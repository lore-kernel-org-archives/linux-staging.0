Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0BB36F43A
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632794; cv=none; b=nfVmzuiDMJrTXQwmO1yH9jUJACHrHdB4WmaGFcjbm8U7jik/218uowJgI3DTnPk0uXkmtNyH7DljKyWznSnb4KHc7v5mwMThbo3JyrnqqxagvkQc3rZHNJ9GXl1+AMFQADM5cc/wrOYo6G4S93czUBTVKCGqoTJAmpSYBfgDEBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632794; c=relaxed/simple;
	bh=Nm5b8sgLD4sBAwSa6lg3pqm0KR82wRdBdgAP9dBu6EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdT/qM3c8gncmmKbJPVUil5F91SxDkIXB1x0OoVFq4vdJprs0BcS5zGNf+suwlsy3P9sPRkaw1cyw+mNjzWp0Qp3QxNPv1ghxJxRvMf6/IOAoldCJyD2HwrXkoA/10M1CoaGuenwhmWxr6DcoB+79gXlDjbqosLzg+Y2PmFxvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHGt72JS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHGt72JS"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c47ee987401so107708a12.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632791; x=1770237591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUtAzlicNbYpibyHmDOFcgslFGJZKtVL/UOPgB2to8g=;
        b=NHGt72JSom2Cr24vAfY1Ivj3KxDzAety28mbGLRsXGKUuPxHu/8CQU+IkbbdVkGfjG
         3yXnU1rFB7HK5nDG7mrbDjdN7bzp2doqq7WoAq+ZOy8Nw09CFCGeW+ZxY6PNru3R556B
         Skx1x2qYk2ku2uF1T8YgFOgJJfoXyOVMjYPrSZEBHulZwWOL5jTj9oF3OxO3HYoXsFSU
         C1TRwsXVJAE/L64o1cuIe42RNGychf5b2aJmXN3Fwh/eO86aFoDebupri6k3zdzioSrm
         Vnhphcj9hgUsQ9ROBnXHWsubP4tDNCPm1jZ9vJHVUqgqNEap5k39u/xyh+NvPP88RiTV
         CEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632791; x=1770237591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUtAzlicNbYpibyHmDOFcgslFGJZKtVL/UOPgB2to8g=;
        b=dG30uDkby4pOFYep/tez3HFNVujwvR4o7hj6q96ZvZnBR9pWJyP9xgfH96ACYLDKd5
         kCTWSUysyuFrjH09zzkwu3npTU31DjRvhuObB1CEeQOFpdTuK3qh3TWa+fl37LzsapPN
         N+8YSWsm1RQJAnKhC2pABcArIAArQeEhGTODQkK3hGcFgo/BxesfX4+1l4JdI8iWD/ZV
         ucDuhFfBwE321hzVkoVeUbtl7OLOD3TWuGfPZj/BA4CqNl3v3dnDmqY2u4MCjgw5lVPO
         fNZrv3lQmoUv9wNqF18yWu0E4C+lZtml/dfdbe7subERUNk516N0P1otvBIXewtD+BiB
         LV6g==
X-Forwarded-Encrypted: i=1; AJvYcCVb3osKeftHGq9s+JjgDzfk+/62a8WuX6r53qLeQ1w+V8dL9RXS4qrlvSU51vbwOHZ5O9NoadmmRVUWRxR5@lists.linux.dev
X-Gm-Message-State: AOJu0YzC3fA2YGoEd0Z6hGrOmNJyz9YM78rH4ECuhbNyg6nYXB5FJQXV
	fFWFMl7z9w9XNLNG8k/I4eOtY/RZsJHa88Z+EHJXZsxhGpDG+Itd8jLB
X-Gm-Gg: AZuq6aKCYb58qzSXj5ywTqDWDW1fuegmkzqUuL4S3fCJH36XFR1Xsfz/C3J1ny1yAPt
	ejoVfz+SYSjPclv90ZvRjdRhooHjSZjSOZBaor26KB9FS/kDliqUWqRF5/vsY37CyC5dMi7ewVq
	kv2kqm6cnjaBKbmdYtptM6FUkYzg740ErSGQSWlTGm8F4iVwA54NfpbFN1wRBqbWugvHTrjkaGh
	2n0fRA4TGIT1wolesliXqD04lcv0znD5Mg3i6OO0vVln3m2JDw9fbrrSEjuphZhxEK4r5uh8CMI
	1Y9ZmsL8HsJof8B3PMzL8hMD5Doy4dF6TkxOVfOKggQ9l9NgH+7kZ98cxyCjlHY+avnpUA0Nte/
	ZYexwq2Uh5IPp5/jlyiALALAZe/TuoadCzGgMzPquefNeCKYhFFHJIPmHvSHWADLZG2zsbEUbN1
	2pLdf3a48iHZGsNf57vGZr9aw8UQ==
X-Received: by 2002:a17:902:f683:b0:2a7:a3b3:3229 with SMTP id d9443c01a7336-2a8bd43275amr6095695ad.5.1769632791253;
        Wed, 28 Jan 2026 12:39:51 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c45c4sm29703465ad.62.2026.01.28.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:39:50 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH v5] fbtft: limit dirty rows based on damage range
Date: Thu, 29 Jan 2026 05:39:38 +0900
Message-ID: <20260128203938.962414-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of marking the entire display as dirty, calculate the start
and end rows based on the damage offset and length and only mark the
affected rows dirty. This reduces unnecessary full framebuffer updates
for partial writes.

Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1d5cb45199d0 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,12 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+	__u32 height = end_row - start_row + 1;
+
+	par->fbtftops.mkdirty(info, start_row, height);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0

