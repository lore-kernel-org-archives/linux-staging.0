Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26F471259
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381691; cv=none; b=f/R83amwaEPrvmp0RW+nFAfHNk4+nY7mUTPFzJI4P3ApCyRx3nTqDW12aB/JuTqKxoWOdvS62y9kTU1hdaPB/xHtU8Yaeglpv4nbyDzMEpi+QmVDY6wkFli1Oyf+CgRbT8u36cQuYQQ+bBanoOIJgZ5F+uhdxwHqWm7pOfcQMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381691; c=relaxed/simple;
	bh=Bzonkp4Kl647I49nPKXVT8eFQsR7sFNTOnQ8eIGUtOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQGiYQ20hICuiM0dOcZGsEIH1CtWDMpJW1o3kHvaadUmRIytcGWlopgHBYoxZMpNdxp7lUn2/15CZ/XeLmIJ8ex9Y7SYqu4YoAZ4XHKQjuqvzcbXIZJyY+Ha0mLIcUiNcgzK3u/WEQlRl2WxyP/JRMZhVhjb1pPhjG2u20fjUgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IenNASEQ; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IenNASEQ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-154e9d2d979so2290009c88.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381681; x=1791986481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=IenNASEQI2DdnmE4+WuueaAaS/+nOvJlLiFIWtkaR7oW4gpP5T1aGF8vN6kQ2XtfUl
         QDgOfipRJDk+2BT5ZRm52HtUL3P6UwgMNwjMLNFYPaAVMDggn+GrRJ+a4bpRT6s8GTC5
         0cF0QKF/UgblhrepO8OLNvisy8Hee7ATtY0978tow/BhJysx+lLSkU20gKPyUof8k7ic
         hv5UFDB3XjbCUox2dQJURWG5E2XqBGzMRirf6AUz+w2RvOzKL9kRWXRJ4AWTtbkO+Wl4
         yyJm3nxnMYlV/Lqm+nsRHCMJguWNdrco1m4UukWw13tTylRO71g8KsAxXNsPigtsEsVR
         Eevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381681; x=1791986481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=Y+Y4OWEXpS112PwFF19bfWU01RdyxQl0kpej1C8c/H4YiwFatTd6MaoduoHTSPJRhS
         ZclJPkw/W2UDdIlxQKhQrb1ZI0hqMUSRmK4MjkLBzu6jTg9oWnliNQvzBYXaigolt4Bj
         o8uin0EL1zUCK6/cxg6eL4qQQK5p99liWsPZ6Xogtl0yjI953kF0Fgldys7cGVBdHGII
         j3U1fjiTfqeLXckEQowHWkdqU/ZPkibgSb6+yYpYvYDX53uV1mwACrGdEFGwxphUskYp
         NrViEXhWQNt1w7OcTUGOSKwRZfiC+6JVa3PiwU+NzTnabM9WM50lbGXFGthrjID5oknM
         JGHg==
X-Forwarded-Encrypted: i=1; AKwUvBzm0gA9DQiATXu6kU26OsFAWiniGhDppP69/AeoGY7C8Wd6kqkeicAbDRHbn478p6V/LUVl6V5D/HKvX1v0@lists.linux.dev
X-Gm-Message-State: AFuF++nnr6A73ybySChHgVvda1XAAYP4eQAnMWvVI0mJBiuF04B5oHXX
	YER0XypohGb/Wm868H5kLR7E4uM4o9sEpfX7IjbPDeHkato0CccILIjr
X-Gm-Gg: AYBFou3CxfttwuXfhd4nbxwAnuu5WP2CUHFv1lxtMOgiatugG5ROXvbb1M+3NM0KvQh
	Ikbawo7lDyUsMbBe13L3j6xGF5cMbsmlEHIQmFW4/1E6xnzINwAVxVj7gVwNcK7rusALqUe2L83
	zBfFlWWexsKrj1Ra3BFYehmvQ9QqLWFIOjeopGuIfyDFzNZVQin3Q7zQoZSFIUE5IEBsWkoheNO
	53N+9Xo31feSso5lsVXKWEWF82fVCVsDjHuuyc9JXiR1Fsi+j+5mKgjqz8S53x4UiThBJP2Kssh
	as966EJpzRXuMCfQ7X0ECAKvqaAFrD9p3z60O9w9PAeWHIH+v3O9ya+P18xWtpxgjLbVeF6dQrx
	VKyARaVjFFfRD1tov8ah/B1eZb8RyB7zTsRZcL71/vst0Bj/PtfCu5mMWpHWA6SwKv3Nnlga5TE
	GsbjxTYrwa1Af+P+1stwgRXP0LnLa8fT8F+NNNm9SK9A+2dnUPIgAZIA0RiU0vx7T3r8R8b6Q1P
	i9FtPRGCRiZHARKadTmz6k2sY4p5w==
X-Received: by 2002:a05:7022:ea8b:b0:143:3769:c680 with SMTP id a92af1059eb24-15d3115a913mr6364429c88.25.1791381680555;
        Wed, 07 Oct 2026 07:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1630180f6a5sm4179461c88.22.2026.10.07.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:01:19 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: cedrus: fix typo in comment
Date: Wed,  7 Oct 2026 11:00:56 -0300
Message-ID: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: Neightbor -> Neighbor.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.56.0

