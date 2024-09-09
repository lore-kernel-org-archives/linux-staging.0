Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E500F17623C
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 06:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725862530; cv=none; b=M/tr8fcmyWqalXJkaD8loyKlMpaxR3jYPKw1ZdXjDP/+sRV/19+z0CBxWk0NJJJYOM/Vq/QoONM0rdPAUwgqRhiIZ+glBBpEC73AyKkxa2ABxznez6V2/EILtrUX9OVQrvUVr7mIMj6vWfKfvpbTJ4GUaqeYEfT1rIyKPjxAD7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725862530; c=relaxed/simple;
	bh=ujNT/+9sjUT3Wg0kRSIVEZGaFnbYwTMPEIpDs6npcnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qaBMV/AvkwnYDTLpkBrs+HwagJ5p6LCwTXZUMXoTZaYJSEYPTgn4enAdfkx5AU71NoIuOGR0hKB2Ku0gUNoGUMPJrQnSYhEHjCsdZ34vEY0H4g6eNcvS2wSwqYD9eukWy803FyJFgE17UEnLu1jfH0/X6CX7dC15Lbb+eXWWM/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lgtuorkV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lgtuorkV"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 107F2890;
	Mon,  9 Sep 2024 08:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725862451;
	bh=ujNT/+9sjUT3Wg0kRSIVEZGaFnbYwTMPEIpDs6npcnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lgtuorkVEVvDPc0/hMUoq9gz5q25cJpx9423sVI1xOmvF64GMzJN+FjEyxa82ku4c
	 jClzQZtBJKNYpZIQxqMnTY+cf2Uw6pu4FeCX31OOST1LeHeg6TdeCnCv/j3R9CuCW8
	 2472WMJR281WJqrqyyctgdaL9T99t9vIJVpA98b0=
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
Subject: [PATCH v5 7/7] staging: vchiq_core: Pass enumerated flag instead of int
Date: Mon,  9 Sep 2024 11:44:57 +0530
Message-ID: <20240909061457.255452-8-umang.jain@ideasonboard.com>
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

Pass proper enumerated flag which exists, instead of an integer while
calling queue_message(). It helps with readability of the code.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 85b6f413d3e4..b3b0f8235670 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3126,7 +3126,8 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
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

