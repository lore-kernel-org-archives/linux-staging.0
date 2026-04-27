Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A536BCC9
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 06:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269770; cv=none; b=mADn2PnzLfYp0LDANKR9cvQvBliXzbbu4NHWNZEdohAN1/MDEbB2RvngfKfv26KTRAa/2xbuc/njR8B3ltnVGUcGrQ1RwORyCyvP10yQFD6FV7XfiPz5qhh6d4mlb7mW0UaMcOdDgxAAsyT1AFYSTSjyETdwxRyR6wiUfkT9img=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269770; c=relaxed/simple;
	bh=RRRAyQHLjIeLLwXlIq243pmWQpnPmLKaMs60heEZ+BM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ao/+IBW2iOFF0YF4EWI/xaDQEvqkemrdUjtADDJ0EukUUUbNF6myn3BafmKgAnDYL1diZkACHnAS6zHj076BT+klmj5RXSh5MHb2c/AwK0U5xLiwsirm4fRS7JmJMYzBf04wEA+wBRGhxVIYKVRoGs0W+ne+mynTzFDJakEocaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e6lDqsc5; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e6lDqsc5"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777269767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHUc1ENUhfsBrxgMFSUHAgOYWWiSsBOMNuI1V5XjEBc=;
	b=e6lDqsc5o7FT+ccX2Lp1ZHYVdC4b0qmlOuvaTMYmY277YYDLQ4KlMub/tLLIZCBT0Q8EqR
	ILHxbALhyZVVzkGnbcZGjnyKaEaqOqlHlYqH1jRI00QCB2ylaWt7TljX96my6UrybInUrJ
	rkMUzRdTbNsOVl6tUGPefaUXbnZyuC4=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 08:02:43 +0200
Message-Id: <DI3PJU3MF1MT.1XDY33FGX6JEI@linux.dev>
Cc: <luka.gejak@linux.dev>, <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] staging: rtl8723bs: rtw_mlme: fix lines
 exceeding 100 columns
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Salman Alghamdi" <me@cipherat.com>, <gregkh@linuxfoundation.org>
References: <20260426225552.87114-1-me@cipherat.com>
 <20260426225552.87114-3-me@cipherat.com>
In-Reply-To: <20260426225552.87114-3-me@cipherat.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 27, 2026 at 12:54 AM CEST, Salman Alghamdi wrote:
> Wrap long lines and extract local variables to bring all lines
> within the 100 column limit.
>
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---

...

> @@ -746,9 +791,13 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
>  				rtw_indicate_connect(adapter);
>  			} else {
>  				if (rtw_to_roam(adapter) !=3D 0) {
> -					if (rtw_dec_to_roam(adapter) =3D=3D 0
> -						|| _SUCCESS !=3D rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssi=
d, 1, NULL, 0)
> -					) {
> +					if (rtw_dec_to_roam(adapter) =3D=3D 0) {
> +						rtw_set_to_roam(adapter, 0);
> +						rtw_free_assoc_resources(adapter, 1);
> +						rtw_indicate_disconnect(adapter);
> +					} else if (rtw_sitesurvey_cmd(adapter,
> +								      &pmlmepriv->assoc_ssid,
> +								      1, NULL, 0) !=3D _SUCCESS) {
>  						rtw_set_to_roam(adapter, 0);
>  						rtw_free_assoc_resources(adapter, 1);
>  						rtw_indicate_disconnect(adapter);

This isn't really what I had in mind and it isn't acceptable because you
are repeating yourself. I thought something like:
	bool roam_failed =3D false;
	if (rtw_dec_to_roam(adapter) =3D=3D 0)
		roam_failed =3D true;
	else if (rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
				    1, NULL, 0) !=3D _SUCCESS)
		roam_failed =3D true;
	if (roam_failed) {
		rtw_set_to_roam(adapter, 0);
		rtw_free_assoc_resources(adapter, 1);
		rtw_indicate_disconnect(adapter);
				}

...

Best regards,
Luka Gejak
