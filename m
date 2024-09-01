Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384814B975
	for <linux-staging@lists.linux.dev>; Sun,  1 Sep 2024 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725171519; cv=none; b=qawha6ea08azg+9T0Mices8x1B27AB7oo0hxAVYHo16MSzQBElBZIHDYalSBX1im2I8POW6TJLZ71TkC2KQCtahlXPbN14q8yyIOtTZC2oghLOKULDiG13HIKoYIO3mxi1iMmHk7aWmygFKhKYtx5yAPJd08JGb5J9AeopKfyHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725171519; c=relaxed/simple;
	bh=KHuMczQbOof5uimsMAnuqYikMx9NEe/J7mYcszLAcM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0RrOPtgnSLdTaroZAexQ38gyd7sfIDGysTfuioCbHEpWJ019swpKlrA2MUC0XoOvtsmq1HQ3hA3zhP8jG7+02hb31qUw8Yi2Ybc28a4URtra/TccxjcLFAzxJS9qNWLQyBaCtDl70k+NVKvWFZ7WJNV6RlrlJYjM8GCkKmNu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uVs8KsCt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uVs8KsCt"
Received: from umang.jain (unknown [IPv6:2405:201:2033:3865:19c8:9110:3e7:4518])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2A8F51B;
	Sun,  1 Sep 2024 08:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725171446;
	bh=KHuMczQbOof5uimsMAnuqYikMx9NEe/J7mYcszLAcM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uVs8KsCtW4dZrYV6+q25xhuLJVmZyryi3rhmMNcbAyMyQ3j/5V2qh7TqxNX/IR5n1
	 09zVD9RJaJDOAaV/7GMkXsHmTcDliCkpgL6J8oSaIvO014vgx1xw/+8eL1//axVICj
	 JZkxfXUakIDqO/S0DY5bAUPAtybVW/m06mIjPWtw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 7/7] staging: vchiq_core: Pass enumerated flag instead of int
Date: Sun,  1 Sep 2024 11:48:08 +0530
Message-ID: <20240901061808.187895-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240901061808.187895-1-umang.jain@ideasonboard.com>
References: <20240901061808.187895-1-umang.jain@ideasonboard.com>
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
index 880f7f7e23fa..7c5e10d30bae 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3131,7 +3131,8 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
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
2.45.2

