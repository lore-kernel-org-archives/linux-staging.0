Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8219DFA2
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 06:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113937; cv=none; b=SJ8zhi0+ACp2CEgJN/CO/OTAY9BYgRSIBTrBI3fydbx6MJR5OsqSq9Kp9PxiSUDwMjKTr6CEXNXtUuiQ5HMvVtp+XMnAyajvKA2hfqlouF3MHpRCo4rYkw1pWf6SWbpE8g3mSrBHyY6t8cuO88hIlwRMntSYOu6RRcByk+H4gaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113937; c=relaxed/simple;
	bh=jqwOPTT/o5N4P2uY/I0h1RKQxATI/heA/jcVXeksvG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/K5AObzqwKbu9dVTPyDx1z6jsl9qYpPE4qU8qFS8MZ7zvl1Nc+jefkGE2JU33oBqHbbCML3Vg2NQv2PorYa7cAWDB/+yQN4M01G1QaValBLTPcp1pjdn8Up6jaxXrIvj4SqWjogrZgsFyGPRGLYtxCHoX7GUIwyTm7fygkWK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE7UpE/W; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE7UpE/W"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a23208a0c2so2983790b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113936; x=1761718736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqmjyts0iLEXMuKSaol8oJR6HT/TScQSBk26ZZCHWOY=;
        b=jE7UpE/WdaLzuxsgJnKdn9zYAOeqh6n0OvdVMcxU+W8FjvNNXEpolRgX9zmk8vyfi8
         uhL66xq57SxK2ctiZBIixo5Hz3LxY99+TDaUNj2XhQj1cw1OofLh+SsDWZPjUyci9x3D
         cwlC4IdGutcAT9EPoQTj/ZBm/hqXPjkDrHHWit1iKMOh4VwomD3vWJ9kqoavHPvnNmBV
         dRD0v79kyGLv7NoNPUMgjZap6VGE5Gz5kvJPpyBc+OSLP5e3lCGNMO8EzHjq993D/qZz
         ExL2PFei2AouKyDZuHjnpf5MnXrdp3Y8cLsULxyoKbiXDHAjr2oyziK2/RfhTuy1DK/P
         420Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113936; x=1761718736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jqmjyts0iLEXMuKSaol8oJR6HT/TScQSBk26ZZCHWOY=;
        b=PksCmEQPpcsFHqYz3iSHwqQVGZcbOjRncGtQj/SeqO1BaptGeL4wRiJB3Vf/tTQ3+b
         gZW/aSnli5UwWc57za8i/+8Po+XjSQaOMvpE8AQX6niqefqwYV6EK3YXn7e6H5o3wj/s
         l4EVos22j6rMytKrMHvENaoNv6efM5bJ5xdI7dYwnBcjhkvnpMmE2BGtovBuVqqH5jQO
         gvasMPEfD9G4JUFnj1D/DIrDYBDyHpRswVqSH/Qk4r7kGSX8Tsu97iRlo8ExTWmzsH4j
         dcdeFj5vMc6GWySb9aLFrIsWVfPKGcYKjmvwaRgMU4lSAOYe5Y5LiRGww19oZY26MNUW
         EUWQ==
X-Gm-Message-State: AOJu0YxiKYqYnjrPKLtPsGcMvRVovgjbveDjPBZoyjEgE34u9xhfAS2z
	BwjlcLxdCX0JbdmB75E6+ar+HM4O6st0eBHWlJUSLCND5/inOUXt1Wuc
X-Gm-Gg: ASbGncvf+dYlXWLz5fu2wAeZajvrg24aTHFH27tSuZ82trf8cOvl7u+5d7vJIK+9KxF
	HNrVy36ebb+pnn5yNzDhxBVLu8uDZ/eaeOCU9/MlhNQxus2IGU7pYUSe9NQc1Ha0swLvYR0TlD/
	L8mQE4Pe9vOHSWBTmQskQopVzr/CgBwhp+YaPKtby4Kt5ZkqZcGT3ER3pdLBTPY8Vj4SbbLFFqW
	uzb+eALMWKbWeEad2OWX8BOsekZ1P4jnjTMxeCtog8RvNDBTBuBk8YcQWhtPrmF6Q1nXpgWYWz1
	XtfpNgMJ8S/GtLGlvJ/G6Gx760YDTA6o8S5PUU4YnZPOaDpjZd6SZ1ZybGPj0rAmtPSTLjGIYCc
	r4rRXYUXCFQWJ1KG7BW50vIqTcCZJzT1N3Oh/3+5JYAN2hUJ91xrmH2ogBITMBpZ3w63pBbFRkj
	RBmAfEJp4QnTqfItTCQpLa
X-Google-Smtp-Source: AGHT+IHWAz5aP9qy+1rYMc0xt93mKN+OYaR01Ysz+/Q5ePURy1P35G7B39Q26SxFsqTFF7yaOyzz9Q==
X-Received: by 2002:a05:6a00:1826:b0:77f:3613:b614 with SMTP id d2e1a72fcca58-7a220b259b4mr19881506b3a.30.1761113935522;
        Tue, 21 Oct 2025 23:18:55 -0700 (PDT)
Received: from localhost.localdomain ([103.98.209.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34a94sm13442433b3a.23.2025.10.21.23.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:55 -0700 (PDT)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dharanitharan27 <dharanitharanr05@gmail.com>,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH] [PATCH v2] staging: rtl8723bs: use ether_addr_copy() and simplify NULL checks
Date: Wed, 22 Oct 2025 06:18:25 +0000
Message-ID: <20251022061825.4035-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: dharanitharan27 <dharanitharanr05@gmail.com>

This patch addresses multiple checkpatch warnings and coding-style issues
in rtl8723bs:

- Lines 120, 212, 215, 249, 255, 256, 261, 262, 263: Replaced
  memcpy() with ether_addr_copy() for MAC/Ether address copies,
  following kernel best practices.

These changes improve code clarity, align with Linux kernel style
guidelines, and fix checkpatch.pl warnings.

---
Tested by compiling the module successfully with:
    make M=drivers/staging/rtl8723bs

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
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

