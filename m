Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F27262BC
	for <linux-staging@lists.linux.dev>; Tue, 24 Oct 2023 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KLYnWVLO"
Received: from umang.jain (unknown [103.86.18.159])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEAD4EBA;
	Tue, 24 Oct 2023 13:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698147881;
	bh=H/nz2gkbrMm7IT7ydeLh0hLjQygmW288aTznsob3DGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLYnWVLOh+BLtw9NZbdro+YtM0sEEkM0vGXLEnZt8Spiyk+o2COQ/RbXeeishohIi
	 X7AUBrXEYW7nxBSa9T8Bs7WGwGmI8yySR3uniGe+OZwbY7Ni6tnob7payB9bT83dJ4
	 a79A86yFWuFo+EWydrZKZn+BoKnHcr/PiqyfDwgU=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 7/8] staging: vc04_services: Drop VCHIQ_LOG_PREFIX macro
Date: Tue, 24 Oct 2023 07:44:27 -0400
Message-ID: <20231024114428.443528-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro is not used anymore, so drop it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 7a36648d6dad..076c6d9ad56a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -38,8 +38,6 @@
 #define VCHIQ_LOG_INFO     6
 #define VCHIQ_LOG_TRACE    7
 
-#define VCHIQ_LOG_PREFIX   KERN_INFO "vchiq: "
-
 enum vchiq_log_category {
 	VCHIQ_ARM,
 	VCHIQ_CORE,
-- 
2.41.0

