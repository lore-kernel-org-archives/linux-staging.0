Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8FE17555
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776009041; cv=none; b=lTzVT4OJJEJt9gNDEomKun+b/joqvgNwn3O2bgk3C2ugmuC0BTdU9YhA8vFOtSpf2kroQn8uOkPckiJGlcllNyD1mYoxIzBggYT1giMsXttVltQpmIq6msfa7sme9TMRUIbd53l/MHgoQAoWqH3wfZ7ygUUQHxp1urXIGbG6M7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776009041; c=relaxed/simple;
	bh=lwhat2bSQv6XJb0gxi3qwiTzBQ65AmGJ8xWTcMNNrUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XFjCmWfraW5rYle1y+e5JIwIuG1D6ItTw+v6yxFzP1xnuMAKIUTdxkyMQvwZ/1bxGAmTXd11vkDr+BcA7HNPAh/BYpzO8krvVETUKA0SIaNhzIvxQR34SBDqYIvFtHBtkC1U/fPFwRC16fZVmTfrOGJ6nWGWi99CUE48g9ugPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7btp8kO; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7btp8kO"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3487307eec.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776009039; x=1776613839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SHDvV1CNmZJ3zUchoWzB/rMv8sKx+dY5re1OzoQ2tMA=;
        b=q7btp8kOUZf7EiJpsCYrI26FHtPWmMk1DV39bTv4qtzi1GBQX07I/R7xYWoQj7JJhU
         xpBzjr+NftX+GUOZRccDRGpJVj6oNYa/dReugPMm2dCCNb3aES77vdfY9Jw4hHokMc1J
         GlmYd8sSppsPr4TI3UsJbVF73XXDPr4t1+sLxoVZdntxgh2C6HXeUO8lXFPbwM7gWkXM
         xvy13IwsXVfaI1ETvmX7wVRHFyslzwMEoBjilNWB5VhBC2/KYQ/QN/JcMDvz/Tw9lw0K
         RErhqp9NX0WiPhSyll4iAMqOnARSqyg6iaAJ7lpGJZh8jEK2ntycvsChgMePJlWs+UnR
         fCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776009039; x=1776613839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHDvV1CNmZJ3zUchoWzB/rMv8sKx+dY5re1OzoQ2tMA=;
        b=WTXiJzt0wSm8gLGL/6uRegV0LMRELO5c5L0KxErDR92oxHlk4CqxdxkrJOwOyKdI2E
         LzuPDt6rRs486QjlkPSJm0OL+Z82lCJ3dr9hD/jprbXzHvhw4LSpcTITzV/Bnso43MHG
         DSQqIUXpANNJ0O486SWwFiuQMZBG1A6BqIpV3s1jP5Vp9Gkq+/2jhwZ0GyWRTgd/TEUY
         zYusDMPiLeQgG+aOz/OwQ1cHebD2PxxEbxOeKt7JlKC0Hdtl23bmm5Np/h4xQ60OFYwo
         JhF+xSVcfSMx4MXBPqhZ5K7jc3e31NBfIEkE/pZvgeMxjVUwObzbeM3DGv/ucNX0KSOH
         DT3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/iWMSu85Ro189RG41i/lOehK19VoLxwl6sj95Zzw3nYRrJnz9HBkALszuv3a6YsifjlecynPTr1756AJfI@lists.linux.dev
X-Gm-Message-State: AOJu0YwA5w407MK/bHhC45r+zKrdLUFrCTvsdsFPLkTeCyy7S7v1Jyb4
	7NpdnR6NEGC7z8sKvszD0iyIpHjL54d+9SSJAR5Jf4+ZEjkc2lhlI0p7
X-Gm-Gg: AeBDietRqWslbhGAMurV64NoyXTJATekcBMzHmV1i5lWH+FCeeEW4DkShZB50ObeNq6
	onvfo4wu4UQmgMEf0dewzVqIlOmsxoWvntPvy+xJuwWE97ZSgt3P2xdTOfvf4M9XdQYMRj1SUKg
	bJat9uIaW89v93t7gW7I8Bir5A59OOVkposX3CUPuBP2rnwRLdn1SsFvzrYFjzts5wUQ0Oi2uBp
	0xRa/qNMM7+PnwT+ypZZfzdQtYOkJNpybwNezo6UI2jqh9cEtMZPP1dqCNBpVx5s05arlxyd4a4
	Cw4IPkvDGU7a20BbOa3ys+u1DLIKIBC+MARd587e7u4NGxM8Xzjy/+/Zw8ePJPUfab2h99+DdLc
	2XQLoa7JPc4yFuzClMdprbF8gutibEz7DZ6ch/ARV7Mv9iluBnLNAfghozK9GEo7B03DiHTezjd
	4VMrDqJW2p9PDEvJ4Pjob2SYnK9DpuC5Mv0GfTUgABHNro7iM2CTYJ3ms=
X-Received: by 2002:a05:7301:4b12:b0:2d6:526c:55cf with SMTP id 5a478bee46e88-2d6526c5a9emr3259901eec.9.1776009038931;
        Sun, 12 Apr 2026 08:50:38 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm15403781eec.18.2026.04.12.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 08:50:38 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: vi: validate format index before bitmap_set
Date: Sun, 12 Apr 2026 15:48:43 +0000
Message-Id: <20260412154843.29056-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_idx_by_code() returns -1 when no matching format
is found. vi_tpg_fmts_bitmap_init() used the returned index directly
in bitmap_set(), which may lead to an out-of-bounds access when the
format is not present.

This can occur when TPG is enabled on SoCs whose video_formats[]
table does not include the requested media bus formats.

Validate the index before calling bitmap_set().

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..dd8911640d98 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1020,12 +1020,14 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+	if (index >= 0)
+		bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+	if (index >= 0)
+		bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
 static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-- 
2.34.1

