Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485EC70
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 15:14:39 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4Gfvxn02Wqz4x2Hd
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 14:58:20 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="JZdqBTXF"
Date: Wed, 04 Aug 2021 14:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1628089083;
	bh=Uxwz3jXRe7LOguIMwMuWtaEHnBl60v6KEdbcFAjb0Vw=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=JZdqBTXFEr+E0i8+mJSx6VAiWbpKgMwKvDBH5f6Dq0Ca7C4GtqZXLQyiaVjWYwApY
	 UcbTnfcvfbU2WQ8nL0fb6dVoggWiZjZapmKDSUaucyuOj1R29SNk+vhJuAoPkrSCgs
	 XmV1CZ1+ZFhTFACCwUoTJXMQC1dtVwOMg4B3YuWPGHdBL6DsK4akB3HCZfkFNzsybo
	 oVsO69ZFandu2opM+FdMuxSnScek3wSpkUQP6qqfPeymhtoZiUa0FJY2pwqafXwTDY
	 dT0cxmxfMUD1MuD1gc2CWpa+JLMYFsZ/yC11TPR3t/QFAU0qtvA9b1OkVWDfIxl+g1
	 r38TCnjxOGxcQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Bryan Brattlof <hello@bryanbrattlof.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove unused BT structures
Message-ID: <20210804144812.715695-1-hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch
Message-ID: <20210804145752._eiilGU-mv_tArkc0XZaX-S03zpmLhKZ_fzgarRSE9A@z>

remove static BT debugging structures no longer in use.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 6 ------
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/stag=
ing/rtl8723bs/hal/HalBtc8723b1Ant.c
index 242c14959176..b3d7f50fac4c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -13,12 +13,6 @@ static struct coex_dm_8723b_1ant *pCoexDm =3D &GLCoexDm8=
723b1Ant;
 static struct coex_sta_8723b_1ant GLCoexSta8723b1Ant;
 static struct coex_sta_8723b_1ant *pCoexSta =3D &GLCoexSta8723b1Ant;

-static const char *const GLBtInfoSrc8723b1Ant[] =3D {
-=09"BT Info[wifi fw]",
-=09"BT Info[bt rsp]",
-=09"BT Info[bt auto report]",
-};
-
 /*  local function proto type if needed */
 /*  local function start with halbtc8723b1ant_ */
 static u8 halbtc8723b1ant_BtRssiState(
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/stag=
ing/rtl8723bs/hal/HalBtc8723b2Ant.c
index 3e36a7dc72a6..c1c7b5cc17a7 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -20,12 +20,6 @@ static struct coex_dm_8723b_2ant *pCoexDm =3D &GLCoexDm8=
723b2Ant;
 static struct coex_sta_8723b_2ant GLCoexSta8723b2Ant;
 static struct coex_sta_8723b_2ant *pCoexSta =3D &GLCoexSta8723b2Ant;

-static const char *const GLBtInfoSrc8723b2Ant[] =3D {
-=09"BT Info[wifi fw]",
-=09"BT Info[bt rsp]",
-=09"BT Info[bt auto report]",
-};
-
 /*  local function start with halbtc8723b2ant_ */
 static u8 halbtc8723b2ant_BtRssiState(
 =09u8 levelNum, u8 rssiThresh, u8 rssiThresh1
--
2.30.2


