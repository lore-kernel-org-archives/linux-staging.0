Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF5970
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:33:33 +0000 (UTC)
Date: Sat, 10 Apr 2021 13:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail3; t=1618061597;
	bh=FCOivwZmKcFsZJuUtmm6XCPlM3OwmFa87q/PxS8jP0I=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=jPqE+zQN6gwQJWXrOp1ifnqqBO+aAVKiyO31SWDKtpJHgcShdbX+WezfD6IGJ4u/r
	 mO7bIcH94FgAD94wB+G3P7OZ6SFGgQygjr0JgjDxp5gTx/sUBB5j8S4Ii1mG3eY5im
	 QUMWGdMKQ/m0oQA2S0M3eoAxcZQJkPdSUBp3LmVSqlL2b3s2ara8c8QjLy/3cLoN+Y
	 yccQK6y2TQ4sUQsS6NjfXXKLjvYTnTgfAfpKrzIBE5eDQr11kHSkUpG15SwaLtHpn3
	 fWE9dYxpDg/P/wRX5h91M26/kXv4nbahQYOLFJ4Q3JhMjwlEAQLObkTh0c1TaCBNmh
	 LPosP65SpcNzg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <20210410133212.422929-1-hello@bryanbrattlof.com>
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

The next instruction for both 'goto exit' jump statements is to
execute the exit jump instructions regardless. We can safely
remove all jump statements from __init rtw_drv_entry()

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging=
/rtl8723bs/os_dep/sdio_intf.c
index 9fd926e1698f..84ac81d19746 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -517,13 +517,9 @@ static int __init rtw_drv_entry(void)
 =09if (ret !=3D 0) {
 =09=09sdio_drvpriv.drv_registered =3D false;
 =09=09rtw_ndev_notifier_unregister();
-=09=09goto exit;
 =09}
=20
-=09goto exit;
-
-exit:
-=09DBG_871X_LEVEL(_drv_always_, "module init ret =3D%d\n", ret);
+=09DBG_870X_LEVEL(_drv_always_, "module init ret =3D%d\n", ret);
 =09return ret;
 }
=20
--=20
2.27.0


