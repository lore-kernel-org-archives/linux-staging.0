Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072727B;
	Fri,  1 Apr 2022 08:26:46 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id h1so2096190edj.1;
        Fri, 01 Apr 2022 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9hsMF7BCfjYirFT1IksTwNQVIId/FnL7I37gK+LNZTY=;
        b=coHjGKP2dzde1Xd07Zjvj7YNaOPUdCjyk2t2tfXmsE0tcUE75ziOcdpt1fFPR6xlE0
         qhPrIoZTrHX3XDBZcbWK2JV7qu2xXdArmEcIh9e1fUmmuE/nxFwhA56aFiL3+1Pap3Zx
         R6uwSoW2crKgJRdu0mrbKFaVinGAyfij3jgLGZCw2R0yOkP5cYuDTt61e54mU2h28yzV
         1vjZDKpMxE1TnESzbHi2TGM5AORJN4oJuRwahUv6pnzkuGlTvZKT1G5QyJ+cQcmdhtth
         Rp+G/R7kq8XRHRaDQ8G/DeUtQeK9c77P/vGz71SLP3eoNjwTOWqGaiJu/C843q/R4Cnn
         /WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9hsMF7BCfjYirFT1IksTwNQVIId/FnL7I37gK+LNZTY=;
        b=oCwqU9z/cFjCY1zWMbGvXXAfpm0J5UNbh4lyO12HSCvoltNsPR1/SoiuHl0nurLRKa
         7hWmqug1TpspIQ0eLay3lSn+bUwlIeW+TZ0mjiYCkGhsSnohzSn7RPvSC2pNQ/32vwbW
         +qiFckmYB1JQQruVcAPJecHXFTLQ6lD0gmB04odz97x3ZI029lDu89dxp9RZArINO02H
         JqZEumsadB4+iNpNPVZIIOcgUZEVQqVzo4Bm3Goq32QYiLY5A5iVNfv9Fb9dUqgmgKjA
         CUriE/1Vu3pUH+0sxTAttIiazp/YnaP9D6SjoaKYZbCzue+Xb7E7FgCVYX5tEYEzwmYg
         aHEQ==
X-Gm-Message-State: AOAM531G/tm0H7m4Zp4n+FJRukABpkF7xWGECD/UJ5xwl9U0a5hQnLBl
	yk6QMXAMqNSaJ5vmBeSxJWE=
X-Google-Smtp-Source: ABdhPJwtVEmM1Ovd0jOYKQpen33GZA28WERT42Fptm2WeHbobCIIXTD/T9VT5RllPkXMqD/pA8yRkA==
X-Received: by 2002:a05:6402:524c:b0:419:4d8c:e959 with SMTP id t12-20020a056402524c00b004194d8ce959mr20062285edd.398.1648801605184;
        Fri, 01 Apr 2022 01:26:45 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm757857ejz.57.2022.04.01.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 01:26:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, ira.weiny@intel.com, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vc04_services: Convert kmap() to kmap_local_page()
Date: Fri, 01 Apr 2022 10:07:36 +0200
Message-ID: <3162339.aeNJFYEL58@leap>
In-Reply-To: <20220330191414.23141-1-fmdefrancesco@gmail.com>
References: <20220330191414.23141-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On mercoled=EC 30 marzo 2022 21:14:14 CEST Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. In file interface/vchiq_arm/vchiq_arm.c,
> function free_pagelist() calls kmap() / kunmap() from two places.
>=20
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, free_pagelist() is a function where the
> use of kmap_local_page() in place of kmap() is correctly suited.
>=20
> Convert to kmap_local_page() but, instead of open coding it, use the
> memcpy_to_page() helper.
>=20
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_arm.c   | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index f0bfacfdea80..efb1383b5218 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -431,21 +431,18 @@ free_pagelist(struct vchiq_pagelist_info *pagelisti=
nfo,
>  			if (head_bytes > actual)
>  				head_bytes =3D actual;
> =20
> -			memcpy((char *)kmap(pages[0]) +
> +			memcpy_to_page(pages[0],
>  				pagelist->offset,
>  				fragments,
>  				head_bytes);
> -			kunmap(pages[0]);
>  		}
>  		if ((actual >=3D 0) && (head_bytes < actual) &&
> -		    (tail_bytes !=3D 0)) {
> -			memcpy((char *)kmap(pages[num_pages - 1]) +
> -				((pagelist->offset + actual) &
> -				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1)),
> +		    (tail_bytes !=3D 0))
> +			memcpy_to_page(pages[num_pages - 1],
> +				(pagelist->offset + actual) &
> +				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1),
>  				fragments + g_cache_line_size,
>  				tail_bytes);
> -			kunmap(pages[num_pages - 1]);
> -		}
> =20
>  		down(&g_free_fragments_mutex);
>  		*(char **)fragments =3D g_free_fragments;
> --=20
> 2.34.1
>=20
Hi Greg,

I've just received a message from you that says that a patch that I sent
on March 31 has been applied to staging testing. I know that you usually
apply patches in first come first served fashion (FIFO), therefore I wonder
why this patch has not yet been applied.

Please don't misunderstand me: I have no hurry. I'm asking only because=20
I suspect that this patch, sent on March 30th) could have been overlooked=20
since it has the very identical subject of another patch that I sent on=20
the same day (or the day before, I'm not sure about it now) and which has=20
already been applied. Therefore, they may appear to be the same patch,
because the only difference is that the drivers are different.

Thanks,

=46abio



