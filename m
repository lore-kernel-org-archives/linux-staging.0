Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FC53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:18:43 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2405:204:820c:4b28:9aaf:3c:ef34:ecdd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 839E51056;
	Wed, 18 Jan 2023 20:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674069522;
	bh=psqCt6za/rWwlS8mx3H67DzrDFITmHUqUzosgzjCokY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nAJ9Y52AiPrqGZhBONG9RqjapRQzUKzvOGwsc8HSlPY+buefXW3uFeDrj9roboLs2
	 V9BKgWtND9DZQpgd56Kt32KWzQnt00jZaEbObbg8DdYjwLEdXZ95XmYvCzFRlfI/KK
	 2/7pe96HfLZtF+3uvSMFnqupGZUlRnSR1AEUBzQI=
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
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v4 2/6] vc04_services: bcm2835-audio: Drop include Makefile directive
Date: Thu, 19 Jan 2023 00:48:07 +0530
Message-Id: <20230118191811.208552-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118191811.208552-1-umang.jain@ideasonboard.com>
References: <20230118191811.208552-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the include directive they can break the build one only wants to
build a subdirectory. Replace with "../" for the includes, in the
bcm2835.h instead.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/bcm2835-audio/Makefile  | 2 --
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/Makefile b/drivers/staging/vc04_services/bcm2835-audio/Makefile
index fc7ac6112a3e..01ceebdf88e7 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/Makefile
+++ b/drivers/staging/vc04_services/bcm2835-audio/Makefile
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_BCM2835)	+= snd-bcm2835.o
 snd-bcm2835-objs		:= bcm2835.o bcm2835-ctl.o bcm2835-pcm.o bcm2835-vchiq.o
-
-ccflags-y += -I $(srctree)/$(src)/../include
diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
index 38b7451d77b2..0a81383c475a 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
@@ -6,11 +6,12 @@
 
 #include <linux/device.h>
 #include <linux/wait.h>
-#include <linux/raspberrypi/vchiq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm-indirect.h>
 
+#include "../include/linux/raspberrypi/vchiq.h"
+
 #define MAX_SUBSTREAMS   (8)
 #define AVAIL_SUBSTREAMS_MASK  (0xff)
 
-- 
2.39.0

