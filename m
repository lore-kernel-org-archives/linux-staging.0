Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3150F2139A2
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458896; cv=none; b=ZKcKC7PQSLPlGuL/as0qjsAWyYh1x8S55TiHzK1rAdvn7VRuln8Hw3jQBrk6uzYjYpb8RGmEf9NbQ3sv47Z8ps6pSusfTe04o15AKJVeMyoggBE+JSVMx8GFb6ljWlKSkFMKqn+4S8FcDq0wFju7/aYZ0ShrzSwdcnleeR4dyyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458896; c=relaxed/simple;
	bh=BXlA8lciQJfJQ9PsocdwlLiXf5zbL4riTB1hSsRUQWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5dlLAUvJEc4cJGk7X1mLGSfzFbZEo1BNgzE5zw5XvgsbOKjQUtP9ethV2/WchmpLTgV2p1hyKTcgB69FxSa3wI2IpEuWzR+xBIGGQ17gS7VP+j6nUSJawItDyxvpPYiadlyDT7zZzV6Xf1O0WvvJeflXRAfFBaQj/Mrlptw8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPw1l7+X; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPw1l7+X"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb379so4796384a12.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458891; x=1742063691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=;
        b=hPw1l7+Xh0lo5KJRkIqC//r8wFlddBCvRR43Ormd0CS6USD+lCqifi2ykY1f2KAPhh
         C0ggL4LuicK3P3Pz1Oq69gbUVQgjxf4OSh9t4bqRrXsvta1SOSF3jI8DQDjz7xqZgaVE
         lxtbiZzaxC9Ext2pkTsmGEA8SCoG7+74TWM/8GAYM6xDDSdz7jyuPieDMSbweVRjDlLa
         8HQ/S+6pQ15GNi8FVHIJCqRbEls8FjF0vmNVLW9d9TvDiCKnZ3CdgL8yxB0fEr9BMxM5
         b0bM0flaTAI6lOoA84hU2AmZm6CjjLaoPEamN1qmvdDKOW5kxGu6fGG8/FArqEr+VDKb
         0O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458891; x=1742063691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=;
        b=Zr6N2sYc/CM1BR+DA57NAC1MfDLT6Uu/vTylLHmwGGqqezecqL0wpoTW3NV0yfGjZe
         aT92lRe1LsGPpsGWPsK42lwiqnQ0Wy3QNs+N3oRNaeDjXOXJXM3pADcitt+/pNLXGlpE
         UD6WwtImDowKeIdcyU+zuOqMYUSZaQfco0GaHmaQzT0ODw6/YjehCSY6xkWyyPfWIrEL
         cV5aYxZwS20LEwERoYIKJWTMbfAwW/hq1IZKzpHC4djWrOssMnYReG9gJbbS2Zoo93wy
         SzS+8GKHWXhQMDDvuoRbwisPeDVYNZQhf+fbt0IuwnNNtFJ9yPKQp9qHQ/Sw5c3gqemC
         KDHg==
X-Forwarded-Encrypted: i=1; AJvYcCUsDfVZOAWkMrT2O0W2EID9dFXrcOSaT1HWPVTMSHTs9FoolzHnpSTqKxq728D5LUB2hdy41pTckUgr9Mnl@lists.linux.dev
X-Gm-Message-State: AOJu0YzWrUEhvqOjBG0fD3vMonL782w3B6vnafDecFIl9E0mknX7hd6x
	Rqu2r8zD9b8WXzSithKQJmcifVBS/sfPQ5JnCS4xA3V92WCyhfkr
X-Gm-Gg: ASbGncv7FkmOY/PFwMLCnQuuHav85TroS5wXiTbHxeAdhF7brBL/X6eFcB0SxKU5Mb+
	WPgTlnDDi8hxjLQQLHIQ2YFJOA556e4MebCckP1RWB+9WclXxYFHAHNkL6skPYji8PyVEK24BnL
	t7yK5cuUDMG4DG6iSz6kl1oaTAT0uqOf76T0Xqe/tY/3oPnViBnrQ0epT5CnYjYZbTOY3AB/uRP
	VVBAjtl4hSyGubwwRKUsz8UzTRIVR5mIa11M3mEhjHJ06apgjGJK+VH4xd2MorjzCHrwntvkOTO
	CG6GWNSD97DUINrVg4ad92TJUbHuaR3FEhCT2A+Z5ma6nrwGgfSGjZaDAA==
X-Google-Smtp-Source: AGHT+IFezFam6alDx90TUfBdNmoublXmOdXfqhoT08gBkDkGLkO7nMPBmg+CdG3FyRvs8OOwhJtfsw==
X-Received: by 2002:a17:907:7ba4:b0:abc:c34:4130 with SMTP id a640c23a62f3a-ac2525f958amr896455566b.18.1741458891246;
        Sat, 08 Mar 2025 10:34:51 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:50 -0800 (PST)
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
Subject: [RFC PATCH 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Sat,  8 Mar 2025 20:33:35 +0200
Message-ID: <20250308183410.3013996-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1e5b85167d0e..2d7440049318 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -27,6 +27,7 @@ description:
 
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9295A only supports pixel mode.
+  MAX96793 also supports GMSL3 mode.
 
 properties:
   compatible:
@@ -36,6 +37,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.48.1

