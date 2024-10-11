Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528B209F37
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631367; cv=none; b=Wn/uUNVBJsbGvzyD8MkO71KgzkIqz+LjFKIAKgqrXxoMmQofv5yuBV482nohyYX4BS2c9+/9lykQS9tRUpZ8htqCLHVLuuMqW4k//L8DzSTi8nc9HiQXI34hAGlpwV6ohWvwO1Zfr7j5AmL9pNGUv5HNmmaJoR/RlK7vQFbVJ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631367; c=relaxed/simple;
	bh=2r8iDPbU33zt3eyRnDjAEsNRDwFTo3MDsTAsUAMhUPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+/brG+cVA36/cLag4UR1wjnCLelKRDyx2sO6TV6KQuTmBROa2yqz9kt64joNctKhuIHinUCBxoYyKCGKxaEyRjNB30AuWoHGzTGYH051wGHlVWa4Xu/mfbTeIpFT0v6/zIyJzeJnh8kD09CyunD0PCOA2wlP4OPrkmvbWyLSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hwZeJGMN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hwZeJGMN"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 379931659;
	Fri, 11 Oct 2024 09:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728631266;
	bh=2r8iDPbU33zt3eyRnDjAEsNRDwFTo3MDsTAsUAMhUPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwZeJGMNYQeb58MTevyGN9pnCW3RkDcTGvRNQ2CXVRbFU4+oNqk1PCIxed2v0S4Pe
	 2K28W2ikC29pWZd5vNenvXN4uPgzJgsLnky+0B8/FuyiTRBJfyBOGnwf/tB/mEV4Bq
	 V49E4eIkxw/iqNC1rDXspc6dNUfJu8b9xSagFoo4=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 3/8] staging: vchiq_core: Do not log debug in a separate scope
Date: Fri, 11 Oct 2024 12:52:05 +0530
Message-ID: <20241011072210.494672-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011072210.494672-1-umang.jain@ideasonboard.com>
References: <20241011072210.494672-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not log a dev_dbg() with a separate scope. Drop the {..}
scope and align the dev_dbg() to make it more readable.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c            | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 1dca676186b6..15257cf66fa4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -936,6 +936,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 	struct vchiq_service_quota *quota = NULL;
 	struct vchiq_header *header;
 	int type = VCHIQ_MSG_TYPE(msgid);
+	int svc_fourcc;
 
 	size_t stride;
 
@@ -1128,17 +1129,13 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 	header->msgid = msgid;
 	header->size = size;
 
-	{
-		int svc_fourcc;
-
-		svc_fourcc = service
-			? service->base.fourcc
-			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+	svc_fourcc = service ? service->base.fourcc
+			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		dev_dbg(state->dev, "core_msg: Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu\n",
-			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid), size);
-	}
+	dev_dbg(state->dev, "core_msg: Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu\n",
+		msg_type_str(VCHIQ_MSG_TYPE(msgid)),
+		VCHIQ_MSG_TYPE(msgid), &svc_fourcc,
+		VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid), size);
 
 	/* Make sure the new header is visible to the peer. */
 	wmb();
-- 
2.45.2

