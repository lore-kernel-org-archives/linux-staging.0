Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628649E13D
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105861; cv=none; b=jF4oMAlTtlzJDvHtiOm+N7cSoC6JqL8Yy+KNxIdzsD/o9lvBMLz4j+ljKkkeX262ARMdUfhf4FJdrbF80k9vWba4RPRHUDRZdAkORBuz4GS9lThFnKxMqeLdtjEgV2xXmAI842ptgIEyjGmsmFL/UJ8fsVT4Bxy45/gTTIRLEPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105861; c=relaxed/simple;
	bh=YYANp+TTBbv1WMDp1iZThDNlsZpqbDKkOkyykzla+ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ymhr+XAY2r2U5qgJR7psvTS0kqAhup9jVlBbz2w9EL7XZz6kiKJNGvSqS6YaaByTs+q5kGRlCiJmX5zLCyi6BhZlC1s4kiaky6qqSg2utZDVg0xpOadk6+x+Jy5i4ktDVIhrzDS9GM4Dz70ioQeImwLgxArlxxj4TqieiKnzi+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNcZvWgf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNcZvWgf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca12086c06eso580834a12.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789105860; x=1789710660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUbgazg75ZGLlIe7ZATEFRlDmK/imdYnHRGcGwQ3xn4=;
        b=bNcZvWgfO3wrwxJKnRaMNI3Qz2Z1zRIMtWxSyO6aVGgyf/KP9fEGnwovXlrfLhkKWY
         9Ket8xXY9c5omzY5uSkwgldjT2rQyVl2WJI8WJ01thFCfyikWEb5malmWrauhGvo0NxE
         qIPeR21fT1jMffvx6PZkRh3tMXDtQnnHtGHwIedO30UTqfOhBbLZwRD83BKUnc0tZfsX
         yCLFR1GxjSpmu8HR9t5/Ix3X58x/VKehdByfB6pNXXo9A4d2vwihvV/2KYlAYkm0COs0
         +QgKhme3IFgMP8OUEieeqjmGd4b9kN04euksn/VdbjNhnEaUnd+0+g3yZHStPa1/BJTF
         +8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105860; x=1789710660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUbgazg75ZGLlIe7ZATEFRlDmK/imdYnHRGcGwQ3xn4=;
        b=QGD7esxyB6GPeEvZxp8mPcMhLAzBbkgVkKRs9tU54d6g0xo/FkooHFidjLcmSTXf4k
         hNazbB7Nx9DsLxkdiMiQdqiNge1RMmh+AY+diuujzTZP1pT7up3q2EfkeEPlLqqTxzFu
         2T6OB0I9aTTsExAxUxi0Qi+s6/tgBTkKOd7T02KRp94gqx6QvA1mNuXqpMd795uldmTG
         fxEJNeDTeEiI/v+fXHBMsD6+V6Rb/4QkIdf6fW9u0yu4m/CjhvRYyeYVj6d1VzyLK+Be
         6oc5fKHp+gtVRr0zrYRwS/bKu4qnrS9HOZMeexWCCC8bbMTnnmA/F+J7tu/eIq95jQId
         r+cQ==
X-Forwarded-Encrypted: i=1; AKwUvBywvdiOuwWevhGBAMlGQ9Ffmr5anQQkMkZyQKILf2nYFXKjVeApgypODHLlbaj3rSdkVwzHngG5tzm8FPfV@lists.linux.dev
X-Gm-Message-State: AFuF++ls4DJI46UvnahfMXdx8AeKL1Ze7cKHV7opE/f3QQL4XIIXlK/S
	sgX+8ZlZtX2ZKMuavv0PwYFjHNQF2k9eSloUQR9hcRiZtVbmUOskBiui
X-Gm-Gg: AYBFou3aFXn0NEnaOF+tZm3zxrG/xa+YzDS97qZKimgKTDck/xGHuBOu+7cUeJboynJ
	tBG3bTKWljYb4g4cruP/alkHmDmBhvEveTu44KUZhMBdA5XW/GR63J+xjrEINkmm/5dtyrMBz3Q
	Z9AIejwhFkTGbThXR0qsaHclpp0zmzhYRK4Uh1F737emtdUIJqM0+3w3O62DGd8b/WdlXEf2Cdo
	3EMrxFqNmJl5BeXmEydZfdzJZQ1HBR8/3kbJFnSe9vJCYBXYyeb2qxoEGllmpW7SDlkSAS+1MfE
	Sg3ny7T8I81S+NAevgj39OyocWOK01kvNRmgkgOvwKZlySld5apuicZA2K6EmRk0RR8P0YOw+Wr
	l78yJOtrihmGA/cba8G5z0cmEPIyidmenJ9vwM2P9ffnDi19PwGxvunhB82U5xEzngj7f0yHJP0
	LWp7sfbD2D1BibSkEc1yFu6c6AI20QQmGAPfxpNHFDGH7dDDtX0YyLFOCSod7QK6PTlX37FqndG
	llsfQ==
X-Received: by 2002:a05:6300:618d:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3daed153d75mr5226302637.8.1789105859474;
        Thu, 10 Sep 2026 22:50:59 -0700 (PDT)
Received: from spidy ([2401:4900:55a2:c6fd:d9e0:3d5a:b05d:28e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm3654993c88.6.2026.09.10.22.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:50:58 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Lin YuChen <starpt.official@gmail.com>,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Archit Anant <architanant5@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH] staging: rtl8723bs: avoid linelength > 100 in rtw_security
Date: Fri, 11 Sep 2026 11:19:02 +0530
Message-ID: <20260911054908.37690-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac5f2..e82392938805 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -34,7 +34,7 @@ const char *security_type_str(u8 value)
 
 /* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{					/*  exclude ICV */
 	union {
 		__le32 f0;
 		unsigned char f1[4];
@@ -64,7 +64,9 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			memcpy(&wepkey[3],
+			       &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
+			       keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
@@ -112,7 +114,10 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
-		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
+		/* memcpy(&wepkey[3],
+		 * &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
+		 * *keylength);
+		 */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
@@ -157,7 +162,8 @@ void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b)
 		pmicdata->L ^= pmicdata->M;
 		pmicdata->R ^= ROL32(pmicdata->L, 17);
 		pmicdata->L += pmicdata->R;
-		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) | ((pmicdata->L & 0x00ff00ff) << 8);
+		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) |
+				((pmicdata->L & 0x00ff00ff) << 8);
 		pmicdata->L += pmicdata->R;
 		pmicdata->R ^= ROL32(pmicdata->L, 3);
 		pmicdata->L += pmicdata->R;
@@ -418,7 +424,7 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{								/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8 rc4key[16];
@@ -491,7 +497,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
-{																	/*  exclude ICV */
+{						/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8   rc4key[16];
@@ -747,7 +753,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 		ctr_preload[i] = 0x00;
 	i = 0;
 
-	ctr_preload[0] = 0x01;                                  /* flag */
+	ctr_preload[0] = 0x01;                      /* flag */
 	if (qc_exists && a4_exists)
 		ctr_preload[1] = mpdu[30] & 0x0f;   /* QoC_Control */
 	if (qc_exists && !a4_exists)
@@ -758,7 +764,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 		ctr_preload[1] |= BIT(4);
 
 	for (i = 2; i < 8; i++)
-		ctr_preload[i] = mpdu[i + 8];                       /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
+		ctr_preload[i] = mpdu[i + 8];      /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
 	for (i = 8; i < 14; i++)
 		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
 	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
@@ -766,7 +772,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 }
 
 static signed int aes_cipher(u8 *key, uint	hdrlen,
-			u8 *pframe, uint plen)
+			     u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -967,7 +973,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 }
 
 static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+			       u8 *pframe, uint plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
@@ -1430,7 +1436,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) ||
+	    (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.55.0

