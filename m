Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CCD218AAC
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458950; cv=none; b=dmkX5SU4bx2UJFSBvlgRa3XyZTNXov4smXE4Yg+UAkhlQrouDM5uLiOvwZZPTNZ4izeNefkT8gUP6yMKFlCH+tRZOAxBdYJrU2NJYwZk/E3vUPl3OvQ3PDQAyno/6uzKXnKR5qADFsxjnJw3q5S6V79yk1rGx9k2UJKDCD+iVY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458950; c=relaxed/simple;
	bh=NYzMuVB3B9usgVKCiwjaVacmFf7hMikuoDeAMpRnNcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN5BoQtWlHPTDqy4VA2ZF08dqq7oYeotIzX1QSUdLtsKms+TAozTwkchMUfhE1KESA1p+wCcHtcKcOq1Wnz3/7/qtNhJ+Zq7FoWdRBsxb6ULk8Jb9OdfRl34BjlyabfsK1oIluXHlekL8duFAIrIaml8D7MS1OMwIaT0oVE+/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc2SwnIH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc2SwnIH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso4249127a12.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458947; x=1742063747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=;
        b=mc2SwnIHMsiE0XrvUKJsCz54APc1ZYDGbRUQUvwQpEzAMaViTlXAmooAxybq1zIeUN
         JQMGkjAOoSiWatJvfzWFDxfGl03pnPEgaVEmVziigKBg7j+5zHg5qGiyM4wGR2CLGCDv
         E/bTAWtbT8BXhiqgKWJFaNnzoRs5/u+5YO6hT1TnLhMgBDmmg/u2Ich7NTn+4RAXjlSq
         6DJZbh6QoJD0jSOnSbx7nPe4e2F/gZih/fecluvZYU+0vA0drAYuRvNWAisZqectPn0N
         2L0TCdjNKYgiXkvLHG+hLznVNZu4XHy2JFNHSCfRUcto6w7vlG8Ea4LLoJvlSY2xUzv7
         LvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458947; x=1742063747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=;
        b=XgXoYf1UXsExiwmYHGrB5RHlZfBhphrXlwkQo4JZBzGm0FNMAbKOgxCQ30OZSGaTbS
         uJLAu+vls5Y6isW6xh4waxB77PXwFlgFuf9xA2M++hZfX8L7/fKqb/c5lh72P4z/RcYZ
         S1QsuUJpLPuoCutq7J7OE2iRUlqQNNnF3kZEioKRoT/P7u+drGhrL2FyNA+CnSjmuwJ8
         LiYbansP6DvWMAUgoz+a4Q88moGXx1rRy5oNHaJeLigYcWDjJ1u484WIygjoWfe/+36P
         MXkXE5vYC/0FT1shdywyDysGo1fiS3bcoCXIDlF7jeCxT6KpCX5mf4WM1b/tr0aP4Y7v
         ReiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdWDfNMT/fG23kI/EnvP/3bo3xm9sGv5EMCA57FxiI8eDO4sm10jsrFHcSTb/C+hh8zkuoQqACI2fqg6J6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6j/5WAvj9Uhmgt57mC4S0T9R7VohkEV2Gpu1Oh6gScX5V5KMQ
	O1DoOR43DChdLOjFwin+915selVbGPYUET3eaJH0y2QO/XSAMQH9
X-Gm-Gg: ASbGncvPTlTEG8yCXFKzSa3pR5wP/F1GaTfyju94F9Cgsbt37oidBDMFT1JUMZu8uQh
	1zqdIxADnJYtwgzGA2TqlduIu7uFdIK1Ly8NMFr69twhl1N6xaMdh/FKz0XH5niLGLOtOZC9Ci/
	Dujmsrbi58Ht9yODCYZ+s3e8JShFNyj3fgXk9af4peADg0fJzFYYKewdQojuWL/NNsGE806e6Tx
	Q0qCvHqSbEBbNxl5dtoqiYZ0+SJuzjQkdYNd3C9PVztfPMzU2W9twoIKXZYS1/4yv9Nc/2sE1Iu
	lLLw4pvh0S4zWtaX95FXQQmExvIJLFS5xKYz1asjDILaQ+LkvuZr8CXPeA==
X-Google-Smtp-Source: AGHT+IGYYdE8ygjHkGbwYFxdRuN7/SMwMWgaOvxuGGIjcdc5JQxB3kxCPC7VbHX7VMiCBnhZf/DQyA==
X-Received: by 2002:a17:907:c313:b0:abf:27ac:2cf8 with SMTP id a640c23a62f3a-ac26cbc5b28mr427259166b.21.1741458946975;
        Sat, 08 Mar 2025 10:35:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:46 -0800 (PST)
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
Subject: [RFC PATCH 18/24] dt-bindings: media: i2c: max96712: add support for I2C MUX
Date: Sat,  8 Mar 2025 20:33:47 +0200
Message-ID: <20250308183410.3013996-19-demonsingur@gmail.com>
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer muxes the I2C
channels. Moreover, the serializers can have the same hardware attached
to their respective I2C bus.

The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
to facilitate communication to each of the connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 52b5603c2f53..4c4542d041cd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,17 @@ properties:
 
   enable-gpios: true
 
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        properties:
+          reg:
+            items:
+              min: 0
+              max: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.48.1

