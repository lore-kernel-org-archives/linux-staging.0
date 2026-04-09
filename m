Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13ED18AE3
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 05:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711103; cv=none; b=gsqepPsvUjAMP94Cn4tDVTt1/FaeVsDQttpgCESDQNsWkCGav/Y+tuAVaKzFCERldAX08g2KA94eNjzPJlhB2J5unhgXFQkvImDO03cRRbngDePEM8ituZRIYtmdnr/PcO1gkwSznYWbED5VLOaaWH6x1JmtzdQV81a2RLW57bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711103; c=relaxed/simple;
	bh=mQzK9jcZz828yrR4TkUosfzwRW+IuxNhui1V13o9NnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbpqUmKmx0+DCqc+stFBhQHfggiGl7EeuSj7LTWs+dOWJr/cuZKnV0ocHvvYA3pitAt1Kjae19oXBQAJqa3348Bz0xzNdopNHv5MAF6QU3FhlADHNrEf3UzUMExwkcG03qZRvQzJbRYoUvbRj7joqp8WsUV+9EzPAkiPnmB8zBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLWHUhoV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLWHUhoV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so2790875ad.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711102; x=1776315902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4btcIHGygDjuRmL9zvSKQuZ0W6zk7fWotRKDDiRyMFo=;
        b=KLWHUhoV8am8+PSwrWfJR41O/60jMjS+Y7CkWuS3akl+PBH01e131p/ATIULdjcFIo
         Jv7B3kJsAonmKpck8Brlz023/0PusMZ6Y3/pmFvGS43faBobbIiIvtEFBlxOJOIOxrPk
         TKv3Jb11wHOry7ofAjgYlTHITVBUS5dlChoQv5CHGELDLqk4VpFtMWZ3ijGBrB2O3k7P
         EEmr5xJ1Zg/oCXbiegktfy/1201W/IGJA0Jgxl4hAHVWjLXhOgClAUvZ/xbg8JKS5eTC
         Ut2br+4CF45TPJ0EudzDew/BPiSZvoqWSxI3tKO+LS6ey++wWhHWQprPH5ai1Jwg7mWx
         q9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711102; x=1776315902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4btcIHGygDjuRmL9zvSKQuZ0W6zk7fWotRKDDiRyMFo=;
        b=ej2FKk6td/l6TNbUS/WNQYtq2FEDF8Ku3KzbQ933gNUHvhsKGVRjzmL1P7Wma8ugrP
         +wVtVJliQ/LNmv4PlHoI4O6385GwOlSYPHSEq/yDcQ4eKifEj/gT5g3f2B4v5i5OyTRS
         8/0X9v08pyya7SocJwAb9MGFWaj4muhtFkFAeeKmWcy1FOMOsHi+OT1Tooc3oWtLvD2S
         YmWiThSkcBXrupCRzX7aW2grh4ShB1acLbfyxQzjhz0iEPGfeQftSl+d2WSNBNkbuyx2
         dpALhvL8FySKQZ/iSzYnAQ2nd6bf+L9fkEc1e6PujxgfUG3iS5LKAnfXP3MGxGdNH1OG
         k+iw==
X-Gm-Message-State: AOJu0Yz9+0tF26gHHvhzrVY0hdwGvtjHVI93ro+o0/68hywL2UBqm7pP
	aJamoSjTgG3hVBav3tl9uF4ynZQmdPerO3DQUaB9UbyEhWZq/Dbyv3ef
X-Gm-Gg: AeBDietXVkigYPfk6aGoHQFzNlQuuY3n0vbm1BDkqLVgc/UScTdEWlvOHPWjyqSfb15
	dHJM1blut/m/FxAmzJeOFvnEuuaiDjwiS5JtSok9yZAXiF33vws3KRDoGl56rI7TI2tdf9v+BaU
	NAgvmIxbjt/iFbzeAVL8lEJ7VJgTIfnDR4baPjdCI1fw4nO4lrT5xoyYUXnj6op9LYeIygfM9Cq
	s990PHsKBj31EeFmo7e+W7WPvWpIt9lHfihsCE3dwsRkRYQMoelvDsEXQ4ep2zqmKX1f1OEQy1U
	QaGZDobftnwMTm67J3enVvs4jg1GJcAGufRF4WYgxVtGsYWATUD5bPM4UTWN5wHPaza8va2Lr9Q
	cP+P9tO9jtKr8GuzTo0HLf/4DLBwO3P9Ej091SoHeUebtuIRwRuV0F47Frivx+W8dIqimH7R8VY
	qBPcQ5yPKsFJu5PXCPTgI9mvwfoQzc6IWV0YkiGc2plxmfbftzCy9Zzcp7nyfU3D7j
X-Received: by 2002:a17:903:3848:b0:2b2:9a84:e870 with SMTP id d9443c01a7336-2b2c72d51d9mr18853365ad.8.1775711102149;
        Wed, 08 Apr 2026 22:05:02 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b27472d233sm229004565ad.2.2026.04.08.22.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 22:05:01 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove space after type cast
Date: Thu,  9 Apr 2026 14:04:50 +0900
Message-ID: <20260409050452.97774-3-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409050452.97774-1-osjin83@gmail.com>
References: <20260409050452.97774-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Remove the unnecessary space between a type cast and the variable as
reported by checkpatch.pl. This improves code consistency and conforms
to the Linux kernel coding style.

Signed-off-by: Jinemon Tama <osjin83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index cfa00775341b..01e1595fb46f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -531,7 +531,7 @@ u8 PHY_GetTxPowerIndex(
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	s8 txPower = 0, powerDiffByRate = 0, limit = 0;
 
-	txPower = (s8) PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
+	txPower = (s8)PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
 	powerDiffByRate = PHY_GetTxPowerByRate(padapter, RF_PATH_A, Rate);
 
 	limit = phy_get_tx_pwr_lmt(
@@ -551,7 +551,7 @@ u8 PHY_GetTxPowerIndex(
 	if (txPower > MAX_POWER_INDEX)
 		txPower = MAX_POWER_INDEX;
 
-	return (u8) txPower;
+	return (u8)txPower;
 }
 
 void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)
-- 
2.53.0

