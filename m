Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A83793A0
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239767; cv=none; b=b9Cwz7qkAw1ggWORa6Djg3jdCNggBWR66L2tc/gd0qMOe75Pm8hJdN5VLB2SpL/MUr//Pad3efWkA49eTXNSWKtpXNJiW38lNuqQP0fUiN3mAceGZQkxE7z0O3Fv8YDmkhZpStqmR/FdQx9JoPQujKnbSF7wA+j9SZ29CSFKCuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239767; c=relaxed/simple;
	bh=i4RafcjoCKLIAYA6tpKPmvqCBnpVeLmlWOQe6Bkt7ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhX87E+guu+7yHKT69Hq+n2K2mYzGH3YUEMP7TczJCetHN3AY7UtqgzswhrCE+bYkmcCC1JZw6foOFEla+rI7Dqx6rrSHawFTe/ustJmawb2hdjHzvjjYoEBUpRNSh4QtTFD2YgifxlA0FBsN2Y8BVOujjuKUZusZsjIYHbnKuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8CVp1VN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8CVp1VN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so3299778f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239764; x=1768844564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sVkktHgvaI4mRo7x3+yOQFC1rPBEHhHyTMVQQGkFx0=;
        b=H8CVp1VNQnnoheeAbif1OUppADoWh4xbMeOuVc7Z4z7Vt7XJucPBJUTaLMXQ/BpZGw
         yQ5ODEZmcpYlOofGpZIFLff6dAduahmsNbKfBlKItqGkVnMu+P46vy2ah7Xo6uhILD9q
         rIGvZk58tK7mWHeQSnH4/qS6v2YaQeJd+3rtkw6ZLzmJRgZiP18QEc88mSOCwYG6i3Td
         8PssVm8SAA2ktDJwqTs8SaikjnlL5DV3OFjAcx31X/csvmVUdlrZm7uslLvH278Jp78n
         79lXtkybChsnpFGCy7uJSqgmQPD2BEW3q4ab2kSQTRaZXwRq1YxVap3dSl3DHYMedLB3
         QSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239764; x=1768844564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8sVkktHgvaI4mRo7x3+yOQFC1rPBEHhHyTMVQQGkFx0=;
        b=SvGEtZitN8kfTxuU7MpnkJq4G2bgM6CccO10btBbFTg3i0RqMbImvXjirpV6ISqoH0
         r0HNm6ZIAOz6fgXsdVv2S6EYpqqBienMvvj7nQU/sgBEG5dVkDL0vJhHjm28u6+zZNne
         P3fAwo2AYcPiW3P5Q4zQvPCg2nAuC7RpcaWStUyMUT9X/DEj6faW8ECxV5Cnq5X6ajJv
         QY3f/9Z4DYO/XzSH2qyy34WMtLtbVY62liufG33ydC+vN6+emBj1/RzxLtS65+lQh1uu
         4de0ruNQYNRsFfFMbT2RmMjrCNVDoYD3gffHbow58qfSwG7bUqqzdpXePdF74g8btoJK
         GN3A==
X-Gm-Message-State: AOJu0YzYWMC7KRJfSU53KqP6Ki0z1tW80SBPWyg8AC0PqnOMLq0ZpgkO
	lT3cXbBehbdkpXiymgjE/wGTqv+Vv8o03G89T8o3ztPZnNmNGc5VCSjT
X-Gm-Gg: AY/fxX598aLRFU3MdM6T5vxbm4/wkMZSt/Bwnjsb8I8bGlIOHY8iE/1+Giav+rLbPyg
	3uZnPJTOELyUTherMI/vbZaTIRoK27uxpkBNcw3dYC5soSrfq2t8qcL0RRf6Ni8+l0NKdc0OF5+
	l9XbIzxLg3DF0IofiFnkYK99E7PKjAfXHRIosJagKqT2haiThnfO+hmeEhaV1xcjPhXJUt2rp+3
	YEiyhs7tH7bF2Qt7i9QKol6fePMNcwNzHmFFcyCsAv0ACFaJ2yL7pVOMPQycp9bSM6fovszb9lK
	c0OKzwZjhg2e3YUz7S4YG1H3YkByO8xBcP29b6FhtZf29+RA9Ur+SUqYAwong187Q/CFR1zAb5M
	JkMr3BoO/ZlJERbEM/EuPxBMwEllpcygng4EQNryntxgk4v8Yf8+1pferSUOo6we3mdpq6NDg6Q
	HW2UQkZlnV6hKfnnhYUfQeb6ksxpKThjUmjAuo6Tj8SrUniaokyQ==
X-Google-Smtp-Source: AGHT+IE9W+oBUyS6HLlAQSMsynP3y/r+hxi63aDvbSaAxUhomlMoWvUz5flVpsHrEu2TCKHWd9w3Yg==
X-Received: by 2002:a05:6000:1a89:b0:431:342:ad4e with SMTP id ffacd0b85a97d-432c37a9b5emr25630780f8f.62.1768239764353;
        Mon, 12 Jan 2026 09:42:44 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:44 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 02/10] staging: rtl8723bs: Fix spaces around operator checks in HalHWImg8723B_MAC.c
Date: Mon, 12 Jan 2026 22:42:19 +0500
Message-ID: <20260112174227.14922-3-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks in HalHWImg8723B_MAC.c regarding:
-Spaces preferred around that operator

Adhere to kernel coding style by adding spaces around operators.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index a65dab37ad9d..9c07df254eaa 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -187,7 +187,7 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ArrayLen; i += 2) {
 		u32 v1 = Array[i];
-		u32 v2 = Array[i+1];
+		u32 v2 = Array[i + 1];
 
 		/*  This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
@@ -196,7 +196,7 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 		} else {
 			/*  This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29|BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
 			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
 				bMatched = true;
@@ -213,21 +213,21 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 
 			if (!bMatched) {
 				/*  Condition isn't matched. Discard the following (offset, data) pairs. */
-				while (v1 < 0x40000000 && i < ArrayLen-2)
+				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
 				i -= 2; /*  prevent from for-loop += 2 */
 			} else { /*  Configure matched pairs and skip to end of if-else. */
-				while (v1 < 0x40000000 && i < ArrayLen-2) {
+				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigMAC_8723B(pDM_Odm, v1, (u8)v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
 				/*  Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
-				while (cCond != COND_ENDIF && i < ArrayLen-2) {
+				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				}
 			}
 		}
-- 
2.47.3

