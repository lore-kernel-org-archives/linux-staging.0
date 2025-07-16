Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF4420C00C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 05:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644181; cv=none; b=ueXlX0KrFA+3frdD4VG0yyFVeEUQbWP/Tpletu9ZHIRukE7ea8wAPSz9r+tNJkRsQa/uummqKgPGz01xtGkjhiaEB6U25pCVdSGWCLiD/ZTc2CuYi4jubjUvZHMqtEjnQLK3DrAJn9X425E5AhbrgtWIzOz8Gn0EZfrCZJbj7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644181; c=relaxed/simple;
	bh=M5INun39tksfwABwaRlV5j3FOvnT1FyBQQtsJpB1deM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=baSRVroeRreF9z9WGf72J4KFIwnmOPMZRuFP27/j/baUOmLcUL9PzO7rh2ouaeNGPYptslNbPEK4Bo0XLv4CIcROOwIT834R2gkn0sC1yBfIE3sRBGBPIivv65TmJqZ/CjQXGvwZxn4X0Y6CbF1e9VO7sIDtvSfIiMSkBP1SVAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lic/EceR; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lic/EceR"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea58f008e9so5108585fac.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 22:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752644178; x=1753248978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEsa6lnqOzYqGSywCIC1dTTftmFfal8UqYSzAjHrOFk=;
        b=lic/EceR/3LnssOpdsB4XO04J/MOCn/wDE0BSjE1mdeFC466TuOsefd+2VEYnN/QUF
         833yqgcHmx6YU3vXYh33JfZk1DwNXl1HDEhAFGTPirxChTQTjLm/UYu1IAv01zY7hy07
         +fSi4tps0sDWq7LkOA5DUrdOLOkY1UK0Eiwd0EqcR6YgbN++Era+mpQKFc6MEh8+SlWp
         G85lr7uDUQlYnV5JFkJWa4YumhSEl13vqAvfEtrJq4oVnWsZAOc1camG8leeabJ0fIVE
         R7fEnB1Vki57oHTbeWfNnSfupNKRa3DtQN9VpS8iOKlNsdTRcSFXd2p+gMWWVXXXbQ2A
         eKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644178; x=1753248978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEsa6lnqOzYqGSywCIC1dTTftmFfal8UqYSzAjHrOFk=;
        b=gK8lDG1XrKslNBjqnf2fgqXJj9h7a/rPokARJQeQQ/mKx/AgO7MgNQQdsStiT9b+d5
         h5pDv97EqFe/Te8t7DRzXr8LXZgy+wh2tVTZRGYiigmnUYA1xef9VpPgPwc/fNEt2QEc
         Iqx1QssRZKkh5ajC8j/D5CDZ/q3EbbFAeONJ40yfpKkq1v+BvTdpeOmRXT8ph7q3nsUb
         COtlWngDsOt2VHGodIerfxRwL4XTrQFXsFyMhE/0K/rL6Tm1mXWoEgBm4s+FeifHd45t
         0IPwlUslWZN8Huh13XHTkX1Kho1BWwCeAbV1axumtIRLk3CilCIIlQaKq4my5L8xNFGa
         DCUA==
X-Forwarded-Encrypted: i=1; AJvYcCU2b+AP+Rj6R4246TulruoInttxc5LocMqWhYqpgzAYPVK6Ni6KXSA1DABPHHlmM2KpDh5HrYWWFsp9dI4F@lists.linux.dev
X-Gm-Message-State: AOJu0YxIHdpEGeRb5k9773s2C3lbumRScPAMairvd3Z7UrELCx8mYzy5
	cHA3/infIdiGET1Y54hC95GiospRGh7QXkaPsxGKHocBsPdoDM8oosHU
X-Gm-Gg: ASbGncsvwyt85z5qJJm5leh6AtVaSSjw21Dd56+cGnHyAp1+yBc+mSzljZJYH7EfYDW
	nfb5kboGmBOtjsDiCJV02LdkgLdorAylxtZyKufmLPSIkdZWR1+UeUbUnZgIcNbp7RvnMh5M8Kl
	u1ZUMWg5icDk3iZAy9OlU3E8CpZxYrr6gepOsYJNkHLR5adzMWcWG6P7tsk5yx6QRRux1pbvUfL
	JROJPfrGjkZ5HqmgikGAy0pjDq/Bs8R0ptj76QUWwKVOJBnPx8psk5fizBLILIlUo1JUu490bsF
	DueS7Nh/VwT97t4nDG2o48KRm8z/98S3B/j8LFD4CPBOjqLd8Xhowdd2cRgrK5YTWidmltdYM+G
	6tR+u97Slh/sM3+1olcJQKODFRQBF4I6c8V7Vf3jruXKrVHrlkNOg
X-Google-Smtp-Source: AGHT+IFH4vPrAaApjfd33i2zkGsyjCi58GztaCj+Jehax8w9Qowdcq8pxC3vZduItj7XgwHaJ51Z9Q==
X-Received: by 2002:a05:6871:589e:b0:2ff:a2c7:f01e with SMTP id 586e51a60fabf-2ffb2522176mr1103379fac.38.1752644178478;
        Tue, 15 Jul 2025 22:36:18 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff111c379bsm3177613fac.5.2025.07.15.22.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:36:12 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: fix block comment end markers
Date: Wed, 16 Jul 2025 01:36:02 -0400
Message-Id: <20250716053604.64798-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warnings about block comment style by moving the
closing comment marker '*/' to a separate line.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7a74b011d..1e2b3c456 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -70,7 +70,8 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
  * When                        Who             Remark
  * 11/17/2008  MHC             Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void
 Efuse_PowerSwitch(
 struct adapter *padapter,
@@ -163,7 +164,8 @@ EFUSE_GetEfuseDefinition(
  * When                        Who             Remark
  * 09/23/2008  MHC             Copy from WMAC.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 u8
 EFUSE_Read1Byte(
 struct adapter *Adapter,
@@ -313,7 +315,8 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
  * When                        Who             Remark
  * 11/11/2008  MHC             Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void
 Efuse_ReadAllMap(
        struct adapter *padapter,
@@ -350,7 +353,8 @@ void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bP
  * When                        Who             Remark
  * 11/12/2008  MHC             Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
 {
        struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -396,7 +400,8 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * When                        Who             Remark
  * 11/13/2008  MHC             Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
 {
        struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -429,7 +434,8 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoT
  * When                        Who             Remark
  * 11/12/2008  MHC             Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
        if (Type == 1)
-- 
2.39.5
