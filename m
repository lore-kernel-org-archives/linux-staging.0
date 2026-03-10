Received: from sonic310-11.consmr.mail.ir2.yahoo.com (sonic310-11.consmr.mail.ir2.yahoo.com [77.238.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342683F1679
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179975; cv=none; b=dwb0XAuRYWAkmn1UoC+0vx/fP01uFdpy1HUIXbNZzfA417P3vPjrUfrtEF4QbmlrJwY9o4v2tUQjr+3XoAHOR5QIM7HWbCofA3aAVvo4kyqJMU5uozJwE+NsNPPP9Fm12tw2x1oHSIt6uihoQKIEVC+KiKOyBQDUtYGWIGV3b1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179975; c=relaxed/simple;
	bh=ZbandGBElW0N5pYeEKM6bJhSvoKphyY31WkUTwSebZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc:
	 References; b=senucpefE/LXcnibgYe/1i1EDRk6GF3nEiii2gtX7HW5w6xoJCt54m6j3+6O8Ah9VV1pg7+6L0O5jFzSALGQMkGbGff1K25m0S76gQI1gSaHarOsZ2RwgjlsynIplv4W7CttWOTQW9JtckSdkLLngzIyFC9hfqFdCycyHoBN498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=bhELx4MW; arc=none smtp.client-ip=77.238.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="bhELx4MW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179971; bh=Zo0OiRyYuIByE+/0MTgWLPhDYAHJtmXswAlCOwf731k=; h=From:Subject:Date:To:Cc:References:From:Subject:Reply-To; b=bhELx4MWQXShame/uzBqOok2Ym1jhy0KLzy+AenvUk+04jWkX/UOp87MRvEkjmFHugxxg3csY8dDy9BS7Wstc51ULAACe/WCTtMWIBqDKNsxEZnkgkM+JL06lXZ0pbFcQ4RQMKjQ73iyiz4ME8uTFSJrAlQ4YqWnag2rj40EKvLBln1HkYk8nI4xOQtPhdyx6uJZmlKqxnx65TijbxnFrt/ukYlctAGE9EnYel25ey4MEYa3hbhpFpyEGq7ixC4OR64WP26A/1LqLUPsVZD7jb+5yxKvc+OS9ScNRCo5uqGSnn2hQspELac3JDqJe64Oz6MfERD/Cj6NWdmS0jGEwg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179971; bh=4KrwKKNT7ilNz3U9Kdut4ptDRwnuGvmq+2MVUhGun89=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=qECsILxGD25Mx1QuNzEZe4Sfa95wPJQxamLVEg1kyhCMPDTcyZwczcA9HN0qC5NgFjolT3BVxFJD2VlEyF/SOhhE6LwwFJXyctUOpNQAGRt4dkNjRVTwoyGPIhWZ+/5vX+U7KfNSGzOt9uVMxZlKOitKfWo3nzlLEz9prc/CahtI6Eb1qEpaSC2nzGZOUs5S5CmYNLHHwkTdzbvAzGYjaVJs2ztgTiURG9sfmzftkyt9gWuLK7u0hdRezJA0WBvmyA05imbkJhdfKnMOGpIkM7VPvM8aYxNMSVlKN5PkncI+GkkpFO3Q9rzQSqaNm7qfZ/DXYusVSo53VIQWcOq7mw==
X-YMail-OSG: mHdWvr4VM1niFokvYVSp83U7EaD.8c4JgvWQYrf41PoQqQGOiHQ63_sMXzhGO8Y
 AY0dBubDriZ69wZRoNXk_nCNb_VNOrE_Rjl_m4ZtkbabZGutsVNnguD5w5hPMO28VxMh568fCp8w
 CWuAJ_zzVzWmr.ViSAyuSoUSH_Vzuw02L_QFpTB960D3vo6zjJm6MjUt7rQ_yh75jpfiqY7mf.kK
 ugMhKYAc7xIQAJAwU1vygxoxVnnz5H1Jd1.Nu3Ex_zxkMwVjRoYZMFo0tXuWfLmrxlFEX5QpT2hc
 EY5KAnXlZcylPtRaRid7SlUMKZ5pEexxkPLlDhbVl6wcX9zKxFZoRCJzST41roAktRhddHzsM9Aj
 qsuPy1_YeFEH2Y23hEKwf_j2Vocw0WDzUtiOMhqA7qYFX7wjr0WtCsIbf_M_0xpJbGwNYcqnuDmz
 HVVFA2V_OD31saeIeO5cklAdpRA3e4JQ08pgcYyyjndjKtmW2.JjvKK8jk.T.VacWTIH6.rxd_1G
 7RKWuaS2YEFD6bucxGz4wzsm47B98kEY_8yalExPU3zUtGriDre7kGuakxNgWT6jjNqekkh.XXH8
 7n66Y2uEzTlxyMUQIHX6QkI2fKk8mUaHT0KynaU1lmteoNRsPqEcHEEX.uApD.5morDamwFD_7xK
 VHYq_wC2w_564IMfY8bQHDyxr5UqGtrHxFadLJOwOvECHZa.lDuIayD50WJHWHgDt8t7Ja..0Tn4
 rTZ3GIfSY_wAsVhVtBjGhEiwSabxSkAOB89kWtW4s_CtjKoadXMnonTLjJ.J4.MEvhszzq8uSIpr
 eKjrvMTbT9o.A5GAb0x41_Dai.v9j4ce4DPlwPonTQiIhgIZbGBPuydw93Jb0GwlNxph.tfbzi3d
 7C3tLUbQ9cTYqIjDWaTRX6rRF_HbLut0kdwJaSL8iJdE6XFeb0XSc3pSH3SJfD9j3SNT9GSgrTTe
 HtOYknRR24dPHm3F0owTDUPYINswS5.BAdKBohY_Tb5GTD_g28XjZ6qockqE515k0bF.nJFJfPHP
 zOy5.YQQ3pbls_hH_VkzTH9G8Kb1DS.T2hLfRkgNjKVStWm4l4zDQktonFAeu9C.B2DoxsfRxCDc
 ncVanslvTrEiqidPv5AVUdnJWxyQM8NV1k.gcC48_uLMmGn6WYegv4eliBlrwaXFjnOA4U_4837M
 jJCYQb_4t7yRtaDVSIe.gPAtPUSmZetl55Ps7JOcbs..sNWecIPIkOPOoPcWWn1MMJ7sosjMJERm
 KhNC0s4On6uj_hWH3Nz_dUGVX15wqmdQoYkMP.v86mHfy8vsbfVd8Xvk92sEwzv0.klEpjTcAO_s
 TAxMTKQS27mLJg1u_xFf0y7xFq1V7tOXAoQYrdS2oP5e_fSrnCqCgcPuvO.LA0AU2ebneTO_K3Oq
 HwGz.JFtR48NZ3JfHv0ykd.UOYCYWHlf.tj5lGsKGue7wVTBxp6b7arIh5UbjyeeO5cWbgFMzBg0
 4gjoeyejp2XLiT3PvZnFPAglfVeLKVCaH3pTi_0PFB93278SGJAi_LI4BEprbqFMG7EqSJkw8JIk
 6xMVIrCY_zbtRZ0kVvW1R.dLLnJyON9fiDGFQbAXwZ1Ckwp4cdkVbLGE5eRraypmFdCSrM6QrtrM
 FIQ32AsqviH7fUXShUf12NHvAMifo5jdn.RuW6eVKrCgjw6QAG8hgP2lyJHu_nuHRcQQPqXebbRj
 24knEe8F2wx1NB1RoikH70HFDkqj3Ql8rdWJRYH9.zz3YARAFzzhEC4cc794dffZHnzQKCvoigJD
 zYH_CCR0qW2_A7FeKe8wY405aBspOorf93PUw_mRo0XGDvfEiTtUNTooZY4zIHSwAThPYmYynL_e
 BwlwgEGwhwrEBI6kqWa13cKVezMAPHk1vrtlKqbwFWcyJxH3SqTKuvjpmz_PWTg2chSp6DWUuXMj
 o7DU0Lz_EDHGtoW_4oAtMYeze_VKOR5iqla26Byg8cJVls.v3.RzLx3iUjLtXpj.u7WVqMea94u7
 tZdNBwpIu8lz3Jcctdn8RKZbUw1ToaHVsQHG54niVmJyUG7wSnFL0WGJ1yHRZfYKDQbzW8tdUqMB
 bINVXF7PC3KvMijA8hWYNmkxPqYJayvqg9geUJRsHNxQLWySbGSbvjZxaw9CufeUftorLWvZLMMu
 dBHEY7ZeEvRH1fNgq.g82XBhzCrpSol85oTIok.mKKfDV8tNW0PAKweWdANq.FJwY1A0T_FSCCKM
 DecHW29ogNW9oEtOtRuS3bMUKZQGigekCgz7P8uQzZXVZN2_KHcm56VkADblndP_o2Rd_VlxFiBq
 dEVBfX.tftjiEdkfbwEGa_j6rrfzJIUpPU_5cg7m7
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: fcde9e4c-625f-4827-844a-21483c83bdf7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:59:31 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:15 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v3 00/28] media: staging: atomisp: Remove unnecessary
 return statements from void functions
Date: Tue, 10 Mar 2026 22:39:11 +0100
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NsQ6CMBDG8VcxnT3TXouCk+9hHKAccolQ0mIjI
 by7hYlNt/vf8PtmEcgzBXE9zMJT5MCuT6GPB2Hbsn8ScJ1aoMSz1DKDcnQdhwE8dS4SRMd1use
 37yFiBcZSobAmVGhFQgZPDX+2gfsjdcthdH7a9qJav3/TUYGCQiJl2pCtTH6byta50/ASqxxxp
 yn5U8OkVZIuujFFTpjttGVZvhVonpoZAQAA
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271.ref@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v3:
- Extended cleanup to all 27 files in the driver containing redundant
  'return;' statements at the end of void functions (as suggested by
  Andy Shevchenko): inputfifo.c, bufq.c, ifmtr.c, frame.c, rx.c,
  binary.c, ia_css_debug.c, mmu_public.h,
  isp2400_input_system_private.h, hmm_bo.c, sh_css.c, sp_private.h,
  fifo_monitor_private.h, isp.c, input_formatter_private.h, irq.c,
  mmu.c, fifo_monitor.c, gp_device.c, gdc.c, event_fifo_private.h,
  isp_private.h, input_formatter.c, irq_private.h, gpio_private.h,
  gp_device_private.h, atomisp_cmd.c
- Each removed 'return;' was verified to be at the end of a void function
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc3
- Link to v2: https://lore.kernel.org/r/20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl

Changes in v2:
- Fixed subject prefix to 'media: staging: atomisp:' (reported by media CI robot)
- Rebased on media-committers/next
- Verified with checkpatch.pl --strict: 0 errors, 0 warnings
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc2
- Link to v1: https://lore.kernel.org/r/20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl

---
Tomasz Unger (28):
      media: staging: atomisp: Remove unnecessary return statement in void function
      media: staging: atomisp: Remove unnecessary return statements in inputfifo.c
      media: staging: atomisp: Remove unnecessary return statement in bufq.c
      media: staging: atomisp: Remove unnecessary return statement in ifmtr.c
      media: staging: atomisp: Remove unnecessary return statements in frame.c
      media: staging: atomisp: Remove unnecessary return statements in rx.c
      media: staging: atomisp: Remove unnecessary return statement in binary.c
      media: staging: atomisp: Remove unnecessary return statements in ia_css_debug.c
      media: staging: atomisp: Remove unnecessary return statement in mmu_public.h
      media: staging: atomisp: Remove unnecessary return statements in isp2400_input_system_private.h
      media: staging: atomisp: Remove unnecessary return statements in hmm_bo.c
      media: staging: atomisp: Remove unnecessary return statements in sh_css.c
      media: staging: atomisp: Remove unnecessary return statements in sp_private.h
      media: staging: atomisp: Remove unnecessary return statements in fifo_monitor_private.h
      media: staging: atomisp: Remove unnecessary return statement in isp.c
      media: staging: atomisp: Remove unnecessary return statement in input_formatter_private.h
      media: staging: atomisp: Remove unnecessary return statements in irq.c
      media: staging: atomisp: Remove unnecessary return statements in mmu.c
      media: staging: atomisp: Remove unnecessary return statements in fifo_monitor.c
      media: staging: atomisp: Remove unnecessary return statement in gp_device.c
      media: staging: atomisp: Remove unnecessary return statements in gdc.c
      media: staging: atomisp: Remove unnecessary return statement in event_fifo_private.h
      media: staging: atomisp: Remove unnecessary return statements in isp_private.h
      media: staging: atomisp: Remove unnecessary return statements in input_formatter.c
      media: staging: atomisp: Remove unnecessary return statement in irq_private.h
      media: staging: atomisp: Remove unnecessary return statement in gpio_private.h
      media: staging: atomisp: Remove unnecessary return statement in gp_device_private.h
      media: staging: atomisp: Remove unnecessary return statement in atomisp_cmd.c

 drivers/staging/media/atomisp/pci/atomisp_cmd.c          |  1 -
 .../pci/hive_isp_css_common/host/event_fifo_private.h    |  1 -
 .../atomisp/pci/hive_isp_css_common/host/fifo_monitor.c  |  3 ---
 .../pci/hive_isp_css_common/host/fifo_monitor_private.h  |  2 --
 .../media/atomisp/pci/hive_isp_css_common/host/gdc.c     |  2 --
 .../atomisp/pci/hive_isp_css_common/host/gp_device.c     |  1 -
 .../pci/hive_isp_css_common/host/gp_device_private.h     |  1 -
 .../atomisp/pci/hive_isp_css_common/host/gpio_private.h  |  1 -
 .../pci/hive_isp_css_common/host/input_formatter.c       |  5 -----
 .../hive_isp_css_common/host/input_formatter_private.h   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c     |  8 --------
 .../atomisp/pci/hive_isp_css_common/host/irq_private.h   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/isp.c     |  1 -
 .../atomisp/pci/hive_isp_css_common/host/isp_private.h   |  6 ------
 .../media/atomisp/pci/hive_isp_css_common/host/mmu.c     |  2 --
 .../atomisp/pci/hive_isp_css_common/host/sp_private.h    |  8 --------
 .../atomisp/pci/hive_isp_css_include/host/mmu_public.h   |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c           |  4 ----
 .../media/atomisp/pci/isp2400_input_system_private.h     |  4 ----
 .../media/atomisp/pci/runtime/binary/src/binary.c        |  1 -
 .../staging/media/atomisp/pci/runtime/bufq/src/bufq.c    |  1 -
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c   |  8 --------
 .../staging/media/atomisp/pci/runtime/frame/src/frame.c  |  4 ----
 .../staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c  |  1 -
 .../media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 16 ----------------
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c  |  4 ----
 drivers/staging/media/atomisp/pci/sh_css.c               |  2 --
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c     |  1 -
 28 files changed, 91 deletions(-)
---
base-commit: c24bad1b9ac3ee3a63dcdeaa082cf671a4be1345
change-id: 20260305-atomisp-remove-void-return-v2b-4ce912de212c

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

