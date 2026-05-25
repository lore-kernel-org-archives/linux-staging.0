Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF61A681E
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727178; cv=none; b=PXH6IpmliwnqU5Dv0OJNN5LgUusLQKj4Q4VI+jF0HtJRCyNRnT4GRByBh3Ek73+OiVoKPHYfKreacLBVwcXdzjDeN5olgUO2inZkOmpaO1pUIOVZPDov0NmsjdglSB72D4WnP0bimfE153pg8fNA/htGHUIZAqc4s8Tvv2EzE84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727178; c=relaxed/simple;
	bh=HMRhP5ggT+1hhcC9Z0Zt5C1cJ/nhIgPsBA3x+qDCJqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQPJoeKHpSWPEgR5JH60D6Wqz0x/BzXtGwTAU883RUHVXwMnTXjjBLWsWSpFOmRkikbJ4eoU5uf5wBCD20+KIL1kytHmeHHE8fStRGnZoe3LGw79eCHQMXsF3/h+bcLeS0ASQ64fapp5BDufINAi/uNMdui6fHEIdzD8kSnK4Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=KjJacrWq; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="KjJacrWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779727175; x=1780331975; i=artur.ugnivenko@gmx.de;
	bh=539/pDJ3h/4NAqnGDggfJgutWVcpO28OMTRiXlb0/Tw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KjJacrWqxeegfjFWRuCQ005MHVGy6ysHR/4YP8iYPDdQmnG0LT6L5d++pWfxJ8ka
	 vdpjVcR+wc7WV2v/PzpWKU0fptoQTO7oqhvn8Rw4NOa/sNl/kSpFMezVgqI4wbWKZ
	 WwI5iNztOUOCTml5ZWylmZBhdF98GHFYemJBVts+1YfDEWIuoEy8uAVkR1hvS9d1B
	 Tt199O0AQlLIpyOlBR8FSD5AcMvqrPGBTJHk0NXMduqy8rq2NbsP2uhAjHi5OjYZw
	 5srNYdIi15PO4GVXP5BzDBTD0QavaQqXMmXxSDBHkjA8pfDZbDfLU3HoLSGznP1oH
	 4vOUC0jWcDUBL1SSKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1x5Eko3pGS-00dUQJ; Mon, 25
 May 2026 18:39:34 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v8 2/3] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Mon, 25 May 2026 18:35:31 +0200
Message-ID: <20260525163532.20317-3-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525163532.20317-1-artur.ugnivenko@gmx.de>
References: <20260525163532.20317-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tws4YU7WbvHUNw2JGQOiOpaESydYa+K44dbMSQpC830bNtwoKmg
 TrgpVAD3UIdszQduFE1dYg5Fb+UfhXcXG9IH+SWNl74T42SY/S7qDm6TXuRVXj6F7aa60U5
 4+qQSNzd6l0fmMpZwgBSN0xu+Rjb2HmrAHLcrAsiSdr4M7KXdppDHSyB8gvtLtdJtWJ2Xrr
 342sWzaOmFouCrdt4wnUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:60pcD7uB4HY=;aSKPGQ8upWjsLVuDLQLH2s6x582
 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
 9GaLZG53N4S3qAcjlWwA4buf6Ok=

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on inconsistent braces around if/else statements
in hal/sdio_halinit.c

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v8: No changes in this patch.
Changes in v7: Add changelog.
Changes in v6: Make the patch apply to gregkh/staging-testing.
Changes in v5: No changes in this patch.
Changes in v4: Fix long line checkpatch warning.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make patch apply to gregkh/staging-testing.

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 43f9c45967f4..6f2aea984b30 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -36,8 +36,9 @@ static u8 CardEnable(struct adapter *padapter)
 			bMacPwrCtrlOn =3D true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
-	} else
+	} else {
 		ret =3D _SUCCESS;
+	}
=20
 	return ret;
 }
@@ -1011,8 +1012,9 @@ static void Hal_EfuseParseBoardType_8723BS(
 		pHalData->BoardType =3D (hwinfo[EEPROM_RF_BOARD_OPTION_8723B] & 0xE0) >=
> 5;
 		if (pHalData->BoardType =3D=3D 0xFF)
 			pHalData->BoardType =3D (EEPROM_DEFAULT_BOARD_OPTION & 0xE0) >> 5;
-	} else
+	} else {
 		pHalData->BoardType =3D 0;
+	}
 }
=20
 static void _ReadEfuseInfo8723BS(struct adapter *padapter)
=2D-=20
2.54.0

