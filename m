Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAE2F82
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 22:27:59 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FWVWC66J6z5XGJr
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 22:27:51 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (2048-bit key) header.d=bryanbrattlof.com header.i=@bryanbrattlof.com header.b="b889kpQs"
Date: Thu, 29 Apr 2021 22:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail3; t=1619735255;
	bh=4Xd3/yJD4QqhdhJkdT5Ia1FGfkBKb1yCAXSC+nOxr7k=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=b889kpQsLHe+ddqjLbaknQqMdg+a6fyCMljqMR8P6euZfE7JwK4r+CP6BB7SjSeUL
	 ftq90v6y6sI8tM4gBhq0aBEnVb7s52Xbed1aJvSctFmFXYL0ISB0YGSDn9RwoyZrtH
	 t6LApGzVHESeJnhdzro0cXvWij+HP1P21LOtGn3R85gMsp2GMP9CRcMt2chJrVUtP4
	 DkGIMT4try6EEiE+QdXeEgqQt6+wI0gsFBqjccB7AwuN8ASWtZqI/23fVnj6zUzSz/
	 AhybAl9JLnH4olrn9LEiwu1BmRO8tvY38aEq2bWXlDidluyv4tOj+MzQfvU6WL4WkR
	 NHo5VF7ouJ1WA==
To: Saurav Girepunje <saurav.girepunje@gmail.com>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: gregkh@linuxfoundation.org, marcocesati@gmail.com, fabioaiuto83@gmail.com, dan.carpenter@oracle.com, john.oldman@polehill.co.uk, ross.schm.dev@gmail.com, insafonov@gmail.com, hdegoede@redhat.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH] staging: rtl8723bs: Change the return type
Message-ID: <20210429222721.rudewp22t55fkmgf@bryanbrattlof.com>
In-Reply-To: <20210428175520.GA8921@user>
References: <20210428175520.GA8921@user>
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

On Wed, Apr 28, 2021 at 11:25:20PM +0530, Saurav Girepunje wrote:
>Remove the ret variable in rtw_suspend_common() and change
>the return type from int to void as rtw_suspend_common()
>always return zero unconditionally.
>
>Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>---
> drivers/staging/rtl8723bs/include/osdep_intf.h | 2 +-
> drivers/staging/rtl8723bs/os_dep/os_intfs.c    | 5 ++---
> drivers/staging/rtl8723bs/os_dep/sdio_intf.c   | 4 +++-
> 3 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/include/osdep_intf.h b/drivers/stag=
ing/rtl8723bs/include/osdep_intf.h
>index 48c90f00cc2e..111e0179712a 100644
>--- a/drivers/staging/rtl8723bs/include/osdep_intf.h
>+++ b/drivers/staging/rtl8723bs/include/osdep_intf.h
>@@ -66,7 +66,7 @@ void rtw_ips_pwr_down(struct adapter *padapter);
> int rtw_drv_register_netdev(struct adapter *padapter);
> void rtw_ndev_destructor(struct net_device *ndev);
>
>-int rtw_suspend_common(struct adapter *padapter);
>+void rtw_suspend_common(struct adapter *padapter);
> int rtw_resume_common(struct adapter *padapter);
>
> int netdev_open(struct net_device *pnetdev);
>diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging=
/rtl8723bs/os_dep/os_intfs.c
>index 1f34cb2e367c..724909078d80 100644
>--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
>+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
>@@ -1146,14 +1146,13 @@ static void rtw_suspend_normal(struct adapter *pad=
apter)
> =09=09padapter->intf_deinit(adapter_to_dvobj(padapter));
> }
>
>-int rtw_suspend_common(struct adapter *padapter)
>+void rtw_suspend_common(struct adapter *padapter)
> {
> =09struct dvobj_priv *psdpriv =3D padapter->dvobj;
> =09struct debug_priv *pdbgpriv =3D &psdpriv->drv_dbg;
> =09struct pwrctrl_priv *pwrpriv =3D dvobj_to_pwrctl(psdpriv);
> =09struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>
>-=09int ret =3D 0;
> =09unsigned long start_time =3D jiffies;
>
> =09DBG_871X_LEVEL(_drv_always_, " suspend start\n");
>@@ -1196,7 +1195,7 @@ int rtw_suspend_common(struct adapter *padapter)
>
> exit:
>
>-=09return ret;
>+=09return;
> }
>

Hi Saurav

Now that this function doesn't return anything, we can also remove the
`exit:` jump by replacing the `goto exit` on line 1175 with this
return.

--
~Bryan
>
> static int rtw_resume_process_normal(struct adapter *padapter)
>diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/stagin=
g/rtl8723bs/os_dep/sdio_intf.c
>index a9a9631dd23c..84c16925c4f5 100644
>--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>@@ -452,7 +452,9 @@ static int rtw_sdio_suspend(struct device *dev)
> =09=09return 0;
> =09}
>
>-=09return rtw_suspend_common(padapter);
>+=09rtw_suspend_common(padapter);
>+
>+=09return 0;
> }
>
> static int rtw_resume_process(struct adapter *padapter)
>--
>2.25.1
>

