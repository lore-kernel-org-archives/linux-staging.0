Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD82FB2
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 15:23:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id t3so36687104edc.7
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ko27frDbBXLhAvgfacRGRR+4pUjzfALcpf9gK/LPa6o=;
        b=gvY/8YrnRNatJA/dSudBIKO9l/9Ko2aqFGsWwpgz3p++VlSDxsryN7GZkOcPiScdI5
         Z8m2KBZhuabszpIvvTI6h67J3ClD8n9hM02W6d5btsuyqRxG/PoaEU7cmyqiIqlB39Al
         W7aZ0GhMnhfOx86vMJSOswKnGK/r+G1+YS3eJ/QarYCkaRwf7AUGd9DFflMQejQkGllC
         DwE0+mglMa+g5PMqlsNhRlDuYqkcZL+wtgi5F8UfQd11AAkyxbMah+hpp03xsBMnHm4O
         xsN0NcV4h1UBlTLwO0vMwO8wL3fLjwUT5NgAwaOkFeRiQwVsLwMJH14dQz88CZR/+Xy9
         gEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ko27frDbBXLhAvgfacRGRR+4pUjzfALcpf9gK/LPa6o=;
        b=VD2f/Mbk3L9Cqov0Ht+v4jd8ineWm3nNxl2kKMke9wnC2/yEY6ii2hWxuAVy8sFR5M
         v7xWmMXMk5AVHLKT5iNANNwffMIfM4XJ8NPwPLABXtLOoBd94RoAgpjxHbT/7D4puTYM
         qVNlAUjfgSSOYcR+JBWny0WrJirBJgaQ1v/APSH3IaRfE2vR/yZUkCx/LCIegIdOSF0B
         gtC2apvu5KoF9WcRbL9DxvUOBnePgWGlOLcSF8t60SzTX2S5fpeFVqiUASVw6Iqumwwi
         ES+xopt2oDan33ubUwPcYzGWYVx749L75XTcAW3Nm3RqZYmYzfqzgfzthQrXfxy5KUue
         C3HA==
X-Gm-Message-State: AOAM532SQLWxzQdAzaEMu7SSf6/3gSorh4/wWfMHLh/OxuLO7ZuRVGVj
	h7oio1EMeSrOEv5bbNu/mQ==
X-Google-Smtp-Source: ABdhPJxaOWTiSa4p4wqC2Gva5726GgjctkSJ3UTwEY+X1I0Eb2deWBV7kEuBJcunzKKhyVivrRgjow==
X-Received: by 2002:a05:6402:1295:: with SMTP id w21mr31060225edv.60.1621956181896;
        Tue, 25 May 2021 08:23:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:23:01 -0700 (PDT)
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
Subject: [PATCH 10/10] media: dt-bindings: media: rockchip-vdec: add RK3228 compatible
Date: Tue, 25 May 2021 17:22:25 +0200
Message-Id: <20210525152225.154302-11-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RK3228 compatible for rockchip-vdec.
Also add the optional assigned-clocks and assigned-clock-rates
properties.

Checked with:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip,vdec.yaml

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 8d35c327018b..fbcbc93dd1bd 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -15,7 +15,11 @@ description: |-
 
 properties:
   compatible:
-    const: rockchip,rk3399-vdec
+    oneOf:
+      - const: rockchip,rk3399-vdec
+      - items:
+        - const: rockchip,rk3228-vdec
+        - const: rockchip,rk3399-vdec
 
   reg:
     maxItems: 1
@@ -37,6 +41,10 @@ properties:
       - const: cabac
       - const: core
 
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
   power-domains:
     maxItems: 1
 
-- 
2.27.0

