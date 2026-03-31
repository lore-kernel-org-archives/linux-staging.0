Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBDC41B36F
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972424; cv=none; b=Rwhpnd6Bl5G6bjbz/lMNjzeRR5k1cSzblcMySjvFsVLjrjvlPrlNh7yvddzTxczbPIxiZmyKTtLhtk/M6TmjBjrFn05rN3PoGK2JDbAv5HAfg5Q7AS9RxR4BELBLxrds9Bqf6N5WdNe2DTXFZws1rMRW+H2JejyR0LX1X0qDlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972424; c=relaxed/simple;
	bh=V35+6/k1zqPRT/8hro88i3dXlcwjksJvy2utUOJulfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z01GVqmgmhvsF0JzQ9ikHoaP+o29fTn1pdHCax3BPvVl5ZW2XEzwOt1+54xRKhFweRfJxsq+eW0EFCybFZIz1L2ZoNSksCiNEW6uoJsIdJpyz01QY7BiYFgydtF+Oeso2BxSbNy8M2uaCnDdl6nCYW7eGeiIrSCkNBP97dfKmVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F58EiYU2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F58EiYU2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38c01150eb2so47098901fa.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972421; x=1775577221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZo+MYhY++nozTEBgP8F1gTkvYlk8BMw+q0teHKhaNk=;
        b=F58EiYU2u7LU+oycq34nm65Ps68htgKjbTu136k+UFTqRei/G55vB/opFgsrhcZTut
         6+MeFCviuiDM15NjbJeU13c9w691IiCN2Iu/ZVYbaST2H/OQRMdZ0xaCqxNdz4/+izZo
         ASa+Yo2iKmJfSOKT2xrOFigt/Ii9px8xtJkOoVdYcySiIBAYifE6544t+9WI39lLewf1
         qkwqU6UByaVmeMbT6Cy1IjkJ0FIMha/Lc3v80wUPzojsecfhUmw6+LQiL9ThVNcg9y24
         XsoKkO9r4Fph3ojGgJC96OmyaCbimxHj/gpeBMvveG+nVmb8l4n538lzVOju9aWTeKGO
         gZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972421; x=1775577221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZo+MYhY++nozTEBgP8F1gTkvYlk8BMw+q0teHKhaNk=;
        b=aJb8omx/LNIUM865qDPZFp83e58seCWxdYNX08BrGtHT2qdNsa2M9b569wt8363nws
         fn0W92lho3Mb2RxIz1nj1mVLEKj3FP8An30+92Cw4nTpkECl8lUsk5inhpWKWDuoPxY1
         FaZa62CA6IlMhjqQ6/X20kN6mN8tcTZMIedc6fNXdzzh6lK2EvMzvoT5OLcJ1BAw6Rj4
         m5AQelhYBoe5sezCN3cLpx8vvohra/BLEX1nOgZYIE/oxHQuJb0LqUxdQCLSouFy+Ib2
         tsjhUvPpgV3+08tskMcsglUKf2I1A7d7O9xWUfsqbLCEeH3N6BqlSQUhGQAKYjjt71V/
         xbcA==
X-Gm-Message-State: AOJu0YxMf3ben6lG9k5sV0p3SUp/Qe9cac5uiA/+MVdwUgOHEzf4Pubj
	Z3qk/A3GVJxeocrJ+BNDcGZWbILSQkHOYI/NbQRJgD48n2tLXe9zrKuATdTjKOrO
X-Gm-Gg: ATEYQzw2wL0rvSUovAIGaHg10pWyonruJQnLvY56u+Z75k+wGiEpGxyDpxrmkVDsxCu
	c2hpfcrsgfkgxIuSuWlTNiYL5hFv63IlzQdl607/KACS1wrrps7w79qLZP6Sess7f7OvTDvuLf8
	g6QmeHfD52cKCS4tsmJmKrxURgYip8z8cftn0qMYoyGx+WGil+Adq239DAt78nTVKx48phDGWDJ
	8bY6K0nOELLWzWA3+v17/AZHCvX/m6OBSDfRb3Zvpc5Jk5G7u3rbS/c80WzXYuMxBi3tpR1ZFII
	NxchJV7kUCiRdYS321zH9wfD5GAoRHt5sZa+OqGVT7/0Taey64shrO3XDZy+IWtZl8Pnhy++Hjm
	SkXp1Q3C4bKhL9bArIifrWsueOft0Poqdqo4Ik5Nl0KImplBn9UpOzfTDQhyE7ncHgeE+kat286
	UkUbN6B0bTkKBwcpomTHsZDkoprWwjpEDwfYW7QhmymQJJw9H7T+8t8aAh/b0PYg==
X-Received: by 2002:a05:651c:20c3:b0:38a:322d:693b with SMTP id 38308e7fff4ca-38c7401290fmr39310531fa.26.1774972420363;
        Tue, 31 Mar 2026 08:53:40 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d42d0sm22935991fa.1.2026.03.31.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:40 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 5/7] staging: rtl8723bs: rename global function to snake_case
Date: Tue, 31 Mar 2026 17:53:16 +0200
Message-ID: <20260331155318.185117-6-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>
References: <20260331155318.185117-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames EFUSE_ShadowRead to rtw_efuse_shadow_read to conform to kernel
code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 6 +++---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index f873250e0f7e..94b00d3c61cf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -234,7 +234,7 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
 
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_ShadowRead
+ * Function:	rtw_efuse_shadow_read
  *
  * Overview:	Read from efuse init map !!!!!
  *
@@ -249,7 +249,7 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
  * 11/12/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
 	if (Type == 1)
 		efuse_ShadowRead1Byte(padapter, Offset, (u8 *)Value);
@@ -258,4 +258,4 @@ void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 	else if (Type == 4)
 		efuse_ShadowRead4Byte(padapter, Offset, (u32 *)Value);
 
-}	/* EFUSE_ShadowRead*/
+} /* rtw_efuse_shadow_read*/
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..3b3fac981a27 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -574,7 +574,7 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
 
 
-	EFUSE_ShadowRead(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
+	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
 
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
 	if (tmpvalue & BIT4 && pwrctrlpriv->reg_pdnmode)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index e73f9396e9ca..1012831c7eb5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -73,7 +73,7 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
 u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
-- 
2.53.0

