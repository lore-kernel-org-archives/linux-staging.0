Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044929898B
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777268876; cv=none; b=mn3hngC87AjaJ6VkRKmXh5eaa+kZY2B71AJya4rUuQNmx1NrA7wQNwLd7OyJFypllyHGwGTc7xEKsO5ztoDV41f/ZpAwPjZPIhCSvn5+P76lf7DPtcvJbAmZmmxL8rbRylmhxu0L9aMqouv9/TOIgzVgn5DbxGMOuWN5h3zfMEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777268876; c=relaxed/simple;
	bh=ZNA+Z7uM0T4aC/rYpgG/WXQtXAqoG73zTJrV8YaYuyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AqyTLifMyKX4lWRW2AWaIKO28/ZybVGb7Vpi7h82HBSoU1wUpckEWdcPtxWUdPttdJFv/PvTX4TRYQ9xwD9fYmCrjvcd1+W7P7rNp73dDrThX8PiAeAvpi5+AkUr58Cu+iau+ykeHendzljif3F0Xyb6AwZ8qD2Slbd7Hn2HoRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuU6M4NE; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuU6M4NE"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2e221a71e19so9475409eec.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777268875; x=1777873675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XooreDzs+cvNPadpU61rCgaOMb1b4M2JvjEhVgabVB0=;
        b=WuU6M4NENq47jjC+T1KgVYxdo4hUuc6G6GT0tKqHmRE8UwIF57fddMkOa0BzClvSDs
         jysz55t/TZkUn78aQ8EvhRVPs0+HdzvFqsOkM9pQrgksqqz3vueQK3P7NMtNGTAVXIjT
         4aQaTtKK3Io4POwxKXHVTn01ZSjjN6o6RgoXBJ5AwOppE9WiDlOEXWztgq5RRl+1ZALs
         Sm72ZJEFL4LrVJYpOl8KzEL1t0tOsaGu+EXAXTxsI1hkMTzkTIlPFj/E/TmQ34xjlMC9
         FEdLRndhqZqTLVIGe3JTaUULNZA0X/PMLV54vuJ5gxOYkKqNtxbLU8yhqNjQHocSUWzB
         Y0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777268875; x=1777873675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XooreDzs+cvNPadpU61rCgaOMb1b4M2JvjEhVgabVB0=;
        b=cznDylkdgAGfSmaHME4ma5uIgXMgWm3igBXrToXFqEQhy7Z+dcSZAeSNW+AfCl52qN
         yXNYy34JHEvsmsQxmvgQbzQNVL75GBUXN4CCTl/6aatt/gywP6CcIpMQyMKOTmkl+Ljc
         0atY2prb5IXhchv5XI53nR3rJRf3paH9bRm2M3AdvKfxoHnFz3wXSMyLAwA2dA6uSCn0
         vCIXOvRxTl45f82mVu9xDg3qLPYNPIAqKI3keUrrEV9gvMWQK22WeL1aeUvMVMqlImKX
         FK2w35LjNRp0dOgf+cD62L1G27pPrayJqxk73G17exg3Nw9jvXaHV/FrNJaPWzNt9gx2
         d8ag==
X-Forwarded-Encrypted: i=1; AFNElJ/oXOEb/sMsID/sSptK997Rpg+eajcbNn3j3+IVhdxvvIozP/y3ZW+M/9AiH9qU3TqbKa2xJmmNycs/lNBa@lists.linux.dev
X-Gm-Message-State: AOJu0YzJOC0Kw3MyKPG+54jZSy8b6sYBr00lUqsZfXeUFRnhYkewnlLS
	BsV8/aQwhBPqt6F3axLxYk9V8e9BEwctJ7NYrXVITHZEBSBGLuwth0C2
X-Gm-Gg: AeBDieszVID6AIDcAZl0+NEU7kh7xqXAWAWC7fMelv33x2aRl31sqtM2y3DtIqxp3fe
	iUxVT/8McJY/0IIT/szu07YxhAx6420ruYiglIpZYsYLVTO7VPnxzWNF1Ah40gn7zd9LYTs2WDF
	oWDgTrvxuDB5vQBYGG22NdWXRGxBcQjYfsYwHPS6FVy0kZUnGvOvUIGE0kNnWxrPtpWFHv5gKOQ
	x5yj4j/66KcedH2IZDHRsE83PWpvRNTriEBU1DduEPjAaeztDctGQhGZ1OvTCVQnhwjvPnSkJ3H
	xWAqmQ7gTukze9tAw9PXfQbWNd8yvRiDlfPiDqLEgPUieb2Ee8TpUnOMsH9KXcoGamqBYO7UYDD
	6H+AUIzRV3jqIr4XVXkbXj+5ri4dJTBjLROj5uKokDO8eBpUek0s/AltIVqCZ7lL1Gw6Wk5wBHu
	vKTCcAdRw4DrkL/CtW/AQytUWXwSq3470cjatfJB4DCqFrHm/fk8xUWFRyFNZ/Aej7TMVohJscr
	j1r
X-Received: by 2002:a05:693c:2b15:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2e47a1027d4mr24568461eec.21.1777268874938;
        Sun, 26 Apr 2026 22:47:54 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm42350209eec.21.2026.04.26.22.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:47:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 2/2] staging: sm750fb: propagate error codes from de_wait()
Date: Mon, 27 Apr 2026 05:46:57 +0000
Message-Id: <20260427054657.758-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427054657.758-1-dennylin0707@gmail.com>
References: <20260427054657.758-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750 acceleration functions currently return -1 when
de_wait() fails, discarding the original error code.

Since de_wait() now returns proper errno values, propagate
the error code instead of returning -1.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0f94d859e91c..d8e91f7a7778 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,14 +90,16 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop)
 {
 	u32 de_ctrl;
+	int ret;
 
-	if (accel->de_wait() != 0) {
+	ret = accel->de_wait();
+	if (ret) {
 		/*
 		 * int time wait and always busy,seems hardware
 		 * got something error
 		 */
 		pr_debug("De engine always busy\n");
-		return -1;
+		return ret;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
@@ -154,6 +156,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int rop2)
 {
 	unsigned int direction, de_ctrl;
+	int ret;
 
 	direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
@@ -263,8 +266,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		   DE_WINDOW_WIDTH_DST_MASK) |
 		  (source_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	write_dpr(accel, DE_SOURCE,
 		  ((sx << DE_SOURCE_X_K1_SHIFT) & DE_SOURCE_X_K1_MASK) |
@@ -326,14 +330,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 	unsigned int de_ctrl = 0;
 	unsigned char remain[4];
 	int i, j;
+	int ret;
 
 	start_bit &= 7; /* Just make sure the start bit is within legal range */
 	bytes_per_scan = (width + start_bit + 7) / 8;
 	words_per_scan = bytes_per_scan & ~3;
 	bytes_remain = bytes_per_scan & 3;
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	/*
 	 * 2D Source Base.
-- 
2.34.1

