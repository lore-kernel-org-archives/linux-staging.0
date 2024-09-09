Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7D17623C
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 06:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725862528; cv=none; b=bNhQit0nl8J7exCVqjv2Ybn8vADx1DjbJqUSWNHG5L7xGe9yUTeBxuA4W58U4SpHOdMILtRzGS00/TcLgTdfR0q4E02ywvxFoeHDKP+MrfuQwufBJEzUUKOc/gXwUsIzmQQbl6LDyV+zxEfVtfqJgx9MRUV55llW91KSD9M9VIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725862528; c=relaxed/simple;
	bh=84n0NAUQGTzpqkTNzl5K2t/y7dJ+uVMecYjjoqY7xy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmI+gflaOZtOwy3mnSKEu9OHTK2eV4Xw1865Vw4L9fPn/WboIecYvDCm3eCZH66BYVL2oNnvTDLXUjuKSmgNHh+CAoNBelQ5BdbJ08WcnDKUIy1hvo01KNuElO3Egv7ogxsulk5sUIZOKgoh+tNaRMZxN3fQ/oExsFCB2mCax7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nBRct217; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBRct217"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B08056EC;
	Mon,  9 Sep 2024 08:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725862448;
	bh=84n0NAUQGTzpqkTNzl5K2t/y7dJ+uVMecYjjoqY7xy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBRct217SrqKO7mwsVEugmnZdGySMqvLJs/tIBsIWg0ZRUSaiz8rJeAe2naaQdjl4
	 QSdtjxeoF+5RpzvoeuqGTbD9IRxGPY1F7SXhD/FG1wVqOe7lGAowrSK6NHDmZnY0k0
	 iQIR4uP05xyZJy4Z91Rujsd8fcHUsEVA+GIl6Zis=
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
Subject: [PATCH v5 6/7] staging: vchiq_core: Remove unused function argument
Date: Mon,  9 Sep 2024 11:44:56 +0530
Message-ID: <20240909061457.255452-7-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240909061457.255452-1-umang.jain@ideasonboard.com>
References: <20240909061457.255452-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The argument 'is_blocking' in queue_message_sync() is not
used in the function. Drop it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index a14f46998ddf..85b6f413d3e4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1146,7 +1146,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 		   int msgid,
 		   ssize_t (*copy_callback)(void *context, void *dest,
 					    size_t offset, size_t maxsize),
-		   void *context, int size, int is_blocking)
+		   void *context, int size)
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_header *header;
@@ -1524,7 +1524,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 		/* Acknowledge the OPEN */
 		if (service->sync) {
 			if (queue_message_sync(state, NULL, openack_id, memcpy_copy_callback,
-					       &ack_payload, sizeof(ack_payload), 0) == -EAGAIN)
+					       &ack_payload, sizeof(ack_payload)) == -EAGAIN)
 				goto bail_not_ready;
 
 			/* The service is now open */
@@ -3130,7 +3130,7 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 		break;
 	case VCHIQ_SRVSTATE_OPENSYNC:
 		status = queue_message_sync(service->state, service, data_id,
-					    copy_callback, context, size, 1);
+					    copy_callback, context, size);
 		break;
 	default:
 		status = -EINVAL;
-- 
2.45.0

