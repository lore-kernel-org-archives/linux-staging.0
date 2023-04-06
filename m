Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147ACECA
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 08:00:38 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b20so147275280edd.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Apr 2023 01:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768037;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQH+iRWXQXzrMch9aFmJkKfa79kh+f41Jg9zUvyUDYc=;
        b=IzH1LBufvIiF5rjtHs2OViOTXLaUQ/nT0dvzEtNTVKku7M2CyskBPXnebDVe/qA0aR
         FusvQs0umKVGxpL/VTQ0zwtxVwYQPwvXR2akjtb/iV1UkJZYhJlzwof2ojROi0PmDAJG
         jvbqQ9+83P9+lvKfeB9y/itUyMR5fqY/xoRvOLFVcd8DzX6Ug/KMAag65CqjQgsStuTc
         FO5wHPzoDfkHBSjioRBu5486GaRhP2qMTsgc210CuUEMvdXz+HT3YunOSDi9a/Oy9GIb
         8fu52k0CNbdwc/s3N6aDZnO84/uixLGPYXKSKmfMV2POalKrRWGUYRhL2F0SeI9ItmvP
         SS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768037;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQH+iRWXQXzrMch9aFmJkKfa79kh+f41Jg9zUvyUDYc=;
        b=vb2nL4P4nDYvM6oH3DR/ZRpGNf1H6iWrR0kREOkoZYQkGdhUfS38OO264l+ugAfQ3v
         tqFd4dUUVsYEbkM3BOMrlEa1mRTp61hsKuU8DdFF+Sg5fDo1NJRreuA/1XL6NwEF3qs+
         QIR4DKrbO/plG5IE26sZWwb8GwrvyKcJwaHmJTQMkvCKJnjJ0CTP+Yf2Px4xVEVkbDVE
         lTYWOk4e7F+lbvfo3tfp2y66LLHEHA2LELLIgrRtZpQRE6x/2rwDc1kB0NbjgPj3DySu
         ivl7dImuYO2zoYz38Gv4vs3L+8hJWjPIeoN3cfz8JHrHDbd9R/YM7qQpk08ltPuTxZhX
         9lrw==
X-Gm-Message-State: AAQBX9cEQx76ADvVSH/CoOpcHUSAh26O6Yz8jLKklNByiE5jOBl/HHDe
	nPFMYnE6cmCw1EEqOSYr+Lk=
X-Google-Smtp-Source: AKy350Zln1rHkseAywxn36shRvYFdkWQ7QSVBFsGgDypBCXbFctm0iaYDiDxGcFUUhAKWrU2spc3MA==
X-Received: by 2002:a17:906:fa9b:b0:945:d94e:7054 with SMTP id lt27-20020a170906fa9b00b00945d94e7054mr6300868ejb.36.1680768036990;
        Thu, 06 Apr 2023 01:00:36 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id xf4-20020a17090731c400b00938041aef83sm452290ejb.169.2023.04.06.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:00:36 -0700 (PDT)
Date: Thu, 6 Apr 2023 10:00:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marc Zyngier <maz@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH v2 04/10] serial: 8250_tegra: Add explicit include for
 of.h
Message-ID: <ZC58Ikn9_BUFg_-h@orome>
References: <20230329-acpi-header-cleanup-v2-0-c902e581923b@kernel.org>
 <20230329-acpi-header-cleanup-v2-4-c902e581923b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E3hFsuwxav/nr+wF"
Content-Disposition: inline
In-Reply-To: <20230329-acpi-header-cleanup-v2-4-c902e581923b@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)


--E3hFsuwxav/nr+wF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 03:27:18PM -0500, Rob Herring wrote:
> With linux/acpi.h no longer implicitly including of.h, add an explicit
> include of of.h to fix the following error:
>=20
> drivers/tty/serial/8250/8250_tegra.c:68:15: error: implicit declaration o=
f function 'of_alias_get_id' [-Werror=3Dimplicit-function-declaration]
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/tty/serial/8250/8250_tegra.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--E3hFsuwxav/nr+wF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQufCIACgkQ3SOs138+
s6F+KA/7Bm/KfMbX17OH6FnJh9eMe6ljjpv/iZNRAm7bGZO0mhFGi50XBZsNztqA
VNB3JF2eIsl5fLvZBh3scXkKTB1CEYLOAuhQtUehAXCTDLIgRUn9IzRjit6RBnnU
XTeYRtdEyWtdS90j2nK0edHGOcfOMxYyn1UV/Whtawnx16Ub/ZdIHmTvg454Upqd
2Dv4LpcZIfLFJdPl5B+bYP/Q6Dg9mLDYr7U5V2zxziaDKMOb2L7gN5GMOCL0S+rw
9yHOVa0YxfP6B1zvUjJ8xW0e0XPcRO2f1zApQ0SYpN9DVyKozeB1/U+itoq2wkXS
zVAYUCydZ7TGrFL/NkksLddPwzdLiLeAVDTjwHadnaQERW8NGQkN0Dy+GKSGFFAo
Vsd3TxyP107px9msXa9QHVlPnC2mVgwkg5ZJeWRonPo5lFTC/XpbPe1pnbtn3yjg
o+CKRA75MyFgOIytYdgGK/3/9OJu85zmc0WEQy+0kJnnjLe45y7V7tpMHObl3dGa
KqGTSfMmnf3G7cFAfE1PDdOh/vMO/z2oCc0XR9GdAsEbTXd2E0lrGuw5zrbZYWLO
CeYAiWdsUDmqLEWwKwUT04Z9315lKkJvueZGXfxlGtsz/1j7jVDeC7lUl0u9zt9h
pEq0jCI12awFhFZmUO+3w5b9DBTnKowjD+JwRlg+hs5o0OD1d88=
=T9ol
-----END PGP SIGNATURE-----

--E3hFsuwxav/nr+wF--
