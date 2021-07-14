Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87570
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 10:21:38 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4GPtdP2vWZzMrN4p
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 12:14:01 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
	by laurent.telenet-ops.be with bizsmtp
	id UyDr2500c1ccfby01yDrca; Wed, 14 Jul 2021 12:13:54 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1m3btn-0016Zx-IJ; Wed, 14 Jul 2021 12:13:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1m3btm-00A6LB-O2; Wed, 14 Jul 2021 12:13:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] staging: board: Fix uninitialized spinlock when attaching genpd
Date: Wed, 14 Jul 2021 12:13:46 +0200
Message-Id: <57783ece7ddae55f2bda2f59f452180bff744ea0.1626257398.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Armadillo-800-EVA with CONFIG_DEBUG_SPINLOCK=y:

    BUG: spinlock bad magic on CPU#0, swapper/1
     lock: lcdc0_device+0x10c/0x308, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
    CPU: 0 PID: 1 Comm: swapper Not tainted 5.11.0-rc5-armadillo-00036-gbbca04be7a80-dirty #287
    Hardware name: Generic R8A7740 (Flattened Device Tree)
    [<c010c3c8>] (unwind_backtrace) from [<c010a49c>] (show_stack+0x10/0x14)
    [<c010a49c>] (show_stack) from [<c0159534>] (do_raw_spin_lock+0x20/0x94)
    [<c0159534>] (do_raw_spin_lock) from [<c040858c>] (dev_pm_get_subsys_data+0x8c/0x11c)
    [<c040858c>] (dev_pm_get_subsys_data) from [<c05fbcac>] (genpd_add_device+0x78/0x2b8)
    [<c05fbcac>] (genpd_add_device) from [<c0412db4>] (of_genpd_add_device+0x34/0x4c)
    [<c0412db4>] (of_genpd_add_device) from [<c0a1ea74>] (board_staging_register_device+0x11c/0x148)
    [<c0a1ea74>] (board_staging_register_device) from [<c0a1eac4>] (board_staging_register_devices+0x24/0x28)

of_genpd_add_device() is called before platform_device_register(), as it
needs to attach the genpd before the device is probed.  But the spinlock
is only initialized when the device is registered.

Fix this by open-coding the spinlock initialization, cfr.
device_pm_init_common() in the internal drivers/base code, and in the
SuperH early platform code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Exposed by fw_devlinks changing probe order.
Masked before due to an unrelated wait context check failure, which
disabled any further spinlock checks.
https://lore.kernel.org/linux-acpi/CAMuHMdVL-1RKJ5u-HDVA4F4w_+8yGvQQuJQBcZMsdV4yXzzfcw@mail.gmail.com

v2:
  - Improve code comment.
---
 drivers/staging/board/board.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/board/board.c b/drivers/staging/board/board.c
index cb6feb34dd401ae3..f980af0373452cab 100644
--- a/drivers/staging/board/board.c
+++ b/drivers/staging/board/board.c
@@ -136,6 +136,7 @@ int __init board_staging_register_clock(const struct board_staging_clk *bsc)
 static int board_staging_add_dev_domain(struct platform_device *pdev,
 					const char *domain)
 {
+	struct device *dev = &pdev->dev;
 	struct of_phandle_args pd_args;
 	struct device_node *np;
 
@@ -148,7 +149,11 @@ static int board_staging_add_dev_domain(struct platform_device *pdev,
 	pd_args.np = np;
 	pd_args.args_count = 0;
 
-	return of_genpd_add_device(&pd_args, &pdev->dev);
+	/* Initialization similar to device_pm_init_common() */
+	spin_lock_init(&dev->power.lock);
+	dev->power.early_init = true;
+
+	return of_genpd_add_device(&pd_args, dev);
 }
 #else
 static inline int board_staging_add_dev_domain(struct platform_device *pdev,
-- 
2.25.1

