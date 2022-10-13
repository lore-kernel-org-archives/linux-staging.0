Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CE17F8
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 03:46:05 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 4CC78160D39;
	Thu, 13 Oct 2022 03:09:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 1916C20024;
	Thu, 13 Oct 2022 03:08:29 +0000 (UTC)
Message-ID: <60af3294445ba2d2289a32ef7e429111ff476b44.camel@perches.com>
Subject: Re: [PATCH AUTOSEL 5.19 01/63] staging: r8188eu: do not spam the
 kernel log
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Cc: Michael Straube <straube.linux@gmail.com>, Philipp Hortmann
 <philipp.g.hortmann@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, martin@kaiser.cx,  paskripkin@gmail.com,
 gszymaszek@short.pl, fmdefrancesco@gmail.com,  makvihas@gmail.com,
 saurav.girepunje@gmail.com, linux-staging@lists.linux.dev
Date: Wed, 12 Oct 2022 20:08:58 -0700
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=1.40
X-Stat-Signature: uz6rxyxkf4cx3t8jwgm77puediit9i54
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 1916C20024
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+zvIBb+G3uLRkzWAgvUwCViVSfV01oEU4=
X-HE-Tag: 1665630509-244581

On Wed, 2022-10-12 at 20:17 -0400, Sasha Levin wrote:
> From: Michael Straube <straube.linux@gmail.com>
>=20
> [ Upstream commit 9a4d0d1c21b974454926c3b832b4728679d818eb ]
>=20
> Drivers should not spam the kernel log if they work properly. Convert
> the functions Hal_EfuseParseIDCode88E() and _netdev_open() to use
> netdev_dbg() instead of pr_info() so that developers can still enable
> it if they want to see this information.

Why should this be backported?

> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/st=
aging/r8188eu/hal/rtl8188e_hal_init.c
[]
> @@ -676,6 +676,7 @@ Hal_EfuseParseIDCode88E(
>  	)
>  {
>  	struct eeprom_priv *pEEPROM =3D &padapter->eeprompriv;
> +	struct net_device *netdev =3D padapter->pnetdev;
>  	u16			EEPROMId;
> =20
>  	/*  Check 0x8129 again for making sure autoload status!! */
> @@ -687,7 +688,7 @@ Hal_EfuseParseIDCode88E(
>  		pEEPROM->bautoload_fail_flag =3D false;
>  	}
> =20
> -	pr_info("EEPROM ID =3D 0x%04x\n", EEPROMId);
> +	netdev_dbg(netdev, "EEPROM ID =3D 0x%04x\n", EEPROMId);
>  }
> =20
>  static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrI=
nfo24G, u8 *PROMContent, bool AutoLoadFail)
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/=
r8188eu/os_dep/os_intfs.c
[]
> @@ -636,7 +636,7 @@ int _netdev_open(struct net_device *pnetdev)
>  		if (status =3D=3D _FAIL)
>  			goto netdev_open_error;
> =20
> -		pr_info("MAC Address =3D %pM\n", pnetdev->dev_addr);
> +		netdev_dbg(pnetdev, "MAC Address =3D %pM\n", pnetdev->dev_addr);
> =20
>  		status =3D rtw_start_drv_threads(padapter);
>  		if (status =3D=3D _FAIL) {

