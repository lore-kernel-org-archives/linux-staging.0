Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E3481F
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 09:28:57 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id fi11so15981620edb.10
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680686936;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBpy8sWwJTgWGLvReKzXSppeMMMH/k1pHf1dgNFGfSc=;
        b=ioBNji+RxxxGGQ36bVeyUwYahfusubuoh5Nwpq0S6lk+P1tK3t617l85xXHF1RH0E0
         OGxhS5anmVXjcVjpR+cbMmDWNfn4bIBMxP+oldipb595Nm4MKsIiMhXp2ZiYKDkndoSp
         Ip0puBLq2gl8EIc5OPqJfRLUr1eeu6Dp2CS1jPMDYXAbJ5VSj+oa/5eC1+QsHEh7XbIG
         xLx6LP3veiE7hqgzSPqs2IgixTI7cdW2YUmY3BZSoDwC4d//d1vznOdaiwKh1KwmZOWm
         wjt7g9JbyuUknwjyUUyhh5+p47Pnizp9TtWBp2UEfkhNqXSxT2868Yxo175m3wJ1KHoE
         h98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686936;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBpy8sWwJTgWGLvReKzXSppeMMMH/k1pHf1dgNFGfSc=;
        b=JEFNEJguvpTtS9xrktbXeVuKE4GaAj05ScTNAzqvxvpD5WdtBQXigkIftW8xaNeQ1i
         mJodu/joslTHNH2inYx4K2zEr12KOLQxsHtQ4vehk8iZ68xZwGb3vX5+yYPLskBrjJqN
         S9xltOfD+SD2g+QRsr/efp71SUd/8xIM7MPlDo1Pk73JPjagh34of4zNXuyo5wZxpV6o
         imLOXUh4mjTjZDAhvmFomeuduzCTE2maNbYEANfyGZIjXKGJx1l7dfCMIS1kM5rS0rkr
         AiG7k6EeUXAjzv5tcFUaZTzMm82k2RQiS3080XzS18swdEOVkU3235KdpEOdJOF2Aed7
         fHiA==
X-Gm-Message-State: AAQBX9e8T9ftJWevOoDnYh5QDXtxgI44fAN06WJyVQxVrf9hhOCvbE8N
	EJgXdMMvYspfwY+loWPUi2g=
X-Google-Smtp-Source: AKy350YUNRcjDWMLp0qTEat7nfaXpF/+sohcF9dQ+5CXzGSGZoXIEtlOhulbBix6Li3JgyJN/QV8Ig==
X-Received: by 2002:a17:906:6894:b0:944:18ef:c970 with SMTP id n20-20020a170906689400b0094418efc970mr2515964ejr.32.1680686936010;
        Wed, 05 Apr 2023 02:28:56 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qp25-20020a170907207900b009342fe44911sm7031978ejb.123.2023.04.05.02.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 02:28:55 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:28:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Richard Leitner <richard.leitner@skidata.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [RESEND PATCH v4 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Message-ID: <ZC0_VX5VDOkSVhn6@orome>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230309144320.2937553-4-luca.ceresoli@bootlin.com>
 <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
 <20230404161251.272cc78b@booty>
 <20230405023048.GD9915@pendragon.ideasonboard.com>
 <20230405103134.2ae10766@booty>
 <dddd76a7-f882-f1dd-0781-fcc1f9b4e060@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="05p1aaOYNTitphbN"
Content-Disposition: inline
In-Reply-To: <dddd76a7-f882-f1dd-0781-fcc1f9b4e060@xs4all.nl>
User-Agent: Mutt/2.2.10 (2023-03-25)


--05p1aaOYNTitphbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 10:50:37AM +0200, Hans Verkuil wrote:
[...]
> Note that this driver will stay in staging since it still fails when I try to
> capture from two sensors at the same time: syncpoint errors start appearing
> in that case. I think there are locking issues. I think I have someone to take
> a look at that, but first I want your series to get merged.

Mikko (added) is familiar with syncpoints, so he may be able to help
with. Can you provide steps to reproduce these issues? That may make
it easier for us to help figure this out.

Unfortunately I don't have any device with an actual sensor on it, so
I can only test with the test pattern generator, but syncpoint errors
sound like they would happen with either setup.

Thierry

--05p1aaOYNTitphbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtP1UACgkQ3SOs138+
s6FNpw//dPYUajgCSBJRv0WcnavPtJ3hVlgqhl2wBA4rqtD1NNMJEWkZsI/IUwFu
Lq/UJQuk/brWu8OplLlMaLWm5lngUBMM+t7qHepjdX5GFGKRB684Q106smQw071R
FZ/UqPxLxi9jjWtfAukVZfTjaMxrHt2iSKzz/mc1Lfs2TItZVG0pEEzC3XQdUxks
xn/2wtvoxYBWtDUY132MRYCvS5t26sP8iiZX4Xlm7QYFkQtpwkUi2BmLDS+pPJ08
QulGePJQHZT95TMrSFCcBmuIxJSPYVUlkzG35IxtkVc93NV6TuVHqW3dRg34+jtN
Cj9d5mFQ2fPNrNiHGCT7OTTKI8kVy3nZS+yXydHYIQ1NkAOfFzKSHxwd+XA419SY
emZIhrXy/5VxsNpygDOkkiiP+0VfXKhlGVar0mJhOSKbmbiQwP1T0eQDpeFi7TCF
WW8KFHJqGQgsfSL8pxxqbrwxY2zv5kLllHkyEfU/xSNgvjL3u1qfLnvy8HviuxGX
fmwk/pOaR0+wenBd89SY8tNyz9Nc3DwrfQ70mPclhfG0WrsenmSgzmlk2hWNha7V
I2T44bFe95lkDhDFU60gnlKL8jpPeICyIVJ3RXPpXN099f8JzjNI3GqfgUwIfaKA
Whu5bJHeUZ+EPc0lrH0kkbjY8w2oTyC9W6tF87eqa8M7kujVdgE=
=GclZ
-----END PGP SIGNATURE-----

--05p1aaOYNTitphbN--
