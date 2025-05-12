Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F39299AA1
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085362; cv=none; b=GDxnP1FMfScN5wi7MSLgrAk7E88iZF+nogTrsk5R+WzeFAb9gV3k/6FtsOJwKtIWpZuK1SBM3Gg1w3CO/eaDRZ/oWAjJOp6mU2NZGWe1rNaz+ohBg+EyofgaIArnj1AV3bv5p1pt9Hnh4elkhl1lAoiwD1PaAzqAZ6gp1crK53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085362; c=relaxed/simple;
	bh=CGt+urdvC7bWYv8M2PFC+P/n5LD82zm7rxySf4RlgYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6ePQt6FCmwjH3DBl0NEnuZfNRUs8hGYbp83NWwhQ11pfAf9vL6Yt98D2zdP95gOOcblvfMC6ifIEypy1sHIWs4VnPrPe5rMQq/9nhcM2TgVpuTpC2nj9nUMl7RyjwGD12cr4NGQ6oJWKFY5C76qliN1D1SiEWxjRxwxy4Wv1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTvWg+OM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTvWg+OM"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ace94273f0dso948640966b.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085359; x=1747690159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=;
        b=fTvWg+OMn4KdrhtWtY/u8GguvneWMScYdG6PNV/cMSDX+bsJ39ONV1Rt499qLgcmZ9
         vpA6QoWNEJh5NkFShK6MV4SBWa6cq2aluIx+ZX3Ss4Sm8eEQW3efge904XUlCn1vYjgt
         7Vteo4FS9NsEOvrBf56UGX+3bQLVgZogdDAs9OQU4d9Hcrpva0BiQ2oWfR5GsqjRBF1l
         y0jzJuY6Kb9oPA0AgAfvCvXbkNa5/XxxepveqrHRiKD/6KJPymtIuF43O9aejG6PhrlI
         374ANYhrJ/lCpd0NQ4csPK8GW4HXqeugXbFp3eCpL5tSZcjcZgcuMUdxb20/TIyAHntt
         +1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085359; x=1747690159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=;
        b=p5A41P3sAyoZIjvIxZER2F8JzmHV7bA9l7uE1AiBK/lK71spAfONXM3LCGJHt+xiQv
         Syh5VoCnQWnx1NKQ4Wtmdehg5kyJDa+y35mMAXprsXBvoYeNG2mA7nYLTdgaBHVHvGcR
         WmtAv7L6b1RbJmRue21JksnvQU3fetKHwffoIPKBoTtOuyzfFiojH2TabGeM3zxDt1kH
         9ICBnJM45msgC4rMPnO0yo5U2SaLAtqeGfPPl4rz+AHaglz1YMU29U7G3n9YE+j9NTOk
         7OTNSzCoKbQSiOqBLlOxC0BERy5SRnb3DQRsOtr2uwibs0VNoARrqzh1AU0a+cQuwf9j
         aEYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cp/sL/QC54rqvCggRR2ZfE9jASj4ttmj4pv2IPW5jtA+q+U7F+lhz7wTbSyeNzLlMXFlPXWaIjYQbJxy@lists.linux.dev
X-Gm-Message-State: AOJu0YzFtmDpFasoLScauM1bLfERKfBl84V1P8ub/diqir8qDV0rNkXe
	aSkDbNxUMWacaKTczXwkcdtSJ3bRnKaU1QfzrGN6LMduAkvuUyIC
X-Gm-Gg: ASbGnctLNClwtiPhw/sP7kepUmUGSvD+mhF9gzHtEaGxESUHIK/0Aa33b5t6udv3Idz
	HcDxuaH5WGDqr1juGArpblMqWKUztQ6BLZf+4F5Pv7lVNueodh1dflJyawH0fQTexkjbKXdRZN8
	PuazJTWmF4BS3BVTqsRqyYulCPiswf15VK99In6rzHidSBWm+42p/BbeVNN8CwjPFms/egXd3Qo
	b0/S5eVuFcbK5eJ7UXEsxBkYsbNeks6lt56ezgaES9qVOr2wlzCe+sCa9ctjgZt7SgpHKmEQYj/
	tpKZPaIkUgaZ7Wp/88KtB9efH5B2Uo2GaLbvOIQeCeseFsqFH7EpQuMEMVTRcbQ=
X-Google-Smtp-Source: AGHT+IFOVZsqKkUnHrG+Z2T30gLqj4jyTC304lPRcXNoZpYwifO2FrYbU1VK0myyirrCmWtQYAce4Q==
X-Received: by 2002:a17:907:72c6:b0:ad4:d5be:8329 with SMTP id a640c23a62f3a-ad4d5be83d9mr91960066b.3.1747085358761;
        Mon, 12 May 2025 14:29:18 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:18 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 11/19] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Tue, 13 May 2025 00:28:20 +0300
Message-ID: <20250512212832.3674722-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index e38213209973..0adda5574714 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.49.0

