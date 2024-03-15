Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4431F18EAF
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500239; cv=none; b=THIvI48fd5bKW4wewJpjr6taAA7tZgOkLFdXArawOLfeTRPoNaahgki6pnYp+hCRjsixENpZLE+IV0mTS8yGmfA9tj7At6WZaL4rpHUTzHh/NBXgxHvnogPFzvHELKDcBe+2Z2Lf3B6TnKuumxQzDtjKTMZPmv+/PRDOWnuTjvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500239; c=relaxed/simple;
	bh=T8/GtpJHoujqswC24Nbh2FB5qRlvZngoUBmuABSOFsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mse5Mgwlr9Hc/6gU/Q+wx9Mh8AMZE/AmuJMMcdbkmMKiIfyRdnJ6BxkF/nikNPrsUWmBVQXddjDDH0dgaatm0XVNFnJlK7cTgEasz9GjkmlroGPDsgTA+JrQIlTf7NPxVyGd2EzdYwNk+NRwry+ZfV5BgbczOyEyZmj7di7mm60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrDgMVQJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrDgMVQJ"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60E89B3;
	Fri, 15 Mar 2024 11:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500212;
	bh=T8/GtpJHoujqswC24Nbh2FB5qRlvZngoUBmuABSOFsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrDgMVQJLiNUBCOci9IP2tLoVvkpifUMwqMD7Bv+LezHnfL0Q1issPfIH2ju6Kshd
	 4azQFPBEFkG1JyHtR9NaPSNW/K0TxG2b+Zwx5rbmm3vOBDiRcf7ATi+fqcnYQneQIL
	 jwLUfu8ZLDL9j36r6oTHpqYKUEVnlZ2HZQhxKy+Q=
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
Subject: [PATCH 3/5] staging: vc04_services: Do not log error on kzalloc()
Date: Fri, 15 Mar 2024 16:26:57 +0530
Message-ID: <20240315105659.111544-4-umang.jain@ideasonboard.com>
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

Do not log any error for kzalloc() error path. kzalloc() already reports
such errors.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3c3e6f3e48ce..1151cb4a84f9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -690,7 +690,6 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance) {
-		dev_err(state->dev, "core: %s: Cannot allocate vchiq instance\n", __func__);
 		ret = -ENOMEM;
 		goto failed;
 	}
@@ -957,7 +956,6 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 	} else {
 		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
 		if (!waiter) {
-			dev_err(service->state->dev, "core: %s: - Out of memory\n", __func__);
 			return -ENOMEM;
 		}
 	}
-- 
2.43.0

