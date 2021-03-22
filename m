Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F945F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 09:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C83C6191A;
	Mon, 22 Mar 2021 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616407095;
	bh=cqnosJVtv6oS31tjD0GRSYupIltGHiZs5alaG8lMVIM=;
	h=Subject:To:Cc:From:Date:From;
	b=NqfjZcwL5hdxMtdgQkDijvlRL6V9zfZiC61AdQaOfg01Dp/ia7SaB5ug4YlAFiOrD
	 2gLteMZbwDFl2CcDNjYQly1+W2sA+t9/fx4SLRpMbIPCH1mcbp2+4DK+I/QE/A1Qpx
	 b/noVeThj8vVroDt8SL55LzqplaR/2/eNk5oG3kI=
Subject: Patch "MAINTAINERS: move the staging subsystem to lists.linux.dev" has been added to the 5.10-stable tree
To: gregkh@linuxfoundation.org,linux-staging@lists.linux.dev,mchehab+huawei@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 22 Mar 2021 10:57:49 +0100
Message-ID: <1616407069169199@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    MAINTAINERS: move the staging subsystem to lists.linux.dev

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     maintainers-move-the-staging-subsystem-to-lists.linux.dev.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From e06da9ea3e3f6746a849edeae1d09ee821f5c2ce Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 16 Mar 2021 11:23:11 +0100
Subject: MAINTAINERS: move the staging subsystem to lists.linux.dev

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit e06da9ea3e3f6746a849edeae1d09ee821f5c2ce upstream.

The drivers/staging/ tree has a new mailing list,
linux-staging@lists.linux.dev, so move the MAINTAINER entry to point to
it so that we get patches sent to the proper place.

There was no need to specify a list for the hikey9xx driver, the tools
pick up the "base" list for drivers/staging/* so remove that line to
make the file simpler.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/20210316102311.182375-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 MAINTAINERS |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8001,7 +8001,6 @@ F:	drivers/crypto/hisilicon/sec2/sec_mai
 
 HISILICON STAGING DRIVERS FOR HIKEY 960/970
 M:	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-L:	devel@driverdev.osuosl.org
 S:	Maintained
 F:	drivers/staging/hikey9xx/
 
@@ -16665,7 +16664,7 @@ F:	drivers/staging/vt665?/
 
 STAGING SUBSYSTEM
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-L:	devel@driverdev.osuosl.org
+L:	linux-staging@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	drivers/staging/


Patches currently in stable-queue which might be from gregkh@linuxfoundation.org are

queue-5.10/iio-adc-ad7949-fix-wrong-adc-result-due-to-incorrect-bit-mask.patch
queue-5.10/genirq-disable-interrupts-for-force-threaded-handlers.patch
queue-5.10/iio-hid-sensor-temperature-fix-issues-of-timestamp-channel.patch
queue-5.10/ext4-fix-error-handling-in-ext4_end_enable_verity.patch
queue-5.10/nfsd-don-t-abort-copies-early.patch
queue-5.10/s390-pci-fix-leak-of-pci-device-structure.patch
queue-5.10/nvme-tcp-fix-a-null-deref-when-receiving-a-0-length-r2t-pdu.patch
queue-5.10/kernel-fs-introduce-and-use-set_restart_fn-and-arch_set_restart_data.patch
queue-5.10/static_call-fix-static_call_update-sanity-check.patch
queue-5.10/cifs-fix-allocation-size-on-newly-created-files.patch
queue-5.10/usb-storage-add-quirk-to-defeat-kindle-s-automatic-unload.patch
queue-5.10/afs-stop-listxattr-from-listing-afs.-attributes.patch
queue-5.10/serial-stm32-fix-dma-initialization-error-handling.patch
queue-5.10/nvme-fix-write-zeroes-limitations.patch
queue-5.10/asoc-intel-bytcr_rt5640-fix-hp-pavilion-x2-10-p0xx-ovcd-current-threshold.patch
queue-5.10/afs-fix-accessing-yfs-xattrs-on-a-non-yfs-server.patch
queue-5.10/ext4-find-old-entry-again-if-failed-to-rename-whiteout.patch
queue-5.10/iio-adc-stm32-adc-add-has_iomem-dependency.patch
queue-5.10/alsa-hda-realtek-apply-headset-mic-quirks-for-xiaomi-redmibook-air.patch
queue-5.10/nvme-tcp-fix-possible-hang-when-failing-to-set-io-queues.patch
queue-5.10/net-qrtr-fix-__netdev_alloc_skb-call.patch
queue-5.10/btrfs-fix-slab-cache-flags-for-free-space-tree-bitmap.patch
queue-5.10/thunderbolt-increase-runtime-pm-reference-count-on-dp-tunnel-discovery.patch
queue-5.10/iio-gyro-mpu3050-fix-error-handling-in-mpu3050_trigger_handler.patch
queue-5.10/alsa-dice-fix-null-pointer-dereference-when-node-is-disconnected.patch
queue-5.10/alsa-hda-realtek-apply-pin-quirk-for-xiaominotebook-pro.patch
queue-5.10/usb-typec-remove-vdo-part-of-tps6598x_rx_identity_reg-struct.patch
queue-5.10/sunrpc-fix-refcount-leak-for-rpc-auth-modules.patch
queue-5.10/maintainers-move-the-staging-subsystem-to-lists.linux.dev.patch
queue-5.10/nvme-tcp-fix-misuse-of-__smp_processor_id-with-preemption-enabled.patch
queue-5.10/io_uring-ensure-that-sqpoll-thread-is-started-for-exit.patch
queue-5.10/asoc-codecs-wcd934x-add-a-sanity-check-in-set-channel-map.patch
queue-5.10/nfsd-fix-dest-to-src-mount-in-inter-server-copy.patch
queue-5.10/powerpc-force-inlining-of-cpu_has_feature-to-avoid-build-failure.patch
queue-5.10/btrfs-fix-race-when-cloning-extent-buffer-during-rewind-of-an-old-root.patch
queue-5.10/asoc-simple-card-utils-do-not-handle-device-clock.patch
queue-5.10/perf-x86-intel-fix-a-crash-caused-by-zero-pebs-status.patch
queue-5.10/nvmet-don-t-check-iosqes-iocqes-for-discovery-controllers.patch
queue-5.10/ext4-fix-rename-whiteout-with-fast-commit.patch
queue-5.10/usbip-fix-incorrect-double-assignment-to-udc-ud.tcp_rx.patch
queue-5.10/alsa-hda-realtek-fix-mute-micmute-leds-for-hp-840-g8.patch
queue-5.10/drm-amd-display-correct-algorithm-for-reversed-gamma.patch
queue-5.10/thunderbolt-initialize-hopid-idas-in-tb_switch_alloc.patch
queue-5.10/maintainers-move-some-real-subsystems-off-of-the-staging-mailing-list.patch
queue-5.10/ext4-fix-potential-error-in-ext4_do_update_inode.patch
queue-5.10/iio-adis16400-fix-an-error-code-in-adis16400_initial_setup.patch
queue-5.10/asoc-ak5558-add-module_device_table.patch
queue-5.10/iio-adc-adi-axi-adc-add-proper-kconfig-dependencies.patch
queue-5.10/zonefs-fix-o_append-async-write-handling.patch
queue-5.10/x86-introduce-ts_compat_restart-to-fix-get_nr_restart_syscall.patch
queue-5.10/scsi-ufs-ufs-mediatek-correct-operator.patch
queue-5.10/x86-ioapic-ignore-irq2-again.patch
queue-5.10/nfsd-repair-misuse-of-sv_lock-in-5.10.16-rt30.patch
queue-5.10/counter-stm32-timer-cnt-fix-ceiling-write-max-value.patch
queue-5.10/iio-hid-sensor-prox-fix-scale-not-correct-issue.patch
queue-5.10/asoc-sof-intel-unregister-dmic-device-on-probe-error.patch
queue-5.10/pstore-fix-warning-in-pstore_kill_sb.patch
queue-5.10/s390-pci-remove-superfluous-zdev-zbus-check.patch
queue-5.10/asoc-fsl_ssi-fix-tdm-slot-setup-for-i2s-mode.patch
queue-5.10/zonefs-fix-to-update-.i_wr_refcnt-correctly-in-zonefs_open_zone.patch
queue-5.10/ext4-stop-inode-update-before-return.patch
queue-5.10/iio-adc-qcom-spmi-vadc-add-default-scale-to-lr_mux2_bat_id-channel.patch
queue-5.10/asoc-sof-intel-fix-wrong-poll-bits-in-dsp-power-down.patch
queue-5.10/zonefs-prevent-use-of-seq-files-as-swap-file.patch
queue-5.10/vhost-vdpa-set-v-config_ctx-to-null-if-eventfd_ctx_fdget-fails.patch
queue-5.10/iio-adc-ab8500-gpadc-fix-off-by-10-to-3.patch
queue-5.10/usb-gadget-configfs-fix-kasan-use-after-free.patch
queue-5.10/asoc-qcom-sdm845-fix-array-out-of-range-on-rx-slim-channels.patch
queue-5.10/asoc-qcom-lpass-cpu-fix-lpass-dai-ids-parse.patch
queue-5.10/vhost-vdpa-fix-use-after-free-of-v-config_ctx.patch
queue-5.10/perf-x86-intel-fix-unchecked-msr-access-error-caused-by-vlbr_event.patch
queue-5.10/alsa-hda-realtek-fix-mute-micmute-leds-for-hp-850-g8.patch
queue-5.10/usb-typec-tcpm-invoke-power_supply_changed-for-tcpm-source-psy.patch
queue-5.10/alsa-usb-audio-fix-unintentional-sign-extension-issue.patch
queue-5.10/iio-hid-sensor-humidity-fix-alignment-issue-of-timestamp-channel.patch
queue-5.10/vfio-iommu_api-should-be-selected.patch
queue-5.10/kbuild-fix-linux-version.h-for-empty-sublevel-or-patchlevel-again.patch
queue-5.10/revert-pm-runtime-update-device-status-before-letting-suppliers-suspend.patch
queue-5.10/i915-perf-start-hrtimer-only-if-sampling-the-oa-buffer.patch
queue-5.10/efi-use-32-bit-alignment-for-efi_guid_t-literals.patch
queue-5.10/x86-move-ts_compat-back-to-asm-thread_info.h.patch
queue-5.10/svcrdma-disable-timeouts-on-rdma-backchannel.patch
queue-5.10/asoc-ak4458-add-module_device_table.patch
queue-5.10/tty-serial-stm32-usart-remove-set-but-unused-cookie-.patch
queue-5.10/counter-stm32-timer-cnt-fix-ceiling-miss-alignment-with-reload-register.patch
queue-5.10/s390-pci-refactor-zpci_create_device.patch
queue-5.10/alsa-hda-realtek-fix-mute-micmute-leds-for-hp-440-g8.patch
queue-5.10/scsi-myrs-fix-a-double-free-in-myrs_cleanup.patch
queue-5.10/nfsd-don-t-keep-looking-up-unhashed-files-in-the-nfsd-file-cache.patch
queue-5.10/x86-apic-of-fix-cpu-devicetree-node-lookups.patch
queue-5.10/scsi-lpfc-fix-some-error-codes-in-debugfs.patch
queue-5.10/asoc-qcom-sdm845-fix-array-out-of-bounds-access.patch
queue-5.10/spi-cadence-set-cqspi-to-the-driver_data-field-of-struct-device.patch
queue-5.10/efivars-respect-efi_unsupported-return-from-firmware.patch
queue-5.10/pci-rpadlpar-fix-potential-drc_name-corruption-in-store-functions.patch
queue-5.10/usb-dwc3-gadget-prevent-ep-queuing-while-stopping-transfers.patch
queue-5.10/firmware-efi-fix-a-use-after-bug-in-efi_mem_reserve_persistent.patch
queue-5.10/usb-dwc3-gadget-allow-runtime-suspend-if-udc-unbinded.patch
queue-5.10/s390-vtime-fix-increased-steal-time-accounting.patch
queue-5.10/vhost_vdpa-fix-the-missing-irq_bypass_unregister_producer-invocation.patch
queue-5.10/ext4-do-not-try-to-set-xattr-into-ea_inode-if-value-is-empty.patch
queue-5.10/riscv-correct-sparsemem-configuration.patch
queue-5.10/risc-v-correct-enum-sbi_ext_rfence_fid.patch
queue-5.10/alsa-hda-generic-fix-the-micmute-led-init-state.patch
