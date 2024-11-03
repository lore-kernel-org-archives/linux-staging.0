Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FFF15A848
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621696; cv=none; b=gS+25UVBqII9ScmgRY4ax4Ew/TEsh7r4N0jm6tRIY5SInvfQLl2HqDXX6leJVVZn07/2PKoN+hQ+0gSHPpwEnKQj6o42swPv6INQQO3aOlfje5gqMaco6yjAR12NlMiNYGY9yxZb4l5sQ7n+zn40bAnK+Wka//N/ppo/CYZNTeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621696; c=relaxed/simple;
	bh=sJQBtHHCyUD4fx57VPvGK7t1PMtZgvKNa+0f3DpKnsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKN55XS5+h803kPZloemkLoUJod0Y9/uhUzFMLeqwG5/kZ9vVrws4aTqCf8oUJuXqwb0hPeZRHfd7nWB7r4dCS6a7hzZ+iCfsw8X0hNSGjQcvbnAlfV8qW4Fwng/JFeIgADG8dRG3wyPLLFVa/Y/gTVAjcBaiBIO/WaRRHeDBmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me8+1sqx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me8+1sqx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso4005727a12.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621693; x=1731226493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKRocKMvsGz4cOULrqNXkHoL0rqs+NrAAxU47zmH+UY=;
        b=Me8+1sqx0J1as1Pnx38PPBwkjhZUf6Vp+SHxs3D/vPObY+V0opNJXm1YVfOIgidBQh
         oBnrVisw463NTGiauJT/96GzJwiQ0wXa0rxHOSMyofw9CryG/ugjBw8yHjsgEbrPq0iU
         jtLNUE61vfG5j6AwTJupvYW1hV2mbL4r2gRwD67EoV6CW8NuvrwsEabECJpjX7Jk4w0C
         9QchnhveLiABx6ohxmKCqfj3KpRzqKDanVzWTir39TS6FRWAklFq0imJoVK4DDdVqMaQ
         HsNmRn35U28ZIYpSZKSTOBQWS5uQrSeTEu+XPqZieSuezow95zGn9JDg0B8meR3SQH+r
         b72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621693; x=1731226493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKRocKMvsGz4cOULrqNXkHoL0rqs+NrAAxU47zmH+UY=;
        b=w5AlI5pzv2tbQsc2bNCgPeI56M8TtG8AGnCd/tpZMBWbNrwZzrSCXSnJM6YhweNPQZ
         DOlKltTGhIomvdhBBz4Tp/nn+PJfSgUDbVR7aDxuHN8hIMdlc2viJdr0PtzPKqqUFixB
         EhpODDIjOuZupz4geU9U+NyhWdJMGE8GJpFnIatATMhOjGKqSb+Bf80CaFiYJcC4GTuj
         d3jSbkbMgkev/tV2B3khbXy/ktOXcBGFm+hWjhZs2d2t2Zb2smWX+Jpt7N2rbZzRYGp5
         WX2Dgkc7Ipp13lgu2uFlnicltciiubJTY9+2xevm01VUJ75Y7i8qpewmmb5auNJCnsjY
         KdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQMYgo2bntBlsUSapDqku9anXk668lH5TXGu6goFCYGG2M97LOm/QHTy4UP/dthj0LSFIQ/l3oCUfFv0nL@lists.linux.dev
X-Gm-Message-State: AOJu0YwYmt8iqdLxmmDnefWi1keN9IDFq1cgZuFYTkBwqUPf+vPTKjki
	eKfzWEpTvStuRS9fvNiDmgbHxir7VE3nd+FU4u4ZUNKTD815r4mrGieQCg==
X-Google-Smtp-Source: AGHT+IEUdwUv9MdZb3kct+QldHfpcsuY/9p0YeIRb0fwCu+mPP3498mIgN9ACUM2AetSDqcm1a3iow==
X-Received: by 2002:a05:6402:2114:b0:5ce:d028:e11 with SMTP id 4fb4d7f45d1cf-5ced0280e56mr2014148a12.17.1730621692863;
        Sun, 03 Nov 2024 01:14:52 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:52 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 02/13] staging: rtl8723bs: Remove #if 1 in function hal_EfusePartialWriteCheck
Date: Sun,  3 Nov 2024 09:14:23 +0100
Message-ID: <2eea90fbdc2ef0ef5c8a224330558ccdefdfdf5b.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove #if 1 in function hal_EfusePartialWriteCheck to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 53 -------------------
 1 file changed, 53 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index be4cc8fc5696..2659999404a3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1327,61 +1327,8 @@ static u8 hal_EfusePartialWriteCheck(
 		}
 
 		if (efuse_OneByteRead(padapter, startAddr, &efuse_data, bPseudoTest) && (efuse_data != 0xFF)) {
-#if 1
 			bRet = false;
 			break;
-#else
-			if (EXT_HEADER(efuse_data)) {
-				cur_header = efuse_data;
-				startAddr++;
-				efuse_OneByteRead(padapter, startAddr, &efuse_data, bPseudoTest);
-				if (ALL_WORDS_DISABLED(efuse_data)) {
-					bRet = false;
-					break;
-				} else {
-					curPkt.offset = ((cur_header & 0xE0) >> 5) | ((efuse_data & 0xF0) >> 1);
-					curPkt.word_en = efuse_data & 0x0F;
-				}
-			} else {
-				cur_header  =  efuse_data;
-				curPkt.offset = (cur_header>>4) & 0x0F;
-				curPkt.word_en = cur_header & 0x0F;
-			}
-
-			curPkt.word_cnts = Efuse_CalculateWordCnts(curPkt.word_en);
-			/*  if same header is found but no data followed */
-			/*  write some part of data followed by the header. */
-			if (
-				(curPkt.offset == pTargetPkt->offset) &&
-				(hal_EfuseCheckIfDatafollowed(padapter, curPkt.word_cnts, startAddr+1, bPseudoTest) == false) &&
-				wordEnMatched(pTargetPkt, &curPkt, &matched_wden) == true
-			) {
-				/*  Here to write partial data */
-				badworden = Efuse_WordEnableDataWrite(padapter, startAddr+1, matched_wden, pTargetPkt->data, bPseudoTest);
-				if (badworden != 0x0F) {
-					u32 PgWriteSuccess = 0;
-					/*  if write fail on some words, write these bad words again */
-					if (efuseType == EFUSE_WIFI)
-						PgWriteSuccess = Efuse_PgPacketWrite(padapter, pTargetPkt->offset, badworden, pTargetPkt->data, bPseudoTest);
-					else
-						PgWriteSuccess = Efuse_PgPacketWrite_BT(padapter, pTargetPkt->offset, badworden, pTargetPkt->data, bPseudoTest);
-
-					if (!PgWriteSuccess) {
-						bRet = false;	/*  write fail, return */
-						break;
-					}
-				}
-				/*  partial write ok, update the target packet for later use */
-				for (i = 0; i < 4; i++) {
-					if ((matched_wden & (0x1<<i)) == 0) { /*  this word has been written */
-						pTargetPkt->word_en |= (0x1<<i);	/*  disable the word */
-					}
-				}
-				pTargetPkt->word_cnts = Efuse_CalculateWordCnts(pTargetPkt->word_en);
-			}
-			/*  read from next header */
-			startAddr = startAddr + (curPkt.word_cnts*2) + 1;
-#endif
 		} else {
 			/*  not used header, 0xff */
 			*pAddr = startAddr;
-- 
2.43.0

