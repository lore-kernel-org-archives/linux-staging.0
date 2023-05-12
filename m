Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C124126
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 15:16:47 +0000 (UTC)
Date: Fri, 12 May 2023 15:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atinb.me;
	s=protonmail; t=1683904595; x=1684163795;
	bh=8OyScqtpfkmi9QQDvqaZrTS5JMm0t0ZLhtAMy1swm4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dRW+7frNIfGy7jJTC6G96KTJ589yoVUBeyg8ld699u1wuFN7OTd1eJ91H9582uKEd
	 hgU4UIBCKLvLlvD+855Zwdt6Np+4abxa6po4V4d7fgbgHiofMBKwZL/i6EnjzktJy9
	 wCrSmS/nZWx3QgiMfxN3MmH5w60iMDb1o3JUuzVhlis9n/SfuVczvAOsCZ87nz9QLO
	 CCijriNoQGXxZIz4XNU58v+OrelLXrFgW0t6wuSinIvqj2zf0NTSwmYXolvS5bC1ww
	 7tyfBySBBydgI0W/EUKik/SKdcU2ANqt7cQfJBC6VgQ22cbW6T6LnXqIeQAtzj1bwP
	 Ag+IHdkjLvqfw==
To: gregkh@linuxfoundation.org
From: Atin Bainada <hi@atinb.me>
Cc: linux-staging@lists.linux.dev, Atin Bainada <hi@atinb.me>
Subject: [PATCH] staging: rtl8723bs: hal: Add whitespace around '?'
Message-ID: <20230512151538.17609-1-hi@atinb.me>
Feedback-ID: 64551405:user:proton
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Atin Bainada <hi@atinb.me>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_hal_init.c
index c3c1b49674d3..abfaf1eebf5b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2275,7 +2275,7 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 =09=09=09pHalData->EEPROMBluetoothAntNum =3D tempval & BIT(0);
 =09=09=09/*  EFUSE_0xC3[6] =3D=3D 0, S1(Main)-RF_PATH_A; */
 =09=09=09/*  EFUSE_0xC3[6] =3D=3D 1, S0(Aux)-RF_PATH_B */
-=09=09=09pHalData->ant_path =3D (tempval & BIT(6))? RF_PATH_B : RF_PATH_A;
+=09=09=09pHalData->ant_path =3D (tempval & BIT(6)) ? RF_PATH_B : RF_PATH_A=
;
 =09=09} else {
 =09=09=09pHalData->EEPROMBluetoothAntNum =3D Ant_x1;
 =09=09=09if (pHalData->PackageType =3D=3D PACKAGE_QFN68)
--
2.40.0


