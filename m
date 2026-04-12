Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7F2EA754
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775983778; cv=none; b=jAUrD292mlDj3CxDKAeNEQlzu9hW1MtOYs+CRa3hfM5w6rZhNBUlfy4KIq/lKoh91B6nDIxw/1OrwGEAkxM79FgANx+Mk7nMK/S5v5NLwjEKAeA0CTfBSpGIqcPL5GoiwiZyg+5cVJ3ZZGS1UWKdai1Mbxzx73VIezV4+ADOm8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775983778; c=relaxed/simple;
	bh=Zh1gMWcDLON+NjfzXUS2eYcY2NU/RrfJ8BIhx6gE90w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tn1PMvNj1jCp6dsYnW4UFVQqOFbiV62VSFSj/aHOS2NZ2WijmbHm+FjFpiIoqpElNfhaMussQ+Gngdt61jyLQC0YxsCjlJJAqZNg3jRezfedd0QpI8UZRUwMR5ZvWrmyd9+94a0qq8ZbLqvAoSMY7P00si+Zflhirs0v0WLQO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntt2L0u8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntt2L0u8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f97c626aaso535887266b.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775983775; x=1776588575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+KERGfJ0lgKno7VzsagW4vKndlmZyVJae2CPohMXXU=;
        b=ntt2L0u8/bUw05o7nDx5wjiJW+9HGPPQ5aRlEJtChprzqVd5QCc6v5OOn135SwfokU
         ehA9qXGA14Zq5g9rFmFl+JHO24gjReKh0g3bjPE3s3tUi5E5YLV2HKZTMGW46JRHl3MY
         gIPFlr1gjBrCmC2urNJxneV5qqFMuA4q1zK7A7d46Yp7Dygh87cIxUFvOQ+ngAGx30K4
         TxZyhRVsV9ASupGafTm2+szsPsR+xLHozRRo6rT4JG40ogls2BIXfD/ZBd/InMieCGyd
         xmlpHlSqElew1VWgILBtsLXZ4AI/4dJut2/SJb6FT73txdib8UWL72HhkdfPijdkxbxx
         vCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775983775; x=1776588575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+KERGfJ0lgKno7VzsagW4vKndlmZyVJae2CPohMXXU=;
        b=XXvFCO3+hjW4Li1XRXQXGtvq7N6f7u0rzvxprIVqNjQzZBL/lKgvDeSm925rFjFlWn
         k0bAR7igINPd+2ZAq+E2Jyq/hTmD1I3lExQXpAeC+J/GKvbyGsaOG7jVXYIl8iau8ajy
         wY1/fDpu0KJNpt0Z2qqTZtL/eZquAR+kDYrJLwcOeHBfOa9qDRegHJpnrsbGD/UOd98R
         MLrS7iWN2fY+tdy0Ar75hsE55wpwe3V4KslAGVt6xoi2WoRNyUe1o7sXpMOskzvbt0oP
         dMGTC0xLhABx+QqCCydJhhlfuvGD4KO4mjHWZ6R1LKB9VtMC5F2FHqW64LnDKyqTOc8e
         rAig==
X-Forwarded-Encrypted: i=1; AJvYcCW3Trl2/CnKqajTIep7usn5MOzUFWUE/ZOXxGEI5LImwjn4uuCOkgd1sKguIaHGZeS8qgpoHoZdxOQ13/2O@lists.linux.dev
X-Gm-Message-State: AOJu0YzuX67hzf5k3roehc1GCP5DZrTm06XlhBqLwnXUO+89wlsUQTJY
	/Kfvy3FCcvSSCJRzEazrcfb4QWOngF4h1plxA5AaiakQ13wnRmZl/5VO
X-Gm-Gg: AeBDiesKWE/qiUncXr7X5xsVfGIa8MNKQ7kZ0ueQOtjpQOuzMZkt8NedZZjYsBXGymv
	LHlaF6fSabwYm2AILHBUeA4WdTnTxOwtxyt99XTWGuv55MWA+xdX68UhZFe//X8jglsKQ0pV/3G
	myLY4jq6ruUFHZ8T+NIVRmOwgdyiI53VPy6o6d2b+KQhUl5UTBSpFaAwJloH1Q38eRaUgz4wom8
	ARXgbJoMwsKGia65DzdF45e7YPZB4o6Rse+RLyEjPfQVV9al1c6EtT3lJ3rzqAFpa7RlB4vKiGo
	Ge/CzQq/yrTMpGW2byOQ8HDcko5s37rAZOW+JYSEOCuB10j1Em2XbIEHRimi6Sq4XHwk43Gmoqg
	Mh2XJ79/MTriDfle+r0I1tIW2vOqvTboOj9sTGLVmLb6xA48umiWk1g5eLQnqlLZ6ukpokiYKxG
	Thr6+ee7u/BlHVs/sdLKRnA0sHwByQ0s5zXfjSvnzG1trsNj4TF0BXRd8GkPQHFW87OczWLkty/
	vPST7XJEesl0/UDdM32CnVkPT+egQPVm1yT6sXUpVLv34Dn+kZHQm5xGJuOJrtaGp+pNo7EUHfF
	xyX8/g==
X-Received: by 2002:a17:907:3f87:b0:b9d:df73:f0b8 with SMTP id a640c23a62f3a-b9ddf7429e8mr7795766b.32.1775983775119;
        Sun, 12 Apr 2026 01:49:35 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd89a9sm226253366b.25.2026.04.12.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:49:34 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: media: tegra-video: add missing error checks in vi_tpg_fmts_bitmap_init()
Date: Sun, 12 Apr 2026 10:48:08 +0200
Message-ID: <20260412084808.232010-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412045245.GA2019381@kroah.com>
References: <20260412045245.GA2019381@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_idx_by_code() returns -1 when the requested format is
not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
check this return value before passing it to bitmap_set(). A negative
index converted to unsigned would result in an out-of-bounds memory
access, corrupting adjacent kernel memory.

Add WARN_ON() guards so that any future SoC addition or Kconfig change
that exposes this path fails loudly rather than silently corrupting memory.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index afc7327ef318..d1d934e361f7 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1017,7 +1017,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 }
 
 /* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
+static int vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 {
 	int index;
 
@@ -1025,12 +1025,22 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
+	if (index < 0) {
+		dev_err(chan->vi->dev, "format SRGGB10_1X10 not found\n");
+		return -EINVAL;
+	}
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
+	if (index < 0) {
+		dev_err(chan->vi->dev, "format RGB888_1X32_PADHI not found\n");
+		return -EINVAL;
+	}
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+
+	return 0;
 }
 
 static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
@@ -1410,7 +1420,9 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
+		ret = vi_tpg_fmts_bitmap_init(vi_chan);
+		if (ret < 0)
+			goto cleanup;
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
-- 
2.53.0

