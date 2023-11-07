Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B871C684
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h/KqH/Dw"
Received: from umang.jain (unknown [103.251.226.96])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C311E9CC;
	Tue,  7 Nov 2023 17:55:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699376118;
	bh=SbvUXnDBOpBoaHTh7Ug+PnfVgeplXwBy5YpgCG7S3A0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/KqH/DwlIh+9ZR+XREN/ECd0nlw16RccjVnd8F5/Ov4QYObm70JJKjZhaYAlAgHr
	 0DcZ6SCDGib7fBfIlY72Te7uC5upjNH6Vs0mtGxDO9UhxSe485rdfWM8XxX3BovXSb
	 A0JghFWANuUCTczXRNO+cjBn34C4g9TLdRvxcFK8=
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/2] staging: vc04_services: Use %p to log pointer address
Date: Tue,  7 Nov 2023 11:55:23 -0500
Message-ID: <20231107165523.638555-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107165523.638555-1-umang.jain@ideasonboard.com>
References: <20231107165523.638555-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solves the following Smatch warnings:
vchiq_dev.c:1220 vchiq_release() warn: argument 7 to %lx specifier is cast from pointer

%p will print the hashed pointer to dynamic debug.
In order to print the unmodified pointer address, one can use the
`no_hash_pointers` via kernel parameters.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index a64d6333cf0a..16e951b2570f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1217,9 +1217,9 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	int ret = 0;
 	int i;
 
-	dev_dbg(state->dev, "%s: %s: %s: instance=%lx\n",
+	dev_dbg(state->dev, "%s: %s: %s: instance=%p\n",
 		log_cat(VCHIQ_ARM), log_type(DEBUG),
-		__func__, (unsigned long)instance);
+		__func__, instance);
 
 	if (!state) {
 		ret = -EPERM;
-- 
2.41.0

