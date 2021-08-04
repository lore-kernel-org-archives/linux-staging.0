Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8D70
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 15:11:41 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Gfw1T1JMBz4x2tl
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 15:01:33 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="I5k+d4qR"
Date: Wed, 04 Aug 2021 15:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1628089275;
	bh=Uxwz3jXRe7LOguIMwMuWtaEHnBl60v6KEdbcFAjb0Vw=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=I5k+d4qR1w3jO8skGL8TN61R3kwXhfhc0z/d2binXyel9BZecYSfHOLH8nbV34NGd
	 HEjx7sEnV/NHXAUTf0aHYholQuIK39Iqs4CKRVuiVnwJkr+fRPQvnjbD5Hh7gLLdYB
	 ZMM5Fi5B2eK/TTLZPb0e8M+93xPC8jbozsHOOqujuD8a7O//eBo+OMlEQeWzZ6TeQ+
	 I/Xuf1EcpL9wvr5tPdrUUBqF5rBihSJ1LyJ4j2/YjUK7Qf69NIT4IyuiYr0p4HBs6B
	 jBqALspjjLV5bBUYi3wW9Ib9QVbWbz5g4+nCbB13PKyDGsB5kNENinkwsvasDkAx5o
	 xeziI2AXvC3jA==
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


