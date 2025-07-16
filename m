Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F14274B30
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688281; cv=none; b=d+jWjlv8p82eBSb7/IO9Xfh5sZ/rwWgjKM15J+o6pKc/VlVzaIES5aPHK4BiWHrek/pWHrdztlh8opIKctnooU6YzStD/1sDYm6EGdaZJbbuSZi+wctZEeW6zTbz20T+TaGBCnEhaXqEEp5Z9Af8UFJQz26iMKMBUZA6Zct+7us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688281; c=relaxed/simple;
	bh=3n0he1TOY/hMrnneqFE6zrRs1wcEKNxj8gew8IQTwjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJFNfg7MZ2sGsInApZ94f/6VYH4zUgVa5wkA0nFqqtEA0X8o14SiEmFz6zdQK7LeGVxCuv+hP9vxLNTNkUKl8isKXaqRkF3S8QEInWj3wue1bJJu/Mr3z88joyoKxyiTpibjXWN/8gCRwsvdGbMpk5oAVMmoev3yLt663tHaqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksCsxhO5; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksCsxhO5"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c14138668so58063a34.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752688278; x=1753293078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM7/i0IVkL+k6rNSO8BRUpCtRJ5xQdNWPRi1dgktv8k=;
        b=ksCsxhO5TjmVfbNLB1bM04VndK5m7xzpwRnwL2KuvmwGXOS1mmjY4164F1Oz3r1VzB
         r8hNrYE639anjzTsuo6U3OC3cJPQzDLqwykaQ8AcANksweYDz5wlWWCNfxR/dAtdy2JX
         jvBwS94YxfsY03NpGn6yOlJU713AsQ/izyOKxiYVtpIdUbWyKthkdFLqXNp7fZigZUu2
         42FVhBSXrJ2j4wxrUEuhj34AhLeTp+fIvAI6E2sWAh+nmHt+AX/DnlsV2C7SZl93n+A+
         c2zO53wnCDKxvgd52RxyOW22DLtdOgGrrSpL9YlBt1/wgrcUJ416k6+a4xEpdRLhehut
         qeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752688278; x=1753293078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM7/i0IVkL+k6rNSO8BRUpCtRJ5xQdNWPRi1dgktv8k=;
        b=q3C76XfHPjlLhOk5NeeXO191bGjjrCmHckIen48WdTkFPodpAiF5DCLpfgRbqdqWOu
         kMOGQ+d8p90jksguVUOv0YWRinr3URi/OcSJGfKPi1rFFNTMwFK3N2Yty7cusPlkxi4y
         UGWFD5DLuZjCys5/iwdA64P6rpqv34tRcO5nVg5fHla415neLZd65Cn8mk9YgjfOwdy2
         qB7mJ29TuzALsrFOVsYFZr4dlfiC2+oocbUwCkYTGTYeUuDUTMjePddQXgWWjbe+T12v
         pi5ziWVjL9fuL/C+OX/AcvcwrpJlP9PNxLOoL6aN73ZTcTymLQRnbmWE8sgshzWYVuBe
         5SvA==
X-Forwarded-Encrypted: i=1; AJvYcCVJgX6d3oAyrzPimeIRJBOHMdcUij5L34wcfCLwjlNlqkByqeU29xUGV3E5csdWr8Ax7Ctqi8MyBSsaDdpr@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2azYp6WRLAtPpE/7k0ndiqzKex1OXd01HLTk7ZoT+ARBSzNDK
	wIFpqsznszxqlqQUwUueCAkOq1JaIdrlwO7ez6N1uRJQlch+okWdRsclQhFPAR8i
X-Gm-Gg: ASbGnctXb3wEod35tO1cXO0m2zxSedHGqJqQPsq1R+ZobBqg4udPBrtTiCV6yg/T1U6
	Uexs9D2bR3PfbXnB8o0XCmoEIJUkAAOVnW88iqUzvcoUuRIsq28tQ1AfBMnKQZ+mwWh+uSVsEF5
	9NJiv/OTtp/QtipJeHYCFIQdY2KyAtaS4EAqL9FrTN7aGfTu/8CIAnysPOdoLLBW9YPB44+mn0N
	VfRswRvCUx9BFwKbafqDCw7LmtXuAcPIxZBXK3LwmEKeTJqGGKnn08VjiV22oOQSzUXY8/pAQay
	1yUFVMaGQ3WbgkL3ArtwuIPIxirPiRjyFzlrr741jzH8rgUMEzVXmZtvg1sW/jF6lFPLgPeaioD
	aB7yrEzay4YIzd275bGIP4O2Fyb1VNKZ8Gtngpwk3s0BS1mWRLQo6K5b5k8FwyX0=
X-Google-Smtp-Source: AGHT+IEnO51Y3W31t/92XWUedRTidLnpCNPMN75W8WkPiwEFoDU24oMdaleFDu9UngnVKIs6ejm9Fg==
X-Received: by 2002:a05:6830:6013:b0:72c:3235:3b97 with SMTP id 46e09a7af769-73e64ad5cf7mr3456391a34.22.1752688277720;
        Wed, 16 Jul 2025 10:51:17 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf10648ccsm3127622a34.13.2025.07.16.10.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:51:17 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove unnecessary commented code in rtl8723b_cmd
Date: Wed, 16 Jul 2025 13:51:13 -0400
Message-Id: <20250716175113.81519-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716175113.81519-1-ignacio.pena87@gmail.com>
References: <20250716175113.81519-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove commented out code that serves no purpose, as suggested by
Greg KH. This includes both single line comments and block comments
that are not providing useful documentation.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v2:
- Remove entire commented blocks instead of just fixing formatting
- Combined comment removal patches as they serve the same purpose

 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index abc123def..def456abc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -78,7 +78,6 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
@@ -433,16 +432,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 		}
 
-/* offload to FW if fw version > v15.10
-		pmlmeext->DrvBcnEarly = 0;
-		pmlmeext->DrvBcnTimeOut =7;
-
-		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
-*/
-
-	}
-
 	FillH2CCmd8723B(padapter, H2C_8723B_SET_PWR_MODE, H2C_PWRMODE_LEN, u1H2CPwrModeParm);
 }
 
-- 
2.39.5
