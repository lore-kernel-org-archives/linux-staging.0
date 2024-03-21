Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567DA84039
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026485; cv=none; b=JoGGzATidCa3j2vSVZuysOANgLzS1LvmKlRlMe8GeTLFjnZzHfHNn5cV2Ju/xPqDgUEbyJ7kNLdfFLZRM2bGTHyx9BxMPjUix/AL6fjG2STR6piHO/SGBre07yAyFatq6954uBUtr9p/Jh5gd9fTwIJTpLO20vuIed0CwY/0l7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026485; c=relaxed/simple;
	bh=KmGApSib0sFa02kkFEqNNA517Gpw8tm6KKbqVCkvUt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSiwYIYNuQ3wjSqLLAxeIi0vCOqQDfUyadvP2RO9fmTgVU/v445aESQQCJhTQ3qBtKcicO5g+i4SZck6Yu8g921Evsx6nCxCAFfM8HrNB2Ca7t5z/wZ1vJtF2ViJs8djIfJN1OD/Pjqo1UI7R6f0XNQ5IBxQ98Mob0U4E4blT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W+RZog87; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W+RZog87"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3139C7E9;
	Thu, 21 Mar 2024 14:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711026455;
	bh=KmGApSib0sFa02kkFEqNNA517Gpw8tm6KKbqVCkvUt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+RZog87hmwa5BltUqI0Jc8ce/arbm1fh7OfFMq4Jgd8aq1FS/aogVHtX9yZMdXKW
	 UWQIIKd1eo/CPXjx0YMxp2twlZ0qvYuR116qZQnYyV+wy/lMX1yIsf/TQl/w0F+at2
	 PJr+jkps/hOaVyx4zxi0s2cSCRuQUt2KNQK2SUcI=
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
Subject: [PATCH v2 3/5] staging: vc04_services: Do not log error on kzalloc()
Date: Thu, 21 Mar 2024 18:37:35 +0530
Message-ID: <20240321130737.898154-4-umang.jain@ideasonboard.com>
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

Do not log any error for kzalloc() error path. kzalloc() already reports
such errors.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index b3021739b170..ad506016fc93 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -690,7 +690,6 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance) {
-		dev_err(state->dev, "core: %s: Cannot allocate vchiq instance\n", __func__);
 		ret = -ENOMEM;
 		goto failed;
 	}
@@ -956,10 +955,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 		}
 	} else {
 		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
-		if (!waiter) {
-			dev_err(service->state->dev, "core: %s: - Out of memory\n", __func__);
+		if (!waiter)
 			return -ENOMEM;
-		}
 	}
 
 	status = vchiq_bulk_transfer(instance, handle, data, NULL, size,
-- 
2.43.0

