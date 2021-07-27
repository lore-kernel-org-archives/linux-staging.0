Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E8D70
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 05:41:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j2so13637458wrx.9
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 22:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbb3xFsFO70z18adPPTL+/xIx/O4YhlgKc3zlHPW0A4=;
        b=Tb+DvTJBW3jA1HkMEYfsqImqNKkr2lcOV4oAZ2Mg1FWVQH/KHdqOxBcS5h+6WACYFh
         YLpuK/UnsI8KCt+6UvpKm4cJ76NU/pgtyK4huDutNd4m3D2ghIFy9rFP3YGSogzv3LGR
         LG2G2KymngLjUH9DWfOBX2Pa8mfGawUsNeZX4O8nOBP3QypKcG5fe7OdtZ4qcCeJ2sTp
         +q06D+zYs+qysInDTdc8hbvPVJ3L1pMbIhhs0VfyVMvmIfjH5Hel6OOzCs3RqNHep1Pw
         zRETAI5Z4MWiY8DXwxE47D8PV/rKb4nv4q1dW3Y6a7XTUnjIZguPR4+WbX3wzIgFrh+h
         LWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbb3xFsFO70z18adPPTL+/xIx/O4YhlgKc3zlHPW0A4=;
        b=C+oJogTGqaBcgPxMWCdXUB3/D3Rv32UKxoj2Bl2LJ155lydYWz/dptqsMUE8IsuNYi
         E9j4Qb1g8HSWLwEu3ffG4UmWfxV0hMg7GaOI6grO+HufwLyeuxyH2nObAA6tKPO46f6n
         MJe0gdljD4vHRXxjxihsBDbYk3AtVfXoKv3zVaLtkSHpOd/40HYs7Ca1Dx9dPrz7UsDw
         JsPkAda4ddO+XE/DLeyIMQPMEGCcKFjVxzGwg+m4/2QnFx+ysAtPwjPath5aebWDe+FT
         EFCiiP+FZoZ0IZjXyc5HKlq+Ni+YZvUSXud39ufOin/E5TqQNdL64XOgoAKs/LpxOkrS
         y7+g==
X-Gm-Message-State: AOAM533X0ksp/4BWc6j8qjY9uHiEMGbUjaPqy1Oy0Yd7PVOpkMk3e+DJ
	Pq2x3unOAen4qw+Yb2oXABXQyhJY5NO9lw==
X-Google-Smtp-Source: ABdhPJwLGC9pL+xtF/6KDVSkp6vznxhwfg+1HkEuJWAnAN3hy040CupTU3YFwzJ5lTbnjfsZrSrlsg==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id f12mr22533823wrz.225.1627364460593;
        Mon, 26 Jul 2021 22:41:00 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id c16sm1827792wru.82.2021.07.26.22.40.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jul 2021 22:40:59 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dqfext@gmail.com
Subject: [PATCH] staging: mt7621-pci: avoid to re-disable clock for those pcies not in use
Date: Tue, 27 Jul 2021 07:40:58 +0200
Message-Id: <20210727054058.10612-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock driver for this SoC is using some gates to properly enabling
and disabling the access to peripherals. Those gates that are not
in use are properly being automatically disabled by the kernel.
Pcie driver is explicitly doing a 'clk_disable_unprepare' call for
gates of those pcies that are not used. Since kernel has already
disabled them, the following warnings appear:

WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:952 clk_core_disable+0xe4/0x100
pcie2 already disabled
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0 #0
Stack : 81661680 80082d00 807c0000 00000004 00000000
        80a20000 80860000 80792380
        814503d4 80862e83 00000000 1431b70 81454360
        00000000 00000000 80792380
        81431a08 ffffefff fffffea 00000000 81431a14
        0000007b 80868820 ffffffff
        80792380 1431c70 803d7a24 00000009 807f3a74
        00000001 815df810 00000018 0000000 80a20000
...
Call Trace:
[<80007ed8>] show_stack+0x28/0xf0
[<80381e40>] dump_stack_lvl+0x60/0x80
[<8002cf90>] __warn+0xcc/0x140
[<8002d090>] warn_slowpath_fmt+0x8c/0xac
[<803d7a24>] clk_core_disable+0xe4/0x100
[<803da468>] clk_disable+0x38/0x58
[<804cb730>] mt7621_pci_probe+0x980/0xa50
[<8041e624>] platform_probe+0x50/0xbc
[<8041bfe4>] really_probe.part.0+0xa8/0x340
[<8041c3dc>] driver_probe_device+0x4c/0x154
[<8041cb88>] __driver_attach+0xb4/0x1b4
[<80419a38>] bus_for_each_dev+0x68/0xa4
[<8041b1e8>] bus_add_driver+0x134/0x214
[<8041d3bc>] driver_register+0x98/0x154
[<80001648>] do_one_initcall+0x50/0x1a8
[<808ea1fc>] kernel_init_freeable+0x270/0x30c
[<806dd9dc>] kernel_init+0x20/0x110
[<80002d98>] ret_from_kernel_thread+0x14/0x1c

WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:810 clk_core_unprepare+0xf4/0x194
pcie2 already unprepared
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W 5.14.0 #0
Stack : 81661680 80082d00 807c0000 00000004 00000000
        00000000 81431bc4 80a20000
        80860000 80792380 814503d4 80862e83 00000000
        00000001 81431b70 81454360
        00000000 00000000 80792380 81431a08 ffffefff
        00000000 ffffffea 00000000
        81431a14 0000009b 80868820 ffffffff 80792380
        00000001 81431c70 803d7764
        00000009 807f3a74 00000001 815df810 00000018
        8040b36c 00000000 80a20000
...
Call Trace:
[<80007ed8>] show_stack+0x28/0xf0
[<80381e40>] dump_stack_lvl+0x60/0x80
[<8002cf90>] __warn+0xcc/0x140
[<8002d090>] warn_slowpath_fmt+0x8c/0xac
[<803d7764>] clk_core_unprepare+0xf4/0x194
[<803d97c4>] clk_unprepare+0x30/0x48
[<804cb738>] mt7621_pci_probe+0x988/0xa50
[<8041e624>] platform_probe+0x50/0xbc
[<8041bfe4>] really_probe.part.0+0xa8/0x340
[<8041c3dc>] driver_probe_device+0x4c/0x154
[<8041cb88>] __driver_attach+0xb4/0x1b4
[<80419a38>] bus_for_each_dev+0x68/0xa4
[<8041b1e8>] bus_add_driver+0x134/0x214
[<8041d3bc>] driver_register+0x98/0x154
[<80001648>] do_one_initcall+0x50/0x1a8
[<808ea1fc>] kernel_init_freeable+0x270/0x30c
[<806dd9dc>] kernel_init+0x20/0x110
[<80002d98>] ret_from_kernel_thread+0x14/0x1c

Avoid to explicitly disable already disabled pcie gates
fixes the problem.

Fixes: cc4e864a5ce4 ("staging: mt7621-pci: make use of kernel clock apis")
Reported-by: DENG Qingfang <dqfext@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 691030e1a5ed..f9bdf4e33134 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -422,7 +422,6 @@ static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
 			dev_err(dev, "pcie%d no card, disable it (RST & CLK)\n",
 				slot);
 			mt7621_control_assert(port);
-			clk_disable_unprepare(port->clk);
 			port->enabled = false;
 
 			if (slot == 0) {
-- 
2.25.1

