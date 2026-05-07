Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E923C062C
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164312; cv=none; b=Db0Uznk5L5Y3NLwGaX3tqhmJ8PTXHzkZAsnkTINjzwwJlZCxwEJTSsMMhEw83hzxjWLxigMf9xNT1umxPgjEFAo1v8L+kr8Wdyid6SKMEAr/EQisMu6m2U/cYHYX0kMd0dzU8BJ89SbWoVKpNagNJqQprH+e6Y942JZCua9IP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164312; c=relaxed/simple;
	bh=rJl3Uvd4lhta9jUgYvupsZlIhKqKYWvXASpMhDMdZoI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CP3ayWUUjYt63x6lTUdIyUKGaTN+m3FbtbrZdypirahrVwXPEyDGHQYvZQHp3GULlCpdVluG8osqRZtyymcXg5ufpsfoTjspEQ3j4uitgMIhaLRjXR5jkjwhs2gsQ1/9ZTgtaSWdm3+s/yrGxvStBKx9Ht1nB/u8hojghyOxr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WYMG0zj/; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WYMG0zj/"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778164308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlAlR7wA4ftrxsbZzSgoMqgVCQgYG6YrVknaVl23uro=;
	b=WYMG0zj/kHdz7lSkqgTKuA00CfgP8Q4uc7G1j6fqFooumJwEYk2NLiyce5Pn0zc4/mkdLA
	6QhReNHLu8I6ejRfYFzf1h502bWq/3Ht4oaL0HOeqW+a+WwtXroNDV5TFuQeRrJQdyxnB2
	rkL59jFgYtDMcJmlym0jEk/CE0n3FrE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 16:31:43 +0200
Message-Id: <DICIMZYK90TJ.18IOBIVIP0MC2@linux.dev>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-staging"
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v5] staging: rtl8723bs: remove unnecessary comparison to
 true
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Ashwin Gundarapu" <linuxuser509@zohomail.in>, "gregkh"
 <gregkh@linuxfoundation.org>
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

This indentation is still not correct and it doesn't apply to=20
staging-next either.
Best regards,
Luka Gejak

> 		if ((pmlmepriv->assoc_ssid.ssid_length =3D=3D ssid->ssid_length) &&
> 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length=
))) {
> 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D false) {
>
> base-commit: 26fd6bff2c050196005312d1d306889220952a99

