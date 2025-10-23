Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1AD331A43
	for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231576; cv=none; b=hIbcfRpl4TUYnocJaE8LXIjTgieF8kmqn8+9CvHIm0N7YrQpwNeqQJ/gs44lhsVkY6vkvEIu3DkJYkzJ29CEyUHnM5xCqdh1nSgTomo1tfDW+/7z3ZU+mPG0pfTgMny1KKEwd9NvnvkOuzjluEwDalGj6ldClpOncSv+RwRzNzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231576; c=relaxed/simple;
	bh=UvUk4Cfkfi9r77rELq/+WNUdMHorLknULmh5BUdUL9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UTPFwV+OVZsntVb7NtYbQ4dfzw6Xv5fOvjmDcq4blhiice/1NZKZJGkIFL/YZ2zGZBXOyXV4t1qdQwQboviH0Q6y6AB8TaxnEI39VhCqVYfrhxf8JcGzYlRAJeknIS+vZzgssJXQ06M+o+xJy7nUv5RaqfZm0t0OTu3QmEeBOgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMm1OBi4; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMm1OBi4"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b5579235200so655449a12.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231574; x=1761836374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odpw8dN6lUxcomJlaziI/XaJQnAT5qjBzKqWsmjYw+s=;
        b=jMm1OBi4ekILuSTmRZAAMLngh+lNbdAqSr/sIFUV6eGGG+VolrXGdZsgvCCM9do7mw
         VFOc19NTRqVgdjzdyHNu/GqfkPMslN4wFnsBiJ2p4kin8A5VUnbaubsyzsw04Nqglpr0
         66hH5wi6POzWK3xW2L0BA2mxePfCvdxfzbVXcr0HcKkt+cX2OmC1PZEiuEmaaj7yEaJY
         VSLm/TIrwuu/oDEdaHDeKajN1SE55hHGdBrTE9mmlOlNzUjRGaDkZiuyuK7QJW02vwx7
         w55viT4yKsakEWrgFpLimdWB9v8hLCX0oolE1j9dIneC0JuvPd3QJAfdrNoATpWl+cmG
         KtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231574; x=1761836374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odpw8dN6lUxcomJlaziI/XaJQnAT5qjBzKqWsmjYw+s=;
        b=XTW5KNkcS5q7U7WRNs9oo7w0d4j7CSbQ7nmraoejksHGh2Z4GII9ib26p03thc/Qkr
         dk9+MA7itmivuzxFIOhgpXI3mgZOTuPurBx9dWi/asJ4WNU1QeRbdGA6GZyPQlOefSGn
         afwA2D3fdQduc3IA5SyTt6qHm4onraV1Pk8TMYmMVBGWMFk30NrD8oLpasHdBlsEscis
         wu2HXbGEQW/rfVTH4F6Mi76FJHwTCjI8gzyZ8Pl0WZzF/9Hx4LoDfQo5f8SfhpCQTYkd
         /hhLyedarMht+B2pQJScqFiV+ZrpnTgKmbThXUAp1vTNB1ODErVjVwke1ngXBRtvna+G
         AgKg==
X-Gm-Message-State: AOJu0YzL6EXYKpLifuIhyvFzwZXLa1b2OWf6mLv499eaeDg3nXeeh1il
	qD8N2mvUEyLPAnglrqIdIqPnqqMhmYf8/1DYJl13te99Ow4zrVg7SkgEF6VugOIM
X-Gm-Gg: ASbGnct0IhSYFLp3lkfuU4LUPXS0Vos7zvCWUJ+BZQm02BESybu84FqgZ7SHPLOYuBI
	7JGTK8Lr2To3EIhL/XBEtEVuByxxcd3HFCFRNjIcCsPLm4dtA4bCEoftuWMHkJwwbghOhG63Yao
	OZRjyVV9hYWFpNBF1ufUKk8VKwZObwHAbtzgSwjmQ+TbB7PEPs6WIvxMy5H/KiKNeXp2VBIo/cK
	+w96YWPFsehFLXv8fvKx1Z8/TCDhuZ3UwxjXhCTE2Hgtx2/Kizl2S7ckJVZdIc2S1Z6I9BJH2ts
	qNC/FYaCZ2NVaFAaeW8iq2vyJqMtetp02e86JZHJU53060Yznd+QbixqmZ0RnW03bGoWfSOhgvn
	oqDTV7eMDRdpuJ0QsuOxhQWSWYHQju+2Cusc2RfjIbYySu0RFFUwNR5jYte1JQ/p2O/alXYOZd+
	LUUZ1kIb/eiDk0XQcxJdGYPgytRma//Caey5E=
X-Google-Smtp-Source: AGHT+IHVWS9qmO9OHVeAZHxG/hGBfVEfeiu9abaZHH3C6VR72mqSn5An+od2v+NWoICwaYmeEmg4Qw==
X-Received: by 2002:a17:902:f545:b0:269:874c:4e48 with SMTP id d9443c01a7336-2946e243a6fmr37858305ad.47.1761231573616;
        Thu, 23 Oct 2025 07:59:33 -0700 (PDT)
Received: from localhost.localdomain ([157.51.64.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f3794sm26476005ad.88.2025.10.23.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:59:33 -0700 (PDT)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: use ether_addr_copy() for MAC address copying
Date: Thu, 23 Oct 2025 14:59:03 +0000
Message-ID: <20251023145903.2557-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replaces multiple memcpy() calls with ether_addr_copy() for copying
MAC/Ethernet addresses in rtl8723bs. This improves readability and
aligns with Linux kernel best practices for handling Ethernet addresses.

Fixes the following checkpatch.pl warning:
"Use ether_addr_copy() instead of memcpy() for Ethernet addresses."

These updates enhance code clarity and maintain consistency with
network driver conventions.

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
v5: Removed unnecessary 'NULL checks' from subject,
    reworded commit message per Greg’s feedback
v4: Fixed subject and From email address
v3: Removed redundant line number details
v2: Initial improvements for code style and checkpatch compliance
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

