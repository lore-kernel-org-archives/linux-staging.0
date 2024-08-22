Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57F8F5A
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286650; cv=none; b=AJ72grh1VYkMs0Vxf1UYtqnqbr1LydUx5U+pUQw1IAzqAbq2bheqPLiustf6J4Op9uEbpZiCOumnbebFRfv6kAoHoQg3Cr9wFw3QoSyKLcPheqR+8sccB2sw0wmg6eOLDxfjQ2FlIHO6KdIX0fyDwfEJofvsIOSz1q14KCFStd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286650; c=relaxed/simple;
	bh=J2aU8g4qe+Y8rcEvppQfTwSMn9pHuBRHOVLNGDgiMVY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=XY7jXCKUPBnYl6Dki8O+/hRaaID+bqRQiN/E1bNeUrpmAQVeI12ivKeRibGGBtaXh5ngxLQyKlHsDZ4CbAtO1/njW62Kr/AL6HSwd6M/vubQrAsdQU/7oJilWnk1T63BTZefj89gi5kKbqqaJjTvsK1PlweH68tsPM0H192cF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtlQVHq7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtlQVHq7"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7142448aaf9so171897b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286649; x=1724891449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/LT23mWzcaHjSiEDWUHOQC5zE07WXnQU2xjGHMC0HRU=;
        b=KtlQVHq7hk/E+l2IN1XymqLp4auEDyf2kcC620qf7PmBrOXHeqH9PhjkrMHTM8aw+W
         pk8IjyaAot3rPWmZZ5extbYx2QA4rYCEg7igEG+S5B8IF96nd2iK/S9gTBdxg9ec/Wfg
         UGqKc6QKinDGSJRsSGuB02is/zsK5sZK5ArX+m8QGn2pF7aAFSvfMIq7xF2Tm/1xPpM1
         XN9PWGPtop8ix92VTWmMK7jC0d3U+0bPjg/6ieqljct/54u8IqcTTewUlg7fJrbXQDzX
         kQEK3Bfd+QcBVqmhs74h5QG+B8U1Yb4a9d6rBC49/LUtC8tnYO6tyISQQkYpbtQDlUZ7
         CBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286649; x=1724891449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LT23mWzcaHjSiEDWUHOQC5zE07WXnQU2xjGHMC0HRU=;
        b=vg6jmAHEx/+9cGJVZhN3RxnyXMcAmBn10WKRnPfJ861IERJo09tBADjfCSg2glRJ51
         ParnAw6DUvWfkNzgYtwgvlIX4nSkQG0AmVFZa2h2FOT21ZnalnLPwNukvr/8vqSIrlBK
         F38GeCsfRSdjBqecd02/ZpVGP1kunD81VVo1cizUFSPkQyZblPE8HN5X5Qn/0px/co+4
         4mAfU2jx9fDsDdh8DBsSMtUOqcJ2jWhfeZznGb9VO5pZ8YFXbQo5DLtZcslTENtaprqo
         KQufX6MHiqG5c8OX0OXlqMBaQ2BnWp5Ed5TpurZRM4QceSVttVYKfs9gxa7kEAaaf9y4
         mT+A==
X-Forwarded-Encrypted: i=1; AJvYcCXcqapzQAh+edD77aFd7QuEZzLk2+XApe1GekhKXAcqbhF5oacnMUcNxA/Plpj/bJMR0MIRl+MZm/O7v69x@lists.linux.dev
X-Gm-Message-State: AOJu0YxLbjHEanfDRfgjueFKyBm9DHtZCfKm4tMgg7uRCS6HcdoYsuOR
	mNJXCNwoZAVGqj5o5WmI8592vqCy+UaeVGej8eEnTwqYsjKwuQY3
X-Google-Smtp-Source: AGHT+IEQ2Qasb8z2Lvx5Ov1q/Xl81hwXcRxGm9tO2DIEZqdxrFVhn38SOO+Vka+SA7ZbcTfKVuZ9qg==
X-Received: by 2002:aa7:8244:0:b0:710:d294:a2b with SMTP id d2e1a72fcca58-7143176773amr1714120b3a.8.1724286648640;
        Wed, 21 Aug 2024 17:30:48 -0700 (PDT)
Received: from pop-os.. ([2804:14c:73:8181:6ea7:64ff:ab31:e15d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143424a05esm240318b3a.48.2024.08.21.17.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:30:48 -0700 (PDT)
From: Ana Carolina Hernandes <anachan.01h@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] Staging: rtl8192e: Fix arguments alignment
Date: Wed, 21 Aug 2024 21:30:43 -0300
Message-Id: <20240822003043.10865-1-anachan.01h@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the alignment of arguments in function _rtl92e_query_rxphystatus in
order to silence the following checkpatch warning:

CHECK: Lines should not end with a '('

Signed-off-by: Ana Carolina Hernandes <anachan.01h@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..bca6e4f57bf2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1145,16 +1145,15 @@ static long _rtl92e_signal_scale_mapping(struct r8192_priv *priv, long currsig)
 			_pdrvinfo->RxRate == DESC90_RATE11M) &&\
 			!_pdrvinfo->RxHT)
 
-static void _rtl92e_query_rxphystatus(
-	struct r8192_priv *priv,
-	struct rtllib_rx_stats *pstats,
-	struct rx_desc  *pdesc,
-	struct rx_fwinfo   *pdrvinfo,
-	struct rtllib_rx_stats *precord_stats,
-	bool bpacket_match_bssid,
-	bool bpacket_toself,
-	bool bPacketBeacon,
-	bool bToSelfBA
+static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
+				      struct rtllib_rx_stats *pstats,
+				      struct rx_desc  *pdesc,
+				      struct rx_fwinfo   *pdrvinfo,
+				      struct rtllib_rx_stats *precord_stats,
+				      bool bpacket_match_bssid,
+				      bool bpacket_toself,
+				      bool bPacketBeacon,
+				      bool bToSelfBA
 	)
 {
 	struct phy_sts_ofdm_819xpci *pofdm_buf;
-- 
2.34.1

