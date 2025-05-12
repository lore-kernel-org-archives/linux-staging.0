Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38C29B76B
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085356; cv=none; b=j1cmeOBAGxPnFL6d1NdbRzvcvxUiKeIiLt4ilwOkMgbspblQIejOz1mPD0u+jVsSE/K6/HiRQ8Oahl8Ck/Fb85Y9XgL8tnWJJ4Ly4ldylRmQtglff0i0AHjo4OPrsVN24CTrnnkIbPvtGkTjpU9fTWXc5snESCvX98rDY4W+Mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085356; c=relaxed/simple;
	bh=AI5HO+L98N+ked6mjPhmFqainzTC06f5MQRiYCifuC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anVw4kw4hteTWqgNe4IIAu/nTwtJouvofN7iYWL/l+qpqtAyQ6+ZEzWGRvIW+Cueu4A5XFk6+u4WMRU9lkMHdlHbWJMyFaUPtKsitl7UTSSyke/kckCi1fZM6/Tk3eLOTvm6apgdF0HDHvkWT111siliI+nnr46wExTsh5pDvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHJXEDnz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHJXEDnz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so1480557a12.1
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085353; x=1747690153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=;
        b=lHJXEDnzTSzENlJZ7rTHbEJuMe3ZdMxuzPtp26peETvQBcBuS7B3PkFmWKEy+wopfX
         oMn/Pm2WvAQY+OC+VIxHlBwI9iY1ZKaorzxoVGY5CNh/x01FUMgfqm3XP4DtoHR5tUMk
         ou5VTdT1S9r2PoCU3i8vRFj5cmS68QgE3wEPT45Vb2oZrppwKpn9IScacPGfULJMHG22
         dsZssKZ6cUXSOcW17Y9E3rX7WoLqu35aMFeuBLRgAhUfHDRb69rpG3jUcWMoytLxNpwL
         tNNX/geXBg8irwUA53Ht5Q3nlYosWSyNeeMC6/k7jwxQRJPLtZGr7uSToA2g87rEjx0R
         9ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085353; x=1747690153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=;
        b=oywn1FAr8QrnzkaecvzQ3rFhmNW2QDLCH8GK5u94b5YGZKItmmd2GR2GeDNeWOB59E
         yAkkxYrRs5HIzAaOwSmQ1obj4MlB1fGA5b6VG56hDAmdPuGT5KWxTUGK0+DdACd8wvyG
         XKaeipwDq3rHd6BQYj7VQAr49HiE5MhlPuvYQrwosC4YHHleZ6W8JE2y21G5S+NmXnPF
         5c8jd+4GarbxuG5i2rHKR93M1+O83Ga+lTUlxcjFU9UopR81n7Bl9QQngLEwzo1DL9lR
         VPPx6dljmUOxQ/9KTowgp0VcGs/Tt324pVSSKq2bfkdk/ejHfkjlv4L9MopyqZt9nFix
         WvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoLdfAcgKtEaPT76qiyyNkgB7BX4VnR4w0nQAZqDFKW2ENz4Yynoq9gdmocglwTM6HKYoGdgjkzz4wK+f8@lists.linux.dev
X-Gm-Message-State: AOJu0YzWOefj6HTUbsi9wmVIDLT21FBJKIlg2OrAIlCtr/og+NY/As+I
	WvRW7PD4WUUaw5LyR+RuRSXHlNyC8vL5NL/FpxLsy4wumE4MBvrW
X-Gm-Gg: ASbGncufuyIoHGgqgT4VJkIgA/DbJLLre7kFlOPQ3MyR1yfRJELb/UoDVIeIFRcyYd1
	B/WuOwGlsB9FcIBCkBAwQJmz5z0rsfGApE2xag8FOZ+o0ZHcyxnBgopsufqbsJ2LhLC+RBc1o30
	JJopeWGKeUihszCyUUlLJDmWMVhRhjRINNHdeOvkEy26RJBHRjQeUsjb3ELlycgQdFt1dLyWN/E
	MNUv6rYXqDK7qCeytbz0ev9mn3oXSIQptLuLJIevh7PNZlenspDWgMUN5pm4kII9a3tD1pSWV2s
	PK6U0WfGzUN+cP1BbttlvX5QNhd4Cc/n5yPp9J5eyS0obGwypZEXZDvmzyUviXk=
X-Google-Smtp-Source: AGHT+IEn/Ow2gvZ4FE7aKd+7Z9RkGF19BSAk0UsqyhXis2AK9rexBmvFZbe0MFYZuKP4CsSSd+al+A==
X-Received: by 2002:a17:907:6a13:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad218f072e0mr1388653166b.13.1747085352861;
        Mon, 12 May 2025 14:29:12 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:12 -0700 (PDT)
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
Subject: [PATCH v3 09/19] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Tue, 13 May 2025 00:28:18 +0300
Message-ID: <20250512212832.3674722-10-demonsingur@gmail.com>
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.49.0

