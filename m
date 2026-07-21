Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C24499BE
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627816; cv=none; b=HX3HT93SAMBcaaqy+zGI94SqLGhC5zIaWvmoFFAUP4saf0wA1L+xJydhEyOPQJE6ZtjL0m1EvTam5UKuX2fLmJ75YBcaERtPlsrkM4uZQ67nFxFwULOqNOBB2p6N2r6Mckf2GCEsOCLYFPlhdgU9kjmR7ncUQ3KFoKxNzy9YPNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627816; c=relaxed/simple;
	bh=tikWYDEQLVc5waY2/78bTj9CLn2yecpBpXsk/U5GP90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3SzrLyvYh48dZMCzC7RwS2NU1NAsQoPgA0G4BBk4WDzXkyyRdUaaE3jjcy0QoIJ3XNgTjGRhZ23gnXpHYSzzYZLaBRI00nFnQDOhMx2cSuXnS9Hg/Xpc0cRUsBL6uPrgygxEnLsa60EosWwRbZg64U23iRnKrek6uN5FJox+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1Auc5j2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1Auc5j2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf50c6f235so31220025ad.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627814; x=1785232614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4FztRgbbuu/DGlKT6aKIPa27gZ9w0psRj4kEpq+JGc=;
        b=q1Auc5j22SKXIcZMnPMuQrt1zH8j8rqrLxb+4f599ocIoHOUz9Io7mg59GTnvjY5R9
         oE7IgPx/2sH4SxDzZlp/do0NkojBmm81KKB/7uMNG3gRJCoKJkUBbCqR9qvgTQcj5Jq+
         U9cVRW+1ccPMUbZC+I3+X472cUKdIE9CDlKwK8z2hNnLk9UqwIPHDT/Yv1+uOywkvxRk
         W5cRuKkzqwxE7kYM9GueZ40uEDQpeqM2E28g1Qpr+jyaIttmd9ZPLCBjzZoHMle1KlPN
         s6oKho+jbx0zB0JqzDTP60JjAhVQ5Xy0+peWq5R9OupoRMlKAx6cWqLDV6Od86KO1iVC
         FR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627814; x=1785232614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4FztRgbbuu/DGlKT6aKIPa27gZ9w0psRj4kEpq+JGc=;
        b=NESwTYOrZRCDy3JuBOBzG92F6T+BKtGNfpMp7krwScypvRfA96iPRNYVVcwvJVwCz/
         2c3ioRDaN1rSlQBq1waK5voIc/0aJrWggCdzl6fJstj6NDoEmT6atvV7CoiNHNqqgV4G
         AOrBP2RV9MTqongBErU4E/WaFOQZfA0nS9A8mMkv4ZcznCvRIa/Sy8Jab5jnqLLZ5TuU
         bSRFDeGNtXcaq6jwIcNrnmV8WP+q6FmTBbwj/NkR7h691ZwqFTo8LRPIi0MqystsOtAi
         XVQxNbbM7rU/f2CmaQhFyJ2Xgi/90plHrCsBzbXzPJb3bAdMTH42HjLOxs6QmAyvXKPS
         jIlg==
X-Gm-Message-State: AOJu0YyLLofO3+WmxfXSts8zEtx7fVJEs0jB1Of7MkbJDaPNWiM9vQwW
	gaQhp3dQ95SNkamo9QGG6em2JEmlQNtAEewhcEdhSjOyOO/7QzumY7fk+auuBAGf
X-Gm-Gg: AR+sD11Vpmr0qvWWIVb25r38tu+zs9Vkw70ICel1gLZQdzBmJZUDUWGORz5F8pFdNZb
	vDQ+U44z9yYrHScWtODR2SzIya59PUUSYepnvVufMVojoxKq9p0Zbiii8SfTpobui4P0nYvylSB
	Td/hlCV121AsaQnEe5M0afIpSTKdmkKfnbWkHF3XFjRtd9cmnnvbxmNDR+HKRMIvSTFi5wA/ns6
	H3ij4p+1eUEcJFnay18dozPlProETUyqNWzctaDYgvba9+/nrIY2luOP0VfgPIaiqAh1cMDsYwS
	1E3oQuC67f7nwXk5Tt6ex0L3eQ+5osNuqvq5M1sqmgEIiszM9io4x9X4X3AhEwrqnMh693UEFNL
	bw2/CCcR2MBogDWG3GUyVtMp9PFUvaVBbjnRgjDwzlXGD5rNuxmt05QQgtHlizirgNfJf58xWIP
	OviVvWGkTNJ4UsggOExvs51E/WpE3uC3eaSABh
X-Received: by 2002:a17:902:ce0d:b0:2cc:9a86:9c42 with SMTP id d9443c01a7336-2cf349eb316mr181225525ad.45.1784627814521;
        Tue, 21 Jul 2026 02:56:54 -0700 (PDT)
Received: from localhost.localdomain ([125.20.165.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm44496508eec.26.2026.07.21.02.56.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 02:56:53 -0700 (PDT)
From: Aayush7352 <aayushdixit924@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Aayush Dixit <aayushdixit924@gmail.com>
Subject: [PATCH] staging: nvec: fix power-off path to not depend on workqueue
Date: Tue, 21 Jul 2026 15:26:46 +0530
Message-ID: <20260721095646.80663-1-aayushdixit924@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Dixit <aayushdixit924@gmail.com>

nvec_power_off() uses nvec_write_async() which queues work via
schedule_work().  During system shutdown or reboot, workqueues may be
frozen, so the AP_PWR_DOWN message never reaches the embedded
controller and the system hangs instead of powering off.

Fix by calling nvec_request_master() directly after queuing the
power-off messages, processing the TX queue synchronously in the
power-off context.  Also add a NULL guard for nvec_power_handle.

This addresses the TODO item "add atomic ops in order to fix
shutoff/reboot problems" in drivers/staging/nvec/TODO.

Signed-off-by: Aayush Dixit <aayushdixit924@gmail.com>
---
This patch has not been tested.  Compile-tested and checkpatch-clean only.

 drivers/staging/nvec/nvec.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 88c416ee0..938ea8f34 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -774,10 +774,23 @@ static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 
 static void nvec_power_off(void)
 {
+	struct nvec_chip *nvec = nvec_power_handle;
 	char ap_pwr_down[] = { NVEC_SLEEP, AP_PWR_DOWN };
 
-	nvec_toggle_global_events(nvec_power_handle, false);
-	nvec_write_async(nvec_power_handle, ap_pwr_down, 2);
+	if (!nvec)
+		return;
+
+	nvec_toggle_global_events(nvec, false);
+	nvec_write_async(nvec, ap_pwr_down, 2);
+
+	/*
+	 * Process the TX queue directly instead of relying on the
+	 * workqueue.  Workqueues may be frozen during the power-off
+	 * sequence, so schedule_work() from nvec_write_async() may
+	 * not execute, leaving the AP_PWR_DOWN message unsent and
+	 * the system unable to power off.
+	 */
+	nvec_request_master(&nvec->tx_work);
 }
 
 static int tegra_nvec_probe(struct platform_device *pdev)
-- 
2.55.0

