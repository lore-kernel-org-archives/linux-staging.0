Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9524021CA02
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770570214; cv=none; b=MsN0cPOdd3551ZE59EMIwHy5NVj/9QLgo7BZjIeoJFyzf6Qj1wIrZwX99hXRYDuo8xnZGPcyNdaMb+/uHITXJcl8vkUUn831OFfjojgBdJFJos5jnShdl6ZI4lqWrtHrBQYUM+ghk4CKewqYRztI5itsSktIdydz1xh18XJDRo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770570214; c=relaxed/simple;
	bh=ww4r1sG0FQjd+kNZjJoDEqfRF8h505UHbrHKUk2SVq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cbjl7JUr+Tqx3UK6aadSXGCTdjS5hxhO0TJO7kWqliFEoxjE/nvTkVR8FrLVIwDuEiBgWTodMv5y6zdHukSnovD+PeGMF+c3iGkAHSrn14xcs1KMjtqpx/IQ9eo+wpTY+dmcZ+jUz4KTSRlQnKOu3f1yEtxTOZ6wvSz7fM353TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQm/RT+i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQm/RT+i"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376de3f128so186650f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770570212; x=1771175012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2OK0MDEGd5UnklCN7o4z7flyQmdfqYJal9T+rux9Zg=;
        b=jQm/RT+iOLesCyIRqENrRyo8ANvs5DIU0lreLLcfgXIRhCWBAfLv9gpW/mPirwowSq
         8w9uz/4ggf4P2YT6elg1uDJkj2PfIWmsQTykAjcHyDqLfeEE73oIHSsTq8iu/S0Aud35
         xQJtCcbA5HNIKk8yPDVp81lrluQyLbCBDTCPejxECu5z012nQFJ+UQgVbagA6aVJLDzB
         +lun56xW/vAUnfFwMkbRMO9n3tg090JJ4kwaek5IYy1u1iMJg8DMLtQ+7N9tvuCrunHj
         9RS2mqkU6eqCGkiLCCTsO1XhOmavY5gxtH5hbd9O+9MmzzRtFu430DRSgoj56Hyh4GUa
         ivdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770570212; x=1771175012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2OK0MDEGd5UnklCN7o4z7flyQmdfqYJal9T+rux9Zg=;
        b=n94vz/bAF37ht8raeqOByOCtkzahHYn5AV2YA2WLekP78XaOaLyfB/KimGhubunoLi
         VW8oyoFmgfdyN7ugm2KP+JlHdAsPjlxs23RWZh4MjkkUSxftuMC2N1hpNJZO3imYcpa5
         Rj91HE9sj+m/mZl2JiDq2Gzk+PLE8kmQp8U0fktK44ijcjUnsZkJvelxIoaBZqgksCil
         pAKIWdHUF2YUiJUzjwNOggeKNKgV3/OOaem2CjgjmsDtX63zKCR910Tnk4MP4Flj08f4
         p+82e9HXMJk/CQ9vR9DiLHdZDkh2K3xEGJOmKWUJEcdhOwypkM75j0Y3TO/yaSjGU/sC
         RBUw==
X-Gm-Message-State: AOJu0YwJQ4+Eamn1MFsYouLXuWIZ9JX2iX1Gm/git+FDWSUBX2+rf99Y
	fjgVjI4Soqa2Xq7LZVnkw9v+NOiWNj9bPDsWu7ONTwNGp6LfabMaP3Uc
X-Gm-Gg: AZuq6aKCUnVhtPexd/bumQ/LmJBkO0EFB9fp+kRlxgdaIJmeQDP17SZZAAhCGpFdTOM
	t7jitCYZbsXoUMTcE/PWi/XWqHoNY0boZ2A5iSwcIdI2KtExnR+pEOYRMAnHiyWlGFOow3Lt4xC
	6TmqCQXoFl0nxFAQ0VmdhA05IzFKAXStTFadpMIQdQRFuhPy1iHd3YUw2iQeV5OVLHZUq9ckgVe
	gFwqJjYBUSDrK6/YDmxHgMtUvmTtM1q8Ol98A/+IjCXMUCZjOBNYXRQKp0DJ+jD5ul7gntYjNbb
	EdQAW1MRHzNTjQi/xhUoawXDELkWQAhrr8EJ54ziUdMRkOBDoYDaNbzVKizLrB+lUAmPXXYUvGR
	661zDUKMXK7iSBr03KsDrVzmIkbO5Do7r3P70HjaNr+crQDQW6arQCrpWKaRyiMYZUhKLatw/Xe
	b7gjV2OkTJmeL6
X-Received: by 2002:a05:6000:288a:b0:430:fd60:940f with SMTP id ffacd0b85a97d-4362933ed8bmr13560777f8f.14.1770570211609;
        Sun, 08 Feb 2026 09:03:31 -0800 (PST)
Received: from fedora ([179.43.189.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297450b4sm20791166f8f.34.2026.02.08.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 09:03:31 -0800 (PST)
From: =?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	=?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix inconsistent indenting detected by smatch
Date: Sun,  8 Feb 2026 18:02:47 +0100
Message-ID: <20260208170247.7013-1-filippo.muschera@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following inconsistent indentation warnings reported by Smatch:

drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2319
  EXhalbtc8723b1ant_ConnectNotify(): inconsistent indenting
drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c:1410
  phy_IQCalibrate_8723B(): inconsistent indenting

The affected code used a mix of tabs and spaces or excessive
indentation, making it misleading to read. Align the lines with the
surrounding code using tabs.

While at it, wrap long lines in HalPhyRf_8723B.c to silence checkpatch
warnings.

Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
---
v2:
  - Fix coding style issues introduced in v1 when wrapping lines.
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 2 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c  | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3d7f50fac4c..1af101ba9752 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2316,7 +2316,7 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 
 	if (type == BTC_ASSOCIATE_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
-		 pCoexDm->nArpCnt = 0;
+		pCoexDm->nArpCnt = 0;
 	} else {
 		pCoexSta->bWiFiIsHighPriTask = false;
 		/* pCoexDm->nArpCnt = 0; */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..eea44e390270 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1407,8 +1407,10 @@ static void phy_IQCalibrate_8723B(
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
 
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A,
+						       bMaskDWord) & 0x3FF0000) >> 16;
+			result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A,
+						       bMaskDWord) & 0x3FF0000) >> 16;
 			break;
 		}
 	}
-- 
2.52.0

