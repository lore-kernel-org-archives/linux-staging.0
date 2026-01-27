Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5434846A
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514158; cv=none; b=gsqlshdH37jjKh26+TSOz3l6N4fl/EmfcUU4bYrcy8OM7aeZajEizRj+8ABXYIMyOMcaeFYBlNx2dqX9lFj0jGR021hslzzEuq2ajk6BFOrUJKPhoNYLVTc1aktcaWz7zfb9+uVzLbmtEskJKegTHBjF51Oxf9H5sdLFvp+DDG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514158; c=relaxed/simple;
	bh=I1YbETf3vj7uic50zQNizt/haXBDl33BQXN0szPIW9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9U2xx2TSEeJBP6t+VY6P3A/qhog+EseGTH73/tWXeENXa7q45IfDNUCT+4u/hzK2g1WYE8EvwyHoxEwhRp1YjpbOC4l+AbIcdzfx7ld0hKrgiuQekP8j3yqlLcY7FvuVnkG7HFGWDlZbB6aSzVRaJ+oV5oURr3uhjtYtOFfceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/PCBAFJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/PCBAFJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so47639545e9.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769514156; x=1770118956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XcOqH7ds3TDnQ6ZR40/AeZU8rusGJW0TMeBJLRBCCfY=;
        b=S/PCBAFJLZ/hey1OJ3g1n3neKWZGwru9op+4qKlGMv2w14AhrhOBQomZLZumHbyhD2
         JXKZL60HI1Mp2+QkT4IYV/DifR3j8RiTHTwxoTdsRX2SA3QBgeS0fSwNqlcD7+K4VDhO
         CSNIMt8AhlQtw8WgksLOowHtyyOomjZDO/z/k/ehONCcqFwS4Qy6BfFCRaC8s/rxEPun
         QszNnmliZ9z97qtq2g20VefMlkpZf8Xue7GGDDOqhF6hifuXO4Lw1/CYPEK5K0cm0Ws3
         jvVGk9q44o079odMYc9WSnBmvrs8aEYrST+5RDlc8FAfcHFOt5ZXVaKxctYW/c9YdBlp
         NUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514156; x=1770118956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcOqH7ds3TDnQ6ZR40/AeZU8rusGJW0TMeBJLRBCCfY=;
        b=k7R4mZbaSJaEInNUk34MV5M207swih0U8ikcT/ajHr6GzMll2N9cYPX2fVyktvYJQ6
         mzJZmAY2ljmKibX+GYwgtVp9XzaQJFm/4h4o0FVM+wiqjq4Mxt99mrRotC0yth4widNn
         Eg6/p8NS40hCd7FiEDBMJJsm+QIKCYOHOWUFpxhGM0mQ63iO09U0GUynS3qNDcC+xgtX
         +u/43GzJ64nuxzONa+w1VkpYHVRGrEF/9+u3LjnKlyktQu/k2ZuQF6BczRHOFxn9X/Ov
         +YPr7fAGEmq85h2EMlZJeJnI2/5cbkeo2gjCZHJVfZe8ZpQhb13CrKlPzOIFamJpriWg
         oqDg==
X-Forwarded-Encrypted: i=1; AJvYcCX1szGTbqGBeK1ddaV7jNtlUpsf7EHpbXq/jj7rZ6GiU6onrn6/TRViDTdJL7mxSH39/rfaVvbniL3WnnZY@lists.linux.dev
X-Gm-Message-State: AOJu0YxSabyVz7fhpXm8OhWeQgMNAR0Av9OKKRdXScxeAK/EByuGUxSF
	YakgNiyHfH1fKMZr0cfgOL5NGUoI0bnQ2/80ogGpcMfHLiemYBMJasvJ
X-Gm-Gg: AZuq6aJ16ouGCp+WNO/J61Yu41vxBl+KKAEdB2TthTTOOfiPIZeUIbsliJdBIW+iS/2
	BWt3e4kMC8UlujM/7muCzfthHeKErIw9eFAezW6B+EOWSL6ZzEmpWnlCCCk4gQcliycQecMNio4
	C83w7kyLd6bQ7nvClBgyA4Xc3FrVbeymbLJYgD+36B1A4ldgeeHHq4UCK6sXW1UJu1ifPWX61P5
	IuW0o811O1yW2JTqpVaeSkhQsTdBqprXDdnGHX0R9kACj6XUa91kfhbfiTE0gYdrhRapIuVO2Na
	SP7SMQPk0sp8zQuhv1E0IaZrEe9r5D4mYPC2+A00bUTAgPrHVOPBJ1zIO+KyJY3QNPyc0imUdo6
	W/WqEI/jVXdCO4SBbZjSAtgwLnERvSwcFbFoMI3qAAaVyNQR1+vG7Dtki6+kHgSa2cQt1J+mu2m
	+5EdNVajwrv4CeVLfu2rg=
X-Received: by 2002:a05:600c:21ce:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-48069e33806mr12386615e9.8.1769514155837;
        Tue, 27 Jan 2026 03:42:35 -0800 (PST)
Received: from Madhu.broadband ([83.106.123.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee30dsm52189425e9.6.2026.01.27.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:42:35 -0800 (PST)
From: Madhumitha Sundar <madhuananda18@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhumitha Sundar <madhuananda18@gmail.com>
Subject: [PATCH] staging: sm750fb: make fixId array const
Date: Tue, 27 Jan 2026 11:42:32 +0000
Message-ID: <20260127114232.29504-1-madhuananda18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixId array contains constant string literals, but the array itself is
currently mutable.

Make the array const so that the compiler can place it in the read-only
data section (.rodata) instead of writable memory.

This fixes a warning detected by checkpatch.pl:
WARNING: static const char * array should probably be static const char * const

Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..ff590061c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char * const fixId[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.43.0

