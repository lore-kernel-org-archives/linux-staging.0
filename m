Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6001846
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 12:10:29 +0000 (UTC)
Date: Sat, 13 May 2023 12:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atinb.me;
	s=protonmail; t=1683979820; x=1684239020;
	bh=LYrt2ASilUQyWgby+CBBJqVaRkyYY9ScoxunpCjv2Vo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=USlzvG6AvifoAsknxmip8UjY2GX7qkEBl0i/ljg8G0FK93NNr74EdE9BVYnvC16Nq
	 +HQYv73Iq+GD26eFyuhq05JMHs+unkUIbIHQ05k6+tVcKGnNesl1IqrGf0ldR4OfKs
	 +SW2TaZLk7cofbo8RbgYJIX8nGd9DVzxTPWhrNQuFpLILOdi0+h58HI8J/m2BOV+hM
	 lhcMGyqs9OuocRzyrP6VcZHKJLzw+nU3qVWEVMeSoQcob7mSDI8EBp10MjnuyM8hC7
	 T80IZAf99f2CIRbBvbxbpca7ivo/2/WhBTmp+ppYxdPW48XCfu9K9ijLFB0+fMHJWh
	 l1ixQ8DhGtSgA==
To: gregkh@linuxfoundation.org
From: Atin Bainada <hi@atinb.me>
Cc: linux-staging@lists.linux.dev, Atin Bainada <hi@atinb.me>
Subject: [PATCH] staging: rtl8723bs: add whitespace before operator
Message-ID: <20230513120950.66944-1-hi@atinb.me>
Feedback-ID: 64551405:user:proton
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

fix the following post-commit hook checkpatch error:

spaces required around that '?' (ctx:VxW)
2278: FILE: rtl8723b_hal_init.c:2278:
+                       pHalData->ant_path =3D (tempval & BIT(6))? RF_PATH_=
B : RF_PATH_A;
                                                               ^

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
--=20
2.40.0


