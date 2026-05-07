Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F315402BBE
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164678; cv=none; b=c4v6z5zN/YryfLD/PVeg2CkmbGqNMo3k51kWgLgTjd73sg4escJlVgQ+BWWzJGZsFTFwxks4nV6YohvZ8H229krugKx6cXw+JoD0Nhu1G8eduTntbQWm56MF3rB6yqKDdJAZmu7Sa2Wtrb9fUhqMZuRUUvdPLIPTRPuf5genxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164678; c=relaxed/simple;
	bh=xHPTpUWLZ9zIYtJAj7iysQFuXLTfhamjoFUMs1i4bRI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bRM5PCbkMGBMd7YwwZlCA+wja+leSFkN2ChTlbJeKFdzsyZE9i7fIxZHCxBj17WEVjrmQOR0OkR/DqTOdwk3Jm5qxd/v0fDy22CQ0wdhw16uzHfREtjReMDAU/VdP+KD7QmqGIWpmnlgwDGvV+tu6+Os+tCjFdUwDxdJD/D44TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=grQ5vGMl; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="grQ5vGMl"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778164674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mC4Fsp5Z1SH7ZNXWL/f0ELurNeruyhI2c3oX2Ca33o8=;
	b=grQ5vGMl8+ZjBr7qvbjCO+gUuTIevFABsTPI1bcu+Ch2G3N6JNQbLkvtWUDdh6gzTa8Yuf
	QIvUTBq1eRSz/0AV2e1pU3hSfNKnGeozC5d9ZAtsdJiQbXqvor2j5CordOE1m7SBTQXU6F
	DJKt2iM9Uv+z7SZgKMo4Xxh1yRELpp8=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 16:37:32 +0200
Message-Id: <DICIRGFJQ036.2FQPQTQMEDDSP@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Ashwin Gundarapu" <linuxuser509@zohomail.in>, "gregkh"
 <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-staging"
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v5] staging: rtl8723bs: remove unnecessary comparison to
 true
References: <19e00e1f2ba.31c276864378.4102205719868900596@zohomail.in>
In-Reply-To: <19e00e1f2ba.31c276864378.4102205719868900596@zohomail.in>
X-Migadu-Flow: FLOW_OUT

On Thu May 7, 2026 at 7:21 AM CEST, Ashwin Gundarapu wrote:
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
>
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v5: Removed git header from email body. Fixed indentation on
> the second line of the function call. Added full version history.
>
> v4: Moved changelog below the --- separator. Ran checkpatch.pl
> - no errors or warnings. Fixed whitespace per Greg KH's review.
>
> v3: Fixed double --- line and corrected whitespace formatting.
>
> v2: Resent with corrected whitespace via Thunderbird plain text mode.
>
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ioctl_set.c
> index c70541f95a73..c100a0d70fe2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, stru=
ct ndis_802_11_ssid *ssid)
> 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) =3D=3D true)
> 		goto release_mlme_lock;
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) =3D=3D=
 true) {
> +	if (check_fwstate(pmlmepriv,
> +		_FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {

Please align it as you see in the following block:
	if (check_fwstate(pmlmepriv,
	    _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
Best regards,
Luka Gejak
> 		if ((pmlmepriv->assoc_ssid.ssid_length =3D=3D ssid->ssid_length) &&
> 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length=
))) {
> 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D false) {
>
> base-commit: 26fd6bff2c050196005312d1d306889220952a99

