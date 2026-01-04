Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DAD259C84
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767524815; cv=none; b=lRB0sQBrQoEpXN9EP03Fe3wdtmsOCCG4dFgbPyDmphlcweUKEpvlOTtiC5XTMUKKpbeOchAPe63Sr3KQVKVf4XwxYGxJU0dDixYt2Dr0n5EUpvA/z2S+NM6ZxkfzDFbowy5OsV3I9HLpXEoLtWwvu1V3NYh3a+Xhgxd1OHTbawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767524815; c=relaxed/simple;
	bh=inJKKkiyV7KHWX9cyP0g6zKY4VeQfXCBaSGilxBwXCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnjCapL4z2JoRBqVRgo/uXcryUEvWAbPpVBeIQHQ5wmeXCYbDII5XRBbkP9yFBlIAYYtqFmTK0N6o/2mdH28Ahu27lmb4JwwrqA0ItYF94PmaJOCc4JhmK4388yLD/4TGvBwOCAwDvGpV/6o1E7kZ9CxMDGBozK9H971pSWkrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kv5xMX9M; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kv5xMX9M"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7baf61be569so13682658b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 03:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767524813; x=1768129613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmz/Xu0Pokn7o5jLUorKqspAjEWkFQmifBWWvvSJmmg=;
        b=kv5xMX9MLo4C4T4Uu35j6mto9AXBDbJdmZD4zai8+prowEQ5Z0PhgtQM1YeOdEQimF
         v6yAlTa5XugNxWrcbSLJf0XYGoG3Wz0d6rO2W7Ftbl4ev+JcaEEBtRn8dNE5jTlwiZ9d
         7tWXPDt4+hCt/Am4ED+nV94VIVGVIv6u1YdA1BaYLt7XGdeHzHPSSYFXlHOS9c95asb1
         zeXi44VrS5n/lEzv+S9Cd3RaWUIxriaX8dAtJnVUdFajfa/jMkS7MDmSECV+Mh2QRfll
         HPW634agwklQ4o7ThgPF3LKRIwWvc7o7xMzP58bL7yfYj0DuRonEXxuwFdCIpxDJDb6d
         fL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767524813; x=1768129613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dmz/Xu0Pokn7o5jLUorKqspAjEWkFQmifBWWvvSJmmg=;
        b=AfcuXryxo2U9GRxolFsVnAkHqWXyzM3Pez+isdd6wvHMLRGmV/plp67QK9/YwDC1Jz
         jYMT0hkxDwzf7zmRcyrHougw0IVX88vuNcS+GBAgklNkqUsbGm7mDGGOC488ouCcpok+
         fY/r+0kM5WYoUdwgqBNJqYWxcKhEr2i0Dym10duAjrSdfoZy4Q6hIsTqreLcl/mlCW5Z
         sWr29WoFNu7IJz9fDFczkJ0QILo6nD3JEJ+e82oorwaFmMfClW+ZjQvRi53W6iHIawky
         QV0o2e/Xtu+JrG17XdNFDT9BVJTwzKmLUdEu2h7Iv0WCpuXlzkNh6BUl416F9SIBUsHU
         sMyA==
X-Gm-Message-State: AOJu0YxdNbYZFltWQg+TNpRdo4gIUgKgNc8Cg2l//d778s981NebKkLN
	RSSZfMldj9HU0nu56KVLyKEhT9kQDUQ1eeM2/oGnhvZzGt2arCrv9/q+W5muFoLLE5OXlA==
X-Gm-Gg: AY/fxX7C+w0cdXmpwWmqg+aTchZBlyIPwnm2/ZDGL8XPHJBcNRAlsJaIdT4UMidsChN
	mWFSMClHqYdHJiZnaMHyVO98qUdC2Q/IQf2Tt8uOeUa849YSYqe/wHOWVkVGKWheUIEBfCEJUmn
	omSQ5+/USoFPdnHZqtlNZ5vwGwFRsAPyl62kBxgwaXTzwQgpaXIVLK01qFlXbqVlzg4gkU3mR/W
	V2720qrzm+y6odGv9LhA7SCdpyf3kkcLw9J1wGwFVWf2fFLxyHkk9yjr+QF2FD4OjY4E+t4VvKr
	aBifoCBxK8+sQxfEBtOtOEmC5Lmt6KWMp3oxXZq1Xpcrd0LJmyX/WjKjCV/dGEcLHccObGg4S0F
	sH0qVrcVmQKJKTsyjiYVbLslEa9cm1iqH+NiK+vsG7rmE3O795J1/VOiV3lm5I/lt7Ce56zF3Rb
	GwRO5ddbzpvF3PIyl2wamDBoglwefUbAlwxCEjBy9bbrAQe0IETf2jg0Hp7YaWJXTL+tVmoAXdL
	r+I1hNf62Q=
X-Google-Smtp-Source: AGHT+IFT57sRzchwkgo2RkVk7eqybUBx+rr0/sZgZIOeGa49uoW05Lm/8gYoJDuz8K8fM2r6MbTUtA==
X-Received: by 2002:a05:7022:6886:b0:11b:1cae:a0fa with SMTP id a92af1059eb24-1217213721emr48642842c88.0.1767524813143;
        Sun, 04 Jan 2026 03:06:53 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:06:52 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in DT init parsing
Date: Sun,  4 Jan 2026 19:06:35 +0800
Message-ID: <20260104110638.532615-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang reports a large stack frame for fbtft_init_display_from_property()
(-Wframe-larger-than=1024) when the init sequence is emitted through a
fixed 64-argument write_register() call.

write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
varargs which inflates stack usage. Switch the DT "init" path to send the
command byte and the payload via fbtft_write_buf_dc() instead.

No functional change intended: the same register values are sent in the
same order, only the transport is changed.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 32 ++++++++++++------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..127d0de87e03 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -846,7 +846,8 @@ EXPORT_SYMBOL(fbtft_unregister_framebuffer);
 static int fbtft_init_display_from_property(struct fbtft_par *par)
 {
 	struct device *dev = par->info->device;
-	int buf[64], count, index, i, j, ret;
+	u8 buf[64];
+	int count, index, i, j, ret;
 	u32 *values;
 	u32 val;
 
@@ -881,7 +882,7 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
 					ret = -EINVAL;
 					goto out_free;
 				}
-				buf[i++] = val;
+				buf[i++] = val & 0xFF;
 				val = values[++index];
 			}
 			/* make debug message */
@@ -891,23 +892,16 @@ static int fbtft_init_display_from_property(struct fbtft_par *par)
 				fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 					      "buf[%d] = %02X\n", j, buf[j]);
 
-			par->fbtftops.write_register(par, i,
-				buf[0], buf[1], buf[2], buf[3],
-				buf[4], buf[5], buf[6], buf[7],
-				buf[8], buf[9], buf[10], buf[11],
-				buf[12], buf[13], buf[14], buf[15],
-				buf[16], buf[17], buf[18], buf[19],
-				buf[20], buf[21], buf[22], buf[23],
-				buf[24], buf[25], buf[26], buf[27],
-				buf[28], buf[29], buf[30], buf[31],
-				buf[32], buf[33], buf[34], buf[35],
-				buf[36], buf[37], buf[38], buf[39],
-				buf[40], buf[41], buf[42], buf[43],
-				buf[44], buf[45], buf[46], buf[47],
-				buf[48], buf[49], buf[50], buf[51],
-				buf[52], buf[53], buf[54], buf[55],
-				buf[56], buf[57], buf[58], buf[59],
-				buf[60], buf[61], buf[62], buf[63]);
+			/* buf[0] is command, buf[1..i-1] is data */
+			ret = fbtft_write_buf_dc(par, &buf[0], 1, 0);
+			if (ret < 0)
+				goto out_free;
+
+			if (i > 1) {
+				ret = fbtft_write_buf_dc(par, &buf[1], i - 1, 1);
+				if (ret < 0)
+					goto out_free;
+			}
 		} else if (val & FBTFT_OF_INIT_DELAY) {
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 				      "init: msleep(%u)\n", val & 0xFFFF);
-- 
2.43.0

