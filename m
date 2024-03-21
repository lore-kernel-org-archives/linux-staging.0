Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03284039
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026481; cv=none; b=Ev5MPlAHh4H8RFY2drnvpeVJtN84HLwLqCc/L2v3Vqysytscxd8wnI2040F4arHuRXq31hKvwF4Qx3GX4PufaqRZ0yZKQJc6Vn0skMLGyV+0d7itrtkqyazbKxvgVtr6t1ja8cPgmdNTYYS6uiu/DMILdCq7T/DYbOo3xR1xo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026481; c=relaxed/simple;
	bh=dV6WuxhN/h69ZBIHcTTl7hhi10YNF9U6477lZqgaoKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM2QNtMKOJVvL+ZtNwggZAKprxXeaglrvfyLDhTwaR0XzlpnJNH9nT9kn9McE7WZVJp3t2YlyEvflKS5tTw494K2blsRIuR0UZzKW+ZT7fWv/eWRl9KQi2hRYU0sMUNixz4czSOf9In8DX/ooycahWZMKT9P+yd2rvxiHjGgrk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DtluYD/T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DtluYD/T"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 661072B3;
	Thu, 21 Mar 2024 14:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711026450;
	bh=dV6WuxhN/h69ZBIHcTTl7hhi10YNF9U6477lZqgaoKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DtluYD/TqP7OvYbmnergd73BZiZlR/G+fLwMdMABvMB+5JDDBs+Kdk0z4wVPnY7FR
	 TdYUSfn8HCl+N4Tj6/AlOmcM1Iwedpt/rUrWbsWefJ1nOCU+mhztvSD+ebkYkhqqLB
	 Dm9KNT73rUcnz75C7J5zIbKx+3z5yx7ljEHZCCUw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/5] staging: vc04_services: vchiq_arm: Use appropriate dev_* log helpers
Date: Thu, 21 Mar 2024 18:37:34 +0530
Message-ID: <20240321130737.898154-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321130737.898154-1-umang.jain@ideasonboard.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-evaluate logs on error code paths and fix a few error logs
with  appropriate dev_* logging helpers.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1579bd4e5263..b3021739b170 100644
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

