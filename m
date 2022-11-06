Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6823A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 09:07:12 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 708D0140844;
	Sun,  6 Nov 2022 08:58:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 5567E20027;
	Sun,  6 Nov 2022 08:57:23 +0000 (UTC)
Message-ID: <6ca906bd81be7c6700068a5c9ba7354e14280619.camel@perches.com>
Subject: Re: [PATCH] staging: r8188eu: convert three functions to bool
From: Joe Perches <joe@perches.com>
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sun, 06 Nov 2022 01:58:17 -0700
In-Reply-To: <20221105093916.8255-1-straube.linux@gmail.com>
References: <20221105093916.8255-1-straube.linux@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 5567E20027
X-Spam-Status: No, score=1.38
X-Stat-Signature: 4uxoeo1dq3egrbjd7hcj7d3iyewk3jjk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/LEMc4sjU2B1G35nYKmk26Yld9KNJFg/I=
X-HE-Tag: 1667725043-59702

On Sat, 2022-11-05 at 10:39 +0100, Michael Straube wrote:
> The functions
>=20
> is_client_associated_to_ap()
> is_client_associated_to_ibss()
> is_IBSS_empty()
>=20
> return boolean values. Convert their return type to bool and replace
> _FAIL, which is defined as 0, with false. Another step to get rid of
> _SUCCESS / _FAIL.

yay.

> diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/stagi=
ng/r8188eu/core/rtw_wlan_util.c
[]
> +bool is_client_associated_to_ap(struct adapter *padapter)
>  {
>  	struct mlme_ext_priv	*pmlmeext;
>  	struct mlme_ext_info	*pmlmeinfo;
> =20
>  	if (!padapter)
> -		return _FAIL;
> +		return false;
> =20
>  	pmlmeext =3D &padapter->mlmeextpriv;
>  	pmlmeinfo =3D &pmlmeext->mlmext_info;
> =20
>  	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & =
0x03) =3D=3D WIFI_FW_STATION_STATE))
>  		return true;
> -	else
> -		return _FAIL;
> +
> +	return false;

instead of

	if (foo)
		return true;
	return false;

These could be:

	return (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
	       ((pmlmeinfo->state & 0x03) =3D=3D WIFI_FW_STATION_STATE);

> +bool is_client_associated_to_ibss(struct adapter *padapter)
>  {
>  	struct mlme_ext_priv	*pmlmeext =3D &padapter->mlmeextpriv;
>  	struct mlme_ext_info	*pmlmeinfo =3D &pmlmeext->mlmext_info;
> =20
>  	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & =
0x03) =3D=3D WIFI_FW_ADHOC_STATE))
>  		return true;
> -	else
> -		return _FAIL;
> +
> +	return false;

and

	return (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
	       ((pmlmeinfo->state & 0x03) =3D=3D WIFI_FW_ADHOC_STATE);


