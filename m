Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B0F2857CC
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 02:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120561; cv=none; b=Jzi0x/rD0bHl+aYpsXAnrY8OYI20cRKUYWlSu8eK/68j/gx+p4u0yyc5Kk9c1Or2EuMB+6ifIiJekSfROYApowgiMpRNYOY5j64ytTyIPDNcYu8qfBaBX3UBx0FTkRTTkuUzSdQA8GOa3gnOW48DyK2tXyhpWYuMI784r1oGiT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120561; c=relaxed/simple;
	bh=Zl68Je2THxiwdgrtmVgPoRyHAnq26RpEGmiXgHyG+i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QM7yzd6Iw/znsga0ULUClnoiUHVWmJsEShpsfz6PXD/cqFMzEUX9KBbfI9fh0gAYxfpy5Zh/syHPEGYrObXoPAt4eJW3tx+ZbM+6jlfv6W+zTzCusJhxdoeKHBzwU0Fzn7fp6ovQ6bEE3pTGSzzvCRIoLv+9AXitHlAUnRzZ7kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDCkRsss; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDCkRsss"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12dca45ca21so602255c88.1
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 19:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778120559; x=1778725359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2A7OPcIfEOOgPo/hUvss5p4sYWrcq7D2ShgndF76WM=;
        b=kDCkRsssKFKANZlw7beL0+tnaloKckAiDSM4+dXeLfzGKpH6/Lzm/8TS4aUnBCE3zU
         BIEiEpySYzVc7fzDWqlCJ/pxxb7L0IKB1k+Zobu4M30/t8ZBlq+4Pbv3Q+8K3XqoNDUO
         e3M9tg7Ec5gEkuhLxt0+iIpvWfeWcSWcRwPH2YyvbxkpD648BwBKHeCx5CkCu9R12ilE
         93KgIZc3QcksLnyBLR+9m2jiAXjuV6hCRKW5s1PpCs09O5B+h6vRYBidFQwmI7d4pjht
         EYob1eZHrY7DnVXGqorfLkcKZ37zZmwG08NmUv8gNyZeWy28/g566PVFj0N/Yuy+wcwg
         Ys6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778120559; x=1778725359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2A7OPcIfEOOgPo/hUvss5p4sYWrcq7D2ShgndF76WM=;
        b=OOVs+JZiggj9JZx9pGD/i/3Ir2uvwU+J2I/TbkNnu87eg9RZyNAoRfYfavar00jaiI
         cwa4zdkYNUAiXem+sQbcIbzVYSjCjVbQbPtU41Vq5TbhJTgukRDoY/5El3gnJeOgFRAo
         z3a3S9v+VFGiOl707RkahKoNaNiz7Kec87Xfoon1KMeN3UMqH27kdVRfoElBnLJbMu7m
         DHkolrzPGaFFRZFQIK42yaZEM6B2NbvJCvI4lnJLoD8FCv5rpnf9ec4s8NMTwqqX9YWE
         NFphvm1vUPDrrF4xJk80bJdgd0OznEdc9ofi+OSUJvOnT5zMsbqbpuTAb/FZR/0yXh+c
         BIeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/R6BUaQEFCIpANbGTtqK4xHXC+sLWumJIMgfrTYA3FrBwKPylCoPEhE6EThVuMycrc0w+WBlaiqDnO2qUD@lists.linux.dev
X-Gm-Message-State: AOJu0YzorPx3gDXJS62sHnu9HjR4DI9x/0iv56bxaXA0HfPBIXVyEFAO
	3A7lwdphBilvnTqDyxP2DggPrJ9YoDWaU8QF6ENEHGGIDPZlNlnO4ADl
X-Gm-Gg: AeBDieuGBlXoJSDET1jet6BzfY6oRwRkamwl6g9gCp98B0yAu+4AavKStwDwTXHlWo6
	q6CohNI10ELATIE4kvqIGKDxcYxf1lyJ46H7e50FvMfsmncqPiLyRo5gHjQw+IIldu5ifqdjjOK
	FjTz3kL2UBBov6udLjI8H3rnm8Z/xP50aG7InCYhclKd+oVAzqCA1InJpPXm75hz66hlFLq2qYl
	eJ9PIOmkFaOvtwIQZy0GqJqjs5x3vgrH5np993tBHSnIxszGJUzKrQPS5fIhyEshXho7L7NuO0M
	tZbt8XMpTkpBYmNxbA4V8VW2klb0BJUiltL/LQUFoWNShwVI/seYBZuuFEXEvyUqOP3iphVNXgx
	Vm89oBEF3FAxUJ+Qv4peo9Ql9H05SI8Ey2Q4Y2LHnFWHJkm0Xbcm7Q8aHe4/ZUtduP2KUWu6NA1
	RB1uIpCK8ozoMjvd42ExPjXYAjRTzx2xLnuVLsgMRF9ZIGV0skSEtfgCsQ+3EwRWIRlQ==
X-Received: by 2002:a05:7300:ec08:b0:2e6:e916:70ff with SMTP id 5a478bee46e88-2f54aa81abemr3065260eec.28.1778120559210;
        Wed, 06 May 2026 19:22:39 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6658192eec.26.2026.05.06.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:22:38 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	digetx@gmail.com,
	hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Thu,  7 May 2026 02:22:13 +0000
Message-Id: <20260507022213.29290-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507022213.29290-1-dennylin0707@gmail.com>
References: <20260507022213.29290-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Returning 0 is not a valid fourcc either. This condition should
never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
access and return a valid fallback format instead.

Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..456134a9e8cf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
+	if (WARN_ON_ONCE(index >= vi->soc->nformats))
+		return vi->soc->video_formats[0].fourcc;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1

