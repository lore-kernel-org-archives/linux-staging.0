Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D15E1B043A
	for <linux-staging@lists.linux.dev>; Sat,  8 Feb 2025 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002602; cv=none; b=EvSwWYW7ntshkhAAjW8VMg75qmU3A84HqLi9i5UwlglGFzDX8KzEyEcBEwhbuuSPdAP+mzBziRKS+VtBtydmZRlFXANtBcwt+H4JOVV/LGvTX/jkQKy/vW0DI0HJx6EQWBsFwGyTJackkDfIdz+j5PjGHKkYLqFaWrBn+DdK+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002602; c=relaxed/simple;
	bh=6SyAjLBH1UP/Lg4IawurSIwuUj6Az2WGwaEx0NGxizE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I57jVprnKPO2dCRf0UA55emkGhLJ2ZLpUra8jlAluJOu76kRRYXj6w6qqS6mFJP4eFlOwx+BntEQ3evjUIVG2yfblYCoDyYorj44ovWQISaVAzx4Lp9iZL0txNv63GD5GuTHF/xWdkIgysIGfjK/BNCoseMWpMhzCV3o38hj0ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba9wOli5; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba9wOli5"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ebb1652729so1686322b6e.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Feb 2025 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002599; x=1739607399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rTLiEPTqOtFdHsQfnTiaTuKmKAVDOacAUIwSfTExLc=;
        b=ba9wOli5qg2Wz8xrIFqF3NNR433+rnQjEYeLT5GC5hloP2se7lWpfr+a+sTO024Eq5
         rZTpX7fwXmepq5PSjGpCj+/9Nwl/4HPfbbL7HLRtxtQUKghssPgg/Sxm0g1patMv0dNK
         FlYBJ38hKi70PLZ4RYXxVOHBO0ZbYFEYHqhUZvGYct8zN2w3qbAZ1Be4BeSurNVhLue9
         q3m0tLCrcTQTjGB01m3htbxpSVkHJUu08LFocdrZ9BhjqMGDRlTKjhddB4Z05JGq/Hiv
         wjPKxaICSlYuufWXA0ybUuMzUgSZI4cgQyybO10hpQgJ7sJKGDkq0JFYBWhW50U8VzcH
         cQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002599; x=1739607399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rTLiEPTqOtFdHsQfnTiaTuKmKAVDOacAUIwSfTExLc=;
        b=cFA5b5kbtKwfcF8yvrqCLSuryd/rwOkgRGu1N9VR2adKFDsi2VyDuKeq5csqDnMzK2
         jygskqXsCcwm8qJrcduJ82MblwmNfNG0Muys2ioBpOXWVJmupOoNZe2bPlfXVrBEr6ab
         nIMNNoFrMHhKfgOVdgeYAZX7rC3bW8UtQvAcHOYwjG0MpsSbZaw6zNHzo/b+Z7r0MVfT
         3mN4tBZMDVtqDS30/0KfMP2sD6WTVwA1AYPHZ9rdlXOr/KPsFxC0PEWfsiodJIh20h2I
         R5p0bfoWvwBAo6ghp2ouIShi9jYRb0EPFFQ9mqpQVqVhnIqQsT6Ngn64Q/vXDkJubsHR
         mfPA==
X-Gm-Message-State: AOJu0Yypqyclr7L+VZmggY5xJTDFRG+nzqFQY5/S89VPgK6jcDkTyEuT
	GOQ3qdix0yzni+YOcn4oZMBWXfIaN3bSnar44FpxpLYoXMeEXJAc
X-Gm-Gg: ASbGncta2IOgxh15sY00ZRdeE2cegqq9Eu1Y4UcKwcJ6VnRg7YjAWy5isbeTCm+1vgT
	eIBLUEOEoOJ89RDFGJBeps3JrvmvOiiX3CWyaARGF/uanZ/3Adhi2jhQbuxNVwTCYvuT2HHmKIC
	jVoptY/AVrZ4s4Bv11dq8RMeXCZct6+iW5lWeobynK+qaPts5aLTIPooIH98G597JX/edznn1vh
	KIW+ebrciacRumLV5Ejbrl99chBmI0Clq25aNdJ8ScolkYGDdlChSsJiDxfrN3uw2heHug5346z
	luKDHUi8DL+I28plAQ4NViMMPl7X8EZhELKFHUCvXh5aJqqMvTtTrRzq5HhsK4S4ZoV0BfI6buM
	v
X-Google-Smtp-Source: AGHT+IE2WGlva6FTkAjphQq4bYqpI2OIjtaeysunDsrNWQKaw2VxgxJTFyepe9N0rP/jtNDMpO5LRA==
X-Received: by 2002:a05:6808:13cb:b0:3f1:d489:3d95 with SMTP id 5614622812f47-3f3922634b5mr3818812b6e.17.1739002599612;
        Sat, 08 Feb 2025 00:16:39 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm1200833b6e.11.2025.02.08.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:16:39 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove extra blank lines
Date: Sat,  8 Feb 2025 00:15:56 -0800
Message-ID: <e55d54286f8eef91418a117f96cd0cf9dc84ce8a.1739001527.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1739001527.git.onlyian4981@gmail.com>
References: <cover.1739001527.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687; i=onlyian4981@gmail.com;
 h=from:subject:message-id; bh=6SyAjLBH1UP/Lg4IawurSIwuUj6Az2WGwaEx0NGxizE=;
 b=owEBbQKS/ZANAwAIAepTOeN7sYcPAcsmYgBnpxK4Tg+ke+DkqXQY+DGfEz01D0W09bzg1VHiQ
 ZDmAoPWZUqJAjMEAAEIAB0WIQRWEQChjkHIk0vVfn3qUznje7GHDwUCZ6cSuAAKCRDqUznje7GH
 D2zcEAC684ltAhCp4oUzvtzqxJHgy7S3OOgPNGwpx/zsIQ3kk6rG9j8Mi86X8zEZeqSxlZWMTI8
 2k/nO0THwryNsq5kEC1CAHkLj3kSuHxsepWS30inhPF5YYgYctSQ7y/X33YMaNILUGHnMbw/K69
 4oOZnusckXTvgiQDzrbqp83B6qenVQ9iNlXsGNkLmz7EyTUIsufsX2DTXY8k1ZqhPe7cGic4rO1
 MIQGCZZXO4KzGWfY94bacrNUJTYUl5onqx9hgnXPBH5xHT2R4b1hiJ1IrHoPwpBPw0OFxngQ+oI
 a0o9f8TqNdQa4+7TixSuCW8x0tLYsIw5GOYgjVbVvXcwkiMckPMWngnYkP8NkI1dCzDukAA7Ks5
 vCXzv+xLmiSueLWrf1mBqv27+uGVCZkTDJVyVhz6XYDsn1Dxi+0XhwGr0NgRfM2rVkn48bzX52g
 EGeCraBrCW4QnwBkQYs4XH2IKt+ubXx1Ebbb3sKqEA4JTWM//dHUaoLFsd1foHiulVhnFo2do/u
 tsSwwpE6VkDOx1N6QaH98BBtTXtZOulD+ylprrzla+L1KkkXEYc1zImm1u9kmAc0tZDQhE6GTu6
 rFlaVH7lPBOYHrWhqAAy6EZxY+ch+YM2d7Ad/620IvNuzg2d2qAhSCiXUlo1mOMODxOKIgEn666 dDY//L3cPhuKiaA==
X-Developer-Key: i=onlyian4981@gmail.com; a=openpgp; fpr=561100A18E41C8934BD57E7DEA5339E37BB1870F
Content-Transfer-Encoding: 8bit

Repeated blank lines were present and removed. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 394f164b3bf4..4b3e7f40bb93 100644
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

