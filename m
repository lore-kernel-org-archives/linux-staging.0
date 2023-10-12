Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF6D278
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0t6mmLP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso1301795e9.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697090590; x=1697695390; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P51DOcc71lJTpG0lfeJ0M3wrbwZKUgR94Bu9pIZlYhc=;
        b=b0t6mmLPTYcW76veO63BWUxtnBtq4HhkOvexn0OoSzNQWphvAwpDkwR/U5K7z/SBMj
         zXCoDSCD2XLyOB35YsR6W0hLRJwUFVRok+BilXqOtTB672K4g+mf+FENIceVcrNxxpI/
         Y7aKe8HegpDdnH3jiBOavnHaeNKs+uAHVX9TX3ZLYPIkwAgx/nvztU1/0j8741nYyOlM
         cnvJ0HQ9PfFYRrR3C/Jko3IbW3v807wOnCP3nLavwLdgyBbuByYTqGBJWsBJsQihHK8F
         aKd6OWUyMhDdfP3OXbUKGSfsJ+VWubDVfZ8fXFgx+7CqojmOPOOgDRnWftGpn663OIso
         lo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090590; x=1697695390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P51DOcc71lJTpG0lfeJ0M3wrbwZKUgR94Bu9pIZlYhc=;
        b=XOpLhvmG5OP0Isheq253ecR1M4ypPjR/8voRAtRROhwxUbABfVoXp1knZnaGqWTq+w
         3aHVSG5yGhL9iyhHZIQWQZ+1cDylPC4Y50QqkmGPvNXm6GvwP2B3xP4a0D7XUYWFEWce
         2G6a/piOdLMimnjfgA5at/CxQaL4El2V6Ld3D1MgDp4xjGlOHZ1OxSuXeGT9JlcbzdJm
         S0z7f6Y6MxMquv/A0eVNwbF4DjgGtXXTjtA1CWaERDEvu7w4yKaWmDJ5p7UGjC05iJyX
         2pZz/IhHLGbIzH1Syig6YsKX2R+BU6BjUpk3UFgzlCA5nuqIuIymyJk0zUMGaX+rQJxC
         DnwA==
X-Gm-Message-State: AOJu0Yw7FUCOpYIltUZCSIRMAQkkXR0uphZ3PSf/sqKHxXToQYTEX7FH
	X1AQqOw/wzh8t5ZOz2gHe88=
X-Google-Smtp-Source: AGHT+IGIvf+tjlkPYziwdHAnytKW6Q7tiOb8d132sIfdRL9BEIekn7hxdfNJuTgA1fOscFyTYMivkQ==
X-Received: by 2002:a05:600c:1d03:b0:405:39bb:38a8 with SMTP id l3-20020a05600c1d0300b0040539bb38a8mr20228961wms.2.1697090589701;
        Wed, 11 Oct 2023 23:03:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q6-20020adfb186000000b0032d87b13240sm3404038wra.73.2023.10.11.23.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:03:09 -0700 (PDT)
Date: Thu, 12 Oct 2023 08:03:08 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] staging: rtl8192u: Fix missing alloc_workqueue()
Message-ID: <ed45c3e9d69922dfe99bec9f48836a46c40472b7.1697089416.git.philipp.g.hortmann@gmail.com>
References: <cover.1697089416.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1697089416.git.philipp.g.hortmann@gmail.com>

Missing alloc_workqueue() leads to a crash of the system.

Fixes: 1761a85c3bed ("staging: rtl8192u: Remove create_workqueue()")
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8192u (Belkin F5D8053) in Mode n (12.5 MB/s)

Dump of Error:
[ 1428.338077] ------------[ cut here ]------------
[ 1428.338079] WARNING: CPU: 2 PID: 6502 at kernel/workqueue.c:1938 __queue=
_delayed_work+0x77/0xb0
[ 1428.338086] Modules linked in: r8192u_usb(COE) cfg80211 lib80211 libarc4=
 xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_a=
lgo iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c=
 xt_addrtype iptable_filter bpfilter br_netfilter bridge stp llc overlay nl=
s_iso8859_1 snd_hda_codec_hdmi intel_rapl_msr snd_hda_codec_conexant intel_=
rapl_common snd_hda_codec_generic x86_pkg_temp_thermal ledtrig_audio intel_=
powerclamp coretemp sch5627 mei_hdcp kvm_intel binfmt_misc kvm snd_hda_inte=
l snd_intel_dspcfg i915 snd_intel_sdw_acpi crct10dif_pclmul ghash_clmulni_i=
ntel snd_hda_codec sha512_ssse3 aesni_intel snd_hda_core crypto_simd snd_hw=
dep cryptd snd_pcm sch56xx_common rapl snd_seq_midi intel_cstate snd_seq_mi=
di_event input_leds joydev serio_raw drm_buddy snd_rawmidi ttm drm_display_=
helper snd_seq at24 snd_seq_device snd_timer cec rc_core snd mei_me soundco=
re mei drm_kms_helper i2c_algo_bit tpm_infineon mac_hid sch_fq_codel msr pa=
rport_pc ppdev lp parport drm ramoops reed_solomon efi_pstore
[ 1428.338200]  ip_tables x_tables autofs4 hid_generic usbhid hid crc32_pcl=
mul i2c_i801 xhci_pci video ahci lpc_ich libahci i2c_smbus xhci_pci_renesas=
 e1000e wmi
[ 1428.338223] CPU: 2 PID: 6502 Comm: kworker/2:0 Tainted: G         C OE  =
    6.6.0-rc1+ #15
[ 1428.338226] Hardware name: FUJITSU ESPRIMO P710/D3161-A1, BIOS V4.6.5.3 =
R1.16.0 for D3161-A1x 10/29/2012
[ 1428.338229] Workqueue: events rtl819x_watchdog_wqcallback [r8192u_usb]
[ 1428.338249] RIP: 0010:__queue_delayed_work+0x77/0xb0
[ 1428.338252] Code: c1 48 89 4a 60 81 ff 00 20 00 00 75 38 4c 89 cf e8 de =
59 0d 00 5d c3 cc cc cc cc e8 b3 f5 ff ff 5d c3 cc cc cc cc 0f 0b eb bb <0f=
> 0b 48 81 7a 68 e0 61 6f 81 74 99 0f 0b 48 8b 42 58 48 85 c0 74
[ 1428.338255] RSP: 0000:ffffc9000c46bd08 EFLAGS: 00010046
[ 1428.338258] RAX: 0000000000000001 RBX: 0000000000000200 RCX: 00000000000=
00000
[ 1428.338260] RDX: ffff88820efacfe8 RSI: 0000000000000000 RDI: 00000000000=
02000
[ 1428.338262] RBP: ffffc9000c46bd08 R08: 0000000000000000 R09: ffff88820ef=
ad038
[ 1428.338264] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88820ef=
acfe8
[ 1428.338265] R13: 0000000000000001 R14: 0000000000002000 R15: 00000000000=
00000
[ 1428.338267] FS:  0000000000000000(0000) GS:ffff888215c00000(0000) knlGS:=
0000000000000000
[ 1428.338270] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1428.338272] CR2: 0000557da4e0d8e5 CR3: 000000011361e001 CR4: 00000000001=
706e0
[ 1428.338274] Call Trace:
[ 1428.338276]  <TASK>
[ 1428.338280]  ? show_regs+0x68/0x70
[ 1428.338284]  ? __queue_delayed_work+0x77/0xb0
[ 1428.338287]  ? __warn+0x8f/0x180
[ 1428.338291]  ? __queue_delayed_work+0x77/0xb0
[ 1428.338296]  ? report_bug+0x1f5/0x200
[ 1428.338303]  ? handle_bug+0x46/0x80
[ 1428.338307]  ? exc_invalid_op+0x19/0x70
[ 1428.338311]  ? asm_exc_invalid_op+0x1b/0x20
[ 1428.338323]  ? __queue_delayed_work+0x77/0xb0
[ 1428.338327]  ? trace_hardirqs_off+0x4f/0xa0
[ 1428.338331]  queue_delayed_work_on+0x8e/0x90
[ 1428.338337]  hal_dm_watchdog+0x3f5/0x1420 [r8192u_usb]
[ 1428.338356]  rtl819x_watchdog_wqcallback+0x6b/0xb60 [r8192u_usb]
[ 1428.338369]  ? __this_cpu_preempt_check+0x13/0x20
[ 1428.338377]  process_scheduled_works+0x308/0x580
[ 1428.338389]  ? __pfx_worker_thread+0x10/0x10
[ 1428.338392]  worker_thread+0x19b/0x360
[ 1428.338398]  ? __pfx_worker_thread+0x10/0x10
[ 1428.338400]  kthread+0x116/0x150
[ 1428.338405]  ? __pfx_kthread+0x10/0x10
[ 1428.338411]  ret_from_fork+0x3c/0x60
[ 1428.338414]  ? __pfx_kthread+0x10/0x10
[ 1428.338419]  ret_from_fork_asm+0x1b/0x30
[ 1428.338433]  </TASK>
[ 1428.338435] irq event stamp: 3280
[ 1428.338436] hardirqs last  enabled at (3279): [<ffffffff81784921>] conso=
le_unlock+0x101/0x120
[ 1428.338440] hardirqs last disabled at (3280): [<ffffffff816f63a4>] queue=
_delayed_work_on+0x74/0x90
[ 1428.338443] softirqs last  enabled at (3272): [<ffffffff825fd6cd>] __do_=
softirq+0x2cd/0x3b7
[ 1428.338447] softirqs last disabled at (3265): [<ffffffff816d3fb0>] irq_e=
xit_rcu+0xa0/0xe0
[ 1428.338450] ---[ end trace 0000000000000000 ]---
[ 1428.338456] BUG: kernel NULL pointer dereference, address: 0000000000000=
1c0
[ 1428.338458] #PF: supervisor read access in kernel mode
[ 1428.338460] #PF: error_code(0x0000) - not-present page
[ 1428.338462] PGD 0 P4D 0
[ 1428.338464] Oops: 0000 [#1] PREEMPT SMP PTI
[ 1428.338467] CPU: 2 PID: 6502 Comm: kworker/2:0 Tainted: G        WC OE  =
    6.6.0-rc1+ #15
[ 1428.338469] Hardware name: FUJITSU ESPRIMO P710/D3161-A1, BIOS V4.6.5.3 =
R1.16.0 for D3161-A1x 10/29/2012
[ 1428.338470] Workqueue: events rtl819x_watchdog_wqcallback [r8192u_usb]
[ 1428.338483] RIP: 0010:__queue_work+0x38/0x610
[ 1428.338485] Code: 89 fe 41 55 41 54 49 89 d4 53 48 89 f3 48 83 ec 18 8b =
0d 43 23 ce 01 85 c9 74 0f 65 8b 05 c0 af ae 7e 85 c0 0f 84 da 02 00 00 <f7=
> 83 c0 01 00 00 00 80 01 00 0f 85 eb 02 00 00 e8 33 d6 0a 00 31
[ 1428.338488] RSP: 0000:ffffc9000c46bcb8 EFLAGS: 00010046
[ 1428.338490] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00001
[ 1428.338491] RDX: ffff88820efacfe8 RSI: 0000000000000000 RDI: 00000000000=
02000
[ 1428.338493] RBP: ffffc9000c46bcf8 R08: ffff88820efacff0 R09: ffff88820ef=
ad038
[ 1428.338494] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88820ef=
acfe8
[ 1428.338496] R13: 0000000000000001 R14: 0000000000002000 R15: 00000000000=
00000
[ 1428.338497] FS:  0000000000000000(0000) GS:ffff888215c00000(0000) knlGS:=
0000000000000000
[ 1428.338499] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1428.338500] CR2: 00000000000001c0 CR3: 000000011361e001 CR4: 00000000001=
706e0
[ 1428.338502] Call Trace:
[ 1428.338503]  <TASK>
[ 1428.338505]  ? show_regs+0x68/0x70
[ 1428.338508]  ? __die_body+0x20/0x70
[ 1428.338511]  ? __die+0x2b/0x40
[ 1428.338514]  ? page_fault_oops+0x160/0x480
[ 1428.338517]  ? search_bpf_extables+0xad/0x160
[ 1428.338520]  ? __queue_work+0x38/0x610
[ 1428.338523]  ? search_exception_tables+0x5f/0x70
[ 1428.338526]  ? kernelmode_fixup_or_oops+0xa2/0x120
[ 1428.338529]  ? __bad_area_nosemaphore+0x197/0x250
[ 1428.338531]  ? vprintk_default+0x1d/0x30
[ 1428.338535]  ? bad_area_nosemaphore+0x16/0x20
[ 1428.338537]  ? do_user_addr_fault+0x34d/0xa40
[ 1428.338539]  ? debug_smp_processor_id+0x17/0x20
[ 1428.338541]  ? exc_page_fault+0x3c/0x210
[ 1428.338545]  ? __this_cpu_preempt_check+0x13/0x20
[ 1428.338548]  ? exc_page_fault+0x84/0x210
[ 1428.338551]  ? asm_exc_page_fault+0x27/0x30
[ 1428.338555]  ? __queue_work+0x38/0x610
[ 1428.338559]  __queue_delayed_work+0x6d/0xb0
[ 1428.338561]  queue_delayed_work_on+0x8e/0x90
[ 1428.338565]  hal_dm_watchdog+0x3f5/0x1420 [r8192u_usb]
[ 1428.338579]  rtl819x_watchdog_wqcallback+0x6b/0xb60 [r8192u_usb]
[ 1428.338591]  ? __this_cpu_preempt_check+0x13/0x20
[ 1428.338594]  process_scheduled_works+0x308/0x580
[ 1428.338599]  ? __pfx_worker_thread+0x10/0x10
[ 1428.338601]  worker_thread+0x19b/0x360
[ 1428.338604]  ? __pfx_worker_thread+0x10/0x10
[ 1428.338606]  kthread+0x116/0x150
[ 1428.338609]  ? __pfx_kthread+0x10/0x10
[ 1428.338612]  ret_from_fork+0x3c/0x60
[ 1428.338615]  ? __pfx_kthread+0x10/0x10
[ 1428.338618]  ret_from_fork_asm+0x1b/0x30
[ 1428.338623]  </TASK>
---
 drivers/staging/rtl8192u/r8192U_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl81=
92u/r8192U_core.c
index 0a60ef20107c..bf6d93de7a74 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2024,6 +2024,12 @@ static void rtl8192_init_priv_task(struct net_device=
 *dev)
 {
 	struct r8192_priv *priv =3D ieee80211_priv(dev);
=20
+	priv->priv_wq =3D alloc_workqueue("priv_wq", 0, 0);
+	if (!priv->priv_wq) {
+		pr_err("alloc_workqueue for priv->priv_wq failed\n");
+		return;
+	}
+
 	INIT_WORK(&priv->reset_wq, rtl8192_restart);
=20
 	INIT_DELAYED_WORK(&priv->watch_dog_wq,
--=20
2.42.0

