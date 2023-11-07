Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C2112E4E
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FN2eLvQd"
Received: from umang.jain (unknown [103.251.226.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFE94468;
	Tue,  7 Nov 2023 10:51:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699350722;
	bh=jj3pdwPVWpDpIbcBPuLxHIbwqXzw11/JBoR+RfsosXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FN2eLvQdYmE+YgNWQ5wKhGV3l6VOwJGVIyHLAOY4nCBqWoUaTh7Qg6jiRyPYG1hSm
	 lDJg53zjKMsCo8LFctFlhaXgYVNplxg0/KiUCuSVZBlftNoiFBrPJvePxhD6YeflXI
	 4Nt+tRz+kckfmTy9XoyaIVu0EsuXmxowjgPeaWOg=
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
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 4/9] staging: vc04_services: Shorten helper function name
Date: Tue,  7 Nov 2023 04:51:51 -0500
Message-ID: <20231107095156.365492-5-umang.jain@ideasonboard.com>
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

Shorten the helper log_category_str() to log_cat().
Going forwards, this will be used at multiple places with
dev_dbg().

No functiional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.h     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 161358db457c..cc7bb6ca832a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -39,7 +39,7 @@ enum vchiq_log_category {
 	VCHIQ_SUSPEND,
 };
 
-static inline const char *log_category_str(enum vchiq_log_category c)
+static inline const char *log_cat(enum vchiq_log_category c)
 {
 	static const char * const strings[] = {
 		"vchiq_arm",
@@ -54,19 +54,19 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 
 #ifndef vchiq_log_error
 #define vchiq_log_error(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s error: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
+	do { dev_dbg(dev, "%s error: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_warning
 #define vchiq_log_warning(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
+	do { dev_dbg(dev, "%s warning: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_debug
 #define vchiq_log_debug(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
+	do { dev_dbg(dev, "%s debug: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_trace
 #define vchiq_log_trace(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s trace: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
+	do { dev_dbg(dev, "%s trace: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
 #endif
 
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
-- 
2.41.0

