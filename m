Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926543FB7F2
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988258; cv=none; b=ttHEC/xNTymHsKIoT27CBsSaeVPTpqt3+fQ0JtXnqFkN3tPJwC6YPlnbWjLlcAwlUMgFklAzGPDQkA9146APwfwfI6q4iPDvqhAmk9KQ2kIt85bzAPk5myx3cDkeRmx9xR57qD/CUyQj9T43iI+hRCU8LWvH6YoNa9sK0U5r8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988258; c=relaxed/simple;
	bh=bOQM903PnZVuuQR6AQc4pG50yRSBxLjnqB7QyRaSPzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ud6JbUZZhJH46HtgHt/dDuvURytWzac9zvR97HoQcDLfdjWZyVaIdlEDJ6ttQtgCsMWCUvZQ4w4gXaSbVupzVh5indSkB1zlDeKPJBTuWxTmcWc3s4XrZ3gwPLZLa+krVJWnzH1Ht2+L+/IxP6zOVMGtTpFogjLbUpmGL+cIKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=hpvIUeES; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="hpvIUeES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779988248; x=1780593048; i=artur.ugnivenko@gmx.de;
	bh=anB4PEoLxrm/M998Ac/Ppi0DtnUiUqEJzUrn6sJIHEE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hpvIUeESe+upfaqu3RURPGfKyvhRqIe+PccGxIXgvr0J9eDZ0WED4048z17jo00O
	 EtYGNoj0CtlHUO4Drf6Soli8pkTU0RUdy6zjPs5BdYG2yjN3Y1ASilOGStJjvMy+y
	 bqJyw0rdblKSigOHM/7A6y25tuwsqWR9QJxCr4eT2NFq6Pvrf3ZAo1fvI16ePZ/GY
	 j0c6PDn/RCCN8GSKn1EB2ZgCVK4+Ns3LcB8CV+XMn0Pyqb6/qsVfuog56s7QlyqH2
	 V1rcruGalqjd1TmdqcSxUYtzYMSdXu6Vw9FfuqJZi2GTIz9Wixufk978mkvvzjJ2X
	 MH7IK50ZbmlxkvBprg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1x0LBF3WTS-00nwhy; Thu, 28
 May 2026 19:10:47 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: ahmet@sezginduran.net,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v9 2/3] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Thu, 28 May 2026 19:06:44 +0200
Message-ID: <20260528170645.30861-3-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
References: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nEpA9NvJ/rGgv8gtO43V8AXYf1v+tCufyuhKj/T6nuaOAF3/gjp
 MKEU1xC75re5OasV26OzrAtFk0SrjFfDTZvqvmVz6OSVh8qBaHiNbk7uOkCCtsSUGH6RdsK
 FczrJlCsXb/WUkvakw7PqkM9lEdugUQSukm+89n++hNH7dbo4mVKpT2JD/bqxCIB5A+SDo4
 EJSZgvIO6Q+cH1P+4VDGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7ODIjH1J0as=;UHoW1ddx+uIvQtIneSFpGC6XTUx
 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
 fg/cxw==

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on inconsistent braces around if/else statements
in hal/sdio_halinit.c

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v9: No changes in this patch.
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

