Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D492C0F6D
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285023; cv=none; b=nzLCE2lIgBGlCAnhOE6Fs6xu1a12ut2bW6cQpOlvooZEhUMx5pjKnRdj952dF/81kUqnY1UMviCQbUnSCWQYsTgfRibgbNGjg6avu/Co9YBajL18iJw/ZTtMyRownxyDWkki4p+N3+UkDHDTe9Zc0Ww6NqyZzO9WNbIHfIk/y9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285023; c=relaxed/simple;
	bh=Y5HCWvpiFB9p/UfZlX2IENEqaDUkw4WE/wQuZDXSFws=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lO3LqMVvpS3WXD79Cw+JZhgKatlcyOR9Hl9Kj+mxMt/tuy7FBKyM6UdqohcMRIukKI2wsRQ9zBRLRkH24dfFRvtstQNyruAjWOimj/jnKqrLvfzGlOxbvnHSgK+b3Xf9iY58LJwFb40FQSWswoS0xVC535TRuxM0jFTjTyUj5UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=klXZReX8; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="klXZReX8"
Date: Mon, 27 Apr 2026 12:16:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777285018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fBC4cKCRn5CIKNb9DWTogWX0bAJXBXhgaW4EBkdHLk=;
	b=klXZReX8Wx11p3Ue1R0pQEYff3A/io7R1fCebT6sgJFfMx1Y8Hg5Yf4oeTaa91eVzY2fz+
	s3gbV8yluR5bMFmzd6saXu+7sEEM0nlb6+APyQQ08snucuCZ03r55rwP0nsLiSTqt+JfSr
	2B8dP6iQR6zv6bYdHj11f0U+tqMc1og=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Dan Carpenter <error27@gmail.com>
CC: Salman Alghamdi <me@cipherat.com>, gregkh@linuxfoundation.org,
 straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: rtw_mlme: fix line length warnings
In-Reply-To: <ae8Z6ffMqBNLdmBn@stanley.mountain>
References: <20260424212120.237059-1-me@cipherat.com> <DI28VE3I5LAU.9SJM5OX2JD6Q@linux.dev> <ae8Z6ffMqBNLdmBn@stanley.mountain>
Message-ID: <E66C9B44-0906-47E9-AC21-9B4D12887051@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 27, 2026 10:10:17 AM GMT+02:00, Dan Carpenter <error27@gmail=2Ecom=
> wrote:
>On Sat, Apr 25, 2026 at 02:45:50PM +0200, Luka Gejak wrote:
>> On Fri Apr 24, 2026 at 11:16 PM CEST, Salman Alghamdi wrote:
>> > Fix lines exceeding 100 columns in rtw_mlme=2Ec as flagged by
>> > checkpatch=2Epl=2E Wrap long function signatures, function calls,
>> > assignments, and block comments to bring all lines within the
>> > 100 column limit=2E
>> >
>> > Signed-off-by: Salman Alghamdi <me@cipherat=2Ecom>
>> > ---
>> >  drivers/staging/rtl8723bs/core/rtw_mlme=2Ec | 258 +++++++++++++++---=
----
>> >  1 file changed, 182 insertions(+), 76 deletions(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec b/drivers/st=
aging/rtl8723bs/core/rtw_mlme=2Ec
>> > index ddfc56f0253d=2E=2Efe996484a6ed 100644
>> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec
>> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec
>> > @@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
>> >  	pmlmepriv->pscanned =3D NULL;
>> >  	pmlmepriv->fw_state =3D WIFI_STATION_STATE; /*  Must sync with rtw_=
wdev_alloc() */
>> >  	pmlmepriv->cur_network=2Enetwork=2Einfrastructure_mode =3D Ndis802_=
11AutoUnknown;
>> > -	pmlmepriv->scan_mode =3D SCAN_ACTIVE;/*  1: active, 0: passive=2E M=
aybe someday we should rename this varable to "active_mode" (Jeff) */
>> > +	/* 1: active, 0: passive=2E Maybe someday we should rename this
>> > +	 * variable to "active_mode" (Jeff)
>> > +	 */
>> > +	pmlmepriv->scan_mode =3D SCAN_ACTIVE;
>> > =20
>> >  	spin_lock_init(&pmlmepriv->lock);
>> >  	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool=2Equeue);
>> > @@ -125,7 +128,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv =
*pmlmepriv)
>> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_be=
acon_ie_len);
>> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p=
_probe_req_ie_len);
>> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2=
p_probe_resp_ie_len);
>> > -	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv-=
>p2p_go_probe_resp_ie_len);
>> > +	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie,
>> > +			      &pmlmepriv->p2p_go_probe_resp_ie_len);
>> >  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p=
_assoc_req_ie_len);
>> >  }
>> > =20
>> > @@ -369,7 +373,8 @@ int is_same_network(struct wlan_bssid_ex *src, st=
ruct wlan_bssid_ex *dst, u8 fea
>> >  			(d_cap & WLAN_CAPABILITY_ESS));
>> >  }
>> > =20
>> > -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_=
queue, struct wlan_network *network)
>> > +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_=
queue,
>> > +					    struct wlan_network *network)
>> 					    ^^^^
>> This alignment is wrong please align struct with struct from line above=
=2E
>>=20
>
>You're looking at it in an email client, you need to look at it
>in the file itself=2E  (The alignment is fine)=2E
>
>regards,
>dan carpenter
>
>

Hi Dan,
I figured it out=2E My email client(aerc) is actually showing everything=
=20
correctly, but when I click rq to reply with quotes, my editor(vscode)
shifts everything because of the + and -=2E Any recommendation?
Best regards,
Luka Gejak
