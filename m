Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46A1E4928
	for <linux-staging@lists.linux.dev>; Wed, 30 Apr 2025 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992628; cv=none; b=P0i7bHxkFoKQewt7At7xdWfKq5oJOiDoQZZkyRJ6eao2heWVJ0ighmd6IVLmT/Bhb2CbAKKxmsYeoZdMorqDZoIM9WrOQGGzBgQqKOxNU4taNok0NAl6kb3GzRsm+mHfJi5LW4H2ixj4kW7JdHKYchy0ow9fKDgL+HmFh/2las0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992628; c=relaxed/simple;
	bh=AqkrxvNmNSFYAfLVvhqlILUEtmSOv6o0GLSnBLAdudg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WzhDdpUM88XSIOUVEl8FklrKvnOrAI377o3kBRp9oGpl5s4x2j6Zbb7HDbQqFsaKxt5dRHiwjsPQj5MUMTm7z/YqkUszJs0NdKbSm3XeUyRj+qBPI7qI2i7K+aeAE8CmjRcr5hJNlM7yhi8fWk808xtpq6YtwjalqQXTZyeqBOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H93YHSRs; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H93YHSRs"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-225887c7265so12911245ad.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745992626; x=1746597426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SIeVaE3oBK/bbYkLO4xya3KMnkaYWVmL+CNJDLXtBE=;
        b=H93YHSRsAl7h/iaYkg24yygmIAnFo+e4VsE1/bG+ojSAF/JQyzzCLGMrQVWKqdxERc
         UZHNGCvoEzFGAa/SC35s8xdDZQF4EhcrJtaGrsQRlAls7+DRP1OuzSw6giHkIim/si/9
         Kq5RH09maEbchBSuQTGThuKjM9TAWN1OasYQFreQK8lx6nWySqSEd4wLjchCvKrDNqse
         mMmUvP+WpcLAgyujyLXN/0Ykv3QZCAOxWU1Ii05UE1h2RKIkH/Lf/ASgenudOcJ/++Vc
         dkVzGW6Bh9pdTm1+FDKxLbEaSY7Jy6Z2lXEGXP2zydHsFMy4seyXTzV60mmERM+IVYMt
         EznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992626; x=1746597426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SIeVaE3oBK/bbYkLO4xya3KMnkaYWVmL+CNJDLXtBE=;
        b=ruZUAzDXpoRDI4TbMOACJpOIJR4iPu7Tb973YeDv0t5DAUDE8rLIpK52o95OdI+P0+
         in06C4a9UE8olsdWCuA52jjJ6bMSpJiowaVDs2Cw3AYd7bfNJuhumULoFoNDZ2WeQzaE
         +GKBmLMqUjmW0jrTWO+CIdt+bPxJhzwP/fJYd0G4tTk6O7uOQBQZTFKpLwsRYt74Zne5
         oDUZusl7MqQ1NZ5xO2oPzv8H0dRhQEOwD39eNTY9UlgcnDrSdI09mSVphTxc1MYDZAQI
         onEnKccsoT6sMnZ4u/5vhQwCQeV7p/WbPORHuGplwsiD9k7YUGRizWTD0IKVmzdGrm6q
         b5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUsCiz3J/vjrP9WEum7bQJHDI/7EwGFDp0y34rr3cRi5n4+oLOqXOm7QvH1mSCofMl6SuG/h+6VZDAoRBp@lists.linux.dev
X-Gm-Message-State: AOJu0YwKMFt4gul7w13uas6k8b/iheJS9SGTb+woDzx4rHZsP5LfY7uw
	orGN8EWFFsz9LaHlcLap/rw35Agkwu1Innh+QVF8DO+3aec9gDQ8
X-Gm-Gg: ASbGnctp1WNOh2q2OXHQupejjpjiue/CcYtJdqH2Q7WNY4vqv6RZ/MYk4m1G8b7XSTz
	rN25jnUUnFweL+cDD3fw2zK97EmcxtIENqzF8azgldI79iC78SHBxNs95Kn5uQBYmh4N1vmhNi0
	qLDAPm/Wn1CJmuhxTxbPb+a3WupMy4T9IvZXmenH6/HeOEdYxjzrT2TAmeqMrQrIdx1WYXuCybt
	lw5FOXtIubfEk1nEahrHYvuWV25MgS+Qe9OJcjwMrSkr8noFYHfmlB72FPxespgyCcrNhmhegIF
	b6MXlcZAjYZVQuYkSfQzCbEwIyciAfu+5Wlpt1bIA0w6nTruztZSqcId5TSQoYCVvWG2si4Ju1J
	klNxACLN+80m6M0G/K3P4CkQbG4C/vL1DfXtP2BArITM6U0yqIwXcKLM=
X-Google-Smtp-Source: AGHT+IGgrv6SDWIMuXsf6C2RnU9bCVyPaLjrO2DFm+ZB4E4lIHxEQvyi56OVKwlLm1oqqujIrLoTuw==
X-Received: by 2002:a17:903:3c48:b0:220:e98e:4f17 with SMTP id d9443c01a7336-22df34aa388mr11537185ad.2.1745992626163;
        Tue, 29 Apr 2025 22:57:06 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm113383895ad.257.2025.04.29.22.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:57:05 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH 3/5] staging: sm750fb: rename sm750_hw_cursor_setColor
Date: Tue, 29 Apr 2025 22:55:37 -0700
Message-Id: <93717027d952d14d9b17f78e8440a734e4dc5d89.1745982772.git.ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745982772.git.ericflorin.kernel@gmail.com>
References: <cover.1745982772.git.ericflorin.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename sm750_hw_cursor_setColor to sm750_hw_cursor_set_color to conform
with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sm750_hw_cursor_setColor>

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8dd32aa6ac6e..483a30841c77 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -141,7 +141,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
 		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
 
-		sm750_hw_cursor_setColor(cursor, fg, bg);
+		sm750_hw_cursor_set_color(cursor, fg, bg);
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index a6fe241e7748..e80d6efe0ab1 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -72,7 +72,7 @@ void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
 	poke32(HWC_LOCATION, reg);
 }
 
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
 {
 	u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
 		HWC_COLOR_12_2_RGB565_MASK;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index d0ade8e366f4..edfa6a8202cd 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -7,7 +7,7 @@ void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
 void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
 void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
-- 
2.39.5

