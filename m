Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C1745E4
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945053; cv=none; b=iF85dqmIHzVdkH6IYun9nJvtqxCkZzkzHqokTOjLYiLO3BWDF6rBcBGRKboVn1aaGoRs9HYI+1j7Esd8KbdppXmyMJoETkx17vt8dXWJn2Zl7wTOd5dzKW7z8MMot+qdVUco64WmSsZOlk3CiGH8bECPWrG1X3wj0v9c+NZ2fYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945053; c=relaxed/simple;
	bh=CmfwscMiPXcUx2TCKzqbRXQlPzZdKGF7wR96TDgPtK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxpiLeS0VBLBZlzrrwxmQ9w44hf17Uirm93U6waVUbnwaHDv8D0bovGsu2KYCgbskNMTyhIod71CeeKG9Ckuu5snopuAW4FUUp9lNLbkuZ9AyfFI3DCUSzj2oQFl140jMC4Uv5YSn+cN0r95SIk8rmNv78VJG7NfX2cAzXER/C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IPfaZfZj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IPfaZfZj"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35E06FF1;
	Tue, 10 Sep 2024 07:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725944973;
	bh=CmfwscMiPXcUx2TCKzqbRXQlPzZdKGF7wR96TDgPtK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPfaZfZjlAFaXTBuRyCY/QD+DzCprN+st8NWbXFMKIbnShi226vtYDFI7SgWXKNnB
	 AOYflek4KyMYcFGHYeaVQqNZ/f+aH8LOWJKoI839Tl5/VDbnaHqgKAwVLZn+P2F746
	 qxi1+A3SIQxQsNYORBaCEG/X38NL5X1Py4zsQlIY=
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
Subject: [PATCH v6 6/7] staging: vchiq_core: Remove unused function argument
Date: Tue, 10 Sep 2024 10:40:06 +0530
Message-ID: <20240910051007.297227-7-umang.jain@ideasonboard.com>
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

The argument 'is_blocking' in queue_message_sync() is not
used in the function. Drop it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 29203c510952..2c75d8fd06a8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1139,7 +1139,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 		   int msgid,
 		   ssize_t (*copy_callback)(void *context, void *dest,
 					    size_t offset, size_t maxsize),
-		   void *context, int size, int is_blocking)
+		   void *context, int size)
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_header *header;
@@ -1517,7 +1517,7 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 		/* Acknowledge the OPEN */
 		if (service->sync) {
 			if (queue_message_sync(state, NULL, openack_id, memcpy_copy_callback,
-					       &ack_payload, sizeof(ack_payload), 0) == -EAGAIN)
+					       &ack_payload, sizeof(ack_payload)) == -EAGAIN)
 				goto bail_not_ready;
 
 			/* The service is now open */
@@ -3249,7 +3249,7 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
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

