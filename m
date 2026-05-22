Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F33A545C
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456022; cv=none; b=mCqBZFvQwQeLGgHxwTR6H6VPWLRBkKRoQ2+X/0D4VCvK1gjsqW+a641eJjn5rSksIUq7vqJvx/QU8nh66+noEH3m4zFkFi7GuEyEK5gGUoyfiUcIrcvMcQMe43aXzxjYiUS+HDW9M16X7D8ZLvrvDKNNMcGH5p5SWllJELcQ9Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456022; c=relaxed/simple;
	bh=lZh/EdTtkWZiWIr321o5lzywEu9A9eIGGV6lNixVKh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umr1eAfCH7VIetOON/t7IZKI00pmcER9BIhg6T8oIxvBaKsQwiLhPihmn6P5Gd6dP+KtO5wqxzA42TdQ4FEnVinSnOXvKbXT3mnukzA7+4t4/GZ+Xc7cxl4W8kTojxBZXaF+DSVu/rarugQe2aSscYwtMeUUMcJ/NchjW5xiabY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=NWo0Yl5I; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="NWo0Yl5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779456014; x=1780060814; i=artur.ugnivenko@gmx.de;
	bh=1mEkNe9jHL2VQb4ULywm0mQzZoojdzUjcQDilOICR5M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NWo0Yl5IU+xaHo/clPkic7R3lZypCr3uGSTJ9LaS/IhkOLzXUwQXjR0Yy9WLquiH
	 X7bs9yFuZTGyybaNkegwzisF5BbwoHAeNBNpLTgYp3rieduIgcEKA188W8dk0k48p
	 oS60jbQRIxsdc9HKTpvxfW5mfPEqdAUm+O1WhWlj2REgKKnc2jG79Ew5uhUY1sRTu
	 GpX/JJwnUuGGtWyYO+lAmTGQ82Oyp9gdjtW4Y4J5plCDneAltXjqt5Fmwu7pur19s
	 GnyayaAJ94ejo8RXqFWfw3cjtJ12sV+DvisNUDEk6d3sQn7FFxMsLGBVDlh0NJ+ty
	 1QJDN9DxgNpe7k0LqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1x9PfJ0ApX-00aVS9; Fri, 22
 May 2026 15:20:14 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v7 2/3] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Fri, 22 May 2026 15:20:00 +0200
Message-ID: <20260522132001.4771-3-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
References: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EBoUJnxBc4khfUdY+FqdEnZdT8nJDdaCFiz4LUcCiJBxW3d2E+c
 BdAXzDxpVNFNPM/mfKufORHhl75TfX0ueR3nv8ywFwTTcxwKcvVC3GTltEwKKsk6j4OxtAz
 a7xp9HM1Yyg4XS6gxn6dNo6ThjCEk++5piADOeMEwZWoAxJiuu70eUYwtdc1cRwHhpbzEtz
 ZkZaqr0oS59pyjGkoEEAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vEJ6kKkjSLM=;xamiQp1UkryJOOrksLrTcv25RhW
 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
 SmCcLA==

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on inconsistent braces around if/else statements
in hal/sdio_halinit.c

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
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

