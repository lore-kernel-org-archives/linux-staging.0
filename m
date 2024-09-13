Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E7139D
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 00:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187336; cv=none; b=G4yGKS9wesPtWdOPqVV+G4bk43vMA3PGwvDobO8fmnmr+C+VSCYit7RN3fdaSzR+3vFj7dStwIAE0Qy+21p7bHvaCjqtJ7rfKMVxBJ8H+3oXDsRkUnmVBpYubGToaQVQHz574NgArDfn/uYzC98i+lzRgXhLk7Qvr3L7krOTVw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187336; c=relaxed/simple;
	bh=w3hYJNCsTFLX7ZRDdVCnbd+NbEJ0/iGplX2dBfIkTY4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ass1gFv3ml93894vLMMvuJgAl6BWK/AxrEYn41YUj1xX6K/s2EMLXGcxLpchCn9rOcuZAvbSvDzUHhQgBduj3jUenlGGEDDXYJ2RAUFoFLc2XOlf5OYzBjTv+MuP9NQtYv8x0T++u7lZqLQdqfeFoC6z7ErTbYbOltCBDaOZW80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=u/igmZY5; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="u/igmZY5"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48D0Sp1B22030641, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726187332; bh=w3hYJNCsTFLX7ZRDdVCnbd+NbEJ0/iGplX2dBfIkTY4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=u/igmZY5GF2JHV+evajls5sCqd8v63HwEwrxScBYW6X6h5KnCjMElJQIjcJtsQ/GP
	 gTFILDtwXI8crZVvep/40Ef3ByfCt66+4BWM7jRv9fs0F1fhyEPanUr/2TBbf8QjZy
	 t1a9wuOjZBFeUk12VhnjGzDH8QNpbuYTF9acmEWq1pGZAtHqZFLaUpASpfZPE0nJkS
	 Pv10v52cN40B6JadKqUv6+zFKPU4nY2fA/DeDxN14hUe3B9dJ/MtIcU8ed9Euww4Yk
	 MwZ/f9SMaRtwCF62EYTHCmV4cHghArg2MRdgE5y39GNurIsYm9Srmwx0h8HMNPfejZ
	 kEYGIHVM9fudA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48D0Sp1B22030641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 08:28:52 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:28:52 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 13 Sep
 2024 08:28:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-staging@lists.linux.dev>
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove unused efuseValue from efuse_OneByteWrite()
Date: Fri, 13 Sep 2024 08:28:13 +0800
Message-ID: <20240913002815.5149-3-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913002815.5149-1-pkshih@realtek.com>
References: <20240913002815.5149-1-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

The efuseValue is to store value from register EFUSE_CTRL, and set control
bits including address and write bit. This is no need for RTL8723BS, so
the consumer has been removed. Thus, remove these unused codes are safe.

Otherwiese, clang warns:

rtw_efuse.c:285:6: warning:
	 variable 'efuseValue' set but not used [-Wunused-but-set-variable]
  285 |         u32 efuseValue;
      |             ^

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 6419638c6e20..8b671f8a7965 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -281,22 +281,13 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 {
 	u8 tmpidx = 0;
 	u8 bResult = false;
-	u32 efuseValue;
 
 	if (bPseudoTest)
 		return Efuse_Write1ByteToFakeContent(addr, data);
 
-
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
 	/* address */
 
-
-	efuseValue = rtw_read32(padapter, EFUSE_CTRL);
-	efuseValue |= (BIT21 | BIT31);
-	efuseValue &= ~(0x3FFFF);
-	efuseValue |= ((addr << 8 | data) & 0x3FFFF);
-
-
 	/*  <20130227, Kordan> 8192E MP chip A-cut had better not set 0x34[11] until B-Cut. */
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
-- 
2.25.1

