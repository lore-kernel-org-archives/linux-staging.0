Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F1B18EAF
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500236; cv=none; b=KOEoRgdyDZ0nK2nk3HS0EPQTsoBklwVwbHUwmnYzDLJFTOEEuc6x3jLs6jZbwPIB1Q7jAVm/dHxbNZqM8scKM4W7RPhP1HPHfzdQjXzr0ypzgJB+rWiFdVefLc5C44Ay+YPGqF4OuLEtUslgVB+v6fB388j5yNbcpKPjIg92k1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500236; c=relaxed/simple;
	bh=zTp2f7mz2V+54r60kqq+2bt9w4vOZq68v+wbbXwTWiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeU9dghrDzcmdsnw2SGNZDMoh/anSF/X/Ba4IZet1TG5fMSOa6fZTeu3GObjxl2/J4xyBS7SEAav6JC8qmn6PaSkuUvTIn4LF4DSZ2+TC9LiPTsVgepyCvDAsNzT0AwISWLgcfjzTDnalWzhYECMR+c4/zk7ApbUlVqekc+th58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nD15dZt+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nD15dZt+"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B36D04;
	Fri, 15 Mar 2024 11:56:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500209;
	bh=zTp2f7mz2V+54r60kqq+2bt9w4vOZq68v+wbbXwTWiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nD15dZt+CaDNlwM/AfthST5hmlvlIBURq3EqBfKC6EArJcEZ/pI9Cv1DCJW8nA1O+
	 yEfb2WQDB/KRp+xTfR5a29Mrickoj3LMePO71ocLXXPFRN0BLY9SjxKhQPmcDZdP6d
	 MFmVT2yHC7lwuJbnNdxeF3wMUfBOipHwRmyiJm7w=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/5] staging: vc04_services: vchiq_arm: Use appropriate dev_* log helpers
Date: Fri, 15 Mar 2024 16:26:56 +0530
Message-ID: <20240315105659.111544-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240315105659.111544-1-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-evaluate logs on error code paths and fix a few error logs
with  appropriate dev_* logging helpers.

For a case where a null ptr check is performed, use a WARN_ON()
instead of logging to dev_err().

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1579bd4e5263..3c3e6f3e48ce 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1317,7 +1317,7 @@ vchiq_keepalive_thread_func(void *v)
 		long rc = 0, uc = 0;
 
 		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
-			dev_err(state->dev, "suspend: %s: interrupted\n", __func__);
+			dev_dbg(state->dev, "suspend: %s: interrupted\n", __func__);
 			flush_signals(current);
 			continue;
 		}
@@ -1380,7 +1380,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
-		dev_err(state->dev, "suspend: %s: null service ptr\n", __func__);
+		WARN_ON(!service);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1753,7 +1753,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	 */
 	err = vchiq_register_chrdev(&pdev->dev);
 	if (err) {
-		dev_warn(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
+		dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
 		goto error_exit;
 	}
 
@@ -1763,7 +1763,7 @@ static int vchiq_probe(struct platform_device *pdev)
 	return 0;
 
 failed_platform_init:
-	dev_warn(&pdev->dev, "arm: Could not initialize vchiq platform\n");
+	dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
 error_exit:
 	return err;
 }
-- 
2.43.0

