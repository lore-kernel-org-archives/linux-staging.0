Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360517F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 01:18:51 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 4CB43A0968;
	Sun,  6 Nov 2022 01:18:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id B045B20024;
	Sun,  6 Nov 2022 01:17:47 +0000 (UTC)
Message-ID: <8fea8008f0ebb85d7e893513117347712e68fba5.camel@perches.com>
Subject: Re: [PATCH v2 3/3] staging: rtl8192e: remove unnecesscary macro
 defines
From: Joe Perches <joe@perches.com>
To: Jacob Bai <jacob.bai.au@gmail.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 05 Nov 2022 18:18:41 -0700
In-Reply-To: <6cdf838429ca9b553fb572f55a53ec25fa4e5f6a.1667694826.git.jacob.bai.au@gmail.com>
References: <cover.1667694826.git.jacob.bai.au@gmail.com>
	 <6cdf838429ca9b553fb572f55a53ec25fa4e5f6a.1667694826.git.jacob.bai.au@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=1.32
X-Stat-Signature: kx6q3pjzbf487pw7qw8q4b94uwbmijc6
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: B045B20024
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19yKjAvG44W46awVvnMK0OggVPJz+h+ttU=
X-HE-Tag: 1667697467-330742

On Sun, 2022-11-06 at 12:11 +1100, Jacob Bai wrote:
> remove useless macro defines
[]
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/sta=
ging/rtl8192e/rtl8192e/r8192E_phy.c
> index eabb4187d907..aad1842857c0 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -307,12 +307,12 @@ void rtl92e_config_mac(struct net_device *dev)
>  	struct r8192_priv *priv =3D rtllib_priv(dev);
> =20
>  	if (priv->bTXPowerDataReadFromEEPORM) {
> -		dwArrayLen =3D MACPHY_Array_PGLength;
> -		pdwArray =3D Rtl819XMACPHY_Array_PG;
> +		dwArrayLen =3D RTL8192E_MAC_ARRAY_PG_LEN;
> +		pdwArray =3D RTL8192E_MAC_ARRAY_PG;

Perhaps use ARRAY_SIZE instead.

