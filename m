Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2D2F48;
	Wed,  1 Nov 2023 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSCcs4eY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c3077984e8so83265b3a.0;
        Wed, 01 Nov 2023 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698824399; x=1699429199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaTfkXJcsWYh5uAYv4mhG+OfOpapi/f9ImTWYM58lNM=;
        b=WSCcs4eY2XGAqbjDQmfg4bY7Ra9jcSdO6eXTNWRRm4G7BlBX7VMt8pSshODB6UGIfb
         haqbXY7MARCvtXbEc7RJTPQ9hM6YeMv6wfbihGaJeZMPJofqVUfqiYtfbcSkPpU4w0xA
         aYlAVzW0rd2X1HygQMZjOIUFgCt99/UQz8EiUvN9H0Tq2Z1f9/lWz8aSN6QihfD5LyxB
         m1Ao6p0/WZL5FE0OPz/qjiRFVFyXtUaqJzjAx0DfmUfrs4BscvMjKO2BhevQnxAmTrli
         p1cokwXRr4fWX/BvOqxm4TUHRJRJ/QbArE5ne3npMbs8ECzFx/XiZI4MK5iAolBt+CVU
         BJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698824399; x=1699429199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaTfkXJcsWYh5uAYv4mhG+OfOpapi/f9ImTWYM58lNM=;
        b=pJ6H0Z8QQQ26jE0wqOwys0Ds7VvfqM5Im/itJhn1zRCQOOsYNl80kmUZxJkvihDaSs
         zx+C/wMtmAfgdeBrcC9oRgKNAGCAYIAspXhNg2ogkb/qpHfy+ncGoF/b/WVo1Byeyj9R
         UHo6h2PnUXTShdghw3WdoFX0/uvWQPxz/W9AWLdtjbcPbTPtyswQpc9TSmi5t8+vQDQe
         5cDXZvkoe/petxnVlBwwmpYP+RZrnR70Ah64aLDo3WGfL8BAXIoJ3IkVYcS+fcKs1b5I
         MRnLa+nIcRsp/YdbO0jH9YU0Z6YfzOTOYHKCRgtDUiXXm7yszBYDUk5ILFTY4xJiS5jn
         t1Hw==
X-Gm-Message-State: AOJu0YxUl+jLLKJ0rTlb/lBbQoKQpmc0EEQLsV/IIRyhqqm3kdJKYGhk
	AWxsH+nMt0Bljn3R/hr22M0=
X-Google-Smtp-Source: AGHT+IEJK9IqlBWln2yy8MTDkKAUjJX4cbHw4LlzZt41nQjEK0AZpfxOQ4Vtl74E5H+jxfuKAwW9fw==
X-Received: by 2002:a05:6a21:338b:b0:159:e0b9:bd02 with SMTP id yy11-20020a056a21338b00b00159e0b9bd02mr14538190pzb.40.1698824398648;
        Wed, 01 Nov 2023 00:39:58 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id mu13-20020a17090b388d00b00274922d4b38sm332174pjb.27.2023.11.01.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 00:39:58 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DD85280A734F; Wed,  1 Nov 2023 14:39:53 +0700 (WIB)
Date: Wed, 1 Nov 2023 14:39:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dorine Tipo <dorine.a.tipo@gmail.com>,
	Linux Outreachy <outreachy@lists.linux.dev>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Charles Han <hanchunchao@inspur.com>
Subject: Re: [PATCH] staging: vme: enhance the help paragraphs for clarity
Message-ID: <ZUIAyQGSfIKqK7AE@debian.me>
References: <20231029180346.8570-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ph4bCGRF0u6YYI3A"
Content-Disposition: inline
In-Reply-To: <20231029180346.8570-1-dorine.a.tipo@gmail.com>


--ph4bCGRF0u6YYI3A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc'ing driver contributors found via get_maintainer.pl. Also Cc: Charles f=
rom
linux-doc mailing list as wording patches like this one most likely suit hi=
m.]

On Sun, Oct 29, 2023 at 06:03:46PM +0000, Dorine Tipo wrote:
> diff --git a/drivers/staging/vme_user/Kconfig b/drivers/staging/vme_user/=
Kconfig
> index d65cc5510649..65a3e769090d 100644
> --- a/drivers/staging/vme_user/Kconfig
> +++ b/drivers/staging/vme_user/Kconfig
> @@ -4,6 +4,11 @@ menuconfig VME_BUS
>  	depends on PCI
>  	help
>  	  If you say Y here you get support for the VME bridge Framework.
> +          The VME Bridge Framework provides a set of tools and drivers
> +          for VMEbus systems, allowing seamless integration of VME devic=
es
> +          with your PCI-enabled hardware. Select 'Y' to enable this feat=
ure
> +          if you have VMEbus-based hardware or intend to use VME devices=
 in
> +          your system.
> =20
>  if VME_BUS
> =20
> @@ -14,7 +19,10 @@ config VME_TSI148
>  	depends on HAS_DMA
>  	help
>  	 If you say Y here you get support for the Tundra TSI148 VME bridge
> -	 chip.
> +	 chip. This bridge chip provides compatibility for VMEbus systems, allo=
wing
> +         communication with various VME devices. If you have hardware th=
at
> +         includes the Tundra TSI148 VME bridge, or if you plan to use VME
> +         devices with your system, choose 'Y' to enable this feature.

Dorine,

Are you sure that your description properly describes what these modules
are doing? And most importantly, when users select them as module (choose
M), what will the modules be named?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--ph4bCGRF0u6YYI3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUIAxAAKCRD2uYlJVVFO
owJoAQC2v2Rw64vzjbVbztTMOUI/hXJ2aOgbdCacohfuzvYkZwD/ciCDXTleE1P8
GIh/Nsy2OZwTuZDFK26syy2LxMaRAA8=
=fXwj
-----END PGP SIGNATURE-----

--ph4bCGRF0u6YYI3A--
