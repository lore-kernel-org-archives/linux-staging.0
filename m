Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D3224FA
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771391509; cv=none; b=u9xUvDOuQl0Av8H5EhHkH1w7WUgYFTQv607uylaU7/TZ5Kr/AGOFcfcso6DPw0OYR7Yq/ePx/BD2kg/nxpbHHsGxkzS4a2d7aEZ3ivP4SKDt7NoP9ZTaQ/RHvKzLTt3tfUte3Gaq5P9HsXWH9ibSxHE6Lp2p6UhXUifkSA1CzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771391509; c=relaxed/simple;
	bh=nc04m4NEAFfqSVrILknzoGcaSG7Qk0ln7BPXktd2BKE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DHm86ZLkcx9djtOIFor3UYPICAPCqKhK5hUarYdAG/HzMUyVfg+x3WP1QBlztuMftaNXQZms9pNUV3hEiaUeUmJui3+IHm1o2yAFc6Adcd5joOLw99GKUgY73GHqjAvGI7CZ8GIkOZRIRChB+csJBzv5MDhYTi1E1ebS+IMsr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDebWfbf; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDebWfbf"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad8435f46so4343981d50.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 21:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771391507; x=1771996307; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9+MctfsBg9ycw/GK7CJ4t08qNka+hRhiiXBWwkm89E=;
        b=HDebWfbfdJZaoZMotxpZZNzVtCrAeTEpvIf8CWUfqCSH8wiq3RGgAiVsYZrUZenbW2
         ecHvV3FwuU0VshnIdeLC1ZA222IMBXzQX6GDPCStQSvwxtW4BnWH1XT814DZ/eVzANw3
         sHMsGliCgR/6ZdadiriyYBUfzlilBUqN8l9WpIgRF7tiIdXQYm8yf/fGZYaMHrfXhAZW
         4njAy9/HCN1I4qBwFygvb6goEsxDUNwRAZrqo7vri1/4KZS5+VD2GyAQ9pl5OBUyE11r
         eneZgHhFaYM0IQMj6gS+EDfqFJQI9SGQBhIyMOgbIy5AhKlfGFqpuGYvke5UQNIvsIlw
         tZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771391507; x=1771996307;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9+MctfsBg9ycw/GK7CJ4t08qNka+hRhiiXBWwkm89E=;
        b=E4rLEMdilewB+uCLi8VYjaoHyPQqdyryWjGpPsSguerFjBixJMxf+xyJqy+7JWWv5M
         tBumEQWyCNlZES+zjU0Yv0za2jW+jAjYGVlJ0zCiTGNCqz7McUs1JzDcnPTZqtrPfDCg
         SPoHsNfyRMrfGOe7EKdzeiWOTJWgb1mZdkQm60X8v5D16nVvAejN0nxCJo3WlM5EAt1R
         /dv8ZIcmb6FiOq5P87bOSUl0/DbYZj+VP3+Ec00r5kTDl2xbzoSAxMyVBpVFkxCdWNUg
         pK1T7Ykz1ibScC+Tk4FhWxT80gMMKOvWsfwVSCgOZGpGGvKbwvuih/P2DSS1d8psKEys
         ASXg==
X-Gm-Message-State: AOJu0YwYazCnbJ7TZU9LwT6LoRE4Xdf8hvl2I75fySj4qdsatx3MeUvB
	lQvZNZerhReG6UUZI9eY2g4UUu+c7XSiFYevXRNFFGnvOgYn/A+Y/xnNBKMmLLoc4no=
X-Gm-Gg: AZuq6aJ7C+nSwyr573hY4ygD4DUA5bs8uLt41Bdosxa/k37rxrc4en7LiKmmeaPpli+
	HsxD6oX53HdmV4tYaBl89AXB6lMyIApq2x1e8/zkqC5jh1Id22qAh6SlaMGUcQ9NvDcxL3LCFiR
	ZgfCaIWBY1szc14DAfHFbEvO1N15/rmc2HSJVVh89ES4IZdtGsxHULupFQEnt+2KMRW/IaLFIWV
	N25kqjREAdnrsOeJ0kRG6t00s+dFwFBmES0S8dEWEs4X+6rFe9nrGuvLqs4phOyvmf8OaU7blSU
	4DnqnTZ8gwzPNSlqRotSgV6iEczM93OEEREpk6DR0SHpwuP1gx/+mKVVs5stJUfG2T4wMvysQen
	ffCdUpLS7L0AKOIqIDU87qcFIZW3Pw3yWBpphnQesKQoWXT7UxZD97cSKZHq3dWz3RrW/MG8CdS
	ZTeBVxUOKFp1xpecrm9iAOnkJ/izfEn5u+INWU2a9Eu3R6H03XtKEhHpBHv54z5phM1bw0SEAWO
	8as76QtcJACKnNQ7l+kXLora9zVJDEmkuf4Ibw3+jNM30HsVnU=
X-Received: by 2002:a05:690e:1503:b0:649:44ac:cc01 with SMTP id 956f58d0204a3-64c21b18a02mr10000390d50.55.1771391507060;
        Tue, 17 Feb 2026 21:11:47 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fb195fsm5591430d50.16.2026.02.17.21.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 21:11:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 23:11:29 -0600
Message-Id: <DGHTVJZCV06V.10OUEUP6IQ7A@gmail.com>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v4 2/2] staging: rtl8723bs: Rename camel case variable
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Bryant Boatright" <bryant.boatright@proton.me>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260217145352.2172407-1-bryant.boatright@proton.me>
 <20260217145352.2172407-3-bryant.boatright@proton.me>
In-Reply-To: <20260217145352.2172407-3-bryant.boatright@proton.me>

On Tue Feb 17, 2026 at 8:54 AM CST, Bryant Boatright wrote:
> Adhere to Linux kernel coding style.
>
> Reported by checkpatch:
>
> CHECK: Avoid CamelCase: <rateLen>
>
> Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
> ---

...

> -	if (rateLen > 8) {
> +	if (rate_len > 8) {
>  		ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_=
rates, &sz);
> -		/* ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev=
_network->supported_rates + 8), &sz); */
> +		/* ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pde=
v_network->supported_rates + 8), &sz); */

You can probably just delete this comment, it's more like dead code than
a comment.

Thanks,

ET
