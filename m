Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41402EC0B8
	for <linux-staging@lists.linux.dev>; Sat, 13 Sep 2025 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=157.107.129.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757762715; cv=pass; b=cyJslZsHKA4RYTwkEqYXJVpBNrtWiqjBnMe4WDrFzhodhsp/tpBTsLG8vFCp4177pnnszsH2WZT50s6dlO8qd3OQBKPrJ9MQbK1Pd5McVHiQvuX09b8zWDh+NlO1rNIBpgyuA/ShGAsyrGNPeePIlQ6eTcO4r5L+KwxdWb4IaKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757762715; c=relaxed/simple;
	bh=/lLbsk13uGUkFZNp5M9ZI6OHD8QOwjwtdUkxXlpoP/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEq9zWFH4bsCdxB2UVPe09k0kq1hp6GG9pJw+vbJb5MQiXR8lzlXRm6u+6jgbUQ84y7EnZmVPw554ZRf/7FA0/W0O5DHSHowAq6kSi0LQ9RXP0UPqawAQ7SsQdE1BkyM2OOD/Ij86uRv3bs+uyMfQ7wuAnJ2ZV5awymss85tHjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=g7x2KQ45; arc=pass smtp.client-ip=157.107.129.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="g7x2KQ45"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 0C712107E491F;
	Sat, 13 Sep 2025 20:25:05 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUJiUqTiyZUz; Sat, 13 Sep 2025 20:25:01 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id EF19A107E491D; Sat, 13 Sep 2025 20:25:00 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1757762701;
	cv=none; b=OEUy+2zj+EeuW1TVlropTf2eBMWhv2+BHOsohSwTE7KSZG4YDACJ2StYTDsSgjfKOyWFMOkqb7dyBV2mCgMzDo5/edLIgUYobdOxEJm6dNWkkruix5LGxgDgIHymwvplkIfDJtowxgNQzYIk/qtY+9XVr2Z7ItUklwCsN6dmv8c=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1757762701; c=relaxed/relaxed;
	bh=Rv2C7/noojmqC2TRRtEf9Bz3sPzEahBwEFaiOr0bNE0=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=pPQqUIMJPYG1jZ1sSaGNIW6FNzpJSd5ZVpXSS0FPaO3tvOXmfSppMUBDBTx63cOePtiEI/lqNiWWuOxD6lySiSUiYGxFdO4gPfIiv9+uoo7dajrAkLQJH6jRYjjwklZaoe3HJT6uHarTlm7r1lt6VRBQ+5LmSi1C6EpH8B0KZO4=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org EF19A107E491D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1757762700;
	bh=Rv2C7/noojmqC2TRRtEf9Bz3sPzEahBwEFaiOr0bNE0=;
	h=From:To:Cc:Subject:Date:From;
	b=g7x2KQ45B0soKwZgFWNge10ScJ0FajKbPj1x2UiCJQf0B05N4OymhFLCy8FrItq6+
	 BTsAfCCvYaemyDoPcDCWyDRnXhMj6RFbdgDSesR4N0MvT1fMGUjxK/2vlc5/pu7Uso
	 VD08dYFyQarp64Zk0y/4piG0/Pi0CAZiOEpoonMo=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] staging: rtl8723bs: rtw_efuse.h: Fix prototype whitespace
Date: Sat, 13 Sep 2025 20:24:58 +0900
Message-ID: <20250913112458.910059-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Several function prototypes in rtw_efuse.h contained extra spaces
between the type and variable name of the last argument.

Remove these spaces to conform to the kernel coding style.
No functional change is intended.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/stagin=
g/rtl8723bs/include/rtw_efuse.h
index 669565fa1c69..ca1b58bbf3ab 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -92,10 +92,10 @@ extern u8 fakeBTEfuseModifiedMap[];
=20
 u8 Efuse_CalculateWordCnts(u8 word_en);
 void EFUSE_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 t=
ype, void *pOut, bool bPseudoTest);
-u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 b=
PseudoTest);
-u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 b=
PseudoTest);
+u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool bP=
seudoTest);
+u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bP=
seudoTest);
=20
-void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
+void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
=20
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bP=
seudoTest);
--=20
2.47.3

