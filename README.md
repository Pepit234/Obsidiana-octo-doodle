package com.tuaddon;

import meteordevelopment.meteorclient.events.world.TickEvent;
import meteordevelopment.meteorclient.systems.modules.Module;
import meteordevelopment.orbit.EventHandler;
import net.minecraft.block.Blocks;
import net.minecraft.item.Items;
import net.minecraft.util.Hand;
import net.minecraft.util.hit.BlockHitResult;
import net.minecraft.util.math.BlockPos;
import net.minecraft.util.math.Direction;

public class AutoPortalAddon extends Module {
    public AutoPortalAddon() {
        super("AutoPortal", "Coloca y enciende portales automáticamente.");
    }

    @EventHandler
    private void onTick(TickEvent.Pre event) {
        // Verificar si hay obsidiana en el inventario
        if (!mc.player.getInventory().containsAny(item -> item.getItem() == Items.OBSIDIAN)) return;

        // Buscar una ubicación plana para el portal (ejemplo: frente al jugador)
        BlockPos frontPos = mc.player.getBlockPos().offset(mc.player.getHorizontalFacing(), 2);

        // Verificar que el suelo sea sólido
        if (!mc.world.getBlockState(frontPos.down()).isSolid()) return;

        // Verificar que el área esté libre
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 5; j++) {
                BlockPos checkPos = frontPos.up(j).offset(mc.player.getHorizontalFacing().rotateY(), i - 1);
                if (!mc.world.getBlockState(checkPos).isAir()) return;
            }
        }

        // Colocar la obsidiana en la estructura del portal
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 5; j++) {
                if (i == 0 || i == 3 || j == 0 || j == 4) {
                    BlockPos placePos = frontPos.up(j).offset(mc.player.getHorizontalFacing().rotateY(), i - 1);
                    placeObsidian(placePos);
                }
            }
        }

        // Encender el portal
        BlockPos firePos = frontPos.up();
        mc.interactionManager.interactBlock(mc.player, Hand.MAIN_HAND, new BlockHitResult(
            mc.player.getPos(), Direction.UP, firePos, false
        ));
    }

    private void placeObsidian(BlockPos pos) {
        // Cambiar a la obsidiana en la barra caliente
        int slot = -1;
        for (int i = 0; i < 9; i++) {
            if (mc.player.getInventory().getStack(i).getItem() == Items.OBSIDIAN) {
                slot = i;
                break;
            }
        }
        if (slot == -1) return;

        int prevSlot = mc.player.getInventory().selectedSlot;
        mc.player.getInventory().selectedSlot = slot;

        // Colocar el bloque
        mc.interactionManager.interactBlock(mc.player, Hand.MAIN_HAND, new BlockHitResult(
            mc.player.getPos(), Direction.UP, pos, false
        ));

        mc.player.getInventory().selectedSlot = prevSlot;
    }
}