Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22E569E
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 20:11:24 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [103.251.226.6])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DB36558;
	Fri, 20 Jan 2023 21:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674245482;
	bh=k77WTxAn/feFnTF+zmqDuZWd/SZKbGH7e+gY4VOai8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOxKrguMlsRMJkNG6dE2FkEIoYWJSd5w/ONgleoVLQnA4Rp0+B5o6W3actR1vyBL+
	 KAhzlrQECQ8P1+9qyuZYDV7Ec5xu1s3JX1HkWaS891ZpmVUfoj8U/Q7wB69jr3Rz6v
	 xvjquxNJSpMVQKH7UW5/0NU1xpcDpo4pgIw6YKVo=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v6 1/6] staging: vc04_services: Drop __VCCOREVER__ remnants
Date: Sat, 21 Jan 2023 01:40:59 +0530
Message-Id: <20230120201104.606876-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120201104.606876-1-umang.jain@ideasonboard.com>
References: <20230120201104.606876-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8ba5f91bab63 ("staging: vc04_services: remove __VCCOREVER__")
was meant to remove all of __VCCOREVER__ definitions but missed to
remove a few. Hence, drop them now.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/vc04_services/bcm2835-audio/Makefile  | 2 +-
 drivers/staging/vc04_services/bcm2835-camera/Makefile | 3 +--
 drivers/staging/vc04_services/vchiq-mmal/Makefile     | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/Makefile b/drivers/staging/vc04_services/bcm2835-audio/Makefile
index d59fe4dde615..fc7ac6112a3e 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/Makefile
+++ b/drivers/staging/vc04_services/bcm2835-audio/Makefile
@@ -2,4 +2,4 @@
 obj-$(CONFIG_SND_BCM2835)	+= snd-bcm2835.o
 snd-bcm2835-objs		:= bcm2835.o bcm2835-ctl.o bcm2835-pcm.o bcm2835-vchiq.o
 
-ccflags-y += -I $(srctree)/$(src)/../include -D__VCCOREVER__=0x04000000
+ccflags-y += -I $(srctree)/$(src)/../include
diff --git a/drivers/staging/vc04_services/bcm2835-camera/Makefile b/drivers/staging/vc04_services/bcm2835-camera/Makefile
index 3a76d6ade428..3494c82b271a 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/Makefile
+++ b/drivers/staging/vc04_services/bcm2835-camera/Makefile
@@ -7,5 +7,4 @@ obj-$(CONFIG_VIDEO_BCM2835) += bcm2835-v4l2.o
 
 ccflags-y += \
 	-I $(srctree)/$(src)/.. \
-	-I $(srctree)/$(src)/../vchiq-mmal/ \
-	-D__VCCOREVER__=0x04000000
+	-I $(srctree)/$(src)/../vchiq-mmal/
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Makefile b/drivers/staging/vc04_services/vchiq-mmal/Makefile
index b2a830f48acc..c7d3b06e17ce 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/Makefile
+++ b/drivers/staging/vc04_services/vchiq-mmal/Makefile
@@ -5,5 +5,4 @@ obj-$(CONFIG_BCM2835_VCHIQ_MMAL) += bcm2835-mmal-vchiq.o
 
 ccflags-y += \
 	-I$(srctree)/$(src)/.. \
-	-I$(srctree)/$(src)/../include \
-	-D__VCCOREVER__=0x04000000
+	-I$(srctree)/$(src)/../include
-- 
2.39.0

