Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60429C341
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085365; cv=none; b=mNkHzkZI3BZKZI4H5dACgZNJ4zX9WIkHU4k+MvGn7z31wy1DbOM8Bi816ZbBMeNpM9XdjgmJOguXq42iyCOlz3/qB5Ug3fgZpLuKUp2kI/oI+mcnemi3fxKtpxdqyvb/qnnKnCcY2XVKE5DYRRKbN/QIWm2QEXllECzbGu2rVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085365; c=relaxed/simple;
	bh=aYTVAl9tpCjpSvYuv5h7flPjDKRvDIanTk0kRi3jRK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaHoNzyF0yTe4NRzC0EP4Re2O4Ar8/VmkLlmTXuayioOw/7gbAsF0awJUdRfhLr8L346ff3IgK2fOAutXM+JQL9aCC7XpSJtgrYVbnvt0QWr3kk7CMy55Gp8cEvq/rJxGhG1024QHM7EqhGL/2PP5XOoAHWcbKsYIURftzt9DAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwI65E42; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwI65E42"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad24677aaf6so264056766b.2
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085362; x=1747690162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=;
        b=iwI65E42B+W4+hPUfoFXkOVN6nxlcH2thVuy36FvR9RPzMXeIWUSjjEW5eFzfxsWQa
         A03npKGG1Pf9RwTjo0ZHELPq2fD4Rs/j96pcZ7v2htMM6ysRgGrgRUEQvujApU8GwQGP
         c+g1xMNfV0myL/eKHN5Dhso0IaVj+ZtLc0vbt+by7G5Eql4aiNAVA8Afue6qe4ifGtBw
         ezj3uijoNF/c2Df2gFwU+1PqEjZCzHWBh5Bsxy6MaovM6C7oSsUqJ2h3n7V46yvCbWYW
         fglIwXLGwMIcf/sw7TTrcFYPtnxo3QuEWYdYNcvLv9l33xD9R6UzXSK1VSpPIFotJd45
         r+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085362; x=1747690162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=;
        b=j+a2/u+/GrUZgG2cJz1ZhG1BdH4JGY1mb7lcZvpOG77k2dGMgt51VRmrDmVycePXrq
         020yS1zIDLX9v/Pnl0INMEsZkBl7aO0nUro4xFR+hrst/3rdo44B2EQIxMHlshE52iiG
         jkQwYRyA+IW/3PhV+wguGaBPNLXRsLF+SVKUyYjyzyCQnEBCe8K2dJ8ZS/s2AkcWTtt+
         9MEaJUNNKNGIM1GbVJ37KAEACsp/kH0QGfsYYm3OkN6K6dUaXhLggbwY10awtYp7LUV6
         V0i04wIFxEwYpET0Oox3Nw58CqfvHNKlcQdmkbWyhQyaoEL0dq54UqPEcBgPAG0A6DLV
         wtNA==
X-Forwarded-Encrypted: i=1; AJvYcCXetAOvxFtEV3U8wYRTdJFrO92uyC267QWFzbyZ6gU0FHgZC0FR/DD8/v/PbfJbZvDX7wreWMR1h/vjADNa@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3tSFJ6nW8KqEUTFqk7Bz7IXFe2cGvUJgzcVcC/4KKR3xAA30F
	JE2y1Cwid5HTxqlJ73ed86JFxcTgLTGiYhgYkbakSZ6US4QfpZJ9
X-Gm-Gg: ASbGnctqXefCGBrkx3a+zzuNQC4gFcX3BecINlR/w/DKnLbmkDlkP/RNZlI/NKAWwwh
	8FeYxIQH+YjKhFbzX4hHeeh8zZOrr1r6zJ8WnmvXfg7v/tzAMh7zED7cwCo2pmDRvAfreDKpjlX
	rS0OZB4wwAwIhZbQkqIlb0320xGXZBnOU7B7/Fp8IrF2Mp5o0L2HNiJCOX8T9ntqORojnHDCUcH
	Spn/PAI3awvvJCVch+6c0LXYoqEwXPyYAm+1HPetYPr7GgSAnYPqGh+JXYTKdD0fimsSlqccTOI
	AAe0p6zJx186FZ8g3qUsRsQKIF/6r5JgByFrDPr1RAtiZ54MECfNxY3Kj8a/F+8=
X-Google-Smtp-Source: AGHT+IE7dmBvMO5cOOE3urg5qMwIbc7AnYZ1lfFEOfBXmNO7HW+iI3VfDlJjIZrjIU5AhUfuiiplGw==
X-Received: by 2002:a17:907:1b05:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad218e48fe4mr1549312566b.3.1747085361713;
        Mon, 12 May 2025 14:29:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:21 -0700 (PDT)
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
Subject: [PATCH v3 12/19] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Tue, 13 May 2025 00:28:21 +0300
Message-ID: <20250512212832.3674722-13-demonsingur@gmail.com>
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index abf3afc95fc9..84078626ed5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14192,6 +14192,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.49.0

