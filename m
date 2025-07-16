Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A879EC2
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665897; cv=none; b=EBr8LL2tHbkCKt3BcxwgwJHXTmCvausy3O6N5hOkWW31eYSXak6TAsKOevg/FFTNMccilKEpiPmG+XmBbW/KsDUulb9nD8IN6+rkhh5fw+GEn4U82e8gUHyWhaHE6zBmxtkzyQlAR0ghGu++grBktleaPh/tO8ThsPc3b3pkL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665897; c=relaxed/simple;
	bh=30Bja2rHFYT6qRP13VWLwROwVlgipqsukeuTxKU6rK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IK8A7xXCqbTs07D74+fDYHkOKUNa9O/NT+JKSESjQFHMRenNKUUl/35P7R50Ek3A8yUtlOI3AxkvQLGw2Rn6uzu9zHH6eYv7jw/pD56REMa0Kq4cPfq9tjDu0QJVbrqcwQYqFTxkYrgpF68gCnTH6gUWP5Ba+BYBIKSwzuS/iAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdvDT0Zi; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdvDT0Zi"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2efbbf5a754so3868792fac.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665894; x=1753270694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmzijtn7Q7pEMnH9ui6AfH1YFAubb7T4SBq8jmpOh1w=;
        b=cdvDT0ZiY1mO0D7PWlvqbcqRWGMK0/Oao7w6LJqDS9LZG8j23izIc9jsQVlzhw3PDs
         FwESbXlrspwa0aBl9a5kxEu+yJ5NsmhW7+0pdH1k580TjRj/InZ/BzDb2rHBLylCqszx
         siirH/MbruAVgNqvQHn3fE36mSNcq2kUGB10TgaNz+MlpFTqKQsOFkIGX4wJwFELh7th
         89Kuy7au2ghhxDjEIuFhE0RoHgswW/bE71AsaQ5UXMI8iEa4eFkubZ9Um5t15dDne08a
         CaIlCLU58+wLEozDY3T1zXcjiXqY3F4EbTRfDh/pEIsmr+WJjFIQEuENJY944uPKK6Bb
         Fe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665894; x=1753270694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmzijtn7Q7pEMnH9ui6AfH1YFAubb7T4SBq8jmpOh1w=;
        b=X2nIQtmiqpmWQ3YGpJYm6ouZfF4vUDtucEoLc8Xl8CrmHjpLvZCo202TO7PM5MdnSJ
         H9HTNIaFF63ImypXrnjSNUGla0NpU/IPVotVxg4228HE0+JVsUVxlBaUVWQvECJP41OV
         CQk8ZavUyu6d2wbcA560k2KLQNE7aPQoP1CBTbaZh8lWXgk0ZvR1H4HRL3I4DeauFU4b
         HFz1WQfvdZowba2Q3b5d2GCHZ2VX8EBMSFuniGyMTY1AhvkEdlqpv7pM1oLo/ZR0LFow
         FaM4kEP9Qimlb/wgPDrAL7G1WdgNxCAbS6YnSwX9UMVuNL18Gc4KNODsp6svKKfSRXjR
         /LAA==
X-Forwarded-Encrypted: i=1; AJvYcCVDwBBXRJc8Vp0+xCWOJga3/06kfWvdAEvtUrHPbsHme5TuHgvWJwePrTFyrkP7PfG58bFUNa2R9HXA5W36@lists.linux.dev
X-Gm-Message-State: AOJu0YzpU/KO1ZBJjTDGwLQPMTqxCKc70tC6ofkW1ykeQM8Ihg+vPLTn
	jPX/oCiOO1e/l/URuHpxDu9HjTJ9AJAz8rYDTUoSXcK+qpKo3JNu5955
X-Gm-Gg: ASbGncvN5VwycoeUVMIAl/8oteP5WOTWBh7KJNbKF+NQeGwYLvibVv8QGveCIYtPseh
	FhFxJlq3+Iidx7ULqGOOdqdz9KrFO2CgZupzo6fB8R+4XBhVrzfTSfzhhFnuK6UvMprrFrMI902
	AD8DswjjHUMHTg/KHi3iWRm0qBHa/PEjMR7y9iUQZcSDwnzE80T/kMhCCGNGIOtYZrEPGa5Rctj
	AD/ZVzcCEjnG4KmY4oz+uODjbeAiUD/Gjs4kofmppflCilv5XLRSvyKfVJcUpVG1gaH85oAv5Wt
	jbxezpGOKK1/S1FGdZek3kT0QyOQjg0kobdPq95fsZIOtnqEdDydihOhoMChzeXgFcG0+eBV3xK
	UBKEkhP7IS/KrVvrDAvmLIyVfspvaYKW+4hV0JNVoKwU4jkMjfOiC
X-Google-Smtp-Source: AGHT+IH+Yw+ZyfyblxUL7BEbKbLohu7fkQEuJEKc4v1r454PO0F4s4EfWQphe7K9K7kzk7sDe5OpwA==
X-Received: by 2002:a05:6870:b24f:b0:2bc:716c:4622 with SMTP id 586e51a60fabf-2ffb24e6b25mr1873264fac.38.1752665894297;
        Wed, 16 Jul 2025 04:38:14 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff1127dd10sm3353730fac.19.2025.07.16.04.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:38:13 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: fix block comment alignment in rtl8723b_cmd
Date: Wed, 16 Jul 2025 07:38:07 -0400
Message-Id: <20250716113808.73115-3-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716113808.73115-1-ignacio.pena87@gmail.com>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix block comment formatting to align the * on each line properly
according to kernel coding style.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index def456abc..789abc123 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -34,13 +34,13 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 
 /*****************************************
-* H2C Msg format :
-*| 31 - 8		|7-5	| 4 - 0	|
-*| h2c_msg	|Class	|CMD_ID |
-*| 31-0						|
-*| Ext msg					|
-*
-******************************************/
+ * H2C Msg format :
+ * | 31 - 8		|7-5	| 4 - 0	|
+ * | h2c_msg	|Class	|CMD_ID |
+ * | 31-0						|
+ * | Ext msg					|
+ *
+ ******************************************/
 s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer)
 {
 	u8 h2c_box_num;
@@ -435,13 +435,13 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 		}
 
-/* offload to FW if fw version > v15.10
-		pmlmeext->DrvBcnEarly = 0;
-		pmlmeext->DrvBcnTimeOut =7;
-
-		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
-*/
+/*
+ * offload to FW if fw version > v15.10
+ *		pmlmeext->DrvBcnEarly = 0;
+ *		pmlmeext->DrvBcnTimeOut =7;
+ *
+ *		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
+ *			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
+ */
 
 	}
 
-- 
2.39.5
