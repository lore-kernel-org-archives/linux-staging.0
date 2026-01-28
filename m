Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10525286D72
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592145; cv=none; b=KW2iKbHOW5kgaAZjfPPPbsIQgkL3aVNtYxTBzdMXXzHqn8+FY4dcSpLSbCHzKM6J9uOgmeu1ipuPEtJJTKhu9jVDpvSexinsqV7u5HN63Ag59B18q44f4gKP1rrvV+C8ml3iLkICggdAkHqq5uGDttBEcUkFXc2qUKIDpsblo20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592145; c=relaxed/simple;
	bh=J4xPd1IfrfMwRUhA35VU8gwe3m4oudk3ftkWf8tejlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEDnVH0nVKXsTygyxbG3zEAQ5oS0pje8VAJlwjx8ZW5At7C9pU2sQN6ZoIylmDLinH5GpnscScpQXtlSdV7S6sffavGAdfRQLsP0pmZqa30HOZ/lRW1w29YA6+r+FTkVBPGp48mzQNj9Nlge/kYY7oCT0oelkcUYTe4GDo/L2ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py3u5jTx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py3u5jTx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso2904139b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 01:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769592143; x=1770196943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/20MeRTWa/ulLtC3Qbnsogn/fAwzsjqDT77al9NCJDw=;
        b=Py3u5jTxAolHSu+omjBvYPf5VF2I6fQVl9Y/d+PZuCrXkuYP2XxXH81t6CKLqzC18w
         hbJ4HiCz3OhLcgfjdBQd5eJBzndc36ev+TJKZVykjF2DeUkb+XaJU0WbWn/jYx8LqPOy
         FHPADhpxF3niG0huCn2Xi2pGI1QljBezYEGRDEor4ouFPZWVJIEByIWVelOCNXcEvbUu
         TzjwxDIOJbe2VcDwPyJt0wJK4gwz7+kcTHMoiKM9FDm/am6a9Nn5Bzw55lbW/XPMzxBz
         v54QYfsx184PG76+bUZKy/M3dKHo3x2jivT8sby6xtiavEc5i+LP+aoQxkccye/EVKOl
         Dpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592143; x=1770196943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/20MeRTWa/ulLtC3Qbnsogn/fAwzsjqDT77al9NCJDw=;
        b=M8bARYLpDjDBhuA9Fn54FnGAvDh5/t6J7Jg1GbY9D5EuND8ioJck+9ED6ehEURuXuF
         qmtrExI4LEpFNidxkKYfg8R8RdmpYcLtPHUBQ2cOl611BssrvHpUfOA2MfHW7uqE+d7H
         vpgNax+1+jDWxTq+9l2Yez179LsE32+l+6SJw1OQ3yMnoccKVHR0hnmUzQkyV2CyB+UU
         X+zQBbPLKw1MTDcYc8c07PfJsxI7K7qJTHNNXfn/llBNtxppNPvI8giWmujd1Atdh9Km
         jBa6/Z+OlhVG/Uz6uNAJlN/GJZxxCYFEEUwUHBs4D9oj79l4FiDQKr0ocmeoR1sAnA3y
         CLmw==
X-Forwarded-Encrypted: i=1; AJvYcCX7csYv3sFxC81z76h8cIgEbvuK1FImyPfxkZpvmoiLykQBv+HgdDuZoz3u5dNyQRxu9K2eseKoU8wChlFy@lists.linux.dev
X-Gm-Message-State: AOJu0YxTtCjdQYdnyoClIj166WderkwvZllK+fW7HAWO1v0k8vhtzIIJ
	/LBIzSCZnzFSZMZuZ2QSxdwTrfzedTWkF4EjXTSs319MpSWKg4gQHa4c
X-Gm-Gg: AZuq6aJMnOaTwBTe6ApL4YDAH6zh4EWGX1tIaXznaMPPsLxuPdcyOPzU/K4yDXMgCfH
	LomzbxOwlVTnHcs31FXgl5pckjrNLImr+f30T2diUwsUehB2njbuQYTuH8JnRKtLV3TOJWZ8heD
	mY/wluxMLVJxotkIQm666RlBrQyI9cKig62NnVWvRr2O1iUxJc2GRUNMdeiyf9N2/JwggagWuPL
	7gQPIR9Mcas62PrsWRdd6NPDLLuHUnrwAHj6/qeCfoBKsiw8KDajj1IvRoJyE/E9GF6x8Jr1mQa
	n0sB+PeMcVD0QJWS4+bOzf7iieB3/0A54Kw/W/UK7vBYhuy85LZj5ohzRbMGF2+Sc+U7b3eEgLv
	wMI6YECQu4jAGXR69lJRzWq7bas0WtZsiOFdIb6Ci0XJBh7ZVHr/KmUPK5+nzuyEgqi93dUToFz
	Fq/MycS9wYIaPFpmpNPb6xqQcbMA==
X-Received: by 2002:a05:6a21:6b0d:b0:364:13ab:d4c5 with SMTP id adf61e73a8af0-38ec629f950mr4457135637.26.1769592143279;
        Wed, 28 Jan 2026 01:22:23 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642b0b4c07sm1758138a12.36.2026.01.28.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:22:22 -0800 (PST)
From: Waffle0823 <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Waffle0823 <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 18:22:10 +0900
Message-ID: <20260128092210.864021-1-csshin9928@gmail.com>
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

Signed-off-by: Waffle0823 <csshin9928@gmail.com>
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

