Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDC1A8409
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510117; cv=none; b=ln8O1rXOOtL5ZFv8ngufvSh8rlOIfd7AJJ7QWEP2MM3JYSmTfVxXuAkQUXq/nTnM/eq6FlSL4mp9W+INoqBOxJCtNRDtaYd1se/HJx54j9rSjS8sNGDOK2N4QDwYyMyPcmrxwlLAvOsklrW4+lDyJwvy8gK+co/O8PS2BsXy5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510117; c=relaxed/simple;
	bh=OhQYB9SpCW5H9sXdAUEdJKF1vtNpU1SdEIqDFNjZy/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVq17moMnJg4Imkclk0IT8ouOTQuUp3Bi5NYewvoeFk1YN3H4F3xSJIsol+fv3DPEkHEAYLKEjN9NmYoR4YD5YIw+9ZIw9rYNwcX22p+ZkQUjn2qb8vzpGkS5/N2DIFzBesdwb370Yp63ixHqTgi9WhPNGEmR+ptwir6MM/dFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6yxxvwZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6yxxvwZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so1102680a12.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510114; x=1742114914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=;
        b=c6yxxvwZJSndkHqUhH5Gz4V/e0juzlQG2V8EfNmC4Q5De1WiwZgJvvcAtky/wEcPj4
         JnpzTqmyvWEN6hgTGyloETbIk8pLI+dCShV/N5mGaFgQZDNUXl/KAoxuVSmQ4sYQik71
         gHDbdm0TvQmAuGl2tI/haNGlZKLzyqKCls7VezQjl694XN3lJ4p+9GUZ5hxEDMGd2Ykw
         CaXNyB1LqnCddrULKglloJQIq5Rw1r9Wtob7+bWoPwcR5Xp3wR+ZmEulkblvAQ4RQhWr
         pIK400jAlCn6bB9gJIPHPuaKMiUz7iD9M2UJQ1ANu+PeSJHzEPdnLRVZXIxghG3rIrlZ
         PwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510114; x=1742114914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=;
        b=kJqPjFA9bR5egO6pZtbbu8jyswtmmDInajhX3pxfSoBHwy5rlFyk6flu8EePniwFZR
         O5vbrTwHrL5knUUHvcE4fknHEHfSUIiZtZZM3u8wX+hyTF4BM6hNXO8RmLd5oGySUPJB
         IBR1wZ1Bjz/dOE+vOhHKUfM2OQeFWVfiov1dLpuS+brU1Ssx3GW35RqgGiP/ZiycWl2l
         /bNrUsCgPBnhp7ycdv+6s0EvY+MoHrtKvyvbAoZCAnPaEUxwnZbS4tfFuHHDU9dq3nd/
         Q/IsDG2IuOiQYMR1O2vusxQHDbZswxR63kGTCG9pjjY9d0NrI9xMEzejlw3WbFPhZIGb
         YWAw==
X-Forwarded-Encrypted: i=1; AJvYcCX2BIn+BlhAQLxZou8MiuuuNmXN04G2cXt7OBfWykMh5kpw+C56/4zxHY4/HtFwI4diXERQOukbOZt8p3d0@lists.linux.dev
X-Gm-Message-State: AOJu0YwMSj/h4Z0EGXG7lnQksdW12g1K5qhB1Q3NrEu4TgazqV9z11Ax
	TExfk1/hD0XTmCfF6w+qnxHHY5ir2nmQ/B56H9m7BjuYZWkeMVQ3
X-Gm-Gg: ASbGnct4nmb1jrpeLn5vKss1d3RKAQ5qmV7PJcRkMu75AvzZ1Dc6bepObpSpcMAfKxW
	CVo2zr/adAlSn8NVv5MFhNuSQN5lsMHCKCs3FE2XmoS5UgsSHuoH2H9eu+dAPt5+4KMiyQ8jrx9
	Obb9sHOtaqWT/v2Jx1BJ28hygaFTA2jsvU0+ztJ2NibmDpGlVjEHPN984Jxn7u+KiOUv0D1Ps4Z
	HfVMD1tBTDAWdPsyHIzkPEAj7HorzEGS9kiOQGjdN7gwpY01NkwfW6ID3/PY8KaFGIkQjgR9n6Q
	Pd2mE9RdCmrN/3WcWQCK602xfDf8tH/dDM01+F9I3+8C9eK/vOBv1E6pTw==
X-Google-Smtp-Source: AGHT+IFm2koHNN7A12mxTDrUb8gVHG703Y2Y9Icivhx2dsCJHeZ/vLMfvZOA/IpeXYW5hItMXuZP+w==
X-Received: by 2002:a05:6402:268a:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e5e24688d1mr25168696a12.25.1741510113522;
        Sun, 09 Mar 2025 00:48:33 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:32 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 03/16] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Sun,  9 Mar 2025 10:47:55 +0200
Message-ID: <20250309084814.3114794-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
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
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1026678a17a7..dd28cc397674 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -91,6 +91,30 @@ properties:
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
+      '^i2c@0':
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
@@ -98,6 +122,21 @@ required:
 
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
2.48.1

