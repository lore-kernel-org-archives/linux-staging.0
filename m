Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AE1BFE10
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510136; cv=none; b=gKrokz6wmgC7Ye22LIGo0QFKOwjnbPm+e1q9bDHBp8e0zo32rEVb9SiOx5tcH/3aswqpu67WcE2m4nlE1sDZTz4XyOqOnHoRS/0aRkcDMbJAS3Krhse9fQs4DNVJE4EArSlg/ABcESGH+v3Sl5CBureJ/gv/2/WJCXmTJsbCYjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510136; c=relaxed/simple;
	bh=NhRGOmX9/MaUTOS5b0eo/6ObEFwyCEmjAFZ2amwfknM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDtMxZvIMKLbyrmqB8lmuTq7kQzYdNUe7JZVs79XXSb8XNeqYdFO8Rk+87JNQEtpsALj9ie3RplR1UXZnyneVCqKw3fvuP2R+ZW2kv9252QOmJOH1SF8VO21NHUP8WxfGXECfzAjyHeqlnUjMGnJ8Gzdz8O3PfSpjnd7YM4yJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL7ckA9y; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL7ckA9y"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac298c8fa50so17082866b.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510133; x=1742114933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=;
        b=EL7ckA9y/oSY+1whI3CExGjwN49EcdYg/Lx+zWQgKPsiRB7d3Bk4e/z0DjYdqyvlHP
         Slm/9NVSqyaudXT/XTlHRPw6IhpqlBC7XceBr0/WVdH/XrxUpOlpf4wTJkiQg6kSEvOY
         kjrjuNhu1On/Iwo9/XtrbgeT3qBpAMl+4IWN95zAKgHCAsSS1r1HMoKqysZSGslDzK2+
         lhXy6LMQMH+mDdAQZ6s2f/yFbSNqGVuSE6aI2aeRfS9dyfwNqbwSQS82ppv6jjGGx+Cd
         pWmlRE9SjHhFNVzTQfc5DRTvPskKAcxnuM7J2gPydNlEU/Xuw4UjB/lmJPSilbN209Gb
         7I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510133; x=1742114933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=;
        b=qS5RTl2W2PvKj1EDMMpGYPhq81msHZYyaodLBPBeahagaCgvGUU9unMpq8cTI1PXFR
         fCSQwD76TA/09glVVU9WU1JLgK5eWFbYO/nhxaV5i3RTuYW3iPs3qQ41nHaQEpXiloeT
         sC2NugpElqYtuTFEQr5D4o9/DlvSwicCfRFcddPx20kRAwLI1/vt9L62IfQq3+JoS9Qa
         C3q+9RU/JJPlH76am8JYlFPFQ6QJTpxmLXcnk10WHR5Bleu728iQW/yvS2RDZNajqxLJ
         ILsmEbEBEoXVd5ngXZegfPpIUeNIR0vBYntCTn7meytkT/i5XQIBNIfXYAS7YdY5yP40
         zZsw==
X-Forwarded-Encrypted: i=1; AJvYcCUXm6vIrwe9NvTgTT83t1GYtjWjZcqKB8MDFSepLkdpB8WPFd6iVLp4NaGspqAiuQX5JDvJEnwlH5TkVX/B@lists.linux.dev
X-Gm-Message-State: AOJu0YxQOnRyBWlrrcDv3CF3a60HyQR7YuX8Qx4J93Ihn8/6zt/mDTzH
	3Shc+gjr263+UZ4DLLWaaZ2A6439cjFCXDNG2pvwQhlS4i1AchNP
X-Gm-Gg: ASbGncs3k9SHrjNWOJDDSq5+iloXyns8SSd9p3u+9LeDPVbhBkaHGGiknJ23DFU7vI1
	6WQ0MxbAx4pXhKyKNBnKuZQl+/0MJqjONfmvG3prCuAKhFbvhLOZdrOWgD/76p1KcDEjLcPTYOK
	iJmZ6CzArkzjiur7IQW4F3PFnQ5z5cAo52NDrW/mY3DKTK3JXpNVtKjxzZv/2TEjYeUUdfesoFI
	XLYCgvmyG9hBfZvL4U3Da2axIoByeWBO6knAgKEPKC93LlFV0PtF/8526SBgSdWCosXywqkyEwq
	xll1Ryj9KkOGruoSYo8BBAMMxI5N9Yyn0wqh0TZhJL5nFsszRCKnXxk4tdIOEzuCWTUA
X-Google-Smtp-Source: AGHT+IEEWfGQxkuZd8tf5P3vShYuUP5N/11BTkYFYFiWpUuAwDxrOihccUqBS80lDlE4wNLi4HgKYA==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr24297960a12.23.1741510132648;
        Sun, 09 Mar 2025 00:48:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:52 -0800 (PST)
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
Subject: [RFC PATCH v2 09/16] dt-bindings: media: i2c: max96712: add support for I2C MUX
Date: Sun,  9 Mar 2025 10:48:01 +0200
Message-ID: <20250309084814.3114794-10-demonsingur@gmail.com>
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
 .../bindings/media/i2c/maxim,max96712.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index bf8c861c836b..9e27568e0105 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,19 @@ properties:
 
   enable-gpios: true
 
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    unevaluatedProperties: false
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.48.1

