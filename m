Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408FF29E053
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085378; cv=none; b=s3h8FoLueu2aSyICDZzM6iN0M35tYIargyUgGkUcMWozSXI2iZDYyIEN/2ApJq8cbwIlY6SlmszHJxKVVPP+o6TiIPBCtOAeTzi8urWp6NyHVwNhj/lXkcKqfE1BJvEH7WXWP1TQJxC7w6GqKXY/BJ8Lh4bDnncud2GlTbn7JJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085378; c=relaxed/simple;
	bh=JnE6XYfviXuKDsxNfXJuEWgWM5BjaHUVzzw4UaLBJls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5+WCvof5PsiCJPvmQsa4Zc6lifluikNOQ+yW2Aiqo4E0Ui1Dl2l1W/blmzftsIauM/mWstJcZVp8AhKddo9LZAuWb3nOZrIXu500dvZaIetLdlYuhsaSvguFFYiIzzAGyCVMMIGByA1lynSpe/XbDa2HSHTNl4mSk3u2d5Grpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKw/GTbu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKw/GTbu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad24b7e0331so309846566b.0
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085374; x=1747690174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=;
        b=PKw/GTbu1EsqFMeiV+IEDTPgSdkZWDb5RIBC8evrvdi1V9cKNOVz/7Y91OxqMFVKzX
         cqjUOUwNzxuEDKS3QnWhx+N1GZtOwU8Gh7kRFrt3FHZ4LW4mXUxPGHMKkqHf/kR6mHLT
         yY3UL1fQppqJUvBODjWF+Y88O8nInvDocWeUdM5yXniZ8YlbPhxhvfCVd/AEISyPdmi+
         LpY/0Q3Vr+qwgn3k9oMBcVQa9epn2UUEQ+7R5y4nmU73SDm1CPBI3GcfKthRG5WimBJP
         RfRsHUqaYtG6RkoMRh/A+C1/lA+cU7H7kZ4/Xzdxr3WGh4pECeBvNPKwMKPUT9xbVQbs
         Xi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085374; x=1747690174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj0AjGJjQ6DzFsBm21JwuZJt1umVaV7A/rQDK4jKmt8=;
        b=k5fhqQLkFeGfIbfN7+AlTO4Vg0QEAvyf5b6LBx/0DBAOvezODnb2ZGIkUufho0gwVV
         likzcEuuOm0aF48vVGmRJOY7jiEc6WLMh296ERbx2v971HYpXfHJkZBAAIeAnL2nO5eB
         ReKyQlzP20X5xoB13fJIDnFaWUbU2Nh4goI3IOh47sjYuoBXRC//36E+DhR8xoorvD0d
         7fywLJvxP4boM9J3D4mgibeWyM2AdUJ96OtZ8gqGzFb+2znMwIItxqCPZyT0gLs6xA9O
         g2NYakLEy3jczQuPojvqa6OIjOdCFk/iqe3WrV0grOcjxGqSeUyW1tSk35p4WHjVfWU/
         Qsqg==
X-Forwarded-Encrypted: i=1; AJvYcCVNfbdttkZn9yj54E6P7iPa/4nUbeb0nanvbq7jP0O50brFdLgZ5DNyua/e+O+VG/KfZr+ATreTyN6MSZCu@lists.linux.dev
X-Gm-Message-State: AOJu0YykMEtx6dYm82qR4SfNs0tCqB3Tt5v6vrDkh8LGGiU2WFI79Qg8
	pPf9RW8PbS0+4UDY6bV5wgoIm6vvxX8PB3CF/oFL3ClDzRlHsgNq
X-Gm-Gg: ASbGncsjbF/Y4P2rV6ds5fd8Ge4EnL/hjzyiWslzszrvvK2Fz3OezD3uIrMlFTfzgVt
	7btDlxt6OJ0/QZ+oasD/pEL212jYWWnXymUSTMxrjt/jjWWRXvGAfVJGvSKiD7GauK4Vo7LY22n
	B0s9Mv18J7YLG32tB7H04wE968T/Z8oVwdSpN5WEUQ+2KRW/TCYT561WotYgOPDLck1vSwhR5ak
	GJUeV6fV68uOLCV5bItvE0rJ5yvCr6lSR77pIRXiIAk3HkSqOiKW/xmd9zvuV1n2pvhU0GK1eCV
	WujNPKq3GyBgWLTwnK7b0HoLW6gfzNTPW0ligzPPm0E0FHKqDGx00II1DQeUGS0=
X-Google-Smtp-Source: AGHT+IF60+t2YYCvPtwjwNRfGqKY0KHkmhKRyLDewu+gGn5Xa385417TgpoSalLWHueRIccWcIUMMg==
X-Received: by 2002:a17:907:a0ca:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-ad218fef297mr1289068366b.22.1747085374466;
        Mon, 12 May 2025 14:29:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:34 -0700 (PDT)
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
Subject: [PATCH v3 16/19] arm64: defconfig: disable deprecated MAX96712 driver
Date: Tue, 13 May 2025 00:28:25 +0300
Message-ID: <20250512212832.3674722-17-demonsingur@gmail.com>
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.49.0

