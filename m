Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F11187C
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 13:36:27 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id p14so4402609pfq.5
        for <linux-staging@lists.linux.dev>; Sun, 09 Oct 2022 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPRUb5fXBvpUrUoLBXNgAFQk1VijQRqMyh2TnAMTGtg=;
        b=beTouj+LzjAy8bHGQMDqKT9uxR7+7XKjjMVtkF5HUjZjFOyWy5MDeNI0sbikopgIIR
         b853xvaVfPCinMZcjhK3cK9ZxbH48csvVi4Q+kS9WXDK2k6+72s0hGK1qNUUK05AjBaE
         jZBiYyaQbnQyHvOCjpcpD0mxGfUNbrEZH2YwoOVVEPtvu+MBqiUINPqUVhyO9wuQsfHO
         4oG4OHGOG6DSnGHTk918cYqYMXiOHOjL45kdhlgEbPtr8lW0f8WjdidP1pmcZkibX89d
         iov0kHe+ZZa0qBmA042j2VMWtIS6apB+vSd6m2sgkXzzUOeiJshDMDHL1VLdE4c6IEws
         QJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPRUb5fXBvpUrUoLBXNgAFQk1VijQRqMyh2TnAMTGtg=;
        b=bjFwUrRySCuZFhrGknsaMHoFvjeXtlxIFvRasXmTJxrnV5ARpiRyCUOEkaw01xPuBd
         LOGNm/q3+AYOJ1qPrCaK+EgdYgQeYlgDiIl6QJX7ceam5bRTylPVIwVIwYvcVJi5sjPc
         xnm+KrkWAG9h77g6FrlRy0ozKGnP3MZ0eqwkOVWGDLz53Q4pyIGacTEdR8OUjxTq9s2Z
         Y3KI5bavH1wUOCLLLc9uzbe81zneztYLYKuRCStJ7I/SpTIZSZQtv4eDU6zZ7G2xUyhb
         ibAHyShYHo22NPGO43LBYAL+ZZ49TXd8++3L2tWmgdwTeZlqTDjeFH0sHRXR69645XZQ
         zJhg==
X-Gm-Message-State: ACrzQf1MHcTISIr6yGSAXDBLv+SzOr3xgT5dnLbMAUKch0ZZwN82Utzj
	hq820sfxRVW6SNlWvGca4XY=
X-Google-Smtp-Source: AMsMyM7qirq+CTtzxgDgLaxC/gCx4mvSFpalSIjpkC4n504fPbAnHr170mHWnY2T6hWKZyD6AXF5JA==
X-Received: by 2002:a05:6a00:179c:b0:561:64fc:3037 with SMTP id s28-20020a056a00179c00b0056164fc3037mr14842409pfg.76.1665322586893;
        Sun, 09 Oct 2022 06:36:26 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-66.three.co.id. [180.214.233.66])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090ae00100b0020a7d076bfesm4469527pjy.2.2022.10.09.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 06:36:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id ED98F1039BF; Sun,  9 Oct 2022 20:36:22 +0700 (WIB)
Date: Sun, 9 Oct 2022 20:36:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiangshan Yi <13667453960@163.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] staging: sm750fb: fix spelling typo in comment
Message-ID: <Y0LOVuL8uNJ19bjV@debian.me>
References: <20221009094809.3171319-1-13667453960@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dZhQDIkS5gtuuN7K"
Content-Disposition: inline
In-Reply-To: <20221009094809.3171319-1-13667453960@163.com>


--dZhQDIkS5gtuuN7K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 05:48:09PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
>=20
> Fix spelling typo in comment.
>=20

What comment are you trying to do this typofix? Even seeing the diff
below, I can't figure out that due to insufficient context.

> K2CI (Kylin Kernel Continuous Integration) is a code pre-verification tool
> independently developed by KylinSoft, which is used for ensuring the
> code quality of code submission. K2CI includes the comment check tool
> notes_check.
>=20
> This spelling typo was found using notes_check tool.
>=20

For CI bot like this, I'd like to see publicly-accessible reports (like
build status), just like what kernel test robot (aka LKP aka 01-DAY CI)
does (try searching LKML for recent report by it). Don't forget to add
Link: tag to the report.

> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/staging/sm750fb/ddk750_dvi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.h b/drivers/staging/sm750=
fb/ddk750_dvi.h
> index c2518b73bdbd..afdfdb17ffce 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.h
> +++ b/drivers/staging/sm750fb/ddk750_dvi.h
> @@ -2,7 +2,7 @@
>  #ifndef DDK750_DVI_H__
>  #define DDK750_DVI_H__
> =20
> -/* dvi chip stuffs structros */
> +/* dvi chip stuffs structures */
> =20
>  typedef long (*PFN_DVICTRL_INIT)(unsigned char edge_select,
>  				 unsigned char bus_select,

Are the structures really plural (many instances of the struct)?

--=20
An old man doll... just what I always wanted! - Clara

--dZhQDIkS5gtuuN7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY0LOUgAKCRD2uYlJVVFO
o5abAQDCCPg+8fcvsOLmLonB7xsYw1IuPRjkPfOSqr/8ap6WEwEAn5L6/13EPykf
a2SW0VQuhr/iphjQnmqDUEb/ftTmHgM=
=zi0w
-----END PGP SIGNATURE-----

--dZhQDIkS5gtuuN7K--
