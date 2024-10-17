Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120FF1DE3A4
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729172233; cv=none; b=iz0j7zbrUksDbUBThyvSEP22opqeKjE0FggGw7lgjjPljLlqAJ8PwgOi5NV2inJqRYFfg487A5VV4i01UCFDPcoNUu+0sRPQBvARNwJQV5nIK71Z84Baz7IlaCrc7umuGJs687l29TKdj5NZA7bFG1OUvAG6S5lT+6IXKCU0yZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729172233; c=relaxed/simple;
	bh=dS4uASWxwyiXNL8/Q5N7rvqc7RgiswAf7xz30dE+mG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IthLq5Gn2Q4Twfd8bwjH6FZh4l8o88WZwr3tq2wXNFbr/bP8u4wVwCJKLbb2JNxUJpa51wV7X8aBETb5kCe0IMi1UEPwquI7A8WnL4ayqBE0oeZdrn/I+IsCVwdaSC4Ei56AeLAGdVT7/pKibq+55inp1/EDB11fae7FE7HV5pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YoEVG+BO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YoEVG+BO"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61390195A;
	Thu, 17 Oct 2024 15:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729172114;
	bh=dS4uASWxwyiXNL8/Q5N7rvqc7RgiswAf7xz30dE+mG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YoEVG+BOTSGL884vjYG7dq5gaa4M1CKbduLrPRFnRCRfi/k8ztEkvVyigrKVkukft
	 4Ne3Oi+l8CUwe9G7mJuYnj1GFrruq8eg50oLfERjRQkTf9sxDXreTD2WadzMAgz14/
	 QTP6mhs4lWLAx02vm4/gAAndF5+/HTDhFGMKu57Y=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 6/6] staging: vchiq_dev: Drop userdata local pointer
Date: Thu, 17 Oct 2024 19:06:29 +0530
Message-ID: <20241017133629.216672-7-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017133629.216672-1-umang.jain@ideasonboard.com>
References: <20241017133629.216672-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'userdata' local pointer can be dropped which is set to bulk_waiter.
We can directly pass the waiter->bulk_waiter pointer to
vchiq_bulk_xfer_waiting().

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index f56057e17963..6a9685d9fafc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -289,7 +289,6 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 	struct vchiq_service *service;
 	struct bulk_waiter_node *waiter = NULL, *iter;
 	struct vchiq_bulk bulk_params = {};
-	void *userdata;
 	int status = 0;
 	int ret;
 
@@ -331,9 +330,9 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		}
 		dev_dbg(service->state->dev, "arm: found bulk_waiter %pK for pid %d\n",
 			waiter, current->pid);
-		userdata = &waiter->bulk_waiter;
 
-		status = vchiq_bulk_xfer_waiting(instance, args->handle, userdata);
+		status = vchiq_bulk_xfer_waiting(instance, args->handle,
+						 &waiter->bulk_waiter);
 	} else {
 		bulk_params.uoffset = args->data;
 		bulk_params.mode = args->mode;
-- 
2.45.2

