Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B45688;
	Fri, 24 Mar 2023 13:50:37 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id ix20so1870512plb.3;
        Fri, 24 Mar 2023 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679665837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvvSi+5iA/5tlxMT+sJ3fTetfG9Rc3EXeqwc0N6JACY=;
        b=HGU+Mr5iduwcW0LXBuS3eQEkIO5IJQSwVMvcdJ/WaosQKCZ3oSqTClH9mss1KtyTYd
         aYX+8rnsld/vT93zMB7J5un9LvNViWez6IJHSrOFgUrzmYWMYOzTP4Ecv2O/8aDm3Who
         S5QtlX6e8HCpJZHcHEznl2Tdr5FdwkGemcvlv4GpQLoO4VB6hR+eHtd8jOijahtomA8L
         4gVaN0eZWNvU31VEc59iYsEBEE8RqzZz16l2aX+Ck2YwyrD8ME40hJgzPaMGB04RUFGh
         OnZYWR89vcQAKSp2XXzyGtmvDrvDLbt511mhDc/ren0XsWqOueNBHbaySjLynTdvG3Qt
         jCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679665837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvvSi+5iA/5tlxMT+sJ3fTetfG9Rc3EXeqwc0N6JACY=;
        b=sRW4yNNzmGlNjMygPI9cp4SgZZA/ts9n4sy4pG56B5smfzA/w+I5w433Wo+gSeuTD9
         SNdVhCChrK816JnsXSgZS1Ipj9Sq+K2NIfNut+Pu1USIyNLzFgsP1cBwfOU1ghH9Ay/6
         5dLz8AWx225g9j/wgHK2A2sIaR39bkcOK/zhUPoQrCI1LiFXCd8TZ8hcZmNj+Y4hSILY
         DWtEZxTMYh70F+N7Rp5wb9eQyJ+FMBThWG6Cem4olkj4mUZnQOVEdIUys6ucDyWrfNdx
         IRG+jCOBrQ/lyfNGoSTAh+dT28B1f8bNMRsaiDYAm51Y+AVaOtHMC2eAdLLFkYgXvSe9
         Aueg==
X-Gm-Message-State: AAQBX9fp4lHgZE+CXxRBaV6jFy+4vPIT0EqI0jBNcz9xGQDlMXKpVaXJ
	rHTBhvgECcar/sRaThhNhFQ=
X-Google-Smtp-Source: AKy350b6pccE3wDumL/D98ou7EvPQyfzKdFleAxUumzuVcfFOxXkHnfFOSwqcBj6zVAhRR8voTlIWQ==
X-Received: by 2002:a17:902:ecc2:b0:1a1:f95a:2505 with SMTP id a2-20020a170902ecc200b001a1f95a2505mr7886315plh.29.1679665836741;
        Fri, 24 Mar 2023 06:50:36 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-20.three.co.id. [180.214.232.20])
        by smtp.gmail.com with ESMTPSA id iz4-20020a170902ef8400b0019f9fd5c24asm14181006plb.207.2023.03.24.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 06:50:36 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0E7AB106544; Fri, 24 Mar 2023 20:50:32 +0700 (WIB)
Date: Fri, 24 Mar 2023 20:50:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging rtl8192u: fix block comments
Message-ID: <ZB2qqKCHiYwNr5la@debian.me>
References: <ZB2a5zwYpBZ/6qwU@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BLg0yowj9UD64YiR"
Content-Disposition: inline
In-Reply-To: <ZB2a5zwYpBZ/6qwU@khadija-virtual-machine>


--BLg0yowj9UD64YiR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 05:43:19PM +0500, Khadija Kamran wrote:
> ---*/
> + * Copyright-c Realtek Semiconductor Corp. All rights reserved.
> + *
> + * Module Name:
> + *	r8192U_dm.c
> + *
> + * Abstract:
> + *	HW dynamic mechanism.
> + *
> + * Major Change History:
> + *	When		Who				What
> + *	----------	--------------- -------------------------------
> + *	2008-05-14	amy                     create version 0 porting from wind=
ows code.
> + *

Hi,

The revision history can also be trimmed (since most developers use git
to browse file history, leaving the copyright alone and abstract alone.

For the abstract, what about "Hardware dynamic mechanism for rtl8192u"?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--BLg0yowj9UD64YiR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZB2qpQAKCRD2uYlJVVFO
o7mbAQDvkJXMStCNksJ9+t9Mbb0cjKw2rbfqe+ArEHPyV53khwEAkTKJ+b104ZX0
Fz3KBg7gi+LDhi7dDYNzK6UI/MJ5MQY=
=Ns+6
-----END PGP SIGNATURE-----

--BLg0yowj9UD64YiR--
