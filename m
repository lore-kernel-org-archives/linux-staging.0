Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0D256F;
	Thu,  3 Nov 2022 16:37:35 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4ED7D2000F;
	Thu,  3 Nov 2022 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667493454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kv2JvZM0Bu8PSNm3CYtYunuWc63u0ZjgDdQoHhob8lE=;
	b=jIqi8qkmBIpR1Etyfv94auxeGB1qx9IY/jUoMmiP/H02rSSl3hEjIN2SMYPfEG8p5IKfW8
	nXppenVIY5zA2Qr+kxxRH4sz5I7rsqfb6QCU3tthA+rHWEwqAaq1enf8r6Gkvixnhe0GT4
	7dbvfOkohOhrBDo2Bq4qdX5O683zX99ueYyxPYIA+X7vNddmoeUMdq5HZMJxCTMZoeoEiP
	dOH2E7grVukr2GJWPrTRKP080EXmedFbvVVdRp8axmCb0GDJsH9F1XubDtRw0r3UBxrBj0
	rP9iqbtmYUjmPmf3s+CoYGLV/QlIJjZhUayg85PGhVn+sXFJMbrlTzdQWKaPNQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v8 4/6] MAINTAINERS: Add entry for the Allwinner A31 ISP driver
Date: Thu,  3 Nov 2022 17:37:15 +0100
Message-Id: <20221103163717.246217-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103163717.246217-1-paul.kocialkowski@bootlin.com>
References: <20221103163717.246217-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the Allwinner A31 ISP media driver.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aeb53085d40a..91d08cdfab99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -784,6 +784,15 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
 F:	drivers/media/platform/sunxi/sun6i-csi/
 
+ALLWINNER A31 ISP DRIVER
+M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
+F:	drivers/staging/media/sunxi/sun6i-isp/
+F:	drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h
+
 ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 L:	linux-media@vger.kernel.org
-- 
2.38.1

