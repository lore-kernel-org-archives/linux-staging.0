Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18333CEB1
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057491; cv=none; b=Bdk1eXIHQi2bvPnvpSdkGvJWIfr4U3hnnDQ16KyMfE5X9WnOj16nX3AUCsNEXDcQLdKUxBGo0amUqrfI40jmxIFU84DrCYfD/DkqNl2hI04dzUpSO0MDvzfPVqRepbarOGSK5CQLdI7HdizMQa9q+euvjZ9XLkJwHFTiKTx8Yac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057491; c=relaxed/simple;
	bh=zijp3llFywVfpT9QYqAwWosPxjDdQf1YzfRMKsjJITo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g9CDga8FPIguHWyMU2i1rywnnR2oUp8lbcL1mXaAcEdpwLGQAI+D99DL16hcFwitoJ0vrkeSPAqeB+6ElR0xHUXfCvGt3Vv3aZQKCG/JkFLDkae09GHCW7o2JEUgSi9T6RVeDqUguICBC9XFaDl/3rko9LftE1xBHu8CvTasTmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAV+PJad; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAV+PJad"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290aaff555eso55076475ad.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761057489; x=1761662289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKiewusGPdfvLoc26P5wfhNDeucWP0PGPLulc8zKMzw=;
        b=KAV+PJad4k48yqNCTg9xLPfXlXq98L+d/6B5nNxUpPeSEYY17xwxLF769/H6zu37J5
         xS4G3FhLg3e0ly7TZtr3LmB08Qj53pFI6Fz+EoICuWBBtPoJgwCQyvsPT0o4kuWWCsFB
         e2corDdQAKS0R6nEFLtU1KeGDj5har6Yhc+r1UMyKy/j8yp4GLi4bY5bO0pb/jTOwZRz
         L/67fiQ1augxjpsi39TULM27RWagkU+v1wvxcCHra06BlzvvVpfDhoRp/Z9uOAnJWiw3
         HumXnYNi+UzY6H38G6cQHnH1c5DitoCEsugPSVCw+XGirlsYZ05ee8lPY7m1WLhTw50I
         Sbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057489; x=1761662289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKiewusGPdfvLoc26P5wfhNDeucWP0PGPLulc8zKMzw=;
        b=vo5YN3RdaE7gJHFApZ07fOBgSAARc8kZh7P3U/S3cjS39cY/Ps2dqLe8Hcd2PKF51P
         WPOTETU5+eokGhpjGGRUBCYREuHs50eMwTPTpCf3t9a5TxQTaoVLkSBy6kOekOT0ZMma
         hNvnTtXL8lLIvLTwIydTqiITvRj9dDVB3Yw9VfazwYXHP4SxWhKdaRtU+hPqrVfvJFOM
         rtrVCf7/+wFMk72iGb7Oi3DZ5xQJ8mD45EL8BR84mSNWJzIIGdgKxGAiFLhKj5384N7j
         Elc60Y/HWtr8q6O+Bc8iwqBwVKiIHU7AtAkTjTEg3mDblqefV08Juv7PCO2iPaL3PoCK
         cNgw==
X-Gm-Message-State: AOJu0Yx+hnCNtThVqpBTpMjvPlTDbrr5NPsRi/YmPGtUfeE5etV2joRY
	6qK81fqzkRFAdhDxiEBKURweN5aGx60VIxdyzNc7PrgN0UCsK3dVbv/0
X-Gm-Gg: ASbGnctz1q1iU6zXsMYdSTTI4C34mwYdtW+xvvc23MI9HVIuBEdw36l4mENXOlLAmGT
	tYas86r52oN+36ZQ/EDWyPh/oUqkSQDVxbhKy4ToA9uSJjAGkJoAi65TivwmPfWNUvCzjcv6V0X
	uI+K7vzdHwcyBhw3wWbtnGJp9w4ffpEoQhBOxkgRR4BVe1Z98tynN161TyhGSLVXbyDL9xXw9VX
	hn7ossPfg8qI9qVO5D4ISvfZal1eg7B3ARFicZtN+Q2NNIlw71HrpFoM/Q2zpptmo0ZUrQiYnk4
	RXKN7p/1d/vv5o8PsoIVN2Y+/xL8bxIJG/Upo8/p2V3vMY9VAwXUUL9CHGXVQFWlu3ND8HFDO6m
	JHLIsgvmrXfr0hZ2ZdsKg/Npv9L11mPkLUzGIfQho5E6u2iZEpHv84Fq8b0QTyjPKJ8hLN4cnKJ
	53UpnY29KNIKsbdEXa8YwbF0DmRcJ7fvnn
X-Google-Smtp-Source: AGHT+IEAWIf+CaPqoBesaJEFem/As0pZDf8BVCP9EBp2Myjg1sGwMyqnBAdPVf6U1o+b5r1Y//GycQ==
X-Received: by 2002:a17:902:f70b:b0:283:c950:a76f with SMTP id d9443c01a7336-290cc2f91d2mr223574455ad.43.1761057488793;
        Tue, 21 Oct 2025 07:38:08 -0700 (PDT)
Received: from localhost.localdomain ([38.134.138.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd7e61sm111187215ad.35.2025.10.21.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:38:08 -0700 (PDT)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dharanitharan27 <dharanitharanr05@gmail.com>,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use ether_addr_copy() and simplify NULL checks
Date: Tue, 21 Oct 2025 14:37:39 +0000
Message-ID: <20251021143739.35948-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: dharanitharan27 <dharanitharanr05@gmail.com>

This patch addresses multiple checkpatch warnings and coding-style issues in rtl8723bs:

- Lines 120, 212, 215, 249, 255, 256, 261, 262, 263: Replaced memcpy() with ether_addr_copy() for MAC/Ether address copies, following kernel best practices.

These changes improve code clarity, align with Linux kernel style guidelines, and fix checkpatch.pl warnings.

Tested by compiling the module successfully with:
    make M=drivers/staging/rtl8723bs

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
Signed-off-by: dharanitharan27 <dharanitharanr05@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 33 ++++++++++----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 63c4ebe9df12..af6cdda8238d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -7,6 +7,7 @@
 
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
+#include <linux/etherdevice.h>
 #include "hal_com_h2c.h"
 
 #define MAX_H2C_BOX_NUMS	4
@@ -117,8 +118,8 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	*(fctrl) = 0;
 
 	eth_broadcast_addr(pwlanhdr->addr1);
-	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
 	/* pmlmeext->mgnt_seq++; */
@@ -209,10 +210,10 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
 
 	/*  BSSID. */
-	memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 
 	/*  TA. */
-	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 
 	*pLength = 16;
 }
@@ -246,21 +247,21 @@ static void ConstructNullFunctionData(
 	switch (cur_network->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 		SetToDs(fctrl);
-		memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
-		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, StaAddr, ETH_ALEN);
+		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
+		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
 	case Ndis802_11APMode:
 		SetFrDs(fctrl);
-		memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
-		memcpy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)), ETH_ALEN);
+		ether_addr_copy(pwlanhdr->addr1, StaAddr);
+		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
+		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
 		break;
 	case Ndis802_11IBSS:
 	default:
-		memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
-		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+		ether_addr_copy(pwlanhdr->addr1, StaAddr);
+		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)));
 		break;
 	}
 
@@ -765,9 +766,9 @@ static void ConstructBtNullFunctionData(
 		SetPwrMgt(fctrl);
 
 	SetFrDs(fctrl);
-	memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
-	memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
-	memcpy(pwlanhdr->addr3, myid(&padapter->eeprompriv), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr1, StaAddr);
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
+	ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
 
 	SetDuration(pwlanhdr, 0);
 	SetSeqNum(pwlanhdr, 0);
-- 
2.43.0

