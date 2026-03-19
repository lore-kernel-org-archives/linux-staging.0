Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EC3F7868
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939803; cv=none; b=UlIFUNUk1gpn6MaZ1NogzMXYxViyzLN1wk+Qdi7xfoAqfLbEH+1KWc08nkSZvMbuYbpdefLvTSzGkL3f2JHQ+efQxCXgB1sLuuCPcq+UJ433PYNGEBkgG0UwjyZjb0llqOVEx4cRedOX4o9qd1xbSDCrPTOy/h/smKNTZGlq/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939803; c=relaxed/simple;
	bh=C/cLMoFgW0XVWvrw6Hs3zkAsQGcWlD5hx1imZbF+9q0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dcvYPb/Fx5MK1DYwjX0CzG0RToTwVyMr4GMqct+1bh15wdx8drZLQ6GqH7IszsCBQrJ6S/959eHTf8Vm/y24Zf1JopaTLAShZ352qvHstKE+lftv07H9wefDuc6tg19cR8u/s3Sz028G4J2pCP/hBoF5P6Gk8RRkizrqCGjDnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1AhGfLt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1AhGfLt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82985f42664so905193b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773939802; x=1774544602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UH0QiAiMGoIzmdnAOqrhPJy+r/INXuhs6otIAvOP8aI=;
        b=U1AhGfLtEijSJ5QFOi/f3qY126tl4FLmrOcFCDAcO3Tj2fW3dyhdDd52N04GUfrce8
         UNAug0w4qPtOhbDnRNvdIMrtXxjcGwrNT1ALpqjvViZmbD5oXhGxYhvNrKI0rJTFPkGV
         2sWQxZHSEqIPZYTO1Rw6e81s9YFHoOi9U2FHbCckabMRViW+wfb2iwqOkpbw1J/nhIOJ
         +4Ait1UtgoS/KUTTvG00Twr9mati1gb34Zi6YARJ3xUeAta/zKI28GWQXzZe2sr5dbFd
         9D94DV8GyCWlQKrL4EcYv9VBGkwkYVGk72Yv/MDhrpPpOdwM83ie3fvG5fcOgOfHmG6E
         JVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773939802; x=1774544602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UH0QiAiMGoIzmdnAOqrhPJy+r/INXuhs6otIAvOP8aI=;
        b=EVNs0kxdTNyeO0kGzGGaD6hQW1uTEdlQzXIpJGQ73Makk9R+jtBHKs/Jza+lIBMyTk
         O4F+znstxc3p50UVcVlexqVkG2/hpnIcaqOcQBp01w1P+u/FwgJUNdgW8I1S/m9ZjkK/
         yrPXLNdq6LXPpcgY40cswBWm50PBcjZg4RLrTko1LsJ3bccFtC5jdq6msZLUZIFbF6BC
         ifmwcnOyYTjKnNo1MExrVsqqjKbi8ZqttZOzSwqC0dpLHS9Ls7vuhDSh5bjH06Y0jeop
         l5K/v7MZ77+9PKLcbMyKQbl4eGA7fjohpDAmnxBsf0V8VcsvtmL+nltATWjYVL1dV1NF
         ZaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXufIob4Z7XWU8Aq2WlnxEFmb/aTl+QZ58Uyi9CMTTXIvass79MqXp3Gr+JviivWMRbo2YXHgSaPuq6OYT8@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb79SZh25ZXaKNkrPK0J3fALZ7vYDE7vFKZang9d7+JOlPCRY6
	0LoJqwvXOSIef0ccKIQlDIgYwurU+P8mk7uH565EEJII43f7uAgCNfW0
X-Gm-Gg: ATEYQzz14jOh3M8xwDDbTBb0L7D3cFZt9/tYuU1QkKv5yCIOey18myp1LBVPV1tk7oC
	Imkvq0Q4+gQaALlbwtwDEp76iDsnw7QK/8bL0FMFe3jIK/JqpfrfdQNX73CyPEcelThXYll7noJ
	Cnpink8cNRi9gNrZfqca9VwfhyY7TlJ1DQeukqisXpoqeZb6Ll4V0n4dzm5T95/7iGI+oNQ2Irh
	p/GZn30Z8FuUx8JiH26Z8Vcms396114JvoKKVJrndBWcAm7TzMNuhHgx2dvMXuQaDlxBEfiuGIG
	XjLO8qnbOiJYe+4JmRsrU8fdeGlyj2X+PX5wLae36yXgxH24xm7IOS+jNziGtLizuekvZvPJrvt
	lhruD5phrrPw2hXSJZz9wLWId52IT/gEsbGIGsIqpGjwHBsNj2Z8CD06WhZ+jGLUcFvWIf4ON45
	m5aWBoVTjkfkCHEQ6IlL16q3Vv6duD6hh5a7gvVmfbXgmP8vI3pbHrrjcRYztzFxZkludwOnJ4h
	sIPaubWRmdrAQORD4AcjNLOVRUN6Ga1XtZbHPNVCV8xMWLz
X-Received: by 2002:a05:6a00:1acf:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-82a8c22e689mr54392b3a.5.1773939801863;
        Thu, 19 Mar 2026 10:03:21 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe1ffbsm8599692b3a.43.2026.03.19.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 10:03:21 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: starpt.official@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: initialize le_tmp64 in rtw_BIP_verify()
Date: Fri, 20 Mar 2026 01:03:12 +0800
Message-Id: <20260319170312.71408-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize le_tmp64 to zero in rtw_BIP_verify() to prevent using
uninitialized data.

Smatch warns that only 6 bytes are copied to this 8-byte (u64)
variable, leaving the last two bytes uninitialized:

drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify()
warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)

Initializing the variable at the start of the function fixes this
warning and ensures predictable behavior.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-staging/abvwIQh0CHTp4wNJ@stanley.mountain/
Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..c3f5fc4abd17 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1291,7 +1291,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	__le16 le_tmp;
-	__le64 le_tmp64;
+	__le64 le_tmp64 = 0;
 
 	ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
 	BIP_AAD = kzalloc(ori_len, GFP_KERNEL);
-- 
2.34.1

