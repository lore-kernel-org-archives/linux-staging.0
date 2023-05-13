Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621B2262E
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 21:44:45 +0000 (UTC)
Date: Sat, 13 May 2023 21:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atinb.me;
	s=protonmail; t=1684014281; x=1684273481;
	bh=mvbAspahjsIuaNyQzEJydc5Y64iTmlL1UTO5/ucl+Ew=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PFYSSmT32w1JXYqCjkd5qx+eaTTNTq3iIa0NT1f3ts/5dWDPaBIynFKRAJxj8ONJQ
	 5bT4GpAlUH+vV1Kk4E006MV5VAHAT+x2ZuK75DtKednIN/dyU18Ezq9Vd8INLc0CoU
	 OHjvlyRoBk7ze5/k98rd1uMhNrkpMb3B17Ae8wCjKJMQojWgyCReoOlqGIxrPcg1+H
	 N+A5I1uLQxQ2dUT9LRkenj3WEeR08VLm6Tfe1aenUE+fbmL1VwJ7UIvGcSgRR5dPb9
	 KvkXE2HIrV1UlzW1IEa1kxz6EzX8vvWc9CevQSqK5gsK13hOeOy1DuXOAIXq23O9Vl
	 Nl9M4LkRUwgOA==
To: gregkh@linuxfoundation.org
From: Atin Bainada <hi@atinb.me>
Cc: linux-staging@lists.linux.dev, Atin Bainada <hi@atinb.me>
Subject: [PATCH v2] staging: rtl8723bs: replace ternary operator with if-else block
Message-ID: <20230513214338.79833-1-hi@atinb.me>
Feedback-ID: 64551405:user:proton
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

replace the ternary operator used for assignment of pHalData->ant_path
with an if-else block for better readability

Signed-off-by: Atin Bainada <hi@atinb.me>
---
Changes since v1:
 - replace the ternary operator with if-else block
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_hal_init.c
index c3c1b49674d3..1e9e1089032b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2275,7 +2275,10 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 =09=09=09pHalData->EEPROMBluetoothAntNum =3D tempval & BIT(0);
 =09=09=09/*  EFUSE_0xC3[6] =3D=3D 0, S1(Main)-RF_PATH_A; */
 =09=09=09/*  EFUSE_0xC3[6] =3D=3D 1, S0(Aux)-RF_PATH_B */
-=09=09=09pHalData->ant_path =3D (tempval & BIT(6))? RF_PATH_B : RF_PATH_A;
+=09=09=09if (tempval & BIT(6))
+=09=09=09=09pHalData->ant_path =3D RF_PATH_B;
+=09=09=09else
+=09=09=09=09pHalData->ant_path =3D RF_PATH_A;
 =09=09} else {
 =09=09=09pHalData->EEPROMBluetoothAntNum =3D Ant_x1;
 =09=09=09if (pHalData->PackageType =3D=3D PACKAGE_QFN68)
--=20
2.40.0


