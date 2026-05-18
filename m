Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F403D6487
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102737; cv=none; b=PB1qlJtYldh2FJo5OqLExNM4QQcnZTFfJpzmO/I3y3N7+fFH1RZ5R0rRunATqvRICEZbxGuo9pvyi/9tgehPGWTKwLWDCK6wQpwv/UWrzUFbj3X5+QVxEXoqyVSAGBsQpM0J8wLqIyJpkLhtfuH8en/g92mVEqtJOPz68H1QNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102737; c=relaxed/simple;
	bh=Z1tw1ASxAWl3vu8T/oscTw0RtOYagrxdjkYmnREwLfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOJ6Ex8VPshI4H4DOEXq0DJ+7B/ToS58eKXE8reKONIxtaLmxQjvVNDOhz7FsNfxV4wRVfqMUPOZAv/3hm5FeSehu5sW8cHLANqj2oO4I7gFexOWlMvhFX8TYNiejB/kHxr+1r2viNKvnReonhHM0e5zelM7zJofbUzymzQfK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=X4ze+Pv+; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="X4ze+Pv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779102729; x=1779707529; i=artur.ugnivenko@gmx.de;
	bh=tWOKrHqwG0E3nr9cY8ssA0/YmCGbRlvQdS2UYHXthtA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X4ze+Pv+jSJhE4c0jZheKY7haqCcWN/M2LR2qWTcS14Fx4mWbgyZYgeC+/nnzPIi
	 Y+V6KZvk4oPasW7p3HvHK9M5JCuXHzM2Pu+m9a+N7/5yaPhg/rH75E9xycEUIHFUI
	 VMuEp05e0YvtMXwTRzsXcOPpbLeBZHw6LzMVmIPyhzhwSGgk/Qzou496j9zqQl3sA
	 EOMBQfIHulHMiXyJ6yDDXrNOYrZZHhJLCIdJh9PSnx7GiDoIVy9UdGHUNMp8VVfrC
	 Z8wDUoWB/KiWoW/3fwVHpWUS+0sHQFB+niYdA+Lag0wVbYuqIZfeDPCZV48og3Qcy
	 VrT0FmCbzzsUqoRnWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1wYFIc2ugg-006sKU; Mon, 18
 May 2026 13:12:08 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 2/4] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Mon, 18 May 2026 13:12:05 +0200
Message-ID: <20260518111207.23143-3-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518111207.23143-1-artur.ugnivenko@gmx.de>
References: <agqlgeaakrF1wNIu@stanley.mountain>
 <20260518111207.23143-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+tdm81nVBDgyls61FMuNKiZDBagqq9LaofhcWRPeAEfhmM6XCU0
 ZWw6uvmUwvs+Oq8JWh29evZqu9CnO7dPzA2maIApZ8/873UCDbKbuGl3b/J5epcnqCqvbvM
 sOlxr8ABVozHckuxzT8TCLOFb11FpCw2c5LMZVFXTYbW6/W40EAbRUnABTwb/kM5Cp4RsqC
 ZamaYYcsjllEfHiwrxJDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kithbqnJjoo=;X652X3+4Ixtdunvx2JNRx+Yatcu
 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
 vEBN7IzBgGJ4rNIGjvab33Ev6pLACVsbDoO4=

Fix checkpatch warnings on inconsistent braces around if/else statements i=
n hal/sdio_halinit.c

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

