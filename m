Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DD38B131
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362651; cv=none; b=WPxxZoWCO+Ed52tc9qN/p4Ir7iUSf30fQ3SCu2SZJ/FZNYhEx4oYyfEACBQ+6KTkcC1TOw/MSUFMsFAHTDmnAgdzf/cPs/q2BkygFTaTSGF/J+p1w7tPRQ3KqzEEAlif1Zu/SyJohiCM5T8byU8S4wF4mPfSbpl+Bw2l3czcbb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362651; c=relaxed/simple;
	bh=9DN5SzkcQasRygAYrGypb80P8H1gvR0Wz5htiY3vzbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7Vl2VQzL7z1es2kOBHtHsqyhCGuqjbpPjv1sX6KQ/EqEkGalCIAebdBY8moZWmnDFpmYeRPczBzDorwbx1VPn/c1Woig9fYDY828hjPEvbWfSglHGd1mwElOqKR564KVwAlsF9Egm7GfAHaBc3xRHh9Y7slTeccOvljFpOj/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=s/uhntjO; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="s/uhntjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779362647; x=1779967447; i=artur.ugnivenko@gmx.de;
	bh=X/WLcCYkC3ZXZ+GhX6SbqcfX8HHHSSZZWId5pwAY04c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=s/uhntjO4UMlEN1trhUYtAQ7ptkArx67tcZbZKKQ3KAJyjZX0j4zBX5LR++ekUnm
	 OlTPFJ/vOm/jHCwENCHOH/c3fL8FgmBP3pLrNiBYpYjiJw7Dfdid2mnZq2L0w3NyK
	 zD5zChs+kP+zjBT7Uw8prJIkqm44B18e8R50TszRwB6lbijjs5c7KyOfWnnPp7wZT
	 yYkVQ0vzOIsfhZt2oBbyGJqYxtzRuQQn7fgsCqUAeiouZCBEaytgq75p8xbJYMJY4
	 XbXqOMKBncAh/9OItlDlAHHZoIVPvI5pkL+vLe39ihjqO0lLENSoFWJnEYIMyh5R4
	 yCYC77/NLgzrDKyGNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4axq-1wONLV1n9S-009BF6; Thu, 21
 May 2026 13:24:07 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v5 2/4] staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
Date: Thu, 21 May 2026 13:23:43 +0200
Message-ID: <20260521112345.16604-3-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
References: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CZcp5D9mX3O8RpmOj4pFxaojt7wKEPtoPB4dKZ3HgnUzLlNsThW
 hOkP+EDc49sLtSl5g7QFixSpnRtBhspe1kN1pPcP7a/SRWYt9AdpmqjqaoRgOvo4TqtzY6t
 urnqfr1ebO9b8CUnZ0GSOmK5j40s2iC9Yw0E0gMdGF0bVawyDlMYI9SX/IXe0QHVRsrU7gC
 hZvYxgyJpFE9uYjj7KBug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lLOlgIERLWo=;7mi5a+FuXbbY4949DBCJOXBhwt8
 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

Fix checkpatch warnings on inconsistent braces around if/else
statements in hal/sdio_halinit.c

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

