Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79E3E1718
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371527; cv=none; b=qe2YjfruXNWFsbxv0kCojUEbtNOF/nJ9C+QTQlK1a8Y2hNR20mXa/FGfL4PR/HFs+CLwifQFrht0p54t014GD7D29KkVXEYV1VtKKjgy/tG02mfi2gDbLf189iPms+FG2zA5QGmwyEJeMAOJmAZrs5+7ukQC0qjs2JDUOi19A5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371527; c=relaxed/simple;
	bh=UYOMrLvIb5R5tHBlEGYm0EEZI/UQYz63CX6I7FXIf3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjMB/fBihhv/xYmlcVwzBT7+CoqqvW0fGviH1JwuhAdq/pacHNp9vZKhQ2+dWPHqAcH/ps6WbdWwQAhUxN1OCBoJBn8vo5/COyRvYzT6XLG9PR//u6VRFcAQeLleE8vXz8NMcHof5COY+dtceAfzAKXLjn1FDUvga1nO57oj/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=fjgrx9LS; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="fjgrx9LS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779371518; x=1779976318; i=artur.ugnivenko@gmx.de;
	bh=FBiDT83D+j01rnnfojyOieJntmjgJllJQxIjHOO+Yrw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fjgrx9LSw4Gm+6yWIEkXOCRKH1xCcLymFMR+ObYvbpofHq40/q5kkBywNFjfvZQn
	 DF4YP/bVRT7MXNmPDEO6+IuIC+K70AK67rN44njhMb3dFYxygYnmBF8p7ZSIy5WXJ
	 Mel2l2D+eO2KFKKLsfEyxOpIUHzs4SoBLyztekFOMzi+HVZ/Coap2Yegl2g4jMs+P
	 6eXqHcRLPvL7iusARHDLFEhqtef8mAk829Mpz6eSBm3YQEfyy8p/M4vdHgXnWVALP
	 DUX80AI+JNpLx5yNBWoK2AIAciw+1XFbwEVmuWUjPZ8uj4Y727Qb+AwHhDXBxFUD+
	 BJrKvedorupCxRm+TA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1wdrpw2Raw-00Os8X; Thu, 21
 May 2026 15:51:58 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v6 2/4] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Thu, 21 May 2026 15:47:54 +0200
Message-ID: <20260521134756.24546-3-artur.ugnivenko@gmx.de>
In-Reply-To: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
References: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xmh4vKj1foDqiaGD6me3h3qPzicFxZYVXCt227BBZwtAF8DoB42
 tgGNi+0z3pkWHjDYpBGD5PXf8LDecDyDqjQpsoAr+Q3kj9xzOPHHh+0EAc/iHrhmpgGPLC1
 DBetuRDMO5RrPZzVR41vXxfU8O0eFJUQSq+NrATY/cC9bWzpa33WFG9L6aHTangzU9US9Zq
 h6IRRoESSOG98zf8EBIXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z4I7llxN+Hw=;444W24j2ONc8fNJmMhgrBZ8hNHX
 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
 Yv6xDpLQj0805mZjE0iQgQI1bEY=

Fix checkpatch warnings on inconsistent braces around if/else statements
in hal/sdio_halinit.c

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 5663f97f865c..a06b040fa7eb 100644
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

