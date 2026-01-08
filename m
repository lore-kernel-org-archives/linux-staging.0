Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B2198E91
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767831997; cv=none; b=RCe6I+MYA2/fhIzNomRoBB7tAuSKlnM0KikM+nmCTPBej9Ku8M5yxXysoZq6LkgGFGBuVs3PEAnHUaSBnDPyDkwXO1wVPmdpMKwIjH3kJP9ElFsJtXcHtcWealaqRMsAuKP21SYQvdw5NKvDpY22J7kIZqmJhMPfyy1FeMWBdVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767831997; c=relaxed/simple;
	bh=5I8x6k9naiCcq/TtdgjIF9L/ZIOw9mAMEpsGy2fznlw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=NOAfQ+HmdYXCYIs3R7MGzqOJEqwF6emOgy23VnLsDUaMPlQflraaNbnqtSDtHJKRvlg7Q9Y0C7mPvlyTlI+GtB7kiyP/meJ/Y63BFedT4GfdfGn5MNpjkRWHhcpck2WTZyzBjjiLDpMrDLIqzcFfy500rpwCouNH38kndmq1/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBdUQgaQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBdUQgaQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1970677b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 16:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767831996; x=1768436796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2hag6AFo0NyxsHKV+9jW9zDgYyYoB43NRZQyiBd3w8=;
        b=QBdUQgaQexkXy8ztPl3QD2lytL17GmnH4aTU+ddCtSZWVLK7PDTszdV9sw0FSitlhe
         89VgWNorhY3YUFNmq801iEolJq2SQL/NYCkpNzaDKm9aEjVCn07pILM1/OBrIn53ON2U
         RXChjdNTw+iPllO1rAM027Ehdo9hhmi4NpEBEf1sNNPiYMHNwB9WnacJ432AW5lmx0JR
         dBgey4cb3z4D8+NuXhbrE/llVyvWL8Kx1u0KogCBjAUTQgsdAlBQB6x4QUsGwBh197ZE
         fDQDRBTXdMJqwN9pPBP4nZo9EvsKg2v9+nm4cyNA8Vk7iVclcpDbPAb79SNEmmqm/g/p
         BETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767831996; x=1768436796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2hag6AFo0NyxsHKV+9jW9zDgYyYoB43NRZQyiBd3w8=;
        b=Y3glcWdYyxJS3dzKCheK/r3RUceaF8GIOKCpsmB/Z0DnW7quwnClCiS+1og1sF2/iW
         ejfMNeGyFVBmVUFsZac0lwXKGyrxd/VC7ediX+mOzluHePEMeAUkDEDp5dTaqHBubu1R
         a757OXn0GW4Uf750CAL2p8XbM/lHhBEQuYRF5G68WK5sBtk4iKThFydh9es2F13445+c
         uMCl7RfPa9I4wE9jmy/nMMDwVKlj7p2VT5OSh0SQVlqmHhQUhGnjKwsCFBx+DHG4yaJD
         WbqV4C3Wc8saHxXi+NQsPIVzh6JLfK8GJV47rsmy6CKAEGSPvSXaPxedXqMW4CEosRwN
         9zvg==
X-Forwarded-Encrypted: i=1; AJvYcCVqKz3LY7Xe8vlDMefJLBTFvY8yKP9Soqo0Ph7esYO4SFVH2f87pNyAwI+CDDgnY/WouYS0Dca1yMWanY9t@lists.linux.dev
X-Gm-Message-State: AOJu0YyWMX2tsfs2kp6jDaP3+oxDMdhAxZZbKXzHLAo73N+OfpT3hspT
	U3k2UxvX73GHssRccCN13gpzQFo4lnrHPdbvLV2Q5Q77EKVkfkmorG6/
X-Gm-Gg: AY/fxX4xsOLPAGnoQoFIXN0eaJ70AjDgyRgmaVzaHN4jBeYRdGriBvmKE0KpNxjtcso
	e48aSndFdhSplqVWmOXO+0uIfMqjIOq/tAnRskbXZzyFdybL6kBwS8xjnpRzuD1XnPRpCOUIkWX
	qSTiU+5DfV1n3/WZNRvW3dACT/I/MEZwniM6xTwYyQwqIuCTvw/wPkAXT7WbJ7fm5FeAtZw+Bxa
	dIBY9Myrl7PAOw5MmqMoXFX/fm9GYxmV91zKGGTG/E3k4dNsO8eau7hGpj3eosMxfJxsQdg1l3V
	JdEhnm+OEXmbj3lnJaAl3uhzznPhNIDzLKi53ehnDnELdWKo2wFYUxWalLOq1X0dCwr/NWXMD2p
	BoCT84U8KnBFY+IZnCezqIaxWB87QirSG4EQSjpF+6JzSxjKcXKDslpJCAR4qL/4WZyBmjSN83M
	0hu1tuTLVeZED55Bd2XLHZ+1j8LHy7zva72DLVocvgbhgNUsCmPgDc6ulTl1ALkfGksJfLSVac2
	DmhYOuGtB0=
X-Google-Smtp-Source: AGHT+IECQtLRN8bD1wcaiFD3K4tEL0/AugQ2iV6gW1feaN66k1DO4JBxOJWrNwtxcl4fqHqDFiX0Yw==
X-Received: by 2002:a05:6a20:1583:b0:364:14f3:c536 with SMTP id adf61e73a8af0-3898f8f3b25mr4372228637.7.1767831995769;
        Wed, 07 Jan 2026 16:26:35 -0800 (PST)
Received: from Win10-6700K.localdomain (softbank060114050097.bbtec.net. [60.114.50.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc9e7e8afsm6152946a12.29.2026.01.07.16.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 16:26:35 -0800 (PST)
From: Daisuke Iwasa <iwadjp@gmail.com>
To: gregkh@linuxfoundation.org,
	iwadjp@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace in rtw_mlme.c
Date: Thu,  8 Jan 2026 09:26:28 +0900
Message-Id: <20260108002629.25984-1-iwadjp@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error: TRAILING_WHITESPACE.

Signed-off-by: Daisuke Iwasa <iwadjp@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ff4e668f199c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.34.1

