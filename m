Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6613DDAA
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770556560; cv=none; b=C4JVTlkJX9lVAwNk6pEA3dZQMO9LGoxqjTCGSQsBU1DXncqv9HmITAzJv6fTa4GG8FyzP6oGYnOVROoim+hfQVFqNwkkbzzbq2mF8ZbzljwNH0LVhB0Pq1p5VLkxzuIWuOfhhfYWfpYmwEXTYDgOuAQLYAvk9tSfXiev+vfSJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770556560; c=relaxed/simple;
	bh=FxYMLm+8K3noV6nalOrCXFSC2lruvvFKp/Q9N2Y2Bgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcjGIOWxt6HOqIDPorS2WPLBr9FuKyFIha7bLwpp9T2szcmG1Icx+yrYcXlXXwomgL5Q6EyDB4PKi7K06nN4ZeVjwhcQ31+VtaeuYxKMNZzvfh+JOuMUpEEDAjSgRP7uXZ30ERWph+5/xlmlbXB9ZSvdG43Y1UpmvrWACCenEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEVJomD6; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEVJomD6"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so42333635e9.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770556559; x=1771161359; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADZN83J/wIRICPZeoKhUQcQTF1rjTsyhO+bg/vR3iP4=;
        b=JEVJomD6fIb2WE/CjR/ZVTcFTRkoVw5oYI2KOVlw2b5BucsPiZs676YgFU/fMqDoyk
         o9NPdlASvtVtTXQ+nXbyYGRD5peVrBrZAu+AtxZz5dclzm6gx3yInP6hTFkooxJp1ow6
         b6wiSk8nzRfRijSjYASdwkqbDcx6v3hJvklz+ICELY0VGOKxqHwOEcbCYZ31dIOopm/X
         TsBfQ10mALZRdlfkyIqs+1Q5eWiRksNKuJ/iiPjO9oTJYWITEtqv2MBxHhzmlgbZYovd
         vchSbur3qP/DbMCbnXOkO7M5ZCodtAt2fP9ZPU1d67ICMG7zsIENocvX/POwz5BsLfeu
         A2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770556559; x=1771161359;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADZN83J/wIRICPZeoKhUQcQTF1rjTsyhO+bg/vR3iP4=;
        b=Ek9OhGxuO7h0TtkbYGWiF9KSL2jzN9rK1LmQPjCu2xMeMOzfz4PfJ5kyUP81M1qf6S
         LTcn133va5phm3xQ4swRW18mXKqGuEmo3DZ7uiIsaAfMqwh4OIARvuT8xqWxzdT17PBe
         5tOyRUKXTr0walp88LFkaVbiGoKoqpruPUi/RXYi5ae4zGH70IVGpLeckdF7y4osRuPa
         ZXW5mJmFQL0FRQNeawuwpuwb9uh6UIRM69bdxHwZ+jsO/DGZEf3Vt0OYwP25wLpx0+7X
         LZNM6VwDiu2F+gL64QLaw+De5TDnKagvnKKhgqvhpUzd66O8YQVRnt+eMcVrI9CWBUk/
         twqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUijXdTutjzNrWAcptdMCcJp6a8c1DAo6nWLHmtuUp2/PKcfRBpivl2DRFy/O3qaFoXNQYMXwc5xiD5pIgA@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9COFiSnwltZwMFuI6i7vpMeWgBkhNLOk0SyDC3LCQ5Sjh6UGl
	JAwoXCvcAezsfCoXnKX/AmG5mPSUJroEiFIeFefYN68ynrN1L4eOOTYA
X-Gm-Gg: AZuq6aK/IUipCg2a2xD+kT2lWgOIAp4wFUJcwrjwLRAxtvTlapfiStSzILc9wwnuEXo
	EubsI3P6ZAv2XuBZSbT10OntJLeXu4mhU6yYCRUSygsNPO/FRFbt1Ft1NOcf+k5x0X+B0uOlPxP
	HdKZKZwDq4jJAfCwmfRcvur/fA1tGYGg687JpHtLC0Fj/4U1Y00R6HzlZNKMSQAUAlXyVcU3hfW
	tg8B6v63ZycrP481moEwaiM9ADxDe4oEyKq8o/y5pnr3RUMO8o0HCjpBjzeqbWYLH7S1CRUog1Y
	T047D+bP+xUphJfZFvFBbRr2CDQDWc5DzK+CLFtMjgsgPxtVLjkgres9POyF8Gm/qxbqRbzY06/
	3ppG5cS9jvjINA8+rph2eTQxsr2V6/UkW3FlVq7a7DI/Pe3gqODq8RJlbPHZ1cm3BDe5yQORdLg
	==
X-Received: by 2002:a05:600c:19c7:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483201dd0afmr110425285e9.5.1770556558156;
        Sun, 08 Feb 2026 05:15:58 -0800 (PST)
Received: from BERA ([31.223.74.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm2502319f8f.14.2026.02.08.05.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 05:15:57 -0800 (PST)
Date: Sun, 8 Feb 2026 16:15:55 +0300
From: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: refactor
 halbtc8723b1ant_CoexTableWithType() to remove duplication
Message-ID: <aYiMi-X5r4aUEC32@BERA.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Replace the verbose switch-case block with a constant 2D array lookup.
This makes the function much more concise and easier to read without
changing the underlying behavior.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 55 +++++--------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3d7f50fac4c..d3c7a4b32ff5 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -684,52 +684,23 @@ static void halbtc8723b1ant_CoexTableWithType(
 	struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
 )
 {
+	static const u32 table[8][2] = {
+		{0x55555555, 0x55555555},
+		{0x55555555, 0x5a5a5a5a},
+		{0x5a5a5a5a, 0x5a5a5a5a},
+		{0xaaaa5555, 0xaaaa5a5a},
+		{0x55555555, 0xaaaa5a5a},
+		{0x5a5a5a5a, 0xaaaa5a5a},
+		{0x55555555, 0xaaaaaaaa},
+		{0xaaaaaaaa, 0xaaaaaaaa}
+	};
+
 	pCoexSta->nCoexTableType = type;
 
-	switch (type) {
-	case 0:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0x55555555, 0xffffff, 0x3
-		);
-		break;
-	case 1:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0x5a5a5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 2:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 3:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0xaaaa5555, 0xaaaa5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 4:
+	if (-1 < type && type < 8)
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0xaaaa5a5a, 0xffffff, 0x3
+			pBtCoexist, bForceExec, table[type][0], table[type][1], 0xffffff, 0x3
 		);
-		break;
-	case 5:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x5a5a5a5a, 0xaaaa5a5a, 0xffffff, 0x3
-		);
-		break;
-	case 6:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0xaaaaaaaa, 0xffffff, 0x3
-		);
-		break;
-	case 7:
-		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffffff, 0x3
-		);
-		break;
-	default:
-		break;
-	}
 }
 
 static void halbtc8723b1ant_SetFwIgnoreWlanAct(
-- 
2.43.0

