Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319F7B;
	Sat, 29 Oct 2022 02:28:30 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id j12so6346267plj.5;
        Fri, 28 Oct 2022 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9ysr/bjm0ZC9gEtJk1P7ow/P+t56kY5dDvtQcNi4MQ=;
        b=FGrs5I3W0Ji7vhkQCs00jzZ7Aj0Air8e0TbGIn/F1GL8m9dZ+qJbqndA0WYmV1jxAP
         EVzEpQoUFeTxRQq9pfDXZbrfBJUcgpnFyX9RHKykTiXF61xswZDX2af1pEW0/Msqh4fT
         lfP0+/bAtHZNsaHudqD8epUZQbQMIy6vpU8GWvSidtrV6XROlE38hSftnqRxE/Rhpdm4
         ThNy2HC4fp5HFdMdItboHykF9otcV+Sum9rIUd9hAe01fL5JnqiU5EqiRG6v844AMbjD
         Q56Jy5wPbUlXpvzZKD986FsZQGg7KTlo7CT1QJ8tuMFZDiXLzbKfVCgp0F+nJlF+jTTX
         SLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9ysr/bjm0ZC9gEtJk1P7ow/P+t56kY5dDvtQcNi4MQ=;
        b=BLSm3bK0noDHPnfApwMYiQlFN8BRjAr34suK9uMYTHcGGm6Tl/KdZG1U6vyCfyDKgg
         PTwLRoPWds8Tx30bfTs9iIQT41jr+FINNUoXLaDefPxn3s/qoQxBHftzTmm70c9MR4Yq
         0EsUdmGxM/2PwW+rzo1QwAozVRgFzB1He3Rii7SdIM0ctKJTao0Yyup06yewJJILTEk0
         fZFMmF44Ak0TvotbXc4f2KCUjG3tSsoCnpsgsDJJD+y8PCXLYCPwmN8Y+JJKRCb2a7/Q
         9owmDnPGKjmjxwjDGvsqn2FVcFvzXXBXHe7aXNyzaa0aXGE3lofuz5EPRA+CITzrDPEX
         Wvvg==
X-Gm-Message-State: ACrzQf27Or8otBq24BLiUmS74J0K/qBHhMRTol7gJb9xORBW+3IwbnWB
	Z9jUDG5YwgcCxghvixcCjfk=
X-Google-Smtp-Source: AMsMyM4nPcwAfXy2Nwfhr15BiCSuQ4amKaNnrsmBP8YEDBDAqedWuo8T7hIeLXZWNndQ7IRpfEMoog==
X-Received: by 2002:a17:902:9b82:b0:183:fffb:1bfe with SMTP id y2-20020a1709029b8200b00183fffb1bfemr2147655plp.173.1667010510259;
        Fri, 28 Oct 2022 19:28:30 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-25.three.co.id. [180.214.232.25])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090322cf00b001783f964fe3sm142833plg.113.2022.10.28.19.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 19:28:29 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0A054100A5A; Sat, 29 Oct 2022 09:28:26 +0700 (WIB)
Date: Sat, 29 Oct 2022 09:28:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v8 0/6] staging: vt6655: a series of checkpatch fixes on
 the file: rxtx.c
Message-ID: <Y1yPyt5NsvfSL3UC@debian.me>
References: <cover.1666978292.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ADH5S7zY59Gn+n8g"
Content-Disposition: inline
In-Reply-To: <cover.1666978292.git.tanjubrunostar0@gmail.com>


--ADH5S7zY59Gn+n8g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 05:40:52PM +0000, Tanjuate Brunostar wrote:
> The fixes are similar, mostly long lines splitting. I had to make
> serveral patches to ease the work of inspectors
>=20
> v2: fixed a compilation error found by the kernel test robot and
> recompiled the code
>=20
> v3: tends out the error persisted in the second version. this version is
> a correction of that
>=20
> v4: did some corrections as recommended by Greg KH
>=20
> v5: shortend changelog comments as recommended by Greg KH
>=20
> v6: did some corrections as recommended by Greg KH
>=20
> v7: fixed some errors on my changelog comments
>=20
> v8: fixed some errors pointed out by Philipp Hortmann
>=20
> Tanjuate Brunostar (6):
>   staging: vt6655: fix lines ending in a '('
>   staging: vt6655: fix long lines of code in s_uGetRTSCTSDuration
>   staging: vt6655: fix long lines of code in s_uFillDataHead
>   staging: vt6655: fix long lines of code in s_vGenerateTxParamete
>   staging: vt6655: fix long lines of code in the rest of the file
>   staging: vt6655: fix lines of code ending in a '('
>=20

You messed up your patchset...; the shortlog above says "fix longlines"
but individual patch subject says "refactor". Well, refactoring
means resturcturing and improving it without introducing new
functionality or changing behavior, which is really changing existing
code. However, your patchset only do visual formatting, right?

Also, have you ever at least compile-test your patchset (make W=3D1 and
enabling CONFIG_WERROR)?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ADH5S7zY59Gn+n8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1yPwAAKCRD2uYlJVVFO
oydYAQDtxv1qvxNsp2r080rxws4fOrvmdai2HM6FMB9NuFZJBQEA2zlbqqEl8/+q
1qKuGuRxbHVjustXYCAhX+veICs/XAw=
=KkOZ
-----END PGP SIGNATURE-----

--ADH5S7zY59Gn+n8g--
