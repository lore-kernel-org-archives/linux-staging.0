Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E373DFC6D
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904915; cv=none; b=jzSM8JtehukNarK9+LTBFbuWtJKvWrWrSJnNqeDRea5aSB6UhHrxcaQpcTjtdxpCf0+q4M0w8zVb6a3I1rNVnyMPKsYmw0PHVLLaL3iHtb2gisXy7Nivbf8TS4LyUR1FqkErZOKLnfWNNiAa6x8r2Nh2SsY51H/OwgE2hEEQ8Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904915; c=relaxed/simple;
	bh=1mquS2Te5pcmhhKClH5WCFqqAoZEuU09SWiMbrKXTVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kBkczk/PvOgchi/nBvUXZ9rx/j2iUHZVuor3cPndDP5hF1E2Sq4Ir7W+r2J0p+cSdjljxHqTgQ/KkNTPVDdYzshWyJTTM+dPBnameB8YRDb/ZmlobFBfRvF63shfd43Np5SS3i26UfMIg5LAvKmPdjtskOsgZUHcdlnXaJZtKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=levQE64R; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="levQE64R"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba21d32776so8362035ad.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777904913; x=1778509713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg/PYRJKmkei+pUFOuGC7E8sZukIx2PR66YeeREIlFY=;
        b=levQE64RMFXCbkA9xXw3Ir3pVyUqPHxl+SKdsIQRz/kRujwqEOZ9n6DkjPli6+Zdzq
         z/ynVsL38YRaJl0mt1obes6aCaikAViDtP2jMStLfe1iL68XbZ3myVbMA8bmWnI/mdfs
         a4RsuA7mVzpnwU+Wl+x3U4uhrN1aOvJwcFpMxqUv7qW9uY5Ycb5x6aT5qlWRo8zs7+qw
         KRtOo0S7DmKYZyFJzEcaZVsi4dDIYhScqT3vDEb4c5RgVktllP1Afx7kfd25+gbCHsqs
         p5M5wu2ump3zaEx48iRAlQiiMrBPwAI9vloI0ijM23HfVb1uwn9IwMpgBRzM9N0U/wvQ
         rOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904913; x=1778509713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sg/PYRJKmkei+pUFOuGC7E8sZukIx2PR66YeeREIlFY=;
        b=WRFhmS5md4jy13fEchentEg7q6zp2n5A6GAF8KLYXaKtwpRHwdjhSne/++7LaSDqCK
         ObU6YAXcsl9NUcuinWNhcpEKpKSN7Rb66lnZzjYczhg9NMdnfXVTq+PbR4tbbhxpGkCi
         HUUkJ8n8GhnyiI0qB1+vodrTuR4RzeK11Z9xEURKwU6Xl9KoJ1G668vsQWfOZ/i+3qGh
         0jurNCLhNJE54pq3qGOXvGo4O3vK5lKWRM13wKlQSh5vh/W44a7kD8YLCuiw2Ott1KIZ
         Zvrxp3cTEGiPEQXzyYBz0NX1Za/kLRQ6npMfAWd7Cy01lfXlgTytxpjIKvmyZpB+XBBW
         H1gw==
X-Gm-Message-State: AOJu0YxyGodv+1+p6WEL3gMroAmbDlg+Y037c7KRREG5cbzjIjds+sBe
	1iuVuKoGAPdZ2czUubp9wVHoqX6UT2jCispZ+ZTVBeVqAlY9vXCrwJub7KRo9FCn2v0=
X-Gm-Gg: AeBDieuREzj1+42soPlJqzm4Mbe/C5X1lwM7qRvJZpUSXd8zTR7Ld1zba+SK8scNS0X
	QC88YfJs/UUEV3hRSzOB+4aXwHCAqKxwvtuFBff9BlkHo+zzyjnL3cK8G81mv8KJqUPFg61Y7SO
	72LKhTmf93L9BQW/os9Eg/2J4eeN1ttu5xuxZbfYk9ry0UcKrMj5BSPPd/LGzKz0B36yxoHU3Ae
	S49FCpdQGPPV7oZkO6UHVQvlz6z2RpyaA5BBnRnVnmuMfOGno7P/OiwUYLYW3Tm3sChc7P/n3J2
	LU0E7nzxahP+InfvKmEJWO75rxWlelZEt+1jyo5D6m18wWD/BXzXdXRShpWrGUuYiDofVTlO7oW
	awqyKDo7K7y6HNTaOsyoCoH5ZI+0cjcMgpGFP3U5MMAqoUTyYC8se9iNZ4swgDoGAKMbAgbzFZU
	UJd83IdSeuD24ZTHpVpapyZ/09h/zUFuKGR7QCX2K675IJN66EwtaWtw==
X-Received: by 2002:a17:902:ed09:b0:2b0:7026:24c2 with SMTP id d9443c01a7336-2b9f260dd75mr65476495ad.36.1777904913341;
        Mon, 04 May 2026 07:28:33 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([202.148.63.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f57sm105468605ad.77.2026.05.04.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:28:33 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 2/3] staging: rtl8723bs: Remove commented-out dead code in hal_btcoex.c
Date: Mon,  4 May 2026 14:28:11 +0000
Message-Id: <20260504142812.21964-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
References: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove three commented-out lines of dead code that are never executed.
Keeping commented-out code is discouraged as it clutters the codebase
and serves no purpose.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..aab68aa299c8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -402,9 +402,6 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U1_MAC_PHY_MODE:
 		*pu8 = BTC_SMSP;
-/* 			*pU1Tmp = BTC_DMSP; */
-/* 			*pU1Tmp = BTC_DMDP; */
-/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
 		break;
 
 	case BTC_GET_U1_AP_NUM:
-- 
2.34.1

