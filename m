Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA3D3019D1
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166872; cv=none; b=W6bv2TQhyKZBUsn9aNDd9c+bT3sd6UIFFafRjBz+jLgdKBdVYX9Cc7rJyb6TiNeCM/O44FnD2BS87YV1yXln73r1YSRVKypad4WxRn+EJXSV/cSv0Ia8Boq4nxGViC9NseLfFMkwzXsiESNa5oXj+1240bYl2TseLQ4MqGbR00Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166872; c=relaxed/simple;
	bh=cy1fTRtuWfdpWV0lp1o5RqEBe16gggfZEWrxZ0GPur8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwFrjaR6aWnbGAMgYi0aiDBu1N7Dis8gnyBPQrL7c44bhac2oKEAijRLELgHshgzoJsv+7n3f/tsCLBuQPCd79nKkwPTJUbMSGTkQPb4jL+8ehx0R2cAqkxhSUvXVihgH9nnZ6FQjnG7isgu6Q4L9Kkg4AKnhkT7AvmwMBTWX+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+/7sHaT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+/7sHaT"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso3895412e87.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166869; x=1757771669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71pLyutaBp87cS0Y4+A/ArGFNnaGoasujHt7io2bQsc=;
        b=Y+/7sHaTDrxXGU/sAKjIkdlUAEiqt+D1dqK7ijoEgSz2j+a3/PjulMZsrA7oSBFpHh
         nGbSWB6dSteZxQernX4mPfhtlyaAbYZ4cCYpr+8IIyJEkQiueH0+c99n0uDYHuckSV4X
         VvAq2tvscRuuJMXOQ2/c4bDNErRMyzZL9tRKuTlyDxUor7+reWElaVfIXCA9ciNTcQcb
         NXg6W4WliKK11EianuFDLyRK8ZTV+Q9j1EXKcX+r4k8hixwyP9e1FzEoKDYIShBTk7Cx
         Kd87TPI7HvI6gRl9sxiPV2CHfIn+kb7TBEo3AbSF9PIseM/rldOW/axHVvw3hy6EO+uQ
         eDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166869; x=1757771669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71pLyutaBp87cS0Y4+A/ArGFNnaGoasujHt7io2bQsc=;
        b=jBUwgpfEtfFRbwbZCHR8/Pau25Yd/Dbhh+20pFxGiPk4iD5/d0IOB/0y6LVxIVNGnt
         cgD3p3zNnO+Udf4ujrgrcHMDTb4+8QQlavFxbTcjD2aHZ17IwlMQJsc94CGrOQVEauAa
         4nKVNCC4bDaKeSStn9QSg8/q3Jwivg00ynehczblT/5xwArSZ31q/THHOcrKsS3bBrxT
         DQAoco9P+f5ma3K6kTfQYjATjBgGDCTYGcGuWUiejI5a1DiPoBBwmf9ETTGdCiaJQFfC
         dmfg+oZ/o/tdNXvXOKJbnz7wc61K41NCy/xiNr3428AtLLG+WRcBE04Bz1Nl1LDTfoXC
         Hx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVO1zTErdRtadHFtIpXLYcgTlB/IpYec6oXeCPkiKkc0+bVFKu4Dy8JFAVFOgGfPYOSRRArAnbInNaF6hvZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxGS1KGw8oz33DWkttWAzwMWzjN7xJZ29zAclmP0nHgM6fYU0t8
	PJWhNqXE7vU9kvX9JN6ZDOhQTWB851/qNL9OoxqFVUdySByLr4BPMQco
X-Gm-Gg: ASbGncvVnT29fMunBB4V3KQPp+zvqF4Rj4u8NozxmFgAAxLDR6Rl0m4TT3r+tto7EbX
	FHkxIX4K96beU9lx2UiADwOSnAAWxm4XrfxCr+wTDVpN3Xnl4O74wyO4tU5uFIVvJgzf5kgRzOm
	SdF4IuXNxqic2i9MA9j0n9E4hxbfk46gJqXjCjdpluIgr6lvrgUitNZQ8q8NujrtuubRmiKNSBX
	vgqRD8Wf4H/2E+dlWeGh3KPL6cJZDs54IiPYTfnTJpdXXOhd+Qs4JXwrjGpoT+IPgxkZoronjdG
	7JwVTt8119pdj9sG4aGu4/pbo2hm8w9V2VCn/WK48LCAkASsL8XW+aPKKMK4bDIpwACN/JJScYi
	7h5CyUpinKUiWxw==
X-Google-Smtp-Source: AGHT+IEg1qsnc3gm9kCOfmMvOVRWziPs9tZ0bG+/2BX69CnDioWbbs9wqbu/YMJp9IAdkiymwh1eFA==
X-Received: by 2002:a05:6512:689:b0:55f:4cbc:8522 with SMTP id 2adb3069b0e04-56260e42ad4mr696185e87.30.1757166869186;
        Sat, 06 Sep 2025 06:54:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 17/23] staging: media: tegra-video: tegra20: set VI HW revision
Date: Sat,  6 Sep 2025 16:53:38 +0300
Message-ID: <20250906135345.241229-18-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20, Tegra30 and Tegra114 have VI revision 1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 781c4e8ec856..e0da496bb50f 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -588,6 +588,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

