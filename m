Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09F12E4C
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ron37tNl"
Received: from umang.jain (unknown [103.251.226.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2B35E62;
	Tue,  7 Nov 2023 10:51:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699350718;
	bh=4nV8MroyvaUEvxXBtXmcKoHJdIgd3BGt1fRK0ZyPbq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ron37tNl8KNXrLr6k5ec+MfqlI8NWOm3zlqR5Wu0tplOLFY+AWTtWIXUeAg8AbzHr
	 IR6mKJhhHJgrgRoqYO2tEa8NEqk6vOH5Qp9DUoodYhNLOdYI2y9gBT6hqXNrjHVh07
	 qv0bhiytCjBb62MTnJQs0o4zR9oSvmVTE+kYg0LE=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: [PATCH 3/9] staging: vc04_services: bcm2835-camera: Remove redundant null check
Date: Tue,  7 Nov 2023 04:51:50 -0500
Message-ID: <20231107095156.365492-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107095156.365492-1-umang.jain@ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the buf pointer null check in buffer_cb() as it can never be
NULL. buffer_cb() is always called with a valid mmal_buf pointer
(which is NULL checked) from which, struct vb2_mmal_buf buf pointer
is derived, using container_of macro.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e6e89784d84b..4b2b8f3bf903 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -333,11 +333,8 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 		 mmal_buf->pts);
 
 	if (status) {
-		/* error in transfer */
-		if (buf) {
-			/* there was a buffer with the error so return it */
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		}
+		/* There was a buffer with the error so return it. */
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 		return;
 	}
 
-- 
2.41.0

