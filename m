Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A062A6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 20:13:40 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FH8TS4vZBz4wwvl
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 20:13:32 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="EvtnezQZ"
Date: Fri, 09 Apr 2021 20:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail3; t=1617999196;
	bh=EqzbmR+DJhqb9z9zKSGWyGT6bMFjSUyRnTL5U0wQp9E=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=EvtnezQZaulaWFJFWk6fCh3jklQ8Gbz7xTns7P5j1XDm5MXZf2it1XFBvFprcUEAB
	 NyHRsa/486AHbrzLBlU9bHfYmNwG3w6VXl0qp2+BtzhWeNa8b/wqI5FyqHxNEbdCOo
	 0A+a5e3hElFrUbBoLFzjDn0fPg2qTOexB2pd5MS+SqiJx78ON2dRJhB9akW1SjwDuX
	 /OYHmfahUKE3wPcFm0p8brzN8vRZNFtZHOyVoL5tJlu5W/d6L5izNWkPBKP6T5/YAj
	 D/EKjHFBgHUNCkPOxnDetQadoC5L2lE5BeoI3Xm4HU4QMAv+reiUBatnJb0n10TH6X
	 EN6juZP+jb4YQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant initialization
Message-ID: <20210409201235.407671-1-hello@bryanbrattlof.com>
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

The variable ret is being initialized as 0 and is never used until
it's updated by sdio_register_driver()

This removes the redundant initialization of ret

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 5de4c70aab6a..9fd926e1698f 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -503,7 +503,7 @@ static int rtw_sdio_resume(struct device *dev)
=20
 static int __init rtw_drv_entry(void)
 {
-=09int ret =3D 0;
+=09int ret;
=20
 =09DBG_871X_LEVEL(_drv_always_, "module init start\n");
 =09dump_drv_version(RTW_DBGDUMP);
--=20
2.27.0


