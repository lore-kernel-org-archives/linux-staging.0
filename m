Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A2257AF4
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953021; cv=none; b=vFgoy/LI4G9J4R3tmAPbMETk03t5OjiEky5ZI02Fx6m5wKQkD6sYSvTouc26S3DBuCjv4IYuQODZiIvTjWWHOM/VZnMbWRv2adpPEX3kdEMUtJKctHGELIoTUpyDgBH0il8iKW+alpNabSsBCjFyKPwgzQNALdIxJFgFPLI3SMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953021; c=relaxed/simple;
	bh=Q0yzuR/i79OwBtVvMq1n9QC1kcnPbq976kLG8+CKJv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nz8aHmrG3zmpAVKUNhM7hhnfLAcadfBSz21dvPis6HTvA3fOLwdd8fTtLw2ZAqdJOb458VhZjZshmwafrn/mtYCMbEOQlfsnjd5kZQwwQ69rYMblm4ADCmAFSI99+33qJtbSLZG7h46PMuMLe+Uw3EAwdVj8C9AMZs9P3EWil9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYH32F5g; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYH32F5g"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78c66dcso425470066b.1
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953018; x=1756557818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB9qSruL7ILHa9+FTZbiJBxaeqZc7/PdYKJSFKSL6Vc=;
        b=bYH32F5gavzPuCOXrASlyJfy6tx4S1I9RZDUreJNc+ZKgBKV+iAqejdd+Tef9rKmaU
         D6/hzmUa/sZjGmcbuJ4gZ2muYb6sMUa29IibRITBGqI9oD4iOeWEMrw130lGUWp1FdDP
         CHCs0Z84yjq6/sbqBUDz8iAoJ1FOLe+U3gcNef3CSPAlCjYxkdHuIpgdljN6UPfOUnB5
         cEgDFg9v9TSrk0LuovJ0JNdb/aSAqTHCo2hHaZVj+X1TZ7YpLBdn1virs3rSAxaGckNU
         dBh2XLH+kOXRdStXs8KosrzBavz3vFM6WHQ+Yk6xW6OEXsiSV+HTZf9N3Zid/gTPO6OL
         SRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953018; x=1756557818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zB9qSruL7ILHa9+FTZbiJBxaeqZc7/PdYKJSFKSL6Vc=;
        b=GNhPIIrRth5j20PXpyC0qWVhT/vICyYor6uZ33yZ/AWBPMgeZvttOV7O+XuADs2gDj
         BqAQO6dIYIqT4XrWAUe4xoXhaHgsYMC1+M0vqLt7WCTMflS5p9PscbXfJp3us/16jmj+
         1nwnk+yQMU4DSzZhfYFehZ1TJqModV5a4evCH63tVcAJtyXmOxLrvvIw22SuU47hELrX
         I+XG7QThhBRi3ITrckWaxTPe+/IhYz+BuNdGESgAsrTM2bkQRIIkbsTeVgt7fmnzIEsM
         ai7iXKo5aXLjl0Nqw3ja5eOg/kMf7e1+9HBGocFjwmzSSfeinwGT37qQg0Ix/AXlkt22
         xJIA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMgytpqQ44WqeIC64HTOD+K/4pW8SPPK7aqnHSw3CedLoLilIE74wM9vuknARByr4YfLd6e6b164CL9vT@lists.linux.dev
X-Gm-Message-State: AOJu0YzbDtBr77/m+ORqUdzFT19mbPKIZh3LNXiYhEQtE7ojmTU5gqCh
	0pySzt0n3o9ZtTdnIyB56TMKeZxIhzicXiBi1BTDg+eK1V6DB09TxMGIAncNeA==
X-Gm-Gg: ASbGncubpoGjeCMdpKm7QcFk/0IyZ7sA9hOFIkprE9YMDJgaoFvWolJaEuMd0BMnGC8
	dR9Pdnh8TTOMIVwszxNZWbi3GJhb+jaisRCIG7JCUjpmXxh8fBYf2Xu2Fn1fT53Nccruk2nVaTi
	5LppYqabGWOI1Vu7X0bZQEKPw0aN2dkwGRBHCAZl7bZG9fhq80EMHhkotwN5KLd8gMjUniu+UbW
	+NigixNQl9XYlAfEoYzXkbETaPWLiCu5mMBpbbJoWs7b9k0LjWSDRpvEBgkaviLM/5cflmrQYd0
	KzRit5HLeObyBQKEwhSzsk500JebEIFJ76WO4pba2uzq/Xj922BDzFdqf4Kd4+nfl41sfevD5rW
	DJtqf5R0vkc724l2fVY4spounOA==
X-Google-Smtp-Source: AGHT+IFutx0nnw0Arhk2mibJLHYoSwyZEPHjy/OfHDEcHOJcV10CoLPaHLuGQ9DC4/TRQUtPY3vQXQ==
X-Received: by 2002:a17:907:7f89:b0:adf:7740:9284 with SMTP id a640c23a62f3a-afe294ce4cfmr600917066b.57.1755953017904;
        Sat, 23 Aug 2025 05:43:37 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/14] staging: rtl8723bs: make Efuse_ReadAllMap static
Date: Sat, 23 Aug 2025 14:43:09 +0200
Message-ID: <20250823124321.485910-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the function Efuse_ReadAllMap static and remove its unnecessary
forawrd declaration.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index d28298fa2853..2c0dc55fb20e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -303,13 +303,7 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
  * 11/11/2008	MHC		Create Version 0.
  *
  */
-void
-Efuse_ReadAllMap(
-	struct adapter *padapter,
-	u8 efuseType,
-	u8 *Efuse,
-	bool		bPseudoTest);
-void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bPseudoTest)
+static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bPseudoTest)
 {
 	u16 mapLen = 0;
 
-- 
2.51.0

