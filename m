Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46751FDE33
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458876; cv=none; b=UsQWF1BeO2Zl5oE8vtCfdv5jOr0lG17kA+ElQmhaIqiGlPn2OnVuY3J0r+Or9kcQyCnCBlrwekAnApVHPohCxhXpOj1uVPHOX7ixI5G6I74tenJGIRuDUFZMQpjPYtD6V/IvcWaAOHXqbSNl6Cloc/A5Ts9qMqnVoKfsO6iJjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458876; c=relaxed/simple;
	bh=7z6smvZGWZK5IVexMzCPUepQOMHvMOYKwZikRSdeV8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEWGi0yt4LHShQwkpxHeSqdZcm/JC+aFlyjusVE+jkGy1+xYXnECz7ENmxX/dl1Syp1m9RiF6koGrHWg5F5jGzE7+Ue1hSyzR+ONYA5tkIi8Ksq1wBcXdbdyjXHqVmQOtFV3Uc4+e4ob17BJq3H/bblOcaaZXxVXtyzvchrX+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UondHzxN; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UondHzxN"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf5f4e82caso566365766b.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458873; x=1742063673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=UondHzxN1Fr+lXCX9X38/jDeXudkAe1lCwiC9mfuEXf0LN3YL7/MFOVUANd/8gDLAk
         tmVu5EoCbtr7eUfPCwFykXUvqppPqyaswusidJWOslDf0Vwhj/h/q9x4PRY6mLK2Jv9f
         gyudxmOJQqdQ2Lo0IVWr+boRhOq9+ht8BEfQDD2AVUsodwPMHQkdDWkLAaJWb5LLgtA9
         VQO7ndYa0eb18UibSI6hnDb2iIXrXn0rt0X4VSdLLRaIVx5S0ubgaXi61HbWOZ/cxryg
         fRS63iN9qAlbWi6mBurhZzr84Y0y2ZiWkTYmSnJsm4mII4SJ4xJd70PmyHarP2AeHcnk
         09Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458873; x=1742063673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=KkqsYvBBF9eNzeSQS3w4PIKTnIH5WZ3z/ETv7EK6mQO95N+TBqgFW13S8l25nTyTDf
         0/L7gam5M7G+z4Te/Ws1d8I8xVFXVw3b9+aYLzU0HZa86ku+YdfSbXZ4L5N2IHglxt7P
         KHlFBNwJJ0tkcNG3KoYUX5zrVIE7akHa1uXtzEJYxOKQFnwlF7P3mJLg6hETZJiAlPrJ
         wrQxS2oZe3RB2OFXiCmhjI+A+3LGAOj5y7VnVq19aTGWc+ZBQMF2afF2s2XNSSn9Zh02
         vLMVmuGVSNngN5ogFyxhzR8GKrg6uUnKpgwYSCzQmklDXva3tQ+RExlNMPpdALPXvRv/
         zIeg==
X-Forwarded-Encrypted: i=1; AJvYcCXHEAFNuroRCViAnNxYBbd+SvLd9nehmqdcODLcf0/D2/x2EbjPG2ZpyEk/XeLG00a6ZAl96Z76X6xZt6L9@lists.linux.dev
X-Gm-Message-State: AOJu0YxkBOMCmzhI72O8RFhnRlT0J6AqOhHrXk/Y7VeqB7PfazPL5Yn2
	5JIos/e6sciHyvsVRwXD7D7PR++TbX6HBD8Mi6JeMhTy87f6MKkd
X-Gm-Gg: ASbGncu4fSc9OPPDI85Z9K+HMj5JBastKhVTyqASD+nN0JYETatavwtbXfT8Y6pdMsb
	Nev05+ApeKJ8ZNQWmy4/dMJT4P3b8nMaxMEEydmYyBO1daX/G8JM0oAXM7EiuZTVFYd1U98oPQz
	1Vdv30w+uzLAbM5TmZOxbFXhlVJqsmpf2eRY0tz/WL3WzA03SPxL3dAJw01Tsi+JmU2+IF3ol6z
	QTbf9nKiwVYwspjW5dVpWETToT4vJZom8Rh7gPd5yElmEexI3YbH7BpfjeQF1i536owiraTuRC+
	rMmY9HhuM33bQi7MWnbLh4EbFZHO71X9WOZkZAX0m4/PcqBf5R/IiU6IAA==
X-Google-Smtp-Source: AGHT+IHHxecPfjzvfdbEyvTYOJEPLEU7vh7wD68UjIC6rm0+kpYMQ2ocUKFfty06j22eXjZ3vEkUfQ==
X-Received: by 2002:a17:906:6a29:b0:abf:40ac:4395 with SMTP id a640c23a62f3a-ac252bb26b7mr1043960266b.31.1741458872544;
        Sat, 08 Mar 2025 10:34:32 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:32 -0800 (PST)
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
Subject: [RFC PATCH 01/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:30 +0200
Message-ID: <20250308183410.3013996-2-demonsingur@gmail.com>
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.48.1

