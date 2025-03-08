Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA5215171
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458906; cv=none; b=OgOVl0anFy/c97nbX93QYaeztLNvqv92Kmv3EB3ikB5OlhoUClo09HLfrTrEUhD7JqeJKuWdeMyg45pYnWi9KBDW/yz8H4wSZpJJDVMz3V5ZPAe1fM1/3x0i7hGifDK9YlZLfdIMMnmrPo3rbeCZddWg6U/p52suJjoz7F3hoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458906; c=relaxed/simple;
	bh=r1mQgC4DmlmHWnSr+8d+ANzXlBEejCjCRSN8QOb6qhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0Pc8nMEbpVBMSPSyEcy931d/CtzpxfvSLAL1KPreqildrD2IcIzkKmX+75c/I2c6Y8GfRE/s0+z0Q9wFQr+AYHtd5pzHXXABntfP8jh58KNJI5MBqj+dZmRZRe4rvBtRApelyeu9w96Jlj9RlaQJgi+5dnxVfnZ32PH6FRK2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6n1g8eE; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6n1g8eE"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac21c5d0ea0so353161566b.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458903; x=1742063703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=;
        b=j6n1g8eEsQHWde/OARGiEKAfb1h20ckUneiCKYr14YHHuWQfAIGa0AMrzyBvcOTgoA
         7ArMwLnujpCVvjQSbsesb8W/DNnUfNJD/zbnw+v8UnHG8NQ59CcwZypHAMzh7LrSb9lP
         JkHC7yFEUGXQ17Ta0Ei4/euh3Uq1peyr75XQUbaXU+r9uEeekm1SSeIGn9ArGlHqvDLJ
         93vNGSOvLR/PG9YO6ciHR0WETwtyX5an4jD8Bq86/b0oEpGWR3GzNY2XqzyWFqnOLnHE
         DjNQCS96OhFPg6CD9cTjNmcCUdMM1IGQ4ZV5HDis+DWgJbFYhaBCHSVfLWjiSubA4EOm
         c2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458903; x=1742063703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=;
        b=rKUC/t/TfcLdimQ+kOBtA9gZn0ZHjce4R4/lmv0khW+D6G1FEj+YhESUiy0wqfrTYv
         DuIt0y/S1oYIspSunhIyr3A5KD7FLjj+GbJ3+3h3s3wtR/JjbiML8HmSSX37kBYVze6L
         d5AVu43VTTN+depOT3jZ5vjs7RKhI72p4zA2d33h93f2348jhEGZo7xUCIn4QMvUCF2f
         rJhf30reVifVJYp4wn1RVLaLwXc5gKfQA7jL4j2Lp1HlZqkYLUzjBLcOy6BLJzLMCJPk
         S983DMHnqPbwfRgI7UAdgqERR/1fcGesKByaKttrTYNN1LzK5xTlSwNaaSmOqtwGwpVd
         h2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXYfHwuKD4zxGPYu5jj+jdbbIPcr5xDjXk/LMzaUE54layguZrbET87AtYbzb/rdDYt7o8TUV8EhfpBQK25@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4nQ/ZL1Cvn/43qy6zGYrzUQ5zWFha7mhBJzmMypwQv44X5umx
	BiLZbiqloJ4BKG8YLoOq2M/lg1QhuLpPBMhLse4greagrqooq4vD
X-Gm-Gg: ASbGnctOKi5sA30HDEB2VRb+XTRYqNM71asGzojfNpgQKjosSCYib7vDEqu8svP8QNl
	YG/TWBga0pRC0I9RFYDrrIY8dnWGoFPocdMuMR6rRzQanCMVhM4H+zp12ZWPB2LuB95MOS0RQl3
	OmOHwF0Dv3isyH4r7dEERWyE/4O36i4yMvLLefwE4hbxbNQSZPpBCmf/3XeTQv1lJ7DYKBIZCIp
	Prt8Z00Bn0Q5M1NB9nvOhG9wpP37pNKn5EWnXwIUGeXDl2qu1SXCZaP973+rbs/4Jd1aSazou11
	zmZ2jrRN18xdbxw1z15LZNiE7tk/mZS4/W3XQ13QiF166j8Gw71t7ZPltGiujljUrW7b
X-Google-Smtp-Source: AGHT+IGwUeddAVefNrp/Ox4/s1rrU1bRHiJ+ldxf/aGAE6vsUOrAaQ/XHMxMfTJtL/YGjYojnUCfRw==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr19735826a12.23.1741458902826;
        Sat, 08 Mar 2025 10:35:02 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:02 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make i2c-gate conditional on compatible
Date: Sat,  8 Mar 2025 20:33:38 +0200
Message-ID: <20250308183410.3013996-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devices to be added in following patches don't use I2C gate.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 2f453189338f..d0a2aaf7df9c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -84,14 +84,6 @@ properties:
     required:
       - port@1
 
-  i2c-gate:
-    $ref: /schemas/i2c/i2c-gate.yaml
-    unevaluatedProperties: false
-    description:
-      The MAX96714 will pass through and forward the I2C requests from the
-      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
-      subnode to configure a serializer.
-
   port0-poc-supply:
     description: Regulator providing Power over Coax for the GMSL port
 
@@ -101,6 +93,19 @@ required:
   - ports
 
 additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max96714
+              - maxim,max96714f
+    then:
+      properties:
+        i2c-gate:
+          $ref: /schemas/i2c/i2c-gate.yaml
+          unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1

