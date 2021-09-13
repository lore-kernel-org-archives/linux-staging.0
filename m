Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178293FC4
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 14:16:25 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4H7T0J0HM0z4x9LW
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 14:10:40 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="F3Mnwnp8"
Date: Mon, 13 Sep 2021 14:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1631542223;
	bh=oss/E+70MRl03TJMdN6Zz+nYBuwtt0h53qYO3R5VcFY=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=F3Mnwnp8wndAEJvgLSGbhDOzblYKVeMkvV/pCXEpTJo5WleYqSo4yJsb+mFXfmOGw
	 f3fkWSrMlfKY7cOo26q4NXQl08bt6IEX2IkbL8zYmHkHZalH9BVAcIqnvjboNr9nxr
	 LWBVnMbSBiN3su8fAT2vSUeEKG09SepOk1sWfmISN4b+7s99ngBpkCLJ92LhkeZluD
	 4AcW7caR2mShxoDU7y4TUMGLZmxBqPyAdBu/LHMRFuNLs3GWx5X6bx4SlJNfYaxs8d
	 qF4CJ0PP/DructOuu3Ur96oCShgaUl5MyvzS44Izxj0/6te9UZEtwTnFZF6rTiePHX
	 rD5x+Bu5gwunw==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bryan Brattlof <hello@bryanbrattlof.com>
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: [PATCH] staging: rtl8723bs: define wowlan_stub only when CONFIG_PM is enabled
Message-ID: <20210913140937.1490133-1-hello@bryanbrattlof.com>
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

The wake-on-lan stub is needed only when the device power management
functionality is enabled in the kernel. Conditionally define
wowlan_stub to avoid potential unused object warnings.

Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/st=
aging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 34da8a569709..f4a9b4b7c97e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -47,6 +47,7 @@ static const u32 rtw_cipher_suites[] =3D {
  * Moreover wowlan has to be enabled via a the nl80211_set_wowlan callback=
.
  * (from user space, e.g. iw phy0 wowlan enable)
  */
+#if defined(CONFIG_PM)
 static const struct wiphy_wowlan_support wowlan_stub =3D {
 =09.flags =3D WIPHY_WOWLAN_ANY,
 =09.n_patterns =3D 0,
@@ -54,6 +55,7 @@ static const struct wiphy_wowlan_support wowlan_stub =3D =
{
 =09.pattern_min_len =3D 0,
 =09.max_pkt_offset =3D 0,
 };
+#endif

 static struct ieee80211_rate rtw_rates[] =3D {
 =09RATETAB_ENT(10,  0x1,   0),
--
2.30.2


