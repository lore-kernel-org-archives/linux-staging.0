Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28A1B415F
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510129; cv=none; b=aXc1zH+uAF6jmc+yZN0juwGiLZxtySqkrFuTFezMKDDtk7bzzR4Bz24y0CJxHwm1IrIEGdeRsvYFlbL4oZP2KXjJxxXHOtxU/2B+SmVmPk/e+qzCScxtfqVPn1Bs3JRbXlh3WrXMZTvkhLL/aSH3Gh9IfvncOCpzsyCkZX606sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510129; c=relaxed/simple;
	bh=AzgRF+jbMhC+vfx7CPem6eqzqNZ3Z2lH4KyJ+16TxOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1B70Z+j/PU173gC5NM2zMxh8391CpNRxugvabX+/2W64j9Z3IW23yoRbJkQPcIyr8FGIJkT/wZHsxFbAtl/jq6zIYDzZ2y08KzwzHGIOywbeRKfOggh4dRlxu3IdNY47xa388+1FFOPS944XB4BSpiysIZheAZ37T1qfKrqayU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W31LYwAU; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W31LYwAU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so4930220a12.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510126; x=1742114926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=;
        b=W31LYwAUow26+ozhRr1fQ0uohEraypGrxF3lxQF5c8A7jE48L0xK48WxlftqIkfswj
         pUkacV5nEvtAzsqBL5DUzmAa6evAzdYagOSxdUUEPVuSstL0WXTE1fbIDoshIBKNtEbt
         DuWtuv5BAKTXJ3x+n2ScmTJgtmishN4c1rySpZTbjvLRcE5UTIFq4OAmJ/JS5BV1xg4Q
         5WNDzVBeflBhmlHyKcYzwAYraSQ37FK+rF2vvkBdafxMjJ21iff+OnkJwSwUdMJZSOJ6
         WYSuF0Ro73mclDlweNZwTgjCCfS/1hn5fR4ZwZCttVDSUnZtyX0+OIm8ead6g1UEJt7R
         MlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510126; x=1742114926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=;
        b=uOYCrgFWIIl/T7AtiVp0WuDtU46F7mWzJiNhPxB4BcOZEZD3qVJjfZF7cRDJwKzZdJ
         J0b4b8GeQSak6y+S9YpNDO8jeT20wbhrgM0jg/rrr8FFDKdOH6tXxbWXKmoA41FYwH4F
         MYENJDyg6XSPWiTVKbyMD8fPgJC/853pVLWwgqMseXA770ySJbsEn01n0cPH/gmTMz1g
         sOwxUWfJBbi+urACDHuNYRkp5JETMahQkh9mEyHdbjeTqRzvWaUVaxbXxrw/pNqNZ8Ga
         hislfthuEKjzf2i57AiYEnxvS0nwNMMW3Xrl5N7i5cnPsNo5vpYTiTxG9HCOaVwPh1ba
         B4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl4LCXVMQc7jrRyjFIJ0CUtOhE/CtNgCjgluwVyLj5NLakP64DkyP0pr2/Vu9leH3TFPMR+x08KXYC6sEi@lists.linux.dev
X-Gm-Message-State: AOJu0YyB+yhc5MsglrjjUjj5Um3JZ3D5YOAgnezw/T8R6ANsbpTTmU1U
	h6nuncioZpO6TQTz635WIqax9XI9RgY63rhs8nA/6BiBBain9WRU
X-Gm-Gg: ASbGncuD620sb9p37ajeH2WMeOSgvpv3Q5SWwbym4Li3EKm1TpQUMhAzgxT/Gm2ugPY
	AVq4OsKakpJmbl8NT2eNLf4jiVvfWmzZI0CPBD2FxRiknmpdRSJh99+f0OVmG8Zka8Zheu6+TDk
	TKVe0DmSzNtlKGC+fgCi9QWMoW3tDc43gwN0eghQgILq2+O4AdsPZ3ZO3DeiCASvSQncYwfC8s3
	BUI/deUkvtxwjMafxH3VKB91Tb24nz9zW2N860Awjun1i5E6WKo26q83Jl6s395tyulVxBjJRW+
	VXCyrvsoK6IaZ3jxhtepndFYP7ikyxld+YakdTxZafRxMAOmSbdpUuOVGA==
X-Google-Smtp-Source: AGHT+IFd4OXwST2S8J6EVuRFcvfp8HeWmw8/swAHhqOkgPPhysWXT9icPKoNrSp/fqbd/dZ8XFRNhw==
X-Received: by 2002:a17:907:9719:b0:abf:46cd:5e3f with SMTP id a640c23a62f3a-ac252a9d6acmr1037408766b.16.1741510126320;
        Sun, 09 Mar 2025 00:48:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:45 -0800 (PST)
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
Subject: [RFC PATCH v2 07/16] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Sun,  9 Mar 2025 10:47:59 +0200
Message-ID: <20250309084814.3114794-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..abf3afc95fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.48.1

