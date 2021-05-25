Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB82FB2
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 15:23:01 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r11so36648917edt.13
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ijn2PRPL849+JSabWw86AQic424WRwZ5K5EVNCYn+dM=;
        b=UnJHnkWW66vvZYjMiXcIOKwIXMHwm/QXQ0MkI2C4XmjPc57aMdGG+Bc3x+EDLBF81S
         l5Jcgt7SM0O9ZoeWJosMgoxX3QBgDxUSoIzgnmV6teH6iEgk9HlSi6udW8y3MQ0gJQzv
         UyYjeHVCIYke6ZVqwevqifvjBWCvzhsl5K5X9zvsNsiq9SRQIG+zhN2oHTgEhB/eePV9
         45tzDnpbMoUWevsOzFlZNDy5/+6XJgsOjGbbTmU+RKUQZSwUwwBEYqJ4/FGEji+B13Ax
         CRPyAA2o/rOKGWXBlc9K1qUnHki0zx9D4gXR8vsZ1sTcK3U7QB5zqIDukhrLHh5M7foP
         T+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ijn2PRPL849+JSabWw86AQic424WRwZ5K5EVNCYn+dM=;
        b=P2wY7zB1ygJJTQtPV7P5NTxFlSbZmaEIOpUx94S6I0dIYDiNjpPQRsywycFk2RkYD8
         DhFRPSdhFu/c8zAGNvRhVykxKO8HGnmQ3o+5qzAcUrlWnmkXN3aLol2/XNj8rxcDC/dF
         f7x/W58DkGAyleD5IaQ2JOoYnlVBmz3jvKV34OUy+z6NT2YBCRCF3o7Hq0R3/+NuxsvL
         Ih0MCn8zGkrjxIJQK7JxPMgiJyQ5ygvIwX8RGDh/YwxLa/37QGyLaUGZ48RNVZ4j6EJF
         yO73+q+XYsmWmiydNdmhkEs+1+mOO68BSjpRmYPABnOIMMJpjy6tu6NIfaHBOeBC6N8+
         YNzg==
X-Gm-Message-State: AOAM531RM4ItA4YnrA57ewgY8G5v86XnZfgvMmipKSrUvE4mT1a/bJyS
	6wSmifsOBG82iNrL1c3V0g==
X-Google-Smtp-Source: ABdhPJxduAKmZWou/QxRJ6a6frDpt322X1s543PlVcFZw2wMuMVoUj7bTlccXKiF69JNF3SV/S8oRQ==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr31484310edq.201.1621956179889;
        Tue, 25 May 2021 08:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:59 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/10] media: dt-bindings: media: rockchip-vpu: add new compatibles
Date: Tue, 25 May 2021 17:22:23 +0200
Message-Id: <20210525152225.154302-9-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
changes to the additional clocks for RK3066/RK3188.

Checked with:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-vpu.yaml

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 .../bindings/media/rockchip-vpu.yaml          | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c81dbc3e8960..91a3278f33c2 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -15,10 +15,19 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3288-vpu
-      - rockchip,rk3328-vpu
-      - rockchip,rk3399-vpu
+    oneOf:
+      - enum:
+        - rockchip,rk3036-vpu
+        - rockchip,rk3066-vpu
+        - rockchip,rk3288-vpu
+        - rockchip,rk3328-vpu
+        - rockchip,rk3399-vpu
+      - items:
+        - const: rockchip,rk3228-vpu
+        - const: rockchip,rk3399-vpu
+      - items:
+        - const: rockchip,rk3188-vpu
+        - const: rockchip,rk3066-vpu
 
   reg:
     maxItems: 1
@@ -35,12 +44,20 @@ properties:
           - const: vdpu
 
   clocks:
-    maxItems: 2
+    oneOf:
+      - maxItems: 2
+      - maxItems: 4
 
   clock-names:
-    items:
-      - const: aclk
-      - const: hclk
+    oneOf:
+      - items:
+        - const: aclk
+        - const: hclk
+      - items:
+        - const: aclk_vdpu
+        - const: hclk_vdpu
+        - const: aclk_vepu
+        - const: hclk_vepu
 
   power-domains:
     maxItems: 1
-- 
2.27.0

