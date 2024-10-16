Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B199B208D8C
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083761; cv=none; b=CppprRZy7/V0eAlEPAnvDt2z3u6n8ss6LgEIdSz9WaOqxeRl4RcUb3+Tv2/DWP03MvrYdL4WkGRSw/HjSnateYP89LCgTIZ5LQu1xdhGlCf5pjr6KZD8SWBKfRXG7IwXsOHpnYrzWyGeSIExifu7b8nrnQaejznP2dWpp1pf4w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083761; c=relaxed/simple;
	bh=eFZWbOo+TJEgq/Jip7gO5D6X+BXYGORK47hl/bD23Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhSlc4V9nkphL49BLtWOlJn0FcuuqlE8DUMP2YIj1NlupqrdpA1QwKb4NgOynmb0VpZvTR12pV/n1w7JD1QyC8PIGXQewp4xpKlOweBPnrx79lrbSRWUlBSLWjTVniG+W1vHiBA9CU4GVRNObkAkWYdXauM/OAnA00sn3MHpTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cF4pGfVN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cF4pGfVN"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21533F86;
	Wed, 16 Oct 2024 15:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729083656;
	bh=eFZWbOo+TJEgq/Jip7gO5D6X+BXYGORK47hl/bD23Ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cF4pGfVNL10E8IRO47Cp96CaNFhK5FCkk7fM0g1yOKYCHXKFpPa5lGY6POiXVJR8e
	 j4Zj3qwMWy/keHdk9pWH8tUCQ8RCoSaCBdSm//8DQHrPvQFtBf1KVOLIv3n8siionG
	 1bdxZnCsgj00p/pIOuQmxKlirjifL1h/E7g7ZHew=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>,
	stable@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 2/2] staging: vchiq_arm: Use devm_kzalloc() for drv_mgmt allocation
Date: Wed, 16 Oct 2024 18:32:25 +0530
Message-ID: <20241016130225.61024-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016130225.61024-1-umang.jain@ideasonboard.com>
References: <20241016130225.61024-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct drv_mgmt 'mgmt' is currently allocated dynamically using
kzalloc(). Unfortunately, it is subjected to memory leaks in the error
handling paths of the probe() function.

To address this issue, use device resource management
helper devm_kzalloc(), to ensure cleanup after the allocation.

Cc: stable@vger.kernel.org
Fixes: 1c9e16b73166 ("staging: vc04_services: vchiq_arm: Split driver static and runtime data")
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 7ece82c361ee..8412be7183fc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1343,7 +1343,7 @@ static int vchiq_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	mgmt = kzalloc(sizeof(*mgmt), GFP_KERNEL);
+	mgmt = devm_kzalloc(&pdev->dev, sizeof(*mgmt), GFP_KERNEL);
 	if (!mgmt)
 		return -ENOMEM;
 
@@ -1397,8 +1397,6 @@ static void vchiq_remove(struct platform_device *pdev)
 
 	arm_state = vchiq_platform_get_arm_state(&mgmt->state);
 	kthread_stop(arm_state->ka_thread);
-
-	kfree(mgmt);
 }
 
 static struct platform_driver vchiq_driver = {
-- 
2.45.2

