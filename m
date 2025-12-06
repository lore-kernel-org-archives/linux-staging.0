Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4112DC76D
	for <linux-staging@lists.linux.dev>; Sat,  6 Dec 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765015808; cv=none; b=CB2Kjg1h5BCBoXrNuTL1UD+YB1NkyDoyC9FvNGGbC1c836h5pZcbvGr4O7boDNOgq0a6Kg9xwesPWULghAIqSbIcuSpRkHIatqmmKLgQABp3/DmV/6AgRkmr/RcsFFaSwE6jDwZ8Bp41UATWUvG89JhQBMVh2L9+zZnGUuVsO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765015808; c=relaxed/simple;
	bh=+jGOeCwBw8II32ra0icNbqTPgNqvqPgK5Vys0nmFvas=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YgmGeaMI12Ywv4r87RxmCv8vCZBBjiHGd+hHAB/1mQWsxcrHydWYevFW18vZLqdthy6FiSB+xkt7nIpQXyn+j3DgYxYtSuOCmY/dzWn9Lc6yDxwa0K03NSEI0jy7xtaxNmsp/80VDy2uvovdUydPIud1y58lmeNuu8kJCGYEQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkqenI0y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkqenI0y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so20041765e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Dec 2025 02:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765015805; x=1765620605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72Qsvat0tIoMqay2xUvf0obYBQDN80gqXGFbCav6vw=;
        b=JkqenI0yV6UelNP3NK9KK+AR6EcyI4h1KT1YLgltVYDhPWea2fPwT5KExD5tNge+3X
         tU8H7093XU815MlcdKPjATIMYHJ/Pyd6OyswEnE+Pa9qAZdzOsEa0qGsMxZiuyAOBB3p
         NPHof72VTxmA3qx0r21v767SXm3wo7sgw25KolU5rLcwblpqxlD16rSLyvtH4oDtDTBh
         cOM8pVsPhrUAgEX06anEt+/aO7yag+vykrj5xYQDsuy7bIRNRz0e06Ffrbzg1kvN5Kt0
         gHYJFrqmmdA7u0CRgdUmQLKL2caSHU4lzz1OrP5O0rbWJYN3gTZZEKAfvKwDaDG6XSLR
         K/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765015805; x=1765620605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e72Qsvat0tIoMqay2xUvf0obYBQDN80gqXGFbCav6vw=;
        b=Q5vfNoYOp81Hhhuc2C3pW0DORc99DhAmdzYtQvGxzxcTPhdc58nltNk/8KW7BpPYwC
         /9K+ucbdFPFrkJcXG54dgQAqcC9iixy8NjS1mqLtojQlTsPDmBt6P8gAUe/bE9rVUjxx
         W1j1q4MaF0+C3FjGLWPeDW8m1zwvr3ExyYszM1EgJvikuCY9zkerfPBY3wbwbvAyzvOG
         +zQCy2EfLcDSehHuGeBxw2lqZW71kQNK4q3CVqf6LN+xNWHgtxxFkcr+f1kb31+PDuT3
         z0uGhhZrgxd0ISgSUqKrFZhLL0TFQ1bHNk44loa5YEpKCG8ywGAQDzDVIy8eYNC4+zJb
         kTaA==
X-Forwarded-Encrypted: i=1; AJvYcCUexvVtgfNkFwtDvzq+VJ4gOl+Ef9FXg2Ta4I90aYGMReiuiuwjkoaRlsGy1z+Dn00yOVnyljVwBSdmok8Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwuUvamQyMMKf0onmyUxQsq2qUto+NrNaV9zCvUQM8cbYzxLYf4
	JmSnNN27N5y9vMO4z72qzZZMashrqjgKp2HR1bPoMdjbM8smmj3AfNo/
X-Gm-Gg: ASbGncv5goRGV/z7V7eop44b/NgFR/UXlYGbxzNGfOxagxmHzuPOIjgvS6kZNmmgLIz
	1lcc5yF3xtkOw1TqR0zGEfkW6mSo/vriVjwAEZw/UUDLY/vO/QnocWKjyp3koSOjypd2EIHhwLJ
	M7KDFdEBjh1nHB9l60lF3KuGPcLWurdFBH8I7FOimGs2wuOooD2nTX8VZGgRk/NvmhXJewYFTBk
	M6/P8KPaVHYpXb03pGZ70xHw2iFaBGYsUdlu8ZYtczmEJXp3MUI9Cd71ALB7zWdd3dRD9e4qErc
	OyaClNyM/mwSLfsDNgXv34HiaruSIFtQkrli8kGiw4yOkj22KWb7vURa5RqgynbtVhFBUEt4Htw
	w0skDBygOSlyA/pe4zuFVkNNXxtbsbnjcx9nnJPjprXzoK9+rGHkPn5XOM0PQ3LxlFI7BRJZ4qh
	R6Th4W6dDS5lSykOwNnOw5+XhgKxLsdaBjKNETQD3wi8zVZ+bOzpiB
X-Google-Smtp-Source: AGHT+IEmSNHmcH4FFCPuz09y7GCEEGehvT+Ov7sgA5mGuWPM9fGYRimLpF+YjxKKyr6NA1GIzdWOnw==
X-Received: by 2002:a05:600c:528d:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47939e27a9fmr20278105e9.18.1765015804544;
        Sat, 06 Dec 2025 02:10:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930c747b8sm130665695e9.9.2025.12.06.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 02:10:04 -0800 (PST)
Date: Sat, 6 Dec 2025 10:10:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: vme_user: replace (1 << n) with BIT(n)
Message-ID: <20251206101002.5e05bed7@pumpkin>
In-Reply-To: <20251206063619.30372-1-dharanitharan725@gmail.com>
References: <20251206063619.30372-1-dharanitharan725@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat,  6 Dec 2025 06:36:19 +0000
Dharanitharan R <dharanitharan725@gmail.com> wrote:

> In drivers/staging/vme_user/vme.c, the functions vme_register_bridge()
> and vme_unregister_bridge() use bit shifts like (1 << i) and
> (1 << bridge->num) to manipulate vme_bus_numbers.
>=20
> Replace these shifts with the BIT(n) macro for readability,
> consistency, and kernel coding style.

The whole loop is just doing ffz().
So could be:
	if (vme_bus_numbers !=3D ~0u) {
		bus_num =3D ffz(vme_bus_numbers);
		vme_bus_numbers =3D BIT(bus_num);
		bridge->num =3D bus_num;
		...
		ret =3D 0;
	}

    David
	=09
>=20
> Changes:
> - vme_register_bridge(): (1 << i) =E2=86=92 BIT(i)
> - vme_unregister_bridge(): (1 << bridge->num) =E2=86=92 BIT(bridge->num)
>=20
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vm=
e.c
> index 2095de72596a..f62a94ef35fc 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -1766,8 +1766,8 @@ int vme_register_bridge(struct vme_bridge *bridge)
> =20
>  	mutex_lock(&vme_buses_lock);
>  	for (i =3D 0; i < sizeof(vme_bus_numbers) * 8; i++) {
> -		if ((vme_bus_numbers & (1 << i)) =3D=3D 0) {
> -			vme_bus_numbers |=3D (1 << i);
> +		if ((vme_bus_numbers & BIT(i)) =3D=3D 0) {
> +			vme_bus_numbers |=3D BIT(i);
>  			bridge->num =3D i;
>  			INIT_LIST_HEAD(&bridge->devices);
>  			list_add_tail(&bridge->bus_list, &vme_bus_list);
> @@ -1787,7 +1787,7 @@ void vme_unregister_bridge(struct vme_bridge *bridg=
e)
>  	struct vme_dev *tmp;
> =20
>  	mutex_lock(&vme_buses_lock);
> -	vme_bus_numbers &=3D ~(1 << bridge->num);
> +	vme_bus_numbers &=3D ~BIT(bridge->num);
>  	list_for_each_entry_safe(vdev, tmp, &bridge->devices, bridge_list) {
>  		list_del(&vdev->drv_list);
>  		list_del(&vdev->bridge_list);

