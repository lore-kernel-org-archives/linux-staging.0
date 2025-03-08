Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A6219309
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458954; cv=none; b=j9JSUHgqTU0aPRyE5rLe6YYWpml3+kyYNnAf1QzM1DykM6g3DXh5JXj57RAq0HUfJLbDxPpPnQ4X2kBSOzpzFIuN4/a3eYGH+TsMG3VhsYxB5gMXkZl+co8R5MqouyduAtbS8PKKoiVvIw3TpVxYu188i7gV8u6cuyEMDGH4Q0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458954; c=relaxed/simple;
	bh=FznTDNtKWojR9Ye+Jrb2h3xMj/oOzdqTZQIRY2kpr2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttpLbixeAdRRG7EdYR3m6sqcX3NkcdXJPN0UfKgtzXRcrgii7D3f34UsfCQTVESV5EhRbFhIGd7ze1C3OS7UjrERxTYXzzcgURKwmdqzhmKoTNlkAIdstd7wPEPxxhR6YPaPeKgkUCLbNaDg6l8dtoBr4NchPAxSBZ3pRKAlpa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcwN0zKW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcwN0zKW"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso4989798a12.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458951; x=1742063751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=;
        b=jcwN0zKWfqWlTI9pXjtL/TxY6/0m9fhVqfV1CukEwRPQKM+6KVxJlnd56geLHPC5Tq
         JW3JSyn7TkhNqu3weD2Q5vMdK6GeLdMcR5hIeQI7qrsS0LpQi58BQZNaurEkOOrQ5+lk
         SVYT1iurBbizLINORA0yPvlS28YiOquLwkhllTgYgUHSZj6VH2itzxcKIFSOsQ5vKHKL
         wnz7bv9J43+QwuXzHRwWJoEd03kqzabIE3bP3yU4VrmUxZKx+5KEorU6m0Zy0OEDLCkJ
         z2d4+eHXoky70R0JCq/vIZKeVSVuPOHC/fUWlJWYE3YImDaRjs1IPw302Uh0+zeQXemQ
         cBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458951; x=1742063751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=;
        b=d5nv8x++8Hc7I7BHuoXHBa8cXQ6PVAIcec9w8rxb54ElzQzbmwblGoQNhPch6K+b+Y
         PofeHMsT25EuH9ETL28oDw7LRhRrINUEiy+r1H05s4J0CotHd5oWt33RAAGDft/7+AMZ
         mxic7Vl+Evv5MdmM+jvTQWzyDdjZj4qM3QoVyvouPSKQ1h9cgEGzV4BKISnHfAFS1wOi
         8RLK5ZLuT6FVfjVtES6y1t/TZ3z/09r8JpoyX+ocnlZFh0o3cgl5zYOkfz23bpW8pBoD
         jboZZ08oZeUDOQapUYwUIrbIBvZUFmutLkxwZ8erGgo+WR+u+DsPSToy9gHMuoaUyUcj
         k1SA==
X-Forwarded-Encrypted: i=1; AJvYcCW+t6od2lSuRVann95EuxasnNvbByGGCL+jWntLoJ+RTc05uPNE+ukgjwW/w0OAiKLB+9eDnCAyhhMnhi6h@lists.linux.dev
X-Gm-Message-State: AOJu0YxVwVdsGtsk7El0YxIu62KsR29bDvRgQUIfS6EAARRRASzSYmU8
	cWulpznFaxTWzk8rwafuvmxgTCsHb9CMXu1FtzFMU0mrTMRJceP9
X-Gm-Gg: ASbGncu+/U4L1PLytRFxiKX7treJFgvypu+Z5XxrPhFE/sgJcBGrcjM6u4HZRGzR9tS
	PS8piFGn0RkLYgeb+fdb6SKJc/JijxZWpEsfcubmXipL4AUMnGt7KWGsxh9khhZj++8CpdVue4W
	p5CRmT4+QS4hSIJN1DIrJM0S4vcA3y74ZbP9bJS0qzYSzkPd0pS+6Fh/QgS4Oe5bwuYZlDvjElg
	pTR6RNe+9EiQ5RusejOFUshqZ8NG9zH5qpCgQg6soSLzq4f0do8g8uLob4PMTFqZdBeJy7TM/o4
	sAhISiGBLEG4RBL7jiQBLPXzgz5thc31jYrEV7jtMNflIW31kBawrjOa9g==
X-Google-Smtp-Source: AGHT+IE7HcMcv8UGE2u8zJcS8GFDxgYSucRdRKjubTzY1De4Hv/qmaFr8IpaN1Nvc57DsiT+CQcqYA==
X-Received: by 2002:a17:907:94d4:b0:ac1:df33:25b9 with SMTP id a640c23a62f3a-ac252ba291fmr945250566b.40.1741458950505;
        Sat, 08 Mar 2025 10:35:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:50 -0800 (PST)
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
Subject: [RFC PATCH 19/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Sat,  8 Mar 2025 20:33:48 +0200
Message-ID: <20250308183410.3013996-20-demonsingur@gmail.com>
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 4c4542d041cd..1680d99b1f36 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -87,6 +87,10 @@ properties:
       - required:
           - port@7
 
+patternProperties:
+  port[0-3]-poc-supply:
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.48.1

