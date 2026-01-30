Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF43806D2
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777411; cv=none; b=Yp3QBzzDx3hrjCaqsJzbff+Bk5XUVfdw277GEiCDlxXqtJAucXQSbmL0WkbQIT3J1RaYMikj/RHhPs9FOcMKWtEjPQc4AGj2V8zfW0TLDiqCMUT6ij679Isue4Wk4sNmiOo5thUzYeyoDGCsV5aio4g3Y/qtAD8MEnnsmNYy9Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777411; c=relaxed/simple;
	bh=EuXSZFPJCK7U29pmE8NcCmHCEEPhWM8lTnBth/7gT4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJx4K6VWpl2nAW+iwW3AKryiO/ACgbubEyE+oPLJs3T4zLU+a51LH1hvZMmEzNjlYVAHDVthig1ddmVFTNAQ1ZYdcPN4XK3Q1G30SUxWi/HNtWVwdUT9G6a1rTlM0wC09JhXwJCKSX4p9wU6LCrrDLCyPu3IgLs7InsJO7Vy3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heM16Do9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heM16Do9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2670932so1986768f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777407; x=1770382207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=heM16Do9rg12+aL4pZEFCWEoBPCY9UPj0AH4LrJ+x5zh1MtL7NjL2A9/kMOi6IwCtq
         gj+v9YNmcVwbjNBwdnnpp4mKzh94RKokmkK8MM2MV4+OpupCSNVz29efpfnyYPrZ9Vsm
         MIaBgVfwCYAHGTV/tOBaboqATwMgdlxDko1HftgvEXsAX6tseXD70RVCA+hnYkWHvlMx
         GvsO8z9ojK1eo2S9Ig3LSGvMOPudXvY0F4NLEjKu3gcH+OzjR3bkaH9RbNuF2zaVym3a
         NCSJy9yoDljKQXbUwb//UYd554q5IeIk8IcnqTNx2Z7CywXSgn44IfSB8jSmp1DKWjzC
         MFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777407; x=1770382207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
        b=KGYsWTvPYHUnp/oWECqVPvEyszAMBtIg0nucCguKjWGR53pqONLEp8g4FjVyO4zdpl
         s7snrSGXrtsaV9vVAEww6B9izvJ1Rg9CgPFuHIFIZG9r3b3YIoL8PERpGS6gVDWkPCOO
         yJ3Jyi9D7AYDhFOOX/owEG/9QHNygq6wgNymQuyr1/gpfO9UHgRfBp+DCtBsz0y17o5/
         /bDAedrQpKp0Cr4MWq+1qsoTO8eSISbw2X06Kg+eq16/76F7UQd8VpDnDqP885Un97pd
         z9gzT3xe7LYZgauZrQmQeSacaFR8pkLukRQdMCzwzj+2N4ZTkkHhM8PC+DhXgfJw5ksq
         yl4g==
X-Forwarded-Encrypted: i=1; AJvYcCVZvkcmbB8KTpHs65sqLIHqLZAWfMNHjsx+t0TBRJArD6IIYPAJmw5mLqBfXmO7Nu/avsbT0TLlirmMwyPh@lists.linux.dev
X-Gm-Message-State: AOJu0YwAk+kO/xiRmBfGvsnjUfb+eBK6biwGjXzBw5jO+sVGrajJiDZm
	YDlZg655E3uEdgqb/9ZQO6fyCF192HeIQ3QII1gFUDjpsk3nbzBid9Jp
X-Gm-Gg: AZuq6aIiFZA6VgAPQRvtlISsvDvv0O2iSoK7hNxhjrxVRBinmn4Cmpx+NigC7ropyFX
	tZd95cRO7fGCy9a4CzNGsYtreOpHebMEll0WA9NZmSJBxV7PaxTZOvFte+w1B5NVGe0oKWN+Xd7
	KjTBQYClj0gEYNxU4QhKOQxOKcuEOqiqBw4BeWRJNyvL8N4c1b05BVNvUK51aFpWyGuPIxDbjW7
	zhfl/uOL6JfR8m7XRImgysK/xGZCjD3lXzdHwLUqp+PtRdnyv1E+l0orh1jkhiolitolKMmNhkU
	SoWVv0gC5Rv2B8d/qm0gEKxIdVkELdxJxA6Dea+IKfZMCA6cUcCMcv19QMt0oegM+zrUGrvnTQb
	Avp0q0LU6Cu7FzhpUNEvLvYcpOGc5GjGtqLKGmvZ+9T4t7CFSJxNLxju764sDD6LhfeJRQviTif
	4D
X-Received: by 2002:a05:6000:24c3:b0:435:95fb:a0f2 with SMTP id ffacd0b85a97d-435f3aaf7a1mr4266059f8f.46.1769777406689;
        Fri, 30 Jan 2026 04:50:06 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 11/15] staging: media: tegra-video: tegra20: set VI HW revision
Date: Fri, 30 Jan 2026 14:49:28 +0200
Message-ID: <20260130124932.351328-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b218b9fbc26..7ceefd920cd6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.51.0

