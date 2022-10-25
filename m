Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A857B;
	Tue, 25 Oct 2022 15:28:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id bp11so21157743wrb.9;
        Tue, 25 Oct 2022 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r/lxb9syFi5fszVxey13EVYUFPTHODfMEEaPAN/V+Y=;
        b=V381NSJCc2t+KGfhMm8mz4zvLvUd1ECWt2Vg5y1ifx5E4L3IBAiDSRqQGj3Af6/log
         dvzcHCrt8eR0BcP3QJLig4KAwW+Qx9duhgXdGEClye3/s8l6nOkhL95NQo3hNzmlo1CF
         ggdhZTBfabsD4bUcZdOCI2yIp3nVwMdndztOLdI4fAxy0yO2c3Ww4zMT/QDpPLd7Q33R
         5HG3fP2syiJpc1A/ikzob+C3y9qDmtsngf4hSh3k/BB9kwBXCRX4GarXRgAGpGXHkRAY
         7Yhd6Haq2Mcr8Eshwk+u8bTf+FqR3mfsSokRK4pbZuZtGluGnEtq0ACluHE7de+QB13k
         Tk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7r/lxb9syFi5fszVxey13EVYUFPTHODfMEEaPAN/V+Y=;
        b=Wa82pdpplndB4NY0bWvkUjk/yCyyiqHuC7cfEI9fgGuDhj3oSPqf6nKJRKCmemHSTF
         FzCBTLvxdIyojxogs+/VJig0E+v+dwn0wo7NJzro+wZ6zU4OL4xsJqZKyOO2MzvGBH1l
         OjqNNGaI5LzY1JNEYT8SylvSqJfrgbjL0n0ucUc9U8zxTSJRntD9P+BD13fHzFV+UBDe
         5/E163A1Kmayicy1anfxaO5/9QxeoxsuBGWvvrN6KDdoU3DLDe98w8xNlOldVAfWZqyb
         Kxb4PNRuNA/o8HoYRQ/QTF3Aw9gWsfX+jAyE3jrkcim93ColV5ZYHU+ljtfTRK/HVrDk
         vk9A==
X-Gm-Message-State: ACrzQf2TaShQggV5raatiP3fmpHVPUX7mm+5aCsD37U9tbJ8+RakPDmN
	TL8sVIcF6wUfXMpGkCaesas=
X-Google-Smtp-Source: AMsMyM5K0ZKfrU9AcZgM/WGkAuYCPoBp+s8EysvSeUPepfjiMjsmTSvUp3+EbonMe8RJZrf0AZOixg==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id r16-20020a5d52d0000000b0021e4923fa09mr26317288wrv.244.1666711704051;
        Tue, 25 Oct 2022 08:28:24 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a2-20020a056000050200b0023662245d3csm2848766wrf.95.2022.10.25.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:28:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] media: cedrus: Add helper for checking capabilities
Date: Tue, 25 Oct 2022 17:28:22 +0200
Message-ID: <8131177.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <Y1f/U8NxyJo/pMAH@aptenodytes>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com> <13124586.uLZWGnKmhe@jernej-laptop> <Y1f/U8NxyJo/pMAH@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 25. oktober 2022 ob 17:22:59 CEST je Paul Kocialkowski napisal(a=
):
> Hi Jernej,
>=20
> On Tue 25 Oct 22, 17:17, Jernej =C5=A0krabec wrote:
> > Dne torek, 25. oktober 2022 ob 08:30:28 CEST je Dan Carpenter napisal(a=
):
> > > On Mon, Oct 24, 2022 at 10:15:08PM +0200, Jernej Skrabec wrote:
> > > > There is several different Cedrus cores with varying capabilities, =
so
> > > > some operations like listing formats depends on checks if feature is
> > > > supported or not.
> > > >=20
> > > > Currently check for capabilities is only in format enumeration help=
er,
> > > > but it will be used also elsewhere later. Let's convert this check =
to
> > > > helper and while at it, also simplify it. There is no need to check=
 if
> > > > capability mask is zero, condition will still work properly.
> > >=20
> > > Sure.  That's true.  Out of curiousity, can
> > > cedrus_formats[i].capabilities
> > > be zero?  Because it feels like that's what should be checked.
> >=20
> > Yes, it can be. It's the case for V4L2_PIX_FMT_NV12_32L32. All variants
> > supports it, so there is no special capability needed in order to be
> > listed. What would you check in such case? Condition still works for th=
is
> > case.
> I think the problem is that (bits & 0) =3D=3D 0 is always true.
> So if the input caps are 0, we need to make sure to return false.

No. If format (or any other) capabilities are 0, means they are supported b=
y=20
all variants and it's expected from cedrus_is_capable() to return true.

Regards,
Jernej


