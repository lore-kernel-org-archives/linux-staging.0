Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E2745E4
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945055; cv=none; b=KhQ6I/m26EfgvH28ka895GfsM+r2GccOmWFVR6eefUBNMI4sfpqCF8llk0opp0zZDjMzazhm4U2nNMAO1uysxY/JkbIERwbvfkb4bv2MNkaNtvkn8ALmX9LlZZWoj6J6db3K4UWf5ePyfl1NC2ruhieeM1IrqVI/6gCR3S4qklA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945055; c=relaxed/simple;
	bh=kJq4l0pWRlLipiw9x5X2AVpz48OXfCo65XQq7/XD4+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIN279GNcLe87t0sHgJohR7BbpUQsDdQZHJFeH/esJRzYHWuaB1OxXsRtU5kPGVc7wp4pvpDxcusIzDNvzTr2YIqXbtfevnQ2kNy86dOrun+T8oAnMy6QL41vlZdXhro/nsOzh+ujheOp4XNYNko9oDGNnZA1AsQtzRtoPPho24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FaD5TkSR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FaD5TkSR"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43D211920;
	Tue, 10 Sep 2024 07:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725944975;
	bh=kJq4l0pWRlLipiw9x5X2AVpz48OXfCo65XQq7/XD4+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaD5TkSRfpo3/g3QD6o2KG7xE9O6NXO8McNL6+PxLBTVmTHmRrhD772vXIgkGYHMO
	 sE0cLlVsDt2hoZSchho12YpX3RQdh5pSnvrqrMVtTOxz792VjWSzniWBeP1nJWMWnL
	 1cDEm/2HfSo9f7zOthurmr082Y7mK3kYz2yecAB4=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v6 7/7] staging: vchiq_core: Pass enumerated flag instead of int
Date: Tue, 10 Sep 2024 10:40:07 +0530
Message-ID: <20240910051007.297227-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240910051007.297227-1-umang.jain@ideasonboard.com>
References: <20240910051007.297227-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass proper enumerated flag which exists, instead of an integer while
calling queue_message(). It helps with readability of the code.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2c75d8fd06a8..1f94db6e0cd9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3245,7 +3245,8 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_OPEN:
 		status = queue_message(service->state, service, data_id,
-				       copy_callback, context, size, 1);
+				       copy_callback, context, size,
+				       QMFLAGS_IS_BLOCKING);
 		break;
 	case VCHIQ_SRVSTATE_OPENSYNC:
 		status = queue_message_sync(service->state, service, data_id,
-- 
2.45.0

