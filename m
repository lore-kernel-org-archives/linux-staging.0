Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C04C1367
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 13:52:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id 4so10778209plj.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjL2/QXvUTUImqlJSUAW7Up4yT5vjNcXbyqaxlSaQu0=;
        b=fZSvMMahnYALrXRZSTcnsYyteUmHTGr0EvUnOnUr5aP8LtcWkq8CwmZfQwYH0OYM2d
         10Y52lVBmgbTsf+DTdudWQCgjlMEhfSMklw0biwNK+x79HzQrAXA0DAxaHRyemErIeux
         wqKikay4+vQ+7WyuDk0iMJeTH65YhMV+SaLrVWd//6eaP6wrskuVtszS7QO0MS1doRuR
         Fr/lL5mga+jmbCYxIg0NOo2YnSJPeb7JJFXb7CY3aKWpz9J7RXVapFRB/3zOVumL2ek8
         SVca+Gj1HXrp2KTHnAc17s+h6MYufSq8SNufztqRk1fLa57GeP2S86ap2YxmB1by1Z6Z
         Vx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjL2/QXvUTUImqlJSUAW7Up4yT5vjNcXbyqaxlSaQu0=;
        b=xG5OIWdEoyJqp2hSP/MhcHSNSKX0foZ+TB9w8gu1Og2Q6QVrPSRlRlbmCUy8lDGBN5
         itLxukKyqh9WKK8WZOtNn6R86fzuxon6EXTf2DO4HX5AoFNWpyi9IxdI4idRPw+zKxhW
         yThkXRq2Q5yPGClSVmltpLx22uspJQaluSlrvrLYGETZKNN7bY6NmB5MV3BNz6o2lqoc
         kfVBfp0txHlzMjh2cGe9OHkXvu3Vl1n8yb/ATHyZUL11ETtX2hVE72kFM1sI2avGOdRi
         GN/56QbYir4jG0b6aJtcSB26gVTmfxQj4IPZ8oajFjiT33N8u9MKb6bwmTmkLITydnyw
         BldQ==
X-Gm-Message-State: AFqh2kpAJqUZdSwPahdC+bVSk7OacQ+YJyLc3fZbXaEdjnPjQQrdfyQl
	6pjfmBGxQAxqxVMIRZe/1f0=
X-Google-Smtp-Source: AMrXdXtF0CJT5TEImdqLT6P+vfkloyP/APJlg1ZZj6LY+WRnq+l6XueMTfjmmAwah3QVkuNaY6Y0kA==
X-Received: by 2002:a17:902:aa49:b0:18f:5bc0:8f0 with SMTP id c9-20020a170902aa4900b0018f5bc008f0mr21628881plr.69.1672062729500;
        Mon, 26 Dec 2022 05:52:09 -0800 (PST)
Received: from debian.me (subs03-180-214-233-70.three.co.id. [180.214.233.70])
        by smtp.gmail.com with ESMTPSA id b3-20020a170903228300b00179e1f08634sm7170091plh.222.2022.12.26.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 05:52:08 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 794CC10381D; Mon, 26 Dec 2022 20:52:05 +0700 (WIB)
Date: Mon, 26 Dec 2022 20:52:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Anup Sharma <anupnewsmail@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in
 comments
Message-ID: <Y6mnBSg6i5wMCKUV@debian.me>
References: <Y6mYdPlqIK1VgQ0Z@local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/cuFQ4lObo4YSjvd"
Content-Disposition: inline
In-Reply-To: <Y6mYdPlqIK1VgQ0Z@local>


--/cuFQ4lObo4YSjvd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 26, 2022 at 06:19:56PM +0530, Anup Sharma wrote:
> They are appear to be spelling mistakes, initially identified in a codesp=
ell report and never been addressed so far.

Then where is the report, and what are the reported diagnostics?

--=20
An old man doll... just what I always wanted! - Clara

--/cuFQ4lObo4YSjvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY6mnAAAKCRD2uYlJVVFO
o89DAQCXF8F+MsHSscJA6zxoux/LDtVSTtKiXkrWzo448DJ/pQD/Y/zf/Fd/teoG
pylsRaLivJ3NrfIfxAaWQUyITqqvbA8=
=oYZ+
-----END PGP SIGNATURE-----

--/cuFQ4lObo4YSjvd--
