Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3DC2BDC2F
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694290; cv=none; b=fmmqn8LrNIvlK22yzLE5gq5qht+T2tPisUvXlNhgTRZmYpLiHgnG4CXxAYLCc3ZB2A8s+ysQO3gzl20tOMmMcfpz1BVTx13wx9hFc0jolhEmr6rFa3f+a0JOGnM3QLkh2yNwW3+tS/rGx2Ydptl6NNQ8Jm1PH+h20N2+Drc9CCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694290; c=relaxed/simple;
	bh=hb2tD74FkJ4Z/oLY/veC6PvS/+Yzd0YGgxrh+Xy6/FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYGCeFSJu8q8SCKX6mX8TeNEsjvd0TZcnaSQgAV5yM06Dm1OTxog1b5dYxdd0u19odj7BV+SrCftxo6fqS5uIzlgqUHbnM0bZ2IMtUyWxQWLtaU5B7qSfBgs5a+ykSveaKy8GZCyvlk9HslRfx0H6C3a5OAEw63cKBnsv/DvtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoytyn2I; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoytyn2I"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so2294909a12.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694287; x=1753299087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=hoytyn2I9oEuiut/zCEjofberJpeztC0jq91/3r6a4X6GuxIct4I9zI6mWv/onfN1G
         UJA4FaiuM5p3A1Xkgr6539AOTasIWYDcv+vPurcFD/ZJJ4G8toOHkG3DKVYI3aPUGT0a
         eaTQtmPIrptcFVZlfk6PVa1+TThZxTlRuTXjM2miSeD0K0Ouo1d5by1NvPwSLwbtEbyq
         Z3OnfPe1Ptp2XR4z/zP/A/1r4v+7s0k0yfVMegf4ZSb5nM25LTpK9X9zpKkFAJ7VvEZX
         rFsHJH/cgpCTWhdc6VTHEHeiUqVF6iYdivhidU6uyiWZ3Gxji+tOmsn5xLtOJJfqbBkF
         w+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694287; x=1753299087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=Itv2SMbIeoJo2jbaqves4139HZkF3qDNAFe8lJdIh4fXPNimwA68PdP9IoKAEdanpj
         KqLCJA4hNwdLeKpLRI1O1GWZbHS19ID6y5nPu572ZdE5PBp97zrnk+G/wK5sXvr9/S9n
         0aWZNCnkYky5z/MbP4SPKWNNa/lT1GiD7ZAL2hralo2AJkNy2hnSyhfuQz4jePKWsznX
         4IhdtgXQaqYtrLLlQC/RrowHZGpoJW/NVSinkgy4TpKq6er+8wFHzxLWwFxcRGv0awyn
         W0rMX0ONyS/DCMZCjSg+atcuYm+GHn1Ig9i+E+0K+nyLwPXlGLfvXdkLCHdQ26HKkOIJ
         C9sg==
X-Forwarded-Encrypted: i=1; AJvYcCVSInxr31U7V02AvkWG73AJ4tu5t3LXdAdb9pXsQPuf7SoBD0YbgoDK03UNfu6ic3W/A5uj/nfruTVFfLgQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyjZTH6+LFbh5YbeKw5POjNiLAYJNjuUMFjjIVtL1vgoHZ3orcT
	8hcvwwit3XuoEDEL9C7d26DHvPg+eKz/7xcaefS9RcdrNC54tBp4TpbO
X-Gm-Gg: ASbGnct+AYJAwUypthg/Y/QSoPbXNa+SzPC0KhpxZ3145o0VM8O482Co2EWEUfpmk+H
	YAkSrcl3foNc+ftJvYSHbtsRI02hzWbWXhm6fBnOS4mMqtWBgBE3swx5b/LAyaG8YVj9/XIris6
	Ichba+905yUaUIOGMF/Z7rwDa0lmquzQaNBi0gkRewF33A1aElDrkXYgTpRLbYmHgA9J7sUzU9F
	CLJSB/ms0lCQCvJgWjywQr7PJf1sbjM+2/fpALAfrO31Q+Hs+c5vT5U7rbCfs8n4km6XjcoNge2
	y6n3d2pWt0GR0PqPJbtqKUk39q8Zb+M//nxGo9886Uiw2i+ltkIYn+J0QV05VJJYeo7zki2WHkr
	8TYqoSNqYz10HkCRpC5FrihXOEE15u4Hkm+o=
X-Google-Smtp-Source: AGHT+IE9hyqk0Ays7b48/c7q9YcZueCG0jpD65kEecgbSDJd29bPwrXMO3zJac64DIeLCtVIxzqB+Q==
X-Received: by 2002:a17:907:7b83:b0:add:f68c:5200 with SMTP id a640c23a62f3a-aec4ddb5f4amr47879466b.6.1752694287162;
        Wed, 16 Jul 2025 12:31:27 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:26 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed, 16 Jul 2025 22:30:48 +0300
Message-ID: <20250716193111.942217-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a927..167c3dd50683c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.50.1

