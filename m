Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAD2066C5
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352187; cv=none; b=ZHx0TzoZIx0crvCoNKy9J9XICYgbMFsZXmQABbj1rTX3wqkocimelDzXnjDPMcoW+00gmal61llM/2fdWXqgXp6sqh4aS1Z7479hCSsQ6qK1HLBlrjI7DjJ5zJKw2Ox8jnGpRXjq6cc9wfB1O3hrEwXrQk5vYJGAoCxT1JKshRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352187; c=relaxed/simple;
	bh=MURvAg/sBedQVDaqiX8ATHeyU/kkbdU1HxDIqzhOcZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnxZP9eGi6+Y6Gt/UIk3bBTfmA7PhsIPT04Zihz0XT+BLq5iWlPGOge4M5QwFP5OvqZIksVaARPP117oU2L1yAfHofHd2I4XFBV5HmQf3GUeALJTMItsYNoSEY2Vt+frQCnTD3cMvo14DpPXLG/bVs8MhuMIAw0t3SFD7ISRh9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwrztJ/Z; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwrztJ/Z"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa48404207so7725042a91.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 01:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352185; x=1739956985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgEO1HivjLZosJKcVciMU/JqLrezg/Bp0TI7/JZ0WxI=;
        b=ZwrztJ/ZM8tgbYj01yMifaHrBpGoqvW173Prqt6p89e0OK40pWD6I2u12ls24eXLz6
         XIppBPFFU7JBxDUeiu8COV47etmC1DIO5WXWJcvCW/Ta2FFpF1zCQMlwZpEj/BjL/IYZ
         npfPKa19cY83PK69osui7QLoWlkz8/oi/MpcpglGy49guhhHH2g1Wiiw5tzIIM65r4Vl
         WPiqzZxhsXbHAH8rd2XvJ7njxHGJETRRfVV8p+wT3g84hc/UwVvHH4PjxMeqBgKxG/3D
         F/xnt/5t5rqC9IxJhekFNAdIgLFBzYZ5lmuJnFpgY/dtgI+RfLpt45S3siCuw6RmQmFo
         x/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352185; x=1739956985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgEO1HivjLZosJKcVciMU/JqLrezg/Bp0TI7/JZ0WxI=;
        b=BpI6f9+10atQYsGkkN5F0Rh/+DOVX3X9sn6BNtMaU3nj55Jo24M1qRhR+TbmAeveel
         nXHYa49EveFOJVlSHjFTNeMQCfkpSErghAl0QwDmBGi2ZQAw0AZ3qT13dN3014DQ/zrn
         jIuvq93G4nhTDs1O13izI13dnFNVmKDtYHXywS3VjB75P2isFn4q53AE0w9Vw37fI8si
         1ducB1hxtAdHVxMhuNYg8+xlO7u2bZL0P0rQDuLDC43He4ZwbD+Bn3wVJ41Jm4Ro2osZ
         S8NJ2O/j9xqEJ7SMij4dHgfr/rcV/0FfGW3XWcFONSk08z/HoZOMBuyV/dJ5w7Tt7gXy
         DvVQ==
X-Gm-Message-State: AOJu0YzfgdGsUH/K+8nu/8R7fLEAnn5bROKNSzu8KXR/7nA6+xb8VCuC
	Pa+a90hamx//rUNOYqsLmDOwnLXNcecf5s9xUj0SWkH02c8SZpXEkRHexzVN
X-Gm-Gg: ASbGncu1/OvsfK3yoBEH8UdL/weLEiHuumjn+3hFsNiBTspVSH5J4j73Eil4OEAPCmx
	5lNf19//+EWt1XlwDcspRo+sQ1Si3s0L7esl5zdtPudRFZ0H1CqBiev+/QZ3Te7dsDhg2aBtOZg
	r22lHKQ7SNqynDaD8A5hJKneQ5CLc/y7S5+Tnp3PxxVH2c+ittkMW6w3oPygqr+TRMcmxnb4E2l
	Vd+Spy4emNEm/4cR80jkRatynGyL+tV/lGqR7x3wve2OE2BOCCpNvBWRwVzSQ49Zrc+vdO/iU4g
	yfW8z5WtQTlJGiBMRr9kO/EcHLwzoPLzWo9B2wCoT1rBQQWiKPfNxntJ+0FB7RSXaf7WH0PiYbg
	L
X-Google-Smtp-Source: AGHT+IG1ahvxK+oTK9DbeXMioV1blXV5WcLhl8ADWWvqnSEDFUqzJnKABHHxbLg8LD/6rx9betQF9w==
X-Received: by 2002:a17:90b:2742:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-2fbf5c6ac92mr4543043a91.33.1739352184850;
        Wed, 12 Feb 2025 01:23:04 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f9b80sm998177a91.38.2025.02.12.01.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:23:04 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: remove extra blank lines
Date: Wed, 12 Feb 2025 01:22:56 -0800
Message-ID: <78f3702e2810424d12785f64334127a0f3cd82ef.1739351267.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1739351267.git.onlyian4981@gmail.com>
References: <cover.1739351267.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Repeated blank lines were present and removed. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index e8f583206f92..18f640d48701 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -123,7 +123,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
-
 	}
 }
 
@@ -219,10 +218,8 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 	secmicclear(pmicdata);
 }
 
-
 void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code, u8 pri)
 {
-
 	struct mic_data	micdata;
 	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
 
@@ -245,7 +242,6 @@ void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_cod
 	}
 	rtw_secmicappend(&micdata, &priority[0], 4);
 
-
 	rtw_secmicappend(&micdata, data, data_len);
 
 	rtw_secgetmic(&micdata, mic_code);
@@ -305,7 +301,6 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
 	 0x82C3, 0x29B0, 0x5A77, 0x1E11, 0x7BCB, 0xA8FC, 0x6DD6, 0x2C3A,
 	},
 
-
 	{  /* second half of table is unsigned char-reversed version of first! */
 	 0xA5C6, 0x84F8, 0x99EE, 0x8DF6, 0x0DFF, 0xBDD6, 0xB1DE, 0x5491,
 	 0x5060, 0x0302, 0xA9CE, 0x7D56, 0x19E7, 0x62B5, 0xE64D, 0x9AEC,
@@ -480,7 +475,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _TKIP_) {
-
 		{
 			if (is_multicast_ether_addr(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
@@ -525,7 +519,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 {																	/*  exclude ICV */
@@ -627,11 +620,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	return res;
 }
 
-
 /* 3			=====AES related ===== */
 
-
-
 #define MAX_MSG_SIZE	2048
 
 /*****************************/
@@ -664,7 +654,6 @@ static void construct_ctr_preload(u8 *ctr_preload,
 
 static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext);
 
-
 /****************************************/
 /* aes128k128d()                        */
 /* Performs a 128 bit AES encrypt with  */
-- 
2.45.3

