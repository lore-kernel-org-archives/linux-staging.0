Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9862F6193
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166852; cv=none; b=aLwLgk8xW5p60W6bnRvfPQ0F6DbOOvDdf0jKSOmdPSyVz6HSsJ8w7IMIFm2j4Rm+gKrpaGGJJFOCFF8I3bYHKUsZNSj68QC/a8xBzxlBVGau2aCZPHgqHO3ROEdEgpPOzSLXB2cJITLbjgVKfVrTNZEdg7o3PFuunRgma+NYExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166852; c=relaxed/simple;
	bh=Kw42hJWcUttze7xoNnUBx19g9R/4R6ZXUNR2iHGj6no=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvT1jDPLauZ46rK3RkgU8sazT/36iSNqcEtZagLuZVgsmh1u14Y3AG2v+hn/LYFWPanAyjljlmXO9arh9Qe6wubYH7WsQiC+qsIpxwLwbbxC/tXOo1Pnkch5VcowQRklP1t7bWDXwNpq1SVdLb5z01jQwkgq9lP35p+2vd9kXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RE1uSMZv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RE1uSMZv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5608b619cd8so3567605e87.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166848; x=1757771648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0PXCyJyHficBngfFi8GxW+R2qBl503JjuvrmcgEKW8=;
        b=RE1uSMZvcLAGYwfod2WuCoacwMAXAAOQPySOcRTfV3rBGrOD8Y1IizcOQpVjTbRDZO
         qhXv/cUSWhE51Udw4uDGL3ltV9FgxuwpEWREKcFWzgfZ9xB17ZArS15faXCq9RKNIV4z
         nzVxgTIF7swJTdu0XlhiQc7qz5dMjfQHbRn5/iGQQ1WzCAEh1ImYheTsJXeh3r+Fo9W3
         p4hh6NX6G0jaR4vFQmWgTHxXGWxuPiCiC+rzX1J7Z7ZihwKev0UTxpbreBZJQAw1Bidn
         SA2DWA2GfszkUPhZgr+DLDVsAuxSSbQiML+Wq/FaeD2N09zX+rivOchnOgiWJxA4XqbJ
         kXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166848; x=1757771648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0PXCyJyHficBngfFi8GxW+R2qBl503JjuvrmcgEKW8=;
        b=NjhM97QlEmzIfrVdT5+7tlKWpQqokgusazEiGLX1C/KII7uk5LN4S+qXuQBb3mup2C
         5KdwVfKWqscbUH35AvXi/Q5zg3MQtjZ9Y7kMgya/Ucote244Ngp7MqbbrTQWmfnRF/s9
         U0lcU8FloY82Gkypi1oYKhOseJsH6BHj9YMClZW9KRvNrW5dMKro+/Alu8+M/HBIkYDv
         jR0YyrerOx6UoHbAD1L8eh0ni32EOeYV2UEvvVJV2rL9XN0YhspOExtmpMcKaiXWo8+i
         3tYiwsptGU2vwk1kn7tr3Dwn0RCEkL2ky3I/mMRofM3adisJ4/zotZ64HtUsto4/D0+y
         xXoA==
X-Forwarded-Encrypted: i=1; AJvYcCWLWIlRGFQvS9SlWgn+MLd6ifkvzQ5afVO61pek9RGqIRARCCQCaIWCPEE/KVqYB+rs4Cyquvt/WngrAMsQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxZTqGuUAQ5qLPFAI/J3i2zMe1+eAafx1GUSu8ougjRuIUkzCc4
	ydtYrGNawv3IPoZv8hn3t5YFCEzysesDgUV+A2DmZhKONx/Xy2wV/28b
X-Gm-Gg: ASbGncteG5FN/4aMzrPaQjybcx0byOJO2rXMKkwR15+rMaTYZ0EVj49DrGrdKkDdRSX
	kdFIbq/36ce/+dPBisQt30fi/hN9fOh3r1VcSjUU0a8VeJdruB5VwfE7UZnOaQu224PXmpM1ev+
	eD163kAFActlMwqLfhatvPgGNS1+30M4wVCJiod2lxeaAwiq6PjhIiKqttEUDuim8BdsKCIceZc
	wtYXZYZO/ICONlbUK72fNZnrgm2CPgumbrq2agGvUWlxzMhFwX6eecnVoaW7Dt4rk5s2O6T4iqw
	DYrZdAUYGfxsjsNaXgl01B/QVzJBtyimxcOfG1P3ro9h/mGCJnlImRt6pT/EfHkOa99LMLudt9D
	5C9dXjR9L35wj8u+XQxdFMwkN
X-Google-Smtp-Source: AGHT+IGbn7aQus8K4ENY1gefrmkJcMV2ebrlkldnJ2Jl75zObKrAtv/f8+dZEvE9G3LK5RCJdlACuQ==
X-Received: by 2002:a05:6512:1404:b0:560:8484:a920 with SMTP id 2adb3069b0e04-5625ee795f9mr488463e87.2.1757166848427;
        Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Sat,  6 Sep 2025 16:53:25 +0300
Message-ID: <20250906135345.241229-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..c135f1bd98a9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    one0f:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

