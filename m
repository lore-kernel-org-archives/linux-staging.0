Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FA406263
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107152; cv=none; b=GPhDb91dt937n/Aa549YZJw6+zJduUZHBJAO3pqpgAeeNJZHUM9a5CsM3eHmgp7UEya3xKX43jVhKLqMIARp1tDEowH314ng7PZM1cHfJW+wEyMZdASXky8IvRdTqJULOJk7lfje0jVJmikq8ixOF9hHmtpE3CtSK2x730dJMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107152; c=relaxed/simple;
	bh=157DUCG4ip9nOJzJDvwN9L3Q3hRbjwAJ3hXzMuBNPgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrT1vFmk5Y6pPxRbZxzAA3PPZqnwACfxJV4dhRcqjsZahEAqKFHpmA4eBh7RitLzFJSyPqLr+79ENGCGPArNIGqU14esOdwYlEGi2nxZf6r6kEGCbzZZZdqoYAJJOnuovwvIZeUdKZpCT42+7nSJ1vEZZms1fod/Ny1nViL/URM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=evuh7STN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="evuh7STN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779107144; x=1779711944; i=artur.ugnivenko@gmx.de;
	bh=fL+3ciY0CpwlElXQcNLK0vHMpsN2Q68x/YJ0kiIY5UQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=evuh7STNnFDRKJ3H7IpkUoKOGGZLZNwybtAABxIjIhPj9qKaWUfw00AAhilb2pox
	 QPUWORPl0yHQhB/+APgcZEjLqCvWMDfuD55Ze5RI74di0H2nHQxytz5Zrzuhy5rSr
	 jdGRFcPltop95G5bx1hXBIKt3VZRpF40ogoHaKqDSsCXZqHZdE5q+jgPSCeD+mDSM
	 djKTuHsWByhls0HqOb63pG3rh7W+/6xMRx6ezRq3TnlmZl7InusckVeTVfTQerS3M
	 fEsj/QYicXMWMuFl55qN66on4sAVHUpypFgj89VppS+q599+k+FJc6Y4MNjLI4TtT
	 Bimw4Hh8zMopu5tLCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1wQ2yC1Ev6-00GGeC; Mon, 18
 May 2026 14:25:44 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 2/4] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Mon, 18 May 2026 14:25:41 +0200
Message-ID: <20260518122543.15266-3-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518122543.15266-1-artur.ugnivenko@gmx.de>
References: <agr09UHduXJKU_bB@stanley.mountain>
 <20260518122543.15266-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1E4k8xeJT8QhOaq8bWKyMVTH3CuCinuiuLkhtqOXPT1WtfkxfW/
 TGNRbFztUH46LUVilOLQVFF+TE473JnC7YMFRbPOVf5wX53UhF2VS3QH/IRyc/GMpL8PrGb
 gtVj65aOuQW5WX9mrQBSGkebas0mZY7wp1vpA1+3QGQvqfjagHWhOeHSdkMqbSjIBX7nUUc
 SMOeNT+u9wwFKaxRsm4jA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r+vFdyxuWVE=;rWM/NuIU78S9P8UntyzbynADxEB
 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
 x6fg/vUdWBkO4dw==

Fix checkpatch warnings on inconsistent braces around if/else statements
in hal/sdio_halinit.c

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index dd2736fb5c04..3756b8e3d8e9 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -37,8 +37,9 @@ static u8 CardEnable(struct adapter *padapter)
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
@@ -1027,8 +1028,9 @@ static void Hal_EfuseParseBoardType_8723BS(
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

