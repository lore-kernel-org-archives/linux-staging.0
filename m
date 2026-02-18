Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443C3009DE
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439715; cv=none; b=T7+MrpU2Y6NaQTKWK1xTsBrVBlkl/f7wUda8fJZjZt7XRxrtfNpwIbmypNS0RLIq18nyaQvF4zB99kHTkk+fRq95rMhZpSyoYhJuzWWHAyHHYw85YkWrswfmiL2BuJmlAT7vHuhbDzWmu0/v47a/tE+E4G6bjhwvVHUT35OXrOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439715; c=relaxed/simple;
	bh=mgxvcsvXu9NjlngcS8yOF8rB+m90YOlusZv4zQOgYW8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AX35UMsDB3fRUx6Hl4zZe9SpDZJaJwLrS+IfJmM1GDPh//NKXD2OcuX73ICOqm+f+om6xEQMtsYxWq3/pX+G0yN4OE7LldE0YEvDKHyVqzGha8pnQrVV0rCdW6DVRM1daIZH58XAVym9qTqahY81U92MW9auO7FqtgiRkA19IBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDH7rOPx; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDH7rOPx"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fc4425b6bso1307137b3.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 10:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771439713; x=1772044513; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnqQJzLDCajc6Dk/Q0VSzeJfGgobSOsZc6aaGZ2XE5Q=;
        b=KDH7rOPxI81PAqzDL+DZ23xr8xz2xXkT6uOpgvoyKvMgcULiOBGS+9N31GL8SfY8fT
         AQ6FAOlN1k2IFkV9d8xcntuEcDpAi1Tppx1LYq1dExq9noRqgkiH8J0ommge+jsgiCAH
         TDIZ8W6Vl6Qab37T1w72eR77NzzABYZPTBtfBNFYwWCJmBpn/sRd58/ESx5fHivWOEHz
         bIfYEC2gkZC4OUNdlBtZU098a5v0OXGvuIMwP8ZYs/ycKNA7rkWahl5ASgBLQKKJgd17
         wXfFD5dB0tH3THJGxkwlBxaO4/qQxOM/q/Y8PKCtkvv4ujEg1s25Z6tU5ZXi7EzTxYLJ
         QY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439713; x=1772044513;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnqQJzLDCajc6Dk/Q0VSzeJfGgobSOsZc6aaGZ2XE5Q=;
        b=gZ7xc6Mo4pGx84/4jvTmm7VMtR4kDr9pjGQSFxTyIM/ETmll45KwWEA9g4wyUCRqqx
         BZLY+O41PPoaz7l18q+uwzOY7DiJhjXG0L9ch9FuHa/64K59E9caYODOPfjPll21sjo+
         HJq/ytDQAaLby1muk22+Q6wgFYxtYb17nYx850s7wVLYrlafN+1gSE1JWjsmYuSYU6Ii
         /J5AsT13ypDAHhCouC1orEpsBB9GbuYFTnBLermxqmqSQuOiKmSeC9fQcDgf6EZztcp+
         JxhLk6DKCQ+Vjn6/6RE1PrMCB1ZrKD28tRdcz2Fa7t7YoZdti26b6GfKLDKvQ03B28KF
         IQ9w==
X-Gm-Message-State: AOJu0YwAv5vxLLk9WbuESIrqU06oc5gQGfa6J8rZlhqKhW3d4JmEqI3B
	NShHWPO7/4gDDbl8KunnJsQYCKqUoEqx+Rd1agORML9doroKjQaqBYDy
X-Gm-Gg: AZuq6aIQQ5qiQxOdYSXXEPR0hOkPhkRwSK83LTLsZ6/HKRmgIRoTql8rQgzsnk7rOy3
	yfCO/FuGAuYTpAB4iV9uiNZjgoiQX4Oh9c715+KmDWtUGSI1L0hWVDFKwoV2Ap6B13hpk7tXc+E
	j4vdrfeGKFX7HsJ2awpLhu8hFGuR9g79O+Vx4dI/Td2+ZgpMIC6Nulq+u/3HttfkPYSLeT7tCqA
	kpEiIA3eD+gcsfvop5ijZFUckdLIGugs9lQaxJjPluxTXmdHhw1CJQ3xzhWbw1YhQ2A9gArQlrZ
	Es82/X/9pMs7RqDzCrsjHz6DCbninCZSb5g4vIpn2LMAC9CYhdWLTiueQElM9Bd++vSRBcZJiJw
	/34MNLhA+2yeGczroYq7yGzadpBNsKanF26fPc2RB2aUD3c1Te21UI+MALwS6SBci4fV5tjt3xK
	+af0kGrtLo+IAZtzAa6e7KYoNOitGEDZHKiHDWzvf6Rqcl6h5BJGXJtVBJSG8+QRiCU9+tRJi/g
	MSpFFnFKopmYaiT4weUf+52zisfVlX2hAtN2fsHTSq+9gEcEok=
X-Received: by 2002:a05:690c:110:b0:796:3981:fd24 with SMTP id 00721157ae682-797f734c31bmr19865187b3.39.1771439712960;
        Wed, 18 Feb 2026 10:35:12 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c177773sm124078467b3.2.2026.02.18.10.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:35:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 12:34:56 -0600
Message-Id: <DGIAYPXFFQ1Q.1J195CKVQVKWI@gmail.com>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: fix spaces around binary operators
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218113229.9171-1-nikolayof23@gmail.com>
In-Reply-To: <20260218113229.9171-1-nikolayof23@gmail.com>

On Wed Feb 18, 2026 at 5:30 AM :
> Add missing spaces to comply with kernel coding style.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

...

> =20
>  	while (cnt < in_len) {
>  		if (eid =3D=3D in_ie[cnt]
> -			&& (!oui || !memcmp(&in_ie[cnt+2], oui, oui_len))) {
> +			&& (!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
>  			target_ie =3D &in_ie[cnt];

Logical continuations should be on the previous line:

while (cnt < in_len) {
	if (eid =3D=3D in_ie[cnt] &&
		(!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {

...

> =20
> -	if ((*wpa_ie !=3D WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie+1) !=3D (u8)(w=
pa_ie_len - 2)) ||
> -	   (memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
> +	if ((*wpa_ie !=3D WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) !=3D (u8)=
(wpa_ie_len - 2)) ||
> +	   (memcmp(wpa_ie + 2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
>  		return _FAIL;
>  	}

Alignment should match open parenthesis:

if ((*wpa_ie !=3D WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) !=3D (u8)(wpa=
_ie_len - 2)) ||
	(memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {

...

> =20
>  		/* if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY) */
> -		if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cn=
t+6], wapi_oui1, 4) ||
> -					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
> +		if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cn=
t + 6], wapi_oui1, 4) ||
> +					!memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {

Ditto.

...

> =20
>  	if (MCS_rate[0] & BIT(7))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?1500:1350):((short_GI)?722:650);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 1500:1350) : ((short_GI) ? 722=
:650);

You only fixed half of the problem here, you need to space out the other
ternary operator conditions too:

max_rate =3D (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : =
650);

>  	else if (MCS_rate[0] & BIT(6))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?1350:1215):((short_GI)?650:585);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 1350:1215) : ((short_GI) ? 650=
:585);
>  	else if (MCS_rate[0] & BIT(5))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?1200:1080):((short_GI)?578:520);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 1200:1080) : ((short_GI) ? 578=
:520);
>  	else if (MCS_rate[0] & BIT(4))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?900:810):((short_GI)?433:390);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 900:810) : ((short_GI) ? 433:3=
90);
>  	else if (MCS_rate[0] & BIT(3))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?600:540):((short_GI)?289:260);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 600:540) : ((short_GI) ? 289:2=
60);
>  	else if (MCS_rate[0] & BIT(2))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?450:405):((short_GI)?217:195);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 450:405) : ((short_GI) ? 217:1=
95);
>  	else if (MCS_rate[0] & BIT(1))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?300:270):((short_GI)?144:130);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 300:270) : ((short_GI) ? 144:1=
30);
>  	else if (MCS_rate[0] & BIT(0))
> -		max_rate =3D (bw_40MHz) ? ((short_GI)?150:135):((short_GI)?72:65);
> +		max_rate =3D (bw_40MHz) ? ((short_GI) ? 150:135) : ((short_GI) ? 72:65=
);
> =20
>  	return max_rate;
>  }

Ditto.

Next time before sending patches off, use:

$ ./scripts/checkpatch.pl --strict <patch>

All the problems I cited here could be found with that.

Thanks,

ET
