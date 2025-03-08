Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD12139A2
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458898; cv=none; b=MH+KxaUegKQLF6jLqGfLv3EAsB/kicapEemMpBMzTgjFPeQtDrAWbYjSh90eIKzcZ2nEV9wnFCF+U0nj9/AHg0K3sKRGXBTktA2KrjPHv9K2ZQNO3n+VtJFZP16UvjiXJD9PxBI+0+egr2Of7iV/P0PAhtBcWHp78dX1GV9d1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458898; c=relaxed/simple;
	bh=aY2OdPtIEjCbNO8extSTSEs8Nmwq4TVYO4BTZvMhQEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq9k5RaYG07wpgjDspIziKzWWhJUbhyYNKxv60NiyjnUescv+FfEhrDm1GqNpRjsyIT3bx2AWPx+LcfK+/uv8Vb1Ps2pVp2x+k6HB/sbA9lrBaxGfNLhQPa+0Y/MXKaCdlJAJgoXsc3GgK5eXve+47UFleFX7zpTBd9IKT7jSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyiCiULw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyiCiULw"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abf5f4e82caso566405266b.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458895; x=1742063695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=;
        b=dyiCiULwnfC0KnA19vezw38PclBz9mtTQZsxUWPO8AQHs+zXfsCy6i+VaIVo8FhdLS
         uVYlLnU7gdfrcjfuj0i1PFmROVc95iz9zACSDjVGThZG7oN7GYav1NtB1OuGPIEkjoZv
         AziLJ7Gv6Q+Oy4APNdlfGm1F2vTsYAIDaPq84QmN+RiOnMd+37LdvnKFSwPqUIpWW+ir
         gtPLDDA/zgZ80Vg3UdYcrEiKIrIID1DRTQon3GWDg2JAojoIB2u0uSpWgVRYcJMoruFE
         f8Uqqy3DIdojHAvD3cCW6ZuG+AWR+CNS3AKXjE+XtzQqjNs6i7YXIgBSXVjX4OcmBmoE
         HYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458895; x=1742063695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=;
        b=UvslGD3Vs6TL28wWT+Ln/1rn9wEEzgWmf1065SDRw2+ZPj5trICZiSY34TchSP6Cjk
         gG2JalaEEs74xYJAG1h8+01wBI+e3qrqjSVryQnFG86g9cqhE+XgMMOF/r8SjbaN2ssW
         N3qWbPc7ukff2pWQne3l1Ml0WRXCRSrbMYCrvyhyFzmBqFS78el+pp8+0jxOTbKhrXW9
         eG9XfHBrRTFvq7sBO6fz4M1k2iF9uLfg22Oxhda8LU831hjYtaqj2Efxdt6HNg1EMeFv
         R8F8Ca5nTBkM4F1DmDzq/UEMwxJ1UAtS1IiOzjMeVMd0HNM8SyAIHeGusADwwzNvwHGa
         OyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKrBWXE0VoDrdrqIH3pvOEzVhB4OcM0qgeihtTk4bCP5O3UCor5IJddGkj9Igckm7xsKSxJRJKIF3TY4rG@lists.linux.dev
X-Gm-Message-State: AOJu0YxCt0vs72ps/Z9QFTBvSxjQUkfvC89/XzFjJ8tvng56vBy0hWJK
	Hu6qxpIWTKVEXo8w2bbaQqH4DEcOQRWm0UxHDC90Ap9h/Qs8PI0x
X-Gm-Gg: ASbGnct1XDZuxX7RarQVM3TyHhXeD0RJnuA4rMyS6UPkGwdXyrhZKpUu5eowgCOyy/J
	7NazfFemxaI20l9V6mVwKoihIxr5YllgS22dW5U8QrGkw5iqXtOh8hdPYcw/i1qjcKN//3sKIru
	/dp6jQkTA/46PcXSdR0mENr37ROWgg6+7ZvQzQ/Z+PJ2D3448FCIeLjuX6yhTxFCIYHYuzg/ghZ
	/wnRYCOVS7sDI343bBgvc59kNe6dblEZERxIIr9SN+W2KF7R1+7lslOh0uZPGvBg/LZdlM/cnqu
	fbTTFx9GQqo+9lrX9LRqfhcdn3GOuEVtRIY3dw6Ifx0dWSMI21d7uXidGQ==
X-Google-Smtp-Source: AGHT+IGUMLDPU+kLqQqakvTwdZEbBOPDJZa3MFxXA26YIFzmlmYTztaOBI2ZGBOinmdRJLH3zGhkDQ==
X-Received: by 2002:a17:906:7303:b0:ac2:3ea:c23c with SMTP id a640c23a62f3a-ac25273a0f7mr996974166b.5.1741458894715;
        Sat, 08 Mar 2025 10:34:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:54 -0800 (PST)
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
Subject: [RFC PATCH 07/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:36 +0200
Message-ID: <20250308183410.3013996-8-demonsingur@gmail.com>
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
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..44667b74296c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -9,6 +9,7 @@ title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96714 deserializer converts GMSL2 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..7fcdcc57c8ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14191,6 +14191,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.48.1

