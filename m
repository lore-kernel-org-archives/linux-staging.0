Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362B3431EF
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743852; cv=none; b=g6QPuI+W28BrUfdpTP4DvlSNH/2nNfuzkyIqP2m5WXGBNTV5jFJwnxNmN9g0xOdOxc4FAsfTyiXy2Jl3McvPIcGKSEJfaY62HZHyW51Bl1e7kZNNn9hQgAm3G2B16mIQnc62FeJcF9I/brKn6Ks7OhVxoAgRUMljmYR5RiIMi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743852; c=relaxed/simple;
	bh=gozbqWDIeceUFzji/F5sgeVvUXFmeST/cwqLONvK2HU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ksLjsnjhnrccshQQJFuxqnMK6olxrpAcMqAcEoTuanravt4+5kxLPj3qVFEvsOuAKWiqW1e4/+jQz52u+oRHH9BdAE5LdfwSoxx9WVeytOIIDeFgB/lwsXIfMIsPhVynWYS9KTr1Imt510L5K5TAp3HU+K4zCMChqL8flo8wTlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BUWADjri; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BUWADjri"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWysnD7Qsz+ohY/Yw1BRwCqIaZ8CRFff8UOEftSFA88=;
	b=BUWADjri1pj4BjgnYP/1He+UYIOS/emJcXSruMVUBUpFBok/rTDP/My3OHnYx0zmZigN1B
	SG89SWtGZAHJ4KYiOZ9NYFO5KKknir8TVXQ+86GIWRtNKm9N4z7qf7V5K0/ABPlXx5RncL
	AZA2GhIbYYBXmP8m/Iy3YLdPI0JnaqQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:10:33 +0200
Message-Id: <DHOONJJPBQQY.42HRXDTSSRB8@linux.dev>
To: "Prithvi Tambewagh" <activprithvi@gmail.com>,
 <gregkh@linuxfoundation.org>, <abrahamadekunle50@gmail.com>,
 <b9788213@gmail.com>, <straube.linux@gmail.com>, <tmimiharoen@gmail.com>,
 <filippo.muschera@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <rayfraytech@gmail.com>,
 <david@cardinalsystem.net>, <weibu@redadmin.org>,
 <dharanitharan725@gmail.com>, <ignacio.pena87@gmail.com>,
 <dan.carpenter@linaro.org>, <karanja99erick@gmail.com>,
 <luka.gejak@linux.dev>, <khushalchitturi@gmail.com>, <suunj1331@gmail.com>,
 <s9430939@naver.com>, <nikolayof23@gmail.com>,
 <bryant.boatright@proton.me>, <ysinghcin@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 3/5] staging: rtl8723bs: simplify boolean return in
 IsFrameTypeCtrl()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <20260409135026.137904-4-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-4-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> Replace the simple if-else statement which checked value of
> GetFrameType(pframe), if equal to WIFI_CTRL_TYPE, function
> IsFrameTypeCtrl() returned true else false, with a single return
> statement returning true only if GetFrameType(pframe) =3D=3D WIFI_CTRL_TY=
PE
> otherwise returns false.
>
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/wifi.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/r=
tl8723bs/include/wifi.h
> index 230b2c4ffd3b..2876f15f13d1 100644
> --- a/drivers/staging/rtl8723bs/include/wifi.h
> +++ b/drivers/staging/rtl8723bs/include/wifi.h
> @@ -275,10 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned =
char *pframe)
> =20
>  static inline int IsFrameTypeCtrl(unsigned char *pframe)
>  {
> -	if (WIFI_CTRL_TYPE =3D=3D GetFrameType(pframe))
> -		return true;
> -	else
> -		return false;
> +	return GetFrameType(pframe) =3D=3D WIFI_CTRL_TYPE;
>  }
>  /*----------------------------------------------------------------------=
-------
>  			Below is for the security related definition

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
