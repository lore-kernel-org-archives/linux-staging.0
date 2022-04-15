Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216C87A;
	Fri, 15 Apr 2022 04:57:57 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id g18so13582596ejc.10;
        Thu, 14 Apr 2022 21:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Deay7jAmMyRkDMzIjU7u06qBsjafRlssFVmGBUZbhvw=;
        b=YQ6/ULXIqpRb6u2jK1rgfGvE2zKp6qNt/qMH3C4USife7fpyw4LLsmAcimJDnKOe4t
         Mknnm8W7b4si5hzaJWBPPgdNQeJy2y9pZpGRXyU03ZJ9UWdf87vYVI9++NpwSPER2iO4
         d/flzGZ/3HQGZaf9+YLJepv64IEmekwR29w82r0+umht7DvATM5oSoEtRlkQ/1xszB/G
         IBBs+tok9EgAEcCNkzZGBuOMttHK6F3H7pFcHIOBBsYxD0LcGL7XYYXRoASiXGzV/JUG
         UqL3mzraRklxEXvdVLpBTN/iPApA586HvYoDhXKdokmtrnrxrJw61Gsy87S2n3YgR40Q
         6axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Deay7jAmMyRkDMzIjU7u06qBsjafRlssFVmGBUZbhvw=;
        b=fP+AiZ8zSYXRHPYOqT2xa4+roXa3lqT40ck7Iv9gm3AvR1bZ69P2OPPyDA7RbWvsmn
         pUooYuH6bWl8wV8zT9tm7VQpgJbkSi69Zmhf9qbF5yGmuKafJti/g6qnlElGYS0W9d7a
         5rKM73q2QvePC+CdniVhh8YvruyU75GFr3y6ftLi89aNhrpfQnEOGhI3Z04pxYQR6g7q
         6NwRGq4hkFs1HrmpdILB5kgtHPRok3eKy0awkFBaic3JlOMuomsYgkp4vKLiCeQEh6Hb
         fS6/A+Zth4v8V/OosG1PDA/It7NlUfbpkKn70gNAxOY78bfJE+lhM5DfYxg/oO2+vRrV
         vwlA==
X-Gm-Message-State: AOAM530QeuU7mgd2iihVOgrhmwTEIbHT0nSg6Y95TgrsQMfwpeEe9A1p
	rDL8frDY+GyNu2E4gxM+dM0=
X-Google-Smtp-Source: ABdhPJxT+h0/uUni34qZRuQ/eKcZmKWVus9qXtZAnF8iOUd5G35juUA2O0IghxZcuE5B4CBxO9GVZQ==
X-Received: by 2002:a17:907:724c:b0:6e8:59c1:914c with SMTP id ds12-20020a170907724c00b006e859c1914cmr5180940ejc.172.1649998675372;
        Thu, 14 Apr 2022 21:57:55 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id p14-20020aa7cc8e000000b0040f13865fa9sm2017964edt.3.2022.04.14.21.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 21:57:54 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, Jaehee Park <jhpark1013@gmail.com>
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
Subject: Re: [PATCH v2 4/6] staging: r8188eu: place constants on the right side of tests
Date: Fri, 15 Apr 2022 06:57:52 +0200
Message-ID: <2300552.NG923GbCHz@leap>
In-Reply-To: <baa4d5259e2eb48da1dd71e1863b62a086312a7e.1649990500.git.jhpark1013@gmail.com>
References: <cover.1649990500.git.jhpark1013@gmail.com> <baa4d5259e2eb48da1dd71e1863b62a086312a7e.1649990500.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On venerd=EC 15 aprile 2022 04:48:35 CEST Jaehee Park wrote:
> To comply with the linux coding style, place constants on the right
> side of the test in comparisons. Issue found with checkpatch.
> WARNING: Comparisons should place the constant on the right side of
> the test.
>=20
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/
r8188eu/core/rtw_mlme.c
> index bb9d595a90b9..d57f2ffa069e 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -715,7 +715,7 @@ void rtw_surveydone_event_callback(struct adapter=09
*adapter, u8 *pbuf)
>  			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
>  			pmlmepriv->to_join =3D false;
>  			s_ret =3D=20
rtw_select_and_join_from_scanned_queue(pmlmepriv);
> -			if (_SUCCESS =3D=3D s_ret) {
> +			if (s_ret =3D=3D _SUCCESS) {
>  			     _set_timer(&pmlmepriv->assoc_timer,=20
MAX_JOIN_TIMEOUT);
>  			} else if (s_ret =3D=3D 2) { /* there is no need=20
to wait for join */
>  				_clr_fwstate_(pmlmepriv,=20
_FW_UNDER_LINKING);

As Pavel pointed out, "s_ret" can not ever be equal to '2'; this could have=
=20
been an opportunity to remove a couple of lines of dead code and add one=20
more patch to your series.

Thanks,

=46abio




