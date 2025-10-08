Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942A2F5477
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908691; cv=none; b=qcxJcxxyTnuTVolNXa2Pnsx85GIb44qzxSOzpZ1R8zc3fq0d2+Bvuet1crUrv/hA+pyzTkmYrTkGYpw+5/pBAorHlP9v/NMrGIcPh8GWvUF3p7Teo+xJPdU3P+fk8K/yzqgXbr23GLTl0Wua7JDnnWrV/cvvFcxld8I3bAO0yHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908691; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNO0bLAzZhaQWqJt0/uQoCCUhxk12IBbVOqpDN9yMwnjyklBuldxjz0oJwyB2xdDlYOqqc1AhQJg/GM72Cv0Ti6RiJrylxEY6VwZCIZEKiyK1d/rjSacRNLjVF4In8DD1etPJgOx7gntoC9FhNkR9JiiC+96VmpCsxyw4exMcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy86dlrg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy86dlrg"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57a59124323so2274800e87.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908687; x=1760513487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=Xy86dlrgU8y+ymsAygyndL8EvwP0Y/eZtf65DB1PiUbbrPimihB7km5s/sgLhulAO5
         dPBn0cADdXTuYte87kaIPC0MpiWbpQZvn0pUdyupatuPFjpzZ81MKxDZktfUfT6AApqY
         leiftcweK11464zhZsQF20k7hsIo8KI9mMG6teHeMsp8pagSnxP5pfB32ab0r36KOwpo
         UlSntglhxNZGeHOU9rxYLpV2bBy3RBX2s2HOHOa81Ya2O2vnIlBr+eH5eQ1A95ZWNvHT
         HCx28lcfS08eKzN52HRlyf2Ibs4YRZLZEiiJN1qd6cjDgQrt148vfFxHz4VtWsWcRw51
         E+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908687; x=1760513487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=fS5FBxhY4cdycxlGvkrGsa57FgPhIY7fxPo+JB89B8qkoTiEJcCzfLn2amK+oXejRF
         WVq+4HqnbXO1vx3DHkwvXUgFweSTpDGjzsYP6SuFcJU473ZDJMq+hGyiux6ZPIj0eSYB
         tSJnOzzqKXU/NZHhgLsPgWVcXbd4tkDXDtRcTF3HE1PyW2HD5NKGsi6LJmH4NpCdJOQW
         NIJ3yseHdSUXBDU+k4m8KSFcrMFbri8lAx+udgn9Acd63iktajhnQvgF29HAwYyPz/ux
         b1ZlTl9pCbyg6Xd9oy0K3NbSRET/HA2JynGz/2Ptp9XSwkh9vilSjIi4wSo0v93hjzPM
         uCog==
X-Forwarded-Encrypted: i=1; AJvYcCUVltcGtXhGOGAmrr59NPEfw6AIetgq0Goqw3kAO+NrDNcGIAYBrbvN0I+TyrvC9b5w6e+eCmVUdKj/rZfn@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+AAdxrBCVEQkY/Owu8zR4ozB4zKbwJNQGRH0rtOpEQ5Xn8Yt2
	li0dgNFUP6byHnmPz3OAA0A4B4yPMh4Eayy9NjHH0JJFx/8rf3ACnt90
X-Gm-Gg: ASbGncs/ZAnYcMTFQq9YNSWWXJolRalQkIP7dIlmoeiKQDwhyV/+k/vrG2YIwlLydXZ
	HpBK0eYk7fZDPwxtf87GwoeT8Pa0Yrq8ps13R6OS5he1YiOAEOVHPMk52pN/PnJiyA0K86yfpFt
	hfXEHU5aGNoIq4IOhBZ6LoCQuz3tDFcqOSK0N77QPg8Ly2fSnXEB+esFvSMoXI2ER+X1JRwiJWA
	Va/aoey7Sy4zHJiZl3+qeJzyUBkEPuy0ILSeL1qz30F+oClClfFFpdTFfCnJ/YLdNCoWRg33cSi
	P3TAw4ReQWnD76nbTyMBPp1Afj/Rh4zmR8hbzOOgBmAbahllrQ0DZeuDhkORX5xyKurgE4AiS0C
	5pr/1vWGyW3MCTx3NyCdwYfLqOJ+zDHMzOBZ1RwMOIFWo4kIT
X-Google-Smtp-Source: AGHT+IE+7DyJpwvFP5qOZN8PeNT6/Gm3MISOvz3ifkWRFTEcK846nRXZ88LLrVfYB+NusyJQJau+2g==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d10c with SMTP id 2adb3069b0e04-5906d88b1aemr661760e87.16.1759908687027;
        Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 08/24] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Wed,  8 Oct 2025 10:30:30 +0300
Message-ID: <20251008073046.23231-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

