Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554AD437E;
	Mon, 28 Mar 2022 17:10:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id yy13so30070733ejb.2;
        Mon, 28 Mar 2022 10:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ofjd2BLbf/d57rh07u4nbPhNk5X3kqpA9oKVtxjKxc4=;
        b=RdJbBdxYbiTOUg5lxR0R+3/uOKZOUPBBpsyEkMPR8HHH3Wj7UmqQ0sxQA+kkEx92pP
         oce38WRh3IhgxR9b2W6uMT1D9+r/0P1SpUwYPi2tFx6GrEQmLX1anrY3S/AYbj7Tggei
         urziVxnW+ZtH9/qhxaj1Xfafl9l2o7GoXkfPeIu/Xrxf/85l/uuFuYCTIk25IxrCOnSl
         73TkmiNmg2xjWech/yEn3BCp7ycy20cfnr3ShHoF3LTMke99AY6KPD7ZeD84aEj8RaRE
         XlDOqkH9+eq5M3h4qYxL3A8KBiJfQ8dLHcCju/ft3Ymfl0LgwqHkDqEOpV+2ZzuUzFS3
         xZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ofjd2BLbf/d57rh07u4nbPhNk5X3kqpA9oKVtxjKxc4=;
        b=ofoy4QdW3ah6OGtKnrECNV/YjgCDg6Anpvu/wBcK78SIcAzLbAa/AdXUN87x9K5Ubd
         89CAkTLuhJq8ufRPANqTkELhEU/MdSLydkHhlg4XBrd7UGhGfhCISLUOE3pH6VfPDuqf
         tEFEbm7v7CZdmLlqxoQQF4WYBVCumPciAQDERESBJw9d0TFPtlPU0QW1dq7ug8YN23XK
         xAlWkMiv1guMNbBDIWELeqcWSLRF0T9QbAR3FRA+zyMm90sDMIlEx/QaW/VMl42nUHcQ
         c3OuBp0CYDOdL/5FhB/4p5mKp+BQEMjJLdXSpt3MO319QIFajhg0uUE5N9MEqku7LFt+
         Rzrg==
X-Gm-Message-State: AOAM532etLhTWTT/D0g6ZRL5jJB107IIKFLtD0EYDduxel7Un9xPtKeO
	x1bQwvtqYqAKsyF1rYApxUs=
X-Google-Smtp-Source: ABdhPJyqg4BdnBj4b8BiPKRMBVJOYfgoYQTkh+JHfQmfe8ltITzE2pv4VlnjsBwMAjCa2rMFVr44bw==
X-Received: by 2002:a17:907:728b:b0:6df:8f3b:28ae with SMTP id dt11-20020a170907728b00b006df8f3b28aemr28825891ejc.336.1648487417609;
        Mon, 28 Mar 2022 10:10:17 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id j9-20020a170906534900b006df9b29eaf1sm6174022ejo.8.2022.03.28.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 10:10:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: acourbot@chromium.org, tfiga@chromium.org, hverkuil-cisco@xs4all.nl, Sebastian Fricke <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, open list <linux-kernel@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Subject: Re: [RFC PATCH v3 1/2] media: docs-rst: Append HEVC specific term
Date: Mon, 28 Mar 2022 19:10:15 +0200
Message-ID: <2095465.irdbgypaU6@jernej-laptop>
In-Reply-To: <20220327084308.9053-2-sebastian.fricke@collabora.com>
References: <20220327084308.9053-1-sebastian.fricke@collabora.com> <20220327084308.9053-2-sebastian.fricke@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 27. marec 2022 ob 10:43:08 CEST je Sebastian Fricke napisal(a):
> Describe the coding tree unit as replacement for the macroblock in the
> HEVC codec. Highlight a key difference of the HEVC codec to predecessors
> like AVC(H.264) to give a better overview of the differences between the
> coding standards.
>=20

Looks good to me.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> b/Documentation/userspace-api/media/v4l/dev-decoder.rst index
> 3cf2b496f2d0..eb5b1b1e3a51 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -72,6 +72,11 @@ coded resolution
>  coded width
>     width for given coded resolution.
>=20
> +coding tree unit
> +   processing unit of the HEVC codec (=E2=89=98 macroblock units in H.26=
4, VP8,
> VP9); +   can use block structures of up to 64=C3=9764 pixels;
> +   Good at sub-partitioning the picture into variable sized structures.
> +
>  decode order
>     the order in which frames are decoded; may differ from display order =
if
> the coded format includes a feature of frame reordering; for decoders, @@
> -104,7 +109,8 @@ keyframe
>  macroblock
>     a processing unit in image and video compression formats based on lin=
ear
> block transforms (e.g. H.264, VP8, VP9); codec-specific, but for most of =
=2D=20
>  popular codecs the size is 16x16 samples (pixels).
> +   popular codecs the size is 16x16 samples (pixels). The HEVC codec use=
s a
> +   slightly more flexible processing unit called coding tree unit (CTU).
>=20
>  OUTPUT
>     the source buffer queue; for decoders, the queue of buffers containing




