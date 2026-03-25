Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3D38AC74
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482930; cv=none; b=WV1hudRmZE1yd04mGP92gth+G989A7scKzMBRD30UEHqP8JWTXJnrgfGGNd9sKOhZ/2uDZfG77I2I68aPtS4MqRzLN1aVVeDlvBgLBrtzMpicQ5JfeF1EIufApWzghSN+VySIrSDt66pppO11RAG4vECWNF+om6XcFuAtXzVe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482930; c=relaxed/simple;
	bh=hPHO3IKDEcvfQcKI7GutrFXjJ4A49uIAJo7ir9ZJ/0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGaHGCZ0I0vmvr1qeSBQwQZlas3niK/p/hUYUp1PvP2rVzSfnnKGiVS4GuH2KmwbyRtrKfkU5z/Beoy7PXiRGLDXA9F+Bh1G5NxcU2mmsotmtytTby9ETcWd8gnOa8X0BwbxtYNhc4VlE3M+KcYzDsEMlAnd3pT/haxuJ3P92e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHZKCeUT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHZKCeUT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82c20f1e890so244554b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 16:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774482929; x=1775087729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzzeoIqJLGjFnwLWOb4Sv6Vo/ug4/9HlMGn12omnB+k=;
        b=CHZKCeUTb32Cwa9SSn+0/fK1sfz5O8iwhqD4HUPA8GTJHHQJL+p87DEIHoCk1X3DN1
         tR+mchwEAHEl3IndemFS446ZZas/pLk86Cszoek0Fd3oUw3+hG0ZOKr5tbEvYoMOqZh9
         7zz8IO4CCfVztawwQAlNgXsJs8JJggR6baWOrxTzGsYgHPnEz1HoZhZBbgVr0mLVVa9l
         vELAyfbgtpfQHyFgimBOhz5SEuZitlBWztFrZX2hioRLpeM0PLnRV+7bK0RI4BozNj5T
         QaJjsG5qBryQA8FI8SLA+6csZ/CkWfQtrW5i386xfeqSn1RBLDzD3sUQGhZPYxK7ucWU
         ifiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482929; x=1775087729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzzeoIqJLGjFnwLWOb4Sv6Vo/ug4/9HlMGn12omnB+k=;
        b=pMIl1qq6LaD1e45OOCB5JVthpPfwIHHKcjInuMvPDPBQJrbpFqRXCDLR9NwrRAs+KP
         C5ei2/6ADpnbWp89/Gg7URSHKGvLAveB1dQ7O4JVsQVkkBDPmX9plC1f0O5Qumd6sevw
         dulV00RhqBYsXh0OI2FBqlW/ZktnkgFBfGyQHNDJECRJLDYRGrVOa2ed3qxNJIIb8pl9
         Y/uY7k+eAxEPottv6DgT01GQgCvq7JfwzaadAKiOn70KTGdsBMfT032Vye0ITfXoNsi0
         Goy60tLi0JopHY+unFSNItXBX+T1ySmD2wNSsdCNgBCOAd8mdjLtPp6CLuAhKSEPbAJH
         Nhpw==
X-Gm-Message-State: AOJu0Yx6kBIesfccHvBArSvgMajv8cDkj4XW/JQqhBTEkAVyp77KbsyX
	4+ruR+IdA8q/4YNR5WY96j1LDTFgEdmO96Bg/s74qkibrpy466xCyDKR6r6RB9bYi5X4tg==
X-Gm-Gg: ATEYQzzvB0ejFfOm5JDXAwFXxB72RJThua7FroUfX5mnXxogU55uY3FfaiKIko1OBJ+
	7P3iHSvrL2Q73psXeC7kdeTpnAjsWmSV6LYFPy6AORHGKCeiCfiPnyhOOQOKpbHC1oKD3ZKt7Zg
	ZN3E4IbjNW9oMpSP5tbNUjJ7PbZ29QmQkmLdFZQivvZbhTLIYBIPI0LdM2XVAAjxeaOFMk73M5Y
	ICxONt6HsgpWq9DD+9LisPG/gj8xePKmAX+IL/pHoAF7cu9OQfPki4IS3em2gTjcLM0zRATQFsP
	9XGKKv3TAVZ5nuQ8Pqv1igriwci70e+PAZZW2enLTjucBRxKlEM495oanAs7OTGNKAKmjv1aZP6
	Z+INlLMgU1xfGNIh+gbN7HVAG6EbveXu4ZZDPbYM1gwHMhplPxazJPskfd1GAAWbnns7jhFKSej
	ZATNx2AhedFG6QE7Hoil2uP9o=
X-Received: by 2002:a05:6a00:181c:b0:81a:7be3:9e6a with SMTP id d2e1a72fcca58-82c6de8262bmr5588709b3a.7.1774482929060;
        Wed, 25 Mar 2026 16:55:29 -0700 (PDT)
Received: from MrXploisLite ([39.194.5.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3888e8sm797067b3a.39.2026.03.25.16.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:55:28 -0700 (PDT)
From: MrXploisLite <arokigaming@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MrXploisLite <arokigaming@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove spaces before tabs in hal_com.c
Date: Thu, 26 Mar 2026 07:55:19 +0800
Message-ID: <20260325235519.36499-1-arokigaming@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning 'please, no space before tabs' in comment blocks.
This change removes spaces that precede tab characters in three comment
lines within the _TwoOutPipeMapping and _ThreeOutPipeMapping functions.

No functional change, only whitespace cleanup to comply with kernel
coding style.

Signed-off-by: MrXploisLite <arokigaming@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1298ab2e5..b045bad4c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -359,7 +359,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -400,7 +400,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -417,7 +417,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
-- 
2.53.0

