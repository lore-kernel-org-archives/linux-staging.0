Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202038C2C2
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527394; cv=none; b=iyyrk5eJGP11oq/s3sSZ/kl81vADp/RKDO5Xmw7r/g7F6wFDRJ7NN92t27sy7o2T73zotpJ0sa1jo8sr1GNuhtRUFDJsfWmYw1BtmNGfuhU4f8uEb4OngzbVvgtTJqBOwZu6uC+vuJvcqeW4GUTk3iE/5K+sZLX0NTPZqJa3qWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527394; c=relaxed/simple;
	bh=1gog1afMORIsIGPfEuVIVFQI1bsAxNOV2bdjIS1D/tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+1Iv/qVx7tBo3cAgxCXmode6tWsTfKGHgtohUBzkCevbXihiebhEIMIWzZyWhNIKeFJwQE8qLXn8I36cttqxtKwQAzqTT0dko1EehiEBXg/hkP0Z1M9QDc6pbseoYiVBwiOZizJ0VhxwAWLRO0dOPKebMW6azDs7teff5OdetQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHPTlhZI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHPTlhZI"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-389e139ee5eso89750341fa.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=bHPTlhZIguDfma3JlNep9B4/1h/X6zoHpbJu1hAghOVsrRFcXb1vcTyFAK2EF0lTU7
         aEvIi6InhiryvXui9sG+czVMY3pAk1ViZ75eYzJMuRCM1aepiCb3D2yNSyGDvaBEXYp1
         k1RB8ROJhi4t+ZY0G0joHvFKmSLLqQfzs/CsGd+AQtOs9iQTvQJlSlCVx9Td/h7Qa+Gd
         uHOZ60BSrFnFpGOnu+rYzlusFPVasGOK07rSThw1cg5Gxgm4642Uq77PXa5bOS+gCwNz
         u9BiJB/0DEVKrwDJmGDoAogF8koGmWwoG9KKvnMaTH6UpU01CN1Vd6SrNi+NGpxolBwh
         rjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527389; x=1773132189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=hH1vdAnpg4O3KOSFCwCqWocuEG7Q7FUGQmax6VG0oh6/GmdqG8kUbtbv/gg2hbHxDZ
         zVKo+nmYKe8n1y2p4Tm7tOoIwB40y1jBhzRbHC/fpeUluEoajpqkDqJHsRAqmfE3vfv6
         BzwDlAQJwrjqFZPBQ/9EVunrSLyeEAKZSZ7lYmcWSY9fzavyATopR1vJoBP1HDAAhptK
         pz1wm63V1wrwaOiP0kY8G8xNZ0xvc97r3ECcnZbo9QKaW0GVBJ0DTzkGDL461IDl/3+U
         b0Nzf2pl1t172oPmb0zxt5IsuFchQ4jo2o9enTj7FODF4FfLWLIhr9IDzbBh7+xIYer+
         daTA==
X-Forwarded-Encrypted: i=1; AJvYcCWBj4mp40qjwAAFFqd4tK2/SOWCIzU345gAVkDnJPw1iwNs0qMbVQxMnTgomTVTjOa5lTjh7+qSywMKu2gZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzFU9r5of9qsM4mJIX3iMN0IlOm5YF7XUBM85PYfjohWoV0cPFv
	W327Qg/ys9EkCCqINpJB7+Vc8v0ysi8oH5C6pYLybRWsS6fTFSkOmqof
X-Gm-Gg: ATEYQzwSCltLEp4QcXisx/pn1AoKUb1EFyJTZ5Jn+rWqXj19JEfCUIAlvVhMkGfWrRM
	Jp+B5mGFmpc/u71sMx7bw8JaHnXjHGuNaxA4eVUUoyl+SUSkiwq1Dz+BZ31PSo4qu/6A4hPnNDs
	7hagLob99YNMLqjBbq4PuMX+sVvvmEC2wJewGvooCet09GSOqFJ9q/sXyBKDPo7js4kOf+AU5Ma
	iKxKA3py8c57o598GqrhqOXwngSevbvH9k7auTJs7jUVUJRr0fk29rZi+DENSFCTAk+3E12CoBC
	GcnPg5H+uHny0ewWd5RVIRDULBY6Zv3xILuST8/zqBWXq7fJO5Aji/Mmj6peQON5Tadsi1598Eu
	kV/bzlrvdQO6TQJPFAy3eA2So+HwR7phyDvcyuNo2pqiqjIn3llvGdVD+1MipBpQelN/7aap0yP
	lW3NCMa5XHnqYK
X-Received: by 2002:a05:651c:4211:b0:382:f78d:a0c with SMTP id 38308e7fff4ca-389ff34dfa3mr115153421fa.21.1772527389114;
        Tue, 03 Mar 2026 00:43:09 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 14/15] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Tue,  3 Mar 2026 10:42:37 +0200
Message-ID: <20260303084239.15007-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0

