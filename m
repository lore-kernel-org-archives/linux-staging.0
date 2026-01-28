Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB633A9C9
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590657; cv=none; b=H0GGfwmjkF2RJV4nUG9OqPymwZYjfuyUmyXJ5MsEMAdfB34k5DCmpK2lJqgkBlk1aRVgsk9rM+RrY9IMtBqEGTkwd1WHWXhqMx7XcsL4LSeKAMHakFNaVD375wzhPDw+tOFuM8spdMwwkcEVAsSFk24Hcf8lv9FZW8gpA63/BSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590657; c=relaxed/simple;
	bh=figeAjqhG1svupWcxk1Grs5RKQrQQRzXLgakP8DZC9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDinbetO+phPnWhHqp2qicYL1o4b/nE1jWxAGvKHj3HZWpJWIL+lgXbJuv4+EadhO05cbOIFDN97XXKEVCd3loE0QkEXq+kcjouBZrGh+GYDJfFhp6wBPmeXY5jHR5KaUGxXZzPCTCVOCV1OTbxsMKrUTMbieDAHXD7YloRfp54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNvhHEce; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNvhHEce"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a871c8b171so10580865ad.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769590652; x=1770195452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEOJgPmuwRbV12LBE88Ol+uZDUf/K36dFJv3SsHLtYY=;
        b=mNvhHEce3mD9Nz+NhRCpTn9qRvQi6uA7bFdSHTApm+hqIaGe8s+fh1131jj96ekw7M
         9LNmb/MmGFCGWs8sKvKfApBtyj3fKDqZywe13XmnfckDKdhs494YCqQSob5vC097fWjR
         L4sMcoXDXixDz2g3PE40/vmdKSaW8Q3NGaphDlhtiajeN2062M+07JFSvof3RqklflTc
         BYzSLXA3oa3fRLKJ4VOqr5yStI1x3+Kqth+twd4gkQp602ORHROC2EnFs5nj7dCCsa2o
         DRWeaxePOaBkk0JK6r4ENfyXbxr9vT8dvLoEviZXMTxSc/TO8CE52B8uQ7srbgF0tWFV
         4bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769590652; x=1770195452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEOJgPmuwRbV12LBE88Ol+uZDUf/K36dFJv3SsHLtYY=;
        b=LNNkeM3C/We0gd3OGILXwTL0InhCTpAyRw/fRXNsQt8+pjFVWSn4nIumbqOJE0BGg0
         xCCzLY1kmSUoOamWKmcGZ942ICN0Gq//PiPJCbDb+duzbm9T2NPrG0ynKpnwgWyn5CoM
         AzS35EH04hLnRQrdRchfK2jpMPtJ5BLRlbkhLzzq8ftf4S4bAW1Q8hPipKxF6wqcDVCj
         Tr9ips+dnH4Fo0fGn+0agx2bxFNd3s6CIGHBL+718GJJh5dC6W0GuGre0FhPBIHXur7c
         XplAdzH0kMJDjt20NS6e8I+FPoikciZICNzayIDqTRT8/OAXGmjtF+em3t4MoHJTFywK
         H1hg==
X-Forwarded-Encrypted: i=1; AJvYcCUgLWSFz8+oqG58Ad2XYydyyFlnI4uFIqwtkYAeDzpuFV1bjAlDik4nLAl9YyzMVibEFvF5x27N/s5pxJ8Q@lists.linux.dev
X-Gm-Message-State: AOJu0YyUMcjSFQQMOZ89XcH0zSPLDCBJ8FtwKeBCmNLGieHpfisMW/yh
	u0czEjc9xLTuvw4PCZ1jPnoBfWEDiNHMJX/jFPEegyW7R+p3agw7IqlI
X-Gm-Gg: AZuq6aJmzBLbJhjTBRmAZum9q1AqUuf0TuWe6Hf88FSBPMBSGHEFmes1av/NJ6CGsdo
	nROR2/x6/ugdEdKuIwBTFJyYBF/k+42jKDsijOUBoj+HzCKmEcPM+/kED9l4fymiMS+m3H9xaw2
	A/UGOtqRo2a2dand+jU1mFrAQ+T6oNEQXYWPtQtn7SSm+vTcz+8F3JC9RTxaWlXplJT5Vy3t0YQ
	nnoozwuSOUEzgPRiV6bgIm0LaQZ/Q9WiXf9z1rg54CCAmyr41uhOzNmF/pyaFoZ5v7jdX/uTKEZ
	KaWxM/BN5zKoAP9K31SggA14f7RcKAPsbZG0vKhzyM2hX7kZhXNUsmJ1KWsHEo/7uNgxaBJ/uu6
	aNMs3NYwlVVPDwm8XI3KHPuveNAmwWBBDayjgCzn+2qAsAJc51uK/wnQ7pcwaAvthmXAcKeLJxf
	Q1xhxTTC5ahG/2fCdvLm5SF1jNdw==
X-Received: by 2002:a17:902:ce82:b0:2a8:7814:47ca with SMTP id d9443c01a7336-2a8781448a6mr38415535ad.0.1769590652450;
        Wed, 28 Jan 2026 00:57:32 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4154fcsm16707795ad.36.2026.01.28.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:57:32 -0800 (PST)
From: Waffle0823 <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Waffle0823 <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 17:57:20 +0900
Message-ID: <20260128085720.862399-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of marking the entire display as dirty, calculate
start_row and end_row based on off/len and mark only those rows.
This improves performance for partial framebuffer updates.

Signed-off-by: Waffle0283 csshin9928@gmail.com
---
 drivers/staging/fbtft/fbtft-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+
+	par->fbtftops.mkdirty(info, start_row, end_row);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0

