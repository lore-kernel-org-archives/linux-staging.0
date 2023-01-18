Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E553A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:19:00 +0000 (UTC)
Received: from umang.jainideasonboard.com (unknown [IPv6:2405:204:820c:4b28:9aaf:3c:ef34:ecdd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 667591056;
	Wed, 18 Jan 2023 20:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674069538;
	bh=+PIqosEfP+3HYLMfQ6JbsMBronwbnjz96aQGq+N2CTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pi6XHOjq4artr+hK1B+r5a9I4ThZKP5lqO87TdRR4LnT4WuPBdinA79PI1sujrPD/
	 VH2ExsrLO48DzQ6gXAn2vrhVDlkqDDVyZ/1F4dqYUk6u9aWDUx9I5hQs1wp/1C9bZX
	 OVWbg2ouKMPbzEX7jRCSbRRKO3uqSdZA4xIn2mTs=
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
Subject: [PATCH v4 4/6] vc04_services: vchiq-mmal: Drop include Makefile directive
Date: Thu, 19 Jan 2023 00:48:09 +0530
Message-Id: <20230118191811.208552-5-umang.jain@ideasonboard.com>
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
mmal-vchiq.c instead.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/vchiq-mmal/Makefile     | 4 ----
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/Makefile b/drivers/staging/vc04_services/vchiq-mmal/Makefile
index c7d3b06e17ce..6937f6534c26 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/Makefile
+++ b/drivers/staging/vc04_services/vchiq-mmal/Makefile
@@ -2,7 +2,3 @@
 bcm2835-mmal-vchiq-objs := mmal-vchiq.o
 
 obj-$(CONFIG_BCM2835_VCHIQ_MMAL) += bcm2835-mmal-vchiq.o
-
-ccflags-y += \
-	-I$(srctree)/$(src)/.. \
-	-I$(srctree)/$(src)/../include
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 6b5879a33780..234e3764db64 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -23,9 +23,9 @@
 #include <linux/slab.h>
 #include <linux/completion.h>
 #include <linux/vmalloc.h>
-#include <linux/raspberrypi/vchiq.h>
 #include <media/videobuf2-vmalloc.h>
 
+#include "../include/linux/raspberrypi/vchiq.h"
 #include "mmal-common.h"
 #include "mmal-vchiq.h"
 #include "mmal-msg.h"
-- 
2.39.0

