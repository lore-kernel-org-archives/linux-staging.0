Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A53FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 00:03:56 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Gsb4f5Zrlz4x9pn
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 23:56:18 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="Xc7xoQZD"
Date: Sat, 21 Aug 2021 23:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1629590163;
	bh=wdAPJNqRs4L8i+w4JFiTHyTQcUOb9MfykknwRLa1lNU=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=Xc7xoQZD1wqgiJzRzFaCzU0yBlNYCVXFXwnR0ko+Kf/avpgcOtMly1/uGlRQN1jc/
	 tvXER4FNaA5lZtTINDCi25AnToRyFnbuLOatsi3/Hm4cZvZHp4d+tMc6O3PuFfUyto
	 huYPuTyz5mNwO6FSL1BehaFzns8nTOLZjXYuveT4uhLQuIm1/Q+qDHCv2nepDCjCaW
	 E3ekV4+QpTmX2cwHsuUljazmURN4LU28VI04Z+GLUVXGGnAOONx60B/jt+3znHfKsI
	 pkPeuIHPWWoyorKnx4AwdLic46/FYOSRvCVyhOEftb21f5mAhbZ00kKkgmeh5Ly+WV
	 Vqc50tKsHEKkQ==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Bryan Brattlof <hello@bryanbrattlof.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH 4/6] staging: rtl8723bs: remove sdio_readN()
Message-ID: <20210821235456.2502681-4-hello@bryanbrattlof.com>
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

The sdio_readN() function is unused. We can remove it.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 45 ------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl=
8723bs/hal/sdio_ops.c
index 019ace4b8564..928fa109565e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -195,51 +195,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 a=
ddr)
 =09return val;
 }

-static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf=
)
-{
-=09struct adapter *adapter;
-=09u8 mac_pwr_ctrl_on;
-=09u8 device_id;
-=09u16 offset;
-=09u32 ftaddr;
-=09u8 shift;
-=09s32 err;
-
-=09adapter =3D intfhdl->padapter;
-=09err =3D 0;
-
-=09ftaddr =3D _cvrt2ftaddr(addr, &device_id, &offset);
-
-=09rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
-=09if (
-=09=09((device_id =3D=3D WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
-=09=09(!mac_pwr_ctrl_on) ||
-=09=09(adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-=09)
-=09=09return sd_cmd52_read(intfhdl, ftaddr, cnt, buf);
-
-=09/*  4 bytes alignment */
-=09shift =3D ftaddr & 0x3;
-=09if (shift =3D=3D 0) {
-=09=09err =3D sd_read(intfhdl, ftaddr, cnt, buf);
-=09} else {
-=09=09u8 *tmpbuf;
-=09=09u32 n;
-
-=09=09ftaddr &=3D ~(u16)0x3;
-=09=09n =3D cnt + shift;
-=09=09tmpbuf =3D rtw_malloc(n);
-=09=09if (!tmpbuf)
-=09=09=09return -1;
-
-=09=09err =3D sd_read(intfhdl, ftaddr, n, tmpbuf);
-=09=09if (!err)
-=09=09=09memcpy(buf, tmpbuf + shift, cnt);
-=09=09kfree(tmpbuf);
-=09}
-=09return err;
-}
-
 static s32 sdio_write8(struct intf_hdl *intfhdl, u32 addr, u8 val)
 {
 =09u32 ftaddr;
--
2.30.2


