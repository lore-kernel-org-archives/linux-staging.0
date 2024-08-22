Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61791CDFBC
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 20:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724358463; cv=none; b=lcinXYkAFaNdXijssHm5ar2ckGxRdsv6z3T5FBsJ9wPiktYtFa4dlHKDqoCgMWzNTOqY9AQh2af7B+vFKW53u1WfJgcLwhEC+ywVrlTt61hAeJ8CjkLX/invODIDT20LrvfhO6ukmpufaql1SAvPUZlNh38WfPOTjIhvbF+Zzp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724358463; c=relaxed/simple;
	bh=NlWmjEwwVR5MvLVg70r+w2JPGdKt1+tmyCU3JeooNaM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=eLj0VDnD43oLuUkWy9q2ErXmBTyQE3yyUAbs7t3Xn0IOc6kBjP/n4D8XGkaiBCHRF/Pj8ZP6hPYTMJFuofqJUM+KF2Arohd8+9VsF3Bs7VDtCmFw4rX5F8xHeuzgJDqBcKVn0Pacoa4Bd/MqmjBSpkAZ2yJKgNIF1dxb+iH+Vrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEihG7x6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEihG7x6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fec34f94abso12289205ad.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724358462; x=1724963262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgwgkNZ9d3tHpVJwTEd5s28ymM0oMDBxmCWJifJQBDE=;
        b=AEihG7x6bQJ/xLuGhwxVNThxadH/qOu5MrPhSHRR4cbgS+Bxi6kPhg8CmIPHsrzKMa
         wecQFXKrMiPFo7sAAg/5gBaQ0HQ7fz6y6C9yjw9V3YFFAvmMz84TTRsU2Hffi/b/02Vf
         3f/aqBkLrKi6xJWndbUnANJ6OpIAaXgXDlI5itOtiAFPLtfHZjWPO0JFiTdnpGb72Jpq
         59l20NCvLaCwRz3cDkL1sZikLg4WFAXxddxgPRYoHvbilmenEMdchySAUmkdVxcLjIYI
         QseXCCfe/9kMb0I2CG+uVpC8HKYQAahOPPQKrrGpHyLoWzKDoarMoTUYFxsaLKJx+KWv
         TQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724358462; x=1724963262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgwgkNZ9d3tHpVJwTEd5s28ymM0oMDBxmCWJifJQBDE=;
        b=BZBIo5EP4zXF6vDf5bkSkym/Hcdu83QqEW9LpFhE3g1Mt/jeH2Co7pHSEF5PhORBLL
         9ZqZGRzJY4Wjrl/3FamvCNjM8HEBSf3Q9/8IjAndgBORGblkwOeaKyWq3VRF4Clp7jAU
         Nrejrgqia3JUyzD9NfegS03sz2v8lUPxyehOnL8cLhDx62mTCRVsB/ryVIuM/0rK+o0A
         POZC24WBl9T5dRzsm9W8UMWTKFnj1Qgf7FiHASy9OnpsIhjslwxnn8pWHRiRmmaN+wcM
         xHvOrLgXiqAXg0sBp9IbRfJf7M4I+vWSU/x6DoH67F09kYcmA99pVOPghB0ghcvnx+VC
         hCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaE8Ocxpbj8Tp7vEgo9NVRnFLeAVy5hl1veVBWyYPb5eHYDRdEa9c0Bbb20I1QuVUED2J7Natx9rve/dBp@lists.linux.dev
X-Gm-Message-State: AOJu0YyG74QklRmSDsV2zwW9oHLCM7Wmu2Qv80PdC628LsWCwOPG8u18
	w/No0/PgPbRtXGhtxXuOZcjfRCpkcJISisUt17cHQ1mLgZ8DVVXp
X-Google-Smtp-Source: AGHT+IGwIWOO2z2t7WSEbE9duhKCigo9Wnt8l3LpFkmzUGbkIUMDEhnXh5dcogc9prwkcJedHyHctA==
X-Received: by 2002:a17:902:da8e:b0:202:18de:b419 with SMTP id d9443c01a7336-20388e27f3fmr36357675ad.63.1724358461787;
        Thu, 22 Aug 2024 13:27:41 -0700 (PDT)
Received: from pop-os.. ([2804:14c:73:8181:f583:fcff:5b66:e4be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fc6c26sm16439105ad.297.2024.08.22.13.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 13:27:41 -0700 (PDT)
From: Ana Carolina Hernandes <anachan.01h@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] Staging: rtl8192e: Fix arguments alignment
Date: Thu, 22 Aug 2024 17:27:27 -0300
Message-Id: <20240822202727.18882-1-anachan.01h@gmail.com>
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
Changes in v2:
- Put the ')' up one line
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 66e3ae25ad47..b25e83743956 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1145,17 +1145,15 @@ static long _rtl92e_signal_scale_mapping(struct r8192_priv *priv, long currsig)
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
-	)
+static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
+				      struct rtllib_rx_stats *pstats,
+				      struct rx_desc  *pdesc,
+				      struct rx_fwinfo   *pdrvinfo,
+				      struct rtllib_rx_stats *precord_stats,
+				      bool bpacket_match_bssid,
+				      bool bpacket_toself,
+				      bool bPacketBeacon,
+				      bool bToSelfBA)
 {
 	struct phy_sts_ofdm_819xpci *pofdm_buf;
 	struct phy_sts_cck_819xpci *pcck_buf;
-- 
2.34.1

