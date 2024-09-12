Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EE43B7AC
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 02:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108062; cv=none; b=fWDUIx2KfHnT4KC0mwwy6rW6DHjJl9cTBrtgGYPECXPnVrR9sGABao6odF8EDN5TfbfmjPQ3P3wx66PSlxg2wPzJjC1OvWT7Fk3XHVtFmCLNvdasW2LS4Jv8Tt9/nTOePH+xYLoQ/Ku40LMVbLpK/kjsOLkhCCwc2F4Rjvlfpio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108062; c=relaxed/simple;
	bh=lqnDC/60ZJ10HX4wLhnX/kQ4aVENVa8ccyZYIcltW3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uqi4NjCCJUfsN1Zf/xTy3IZOHu2xlE7GaSqvk6hEgt0+2gfniH86gn+EjBZfO+CVAFop8XKTKyheni0qRiWUWpq651bQIQeOoHsG7XT1p7rTlL//dgEO0fM2oN6Vvyp/S40SNKNr1R/c+cZS/gIZHUGaPEhAAIZx6LuP5DL84eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=HDcsbgCr; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="HDcsbgCr"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48C2RaCuA521279, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726108056; bh=lqnDC/60ZJ10HX4wLhnX/kQ4aVENVa8ccyZYIcltW3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=HDcsbgCrEkmE/zyJOjvbXE7K55GJYwQoqWXvOtvcfoChTDQc3LfgAFzpH4nSTvlwv
	 5ZJwMt4xgnigdViCmSZ95oZgXa5BbC6yTQkOhdXJ8K+zKKgZIzEDZJOV2LFTwYcFAk
	 RemDw0oxZaYCKz1cXrr65aYFdmS6wztPnpEBtQ5m2eMIZR+Txo34AvfqZzX3tZhGGY
	 4cBuOnaBokv4bqgbwy3zsvU9rkDRBaUs64V6Np7UbreN7/yvAHQswvT7+zfNz8/GJQ
	 /1DDxtnJFyE2/LlOMVDCPjHwZWS4BDeJxPXsCsx2NDCpKIeD2r/TivPRvowM5HoSLy
	 PEBJE1Wk6QSWQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48C2RaCuA521279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 10:27:36 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 10:27:37 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 12 Sep
 2024 10:27:36 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH 2/4] staging: rtl8723bs: remove unused efuseValue from efuse_OneByteWrite()
Date: Thu, 12 Sep 2024 10:25:20 +0800
Message-ID: <20240912022522.10715-3-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912022522.10715-1-pkshih@realtek.com>
References: <20240912022522.10715-1-pkshih@realtek.com>
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
index eb848f9bbf2c..cf8485a3ac00 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -282,22 +282,13 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
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
-	efuseValue |= (BIT21|BIT31);
-	efuseValue &= ~(0x3FFFF);
-	efuseValue |= ((addr<<8 | data) & 0x3FFFF);
-
-
 	/*  <20130227, Kordan> 8192E MP chip A-cut had better not set 0x34[11] until B-Cut. */
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
-- 
2.25.1

