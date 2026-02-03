Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79CA3EBF23
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770094336; cv=none; b=IJTkX3I4gyFtPS/8pHcEJNzejzQkl276jZsKgjY5bmp+kvaiiICv9hl8voEMKMgRu1cdFDD8ixfl95mzvV9tUDdKq1MKGn7dq7eRISyppObu0tyAGhne5RTmiVlrkHUJeGOjT2fyJOZrI1uT/TG1aJEo3l8Vqqy+7xO7cqosSi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770094336; c=relaxed/simple;
	bh=Ftf6AxmGQtAtNVtlE38F82dj2LDYE/4g8fYPDiaBt6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTIxYIdRJRsplp9LNoxXNfh7IwXKxfCqGntvEYt74zXYjWrwyKWLL+QEPuLd1fDMc0B/mHAOYP0vZDT/H+iD792zJTerDSp0WbmT8YhtQ/iAUf2hlJJfbQ2tIEpUhfdbjqi/MtDEVFptHIf7ctncSeN2Mi3H0RXyuIJEnL0JJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtNo29/r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtNo29/r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0c20ee83dso47797045ad.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 20:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770094335; x=1770699135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
        b=WtNo29/rD/rNrz0b7ervIWpm8oUhPIJynzCSiQ8TfCXhoVbm6JXRYGW112p9BhRgUH
         oyjl3CUEkcJdPB+Pn9RgLdRUljddOzKUoTTVVvMFagepfDrqibyGxAje395ISeVLr3gU
         xrtlCbO7XulwRd7AQdUQZubFXXm8uSfTZoEhQVUjeJeF5KAksPy2rzRFtHU+cCvRwOof
         R57GnxyW0xNaUywvQOh87LpadLmecAztzewvam58+KrayehdVwcK5n8cMZ6OPPAcWbv9
         Y361YV2Kq7tlawZi14NLA5tnvT1YNFbD2Ym7RmTJ4iQJU70M4ME7PRfL19uT/UN0J71X
         6YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770094335; x=1770699135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
        b=JUd4OXM/sfIXvWoMGJgLgGtGOG+XyNcdoDgOMY0iAgaMRBA5rr1g9abTJ8+KXObLK8
         PMvQAHOuJEslwqn03V+XZSpNXo2b1OXey6LZ+hRGa/VdOKVbOnYgjlkm+E0BtSmjKCth
         NjPF53Ph0pCLAmzlQqxe9BrnukdQzAe9X9QHlqe1qwsZkOpgb7M1yR/f0NZY+yIQJE3V
         6yhgg1nK2rHHyyf4/uMWoWt4ksKPjErKsNosnjxsMwaM5xoBKLUzU9vx58D5ZK9DLCO6
         JgZc9myqBOBqi0ZnFlzsJHv5whVUTaqzxWLtDmx/HTMicnnqVsLO3S0CqaYnmahSkmdZ
         xD8g==
X-Forwarded-Encrypted: i=1; AJvYcCWtw+0YUs5yhmUQGAedwllPdqStbvkYGj+DM+rFDO2y/jDqIBEW3SdSUjND+TvuAXR+OauHmcCxBmbKiFp7@lists.linux.dev
X-Gm-Message-State: AOJu0YyITmHw5KvZXjz2qiupzlEeIA0/E51kbYFurOa1ngjGUUzHZfAC
	LQc+f9IGe+tJ+6vyybD2zmAcFj1hc34b6JeW5Jy0ody32Z93Vcb6XqxY
X-Gm-Gg: AZuq6aK7Y2du4wVTovwc3sb0uuw3pDCZKdaivzHJ0Tjz31m9JjRINoT4gnSsIk4Soo2
	ENJ8n9tusEjsxKyDQvUFnqG2Ve9B/Yo/Z7Gvx9JST1odWjWwNJlAjQ8GNbJCJ9ftk63/FZIa4/B
	awEY4I/w3GWZy/oBiHquhUNR8qRYWP8X0PMlPw6T8QJPh1UftQuZ/XuDQUWnbFVu7DeLPwmRzjO
	ZLIq5WZiVX4/k0fXe4HuFSyXUfxJ/BLqbD/e5UROgxJZ+4Ha4GK9Wi9XTPtPLxbNlpVWIckLxGp
	if/r8+MiJoqYH1gObo/her+xoanWt32vzk5YzeDKCOfjlezgD+OPC0RLpcetntTxti6BS4aT2b+
	4SpaKVyZZjWlbYBktDe1GPT9BBQkArfeA7kMFreX/fOeJc11qj/k0RpCi88j7/Ibrcrj/+jBa4G
	8XFn4pwJXuH012GXJxsTfEUZE=
X-Received: by 2002:a17:902:f544:b0:2a7:fe78:a344 with SMTP id d9443c01a7336-2a8d959c5a1mr143542085ad.6.1770094335015;
        Mon, 02 Feb 2026 20:52:15 -0800 (PST)
Received: from krishna.. ([103.220.210.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8ec56da60sm85791515ad.38.2026.02.02.20.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 20:52:14 -0800 (PST)
From: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro flow control warning and empty macro argument in fbtft-bus.c
Date: Tue,  3 Feb 2026 10:17:28 +0530
Message-ID: <20260203044728.23774-2-krishnaworkemail1308@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
References: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning by adding identity modifier for define_fbtft_write_reg().
No functional change.

Signed-off-by: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..0ab4f5c4f886 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -10,6 +10,7 @@
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
  *
  *****************************************************************************/
+#define fbtft_identity(x) (x)
 
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
@@ -42,29 +43,28 @@ void func(struct fbtft_par *par, int len, ...)                                \
 	*buf = modifier((data_type)va_arg(args, unsigned int));               \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
-	if (ret < 0)							      \
-		goto out;						      \
-	len--;                                                                \
-									      \
-	if (par->startbyte)                                                   \
-		*(u8 *)par->buf = par->startbyte | 0x2;                       \
-									      \
-	if (len) {                                                            \
-		i = len;                                                      \
-		while (i--)						      \
-			*buf++ = modifier((data_type)va_arg(args,             \
-							    unsigned int));   \
-		fbtft_write_buf_dc(par, par->buf,			      \
-				   len * (sizeof(data_type) + offset), 1);    \
-	}                                                                     \
-out:									      \
+	if (ret >= 0) {							      \
+		len--;                                                                \
+											\
+		if (par->startbyte)                                                   \
+			*(u8 *)par->buf = par->startbyte | 0x2;                       \
+											\
+		if (len) {                                                            \
+			i = len;                                                      \
+			while (i--)						      \
+				*buf++ = modifier((data_type)va_arg(args,             \
+									unsigned int));   \
+			fbtft_write_buf_dc(par, par->buf,			      \
+					len * (sizeof(data_type) + offset), 1);    \
+		}                                                                     \
+	}											\
 	va_end(args);                                                         \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_identity)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_identity)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

