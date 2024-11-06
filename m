Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799C5209F3A
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918043; cv=none; b=fWWsCv1pZ9eGP7+JFqXg3tzWnqrZtFZDXkwf3Re9sLVylGRtoORrbKRpe1E/H+zdwoS2UdX7RTvchYf+f+7/i6/jI5OTfADWYrz9vV7t3i5CO6G15MvAWzDoFUy8b0c0S/v2ggEJ8Cb96RYxKOc3ekxA8aiRItXyF/Fh5I3joHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918043; c=relaxed/simple;
	bh=/OLpZDtALrTQzeYx2MmPGQ2pB2ywfY4H/jgQ2wGzKbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jn3YI7bwaax01BYPwOWuYfTCMiMxlBNZ8fRYaB9rcY/9OCy2l3rg/9gQ6zINoZmNNxJWyBctLiGdhxTR03dVJjHpoSY3leOcIIMHYtS847kMkDKIMw54IZuYr31reWdAALG9+LatojJ73rrqhFbYIcFGit/E2vBQC+R2yp0BNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjdnwdKo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjdnwdKo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99cc265e0aso7162066b.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918040; x=1731522840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+wHKn8ywOfNHBd4UcX1XnLelRHkboaw+5QA8QhKjAQ=;
        b=TjdnwdKotRZ1jwF2Qt0eFDhqRGAAAjH3asRNVD/xptm9VxKHd3WfAL0/fcCz4MUgVE
         7GFweKKlIy5m5LrPA3sfoMuK4RL8ipGYemkeDhwUHXEFcDtcskN9pSEeR+dpPCxGlLlz
         V6XLYYNLr4FzqeV/6+3ipFVKKUwJgVQ9fAzT2rgp3W7PGNDUSZULMcm2WKRngog7n91g
         6tT+u7JBZqeze3d36WF2eTLm4QBm08/ib6uJM1Lg7rG2uXaGDRFecNWuRDaL7lQMjOJf
         e4BqijiKsYQrvAlB/y36Cutvy4eWkHFVJmOVlO5VyV08xOgHw6YV0/7OXaPSywyMK+bP
         JRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918040; x=1731522840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+wHKn8ywOfNHBd4UcX1XnLelRHkboaw+5QA8QhKjAQ=;
        b=I8a+6xOtHwMFEYPbF6Q1MPi6Fh9OWg2WuiR6JvN6Fk8v9WU9Vx+DEHdyCMZICNwSME
         Vx+LwEYE/JhyqWFimE7RZlReSjVA/JO5BmMYkZYtCJ6vyjl6aFNYbiGeOvVrK65inTn9
         BScJfICw4GG/BQHqX2vOllyUH4u7KebUo0Zwc2LTIFAHHuFTON/rwzc7I2sYD2rxmIfh
         MXuBDEY3lReooA6wKqmgNHnbAZbmFMF5O/26UnrPrQdUsAF7YjbPDkIZXTbwaRn/WXQ5
         5vexvXOanhoPY86qBsuWw8BXzx3xFJLSpxO4ud5Ox17POvWHFQTsy68mzJjvECcMAfhU
         E/CA==
X-Forwarded-Encrypted: i=1; AJvYcCWLOPVPaGSCEWTnbsNNR8jYYBxlFtPBSzG/Ivnu3+UL7JLFuofRfpPo352pg9n6qgaSlXzn9kOSKNnN7hLG@lists.linux.dev
X-Gm-Message-State: AOJu0YyAdsclypQ6rptpPugbKxsFJfc+y/ZNWD+cHUOpD6jRuUfTWhmm
	n4e8CgCIpfMp6F7x2zZzkSXPpWYnlt9UsgCVG7y9i5DTLvcMxZOJ
X-Google-Smtp-Source: AGHT+IHEF4SIOE1ASmVZGbki4EiC4o+CiW9ngWGXnJO5DlPHyFeIAeZ7QQBHSztMRo2kIs3SVYdAuA==
X-Received: by 2002:a17:906:4789:b0:a99:fb75:3ed7 with SMTP id a640c23a62f3a-a9de5ecdff0mr4000776366b.17.1730918039607;
        Wed, 06 Nov 2024 10:33:59 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:59 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 09/16] staging: rtl8723bs: Remove unused function hal_EfusePgPacketWriteHeader
Date: Wed,  6 Nov 2024 19:33:38 +0100
Message-ID: <aade93afb9f2c6babbcc9c55bb35341cb8c9ff3f.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function hal_EfusePgPacketWriteHeader to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ae909bd1366a..155987c417b4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1327,24 +1327,6 @@ static u8 hal_EfusePgPacketWrite2ByteHeader(
 	return true;
 }
 
-static u8 hal_EfusePgPacketWriteHeader(
-	struct adapter *padapter,
-	u8 efuseType,
-	u16 *pAddr,
-	struct pgpkt_struct *pTargetPkt,
-	u8 bPseudoTest
-)
-{
-	u8 bRet = false;
-
-	if (pTargetPkt->offset >= EFUSE_MAX_SECTION_BASE)
-		bRet = hal_EfusePgPacketWrite2ByteHeader(padapter, efuseType, pAddr, pTargetPkt, bPseudoTest);
-	else
-		bRet = hal_EfusePgPacketWrite1ByteHeader(padapter, efuseType, pAddr, pTargetPkt, bPseudoTest);
-
-	return bRet;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
-- 
2.43.0

