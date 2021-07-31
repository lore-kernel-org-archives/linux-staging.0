Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DB972
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 13:38:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k4so4335459wrc.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMkQE3QmNRpYQY7eJ3HojaGGzFnkdlV1/fq899vPEsQ=;
        b=wSHj5VO+cWazpszzKLEz9n/qIGYhNzcM2302siGcUHnNKJM/9cOCfJrzJdnJR6eUtC
         EzhG1ZvyDBhHFxoLJwM/g4QMWV4YzfuP4scnErfqcFqMW0JdRwgWwXe7KyVTDMSwSTzN
         GA4BslVfwThdh2Wb6QfUu+v06SE3r3jPhtODdFfi0PBSluW2fZkD/cDiTovLvy3pCfGW
         Kqdyjfdp3A4qjTYG98WXkqDmv2jYRQgyIS2fbi1Lvyfn6FgqcrWB2Q7Wm6Ar2oM25rv/
         +ZicC9en/au/Ub2NeisWaV2ItcNvu1VdxAfXP+DZPmJIfvJr3bMjpSiL5iKLBKZOAxo+
         xlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMkQE3QmNRpYQY7eJ3HojaGGzFnkdlV1/fq899vPEsQ=;
        b=EnnIaYX0rWhSYdPfVuDvEcVH3/ApvgOH+iNwwoxDZnEyT6H4VhLn94ybht2JM+jCgR
         7JHAIBuBbk8NK2hFYUGNxJoC4KvWATc3rC5XG4+PIDo/t2vUiKooArk5oNh3bZs28G0E
         M+YFTdbHmuevK8q+6A7qe/Qbo6ssfpYRp1YGPUwiEx6VmPTJuAhVyVXmtuYxUkRw3dfK
         txavFt2mrDJjDspCN+FnvoQOKwfCiHSQY7ZTIM45vkb2VsLikHGmAeL4Hvy1GBcli4pE
         zRqiTeiaUTRxJrbD333RfvGT3QYBEaq66CLRuXmyO/XAM6nHHNsyVfA23tNbtm+1lyGX
         3yZA==
X-Gm-Message-State: AOAM531C7GrJwMBjzckfMqQ4p04vmVvY6MEvj9i8ahWxG5ZcO5ffZI9E
	kwtBMTkVjgjdhr3e/oshnflM/g==
X-Google-Smtp-Source: ABdhPJxaApaJbKLkfmPoHCCMfvSCNxbaRDVJTrOs0WwYUpg2DLuKpBRy5WHFbd03XJ6Ssgy+kIUEXQ==
X-Received: by 2002:adf:df12:: with SMTP id y18mr8517722wrl.189.1627738685779;
        Sat, 31 Jul 2021 06:38:05 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id l7sm4608785wmj.9.2021.07.31.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 06:38:05 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: correct set/defined but unused warnings from debug cleanup
Date: Sat, 31 Jul 2021 14:38:04 +0100
Message-Id: <20210731133804.196631-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent include/odm_debug.h removal series caused a few kernel test
robot warnings. This patch fixes them as well as an existing warning
related to an array within include/rtw_security.h not being used.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c   |  9 ++-------
 drivers/staging/r8188eu/include/rtw_security.h | 17 -----------------
 2 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index d1613a9278c4..166adaac371a 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -364,7 +364,7 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 static u8 /* bit0 = 1 => Tx OK, bit1 = 1 => Rx OK */
 phy_PathA_IQK_8188E(struct adapter *adapt, bool configPathB)
 {
-	u32 regeac, regE94, regE9C, regEA4;
+	u32 regeac, regE94, regE9C;
 	u8 result = 0x00;
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(adapt);
 	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
@@ -391,7 +391,6 @@ phy_PathA_IQK_8188E(struct adapter *adapt, bool configPathB)
 	regeac = ODM_GetBBReg(dm_odm, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regE94 = ODM_GetBBReg(dm_odm, rTx_Power_Before_IQK_A, bMaskDWord);
 	regE9C = ODM_GetBBReg(dm_odm, rTx_Power_After_IQK_A, bMaskDWord);
-	regEA4 = ODM_GetBBReg(dm_odm, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
 	if (!(regeac & BIT28) &&
 	    (((regE94 & 0x03FF0000)>>16) != 0x142) &&
@@ -1091,7 +1090,7 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 	s32 result[4][8];	/* last is final result */
 	u8 i, final_candidate, Indexforchannel;
 	bool pathaok, pathbok;
-	s32 RegE94, RegE9C, RegEA4, RegEAC, RegEB4, RegEBC, RegEC4, RegECC;
+	s32 RegE94, RegE9C, RegEA4, RegEB4, RegEBC, RegEC4;
 	bool is12simular, is13simular, is23simular;
 	bool singletone = false, carrier_sup = false;
 	u32 IQK_BB_REG_92C[IQK_BB_REG_NUM] = {
@@ -1170,18 +1169,15 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 		RegE94 = result[i][0];
 		RegE9C = result[i][1];
 		RegEA4 = result[i][2];
-		RegEAC = result[i][3];
 		RegEB4 = result[i][4];
 		RegEBC = result[i][5];
 		RegEC4 = result[i][6];
-		RegECC = result[i][7];
 	}
 
 	if (final_candidate != 0xff) {
 		RegE94 = result[final_candidate][0];
 		RegE9C = result[final_candidate][1];
 		RegEA4 = result[final_candidate][2];
-		RegEAC = result[final_candidate][3];
 		RegEB4 = result[final_candidate][4];
 		RegEBC = result[final_candidate][5];
 		dm_odm->RFCalibrateInfo.RegE94 = RegE94;
@@ -1189,7 +1185,6 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 		dm_odm->RFCalibrateInfo.RegEB4 = RegEB4;
 		dm_odm->RFCalibrateInfo.RegEBC = RegEBC;
 		RegEC4 = result[final_candidate][6];
-		RegECC = result[final_candidate][7];
 		pathaok = true;
 		pathbok = true;
 	} else {
diff --git a/drivers/staging/r8188eu/include/rtw_security.h b/drivers/staging/r8188eu/include/rtw_security.h
index f8863926c905..ec6ecdb7bc98 100644
--- a/drivers/staging/r8188eu/include/rtw_security.h
+++ b/drivers/staging/r8188eu/include/rtw_security.h
@@ -308,23 +308,6 @@ static inline u32 rotr(u32 val, int bits)
 /* This is based on SHA256 implementation in LibTomCrypt that was released into
  * public domain by Tom St Denis. */
 
-/* the K array */
-static const unsigned long K[64] = {
-	0x428a2f98UL, 0x71374491UL, 0xb5c0fbcfUL, 0xe9b5dba5UL, 0x3956c25bUL,
-	0x59f111f1UL, 0x923f82a4UL, 0xab1c5ed5UL, 0xd807aa98UL, 0x12835b01UL,
-	0x243185beUL, 0x550c7dc3UL, 0x72be5d74UL, 0x80deb1feUL, 0x9bdc06a7UL,
-	0xc19bf174UL, 0xe49b69c1UL, 0xefbe4786UL, 0x0fc19dc6UL, 0x240ca1ccUL,
-	0x2de92c6fUL, 0x4a7484aaUL, 0x5cb0a9dcUL, 0x76f988daUL, 0x983e5152UL,
-	0xa831c66dUL, 0xb00327c8UL, 0xbf597fc7UL, 0xc6e00bf3UL, 0xd5a79147UL,
-	0x06ca6351UL, 0x14292967UL, 0x27b70a85UL, 0x2e1b2138UL, 0x4d2c6dfcUL,
-	0x53380d13UL, 0x650a7354UL, 0x766a0abbUL, 0x81c2c92eUL, 0x92722c85UL,
-	0xa2bfe8a1UL, 0xa81a664bUL, 0xc24b8b70UL, 0xc76c51a3UL, 0xd192e819UL,
-	0xd6990624UL, 0xf40e3585UL, 0x106aa070UL, 0x19a4c116UL, 0x1e376c08UL,
-	0x2748774cUL, 0x34b0bcb5UL, 0x391c0cb3UL, 0x4ed8aa4aUL, 0x5b9cca4fUL,
-	0x682e6ff3UL, 0x748f82eeUL, 0x78a5636fUL, 0x84c87814UL, 0x8cc70208UL,
-	0x90befffaUL, 0xa4506cebUL, 0xbef9a3f7UL, 0xc67178f2UL
-};
-
 /* Various logical functions */
 #define RORc(x, y) \
 	(((((unsigned long)(x) & 0xFFFFFFFFUL) >> (unsigned long)((y)&31)) | \
-- 
2.31.1

