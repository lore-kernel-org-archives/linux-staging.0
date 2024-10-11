Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D820968C
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631365; cv=none; b=GjgUTgRvpK65hj2iV5B+LOdXJGtw3pGAtoiWm/saFHUzUqsE6Y2ha4OTVRBMyRGBtXzMKRUdKXOAniparyoN5Jrpx+vkGJBsOzDmKJHdRZzghI2FWdEWSwjX8Nbp7XQTWAq58WecH1FtzKCcuW1MTqa6A3fhfM9ZgexySYupbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631365; c=relaxed/simple;
	bh=xD3T27aSbZGVWM3LeK6ZydUsioF47rQqpXbA99qZANY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5ZQavzK7Rte/qTHnCwaqtR+H4kHF6lHjXojcLojHvUkXktedeFWeNNePw/tQju0nmUKwDJyzVOB+ziG55UCxhCZEr0z0eRX1ARqRULKpj03SheEybpihsl6M8PLcCGluDLubLsQf/2CG+b+POqgbqe2UHKP84HSbEpvcBqYFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sk8bw1jm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sk8bw1jm"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E0CAD8B;
	Fri, 11 Oct 2024 09:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728631263;
	bh=xD3T27aSbZGVWM3LeK6ZydUsioF47rQqpXbA99qZANY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sk8bw1jmvxjhrc5iEPBuJhwkTPZOY32VV1NqZUihD47hreLaGLG48vSNWpVoBoz0u
	 Kh6a7b9erjNZn8+N6WUvblXBXdOxiLezxeZdJZTzny7pvY050GL5GCdKFaVe6vaUpa
	 S8ajAIaNM11ixccxHb0ItwHYWmXW+slhjyPxtCec=
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
Subject: [PATCH 2/8] staging: vchiq_core: Properly log dev_err()
Date: Fri, 11 Oct 2024 12:52:04 +0530
Message-ID: <20241011072210.494672-3-umang.jain@ideasonboard.com>
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

Properly log a dev_err() message when the msgid is not of
VCHIQ_MSG_PADDING type. Drop 'oldmsgid' scoped variable and improve
on the error string as well.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e9b60dd8d419..1dca676186b6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1188,13 +1188,10 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	header = (struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
 		local->slot_sync);
 
-	{
-		int oldmsgid = header->msgid;
-
-		if (oldmsgid != VCHIQ_MSGID_PADDING)
-			dev_err(state->dev, "core: %d: qms - msgid %x, not PADDING\n",
-				state->id, oldmsgid);
-	}
+	if (header->msgid != VCHIQ_MSGID_PADDING)
+		dev_err(state->dev,
+			"core: %d: qms - msgid %x, is not a PADDING message\n",
+			state->id, header->msgid);
 
 	dev_dbg(state->dev, "sync: %d: qms %s@%pK,%x (%d->%d)\n",
 		state->id, msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-- 
2.45.2

