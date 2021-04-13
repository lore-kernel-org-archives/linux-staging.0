Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8BE70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:29:53 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ba6so19904024edb.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pLUmeAGbyxS4gCgJNLnU1TDnjgxiRdNMqdxBHojttNA=;
        b=sMbM04Wz25J4jyg8B5uaDTpUkEIXYbtEOMrzFIBsFKx+oF78SYyeA+Nbu9VCtdSXpb
         AXSm3jUPry80zckyKZRlYNwaFGydX2ao18WDnDGmzlGaiSdw6ClXsIeY5+uLSXxen9F9
         hgx+xraDuXKfR8q7PrKX8ik2zlLwfB/DZbXi1ihQ3ijfy1KwdGcult5v2bD8mDd1qb2k
         ZQsf1GXnHxmC8PrlYJskIhkvsrMwzUxMVg5W19pDjp7RGjBegIM0w1z95ufBcDDvMHHC
         UZ+vQOXbZoy4V3nHRvjQmExU36VhLM4UtTTvkBVXVH/Ycw87DbQr3S/AxCMrU3LTmZo8
         K8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pLUmeAGbyxS4gCgJNLnU1TDnjgxiRdNMqdxBHojttNA=;
        b=B6t87nFPL8XV/NOIL5BnoHzDG0Efl330/vf96dCoRoJ61VHuEbc7BjFx6LRG59MnU2
         HuUfv7fb/ARtmUBuhFYLsFJsGlo1YUITwQw5FwNd0F2stV1lgLe30s/ynNSTDbJNUKcx
         9AqqMDwWJx7BT/H787g5/qzT5g/9pBqDiwPwd85D40sIvc2RV6pnbhMZJKKBzRq8Wz/E
         ld23mIOKocH/PRGTMGJOIVlnvqi3RL9YoOVYLYA59Ak1xJWZ60AIokMUsVXNcaZuI/tp
         U3VgEQI7oBwPPbC1nuy3hOXbHKN5D902fod3ARu47jys5eEAWB+oiIh5IJJgNmCWud3l
         O+oQ==
X-Gm-Message-State: AOAM533pnYdyajHGcojUl+gM8NYVpT///XVexe/Brh/Gsnaqrne+2CIb
	lwUuqMeYUMKHpGx93t5C/RLcv7tIrNU=
X-Google-Smtp-Source: ABdhPJzFvK0pkp7yDWebh0vdUNAOsdq9oeiI44Pd4vXsNbGtQVrlPjB2/mtsaSrHin838Pi9srF6kg==
X-Received: by 2002:a05:6402:1013:: with SMTP id c19mr35547003edu.213.1618327792278;
        Tue, 13 Apr 2021 08:29:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id hs26sm3880558ejc.23.2021.04.13.08.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:29:51 -0700 (PDT)
Date: Tue, 13 Apr 2021 17:30:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: media: tegra-vde: Align line break to match
 with the open parenthesis in file trace.h
Message-ID: <YHW5Fwl55c7NJAeo@orome.fritz.box>
References: <20210412222040.GA13659@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PjdKBxAW1cKHRKT6"
Content-Disposition: inline
In-Reply-To: <20210412222040.GA13659@focaruja>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)


--PjdKBxAW1cKHRKT6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 07:20:40PM -0300, Aline Santana Cordeiro wrote:
> Align line break to match with the open parenthesis.
> Issue detected by checkpatch.pl.
> It consequently solved a few end lines with a '(',
> issue also detected by checkpatch.pl
>=20
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/trace.h | 111 ++++++++++++++------------=
------
>  1 file changed, 50 insertions(+), 61 deletions(-)

Ugh... I'd say this is one case where checkpatch.pl really shouldn't be
complaining since this isn't a function call or declaration. It's more
like a code snippet written with macros, so I don't think the same rules
should apply.

Adding checkpatch folks (hence quoting in full): is there anything we
can do about this without too much effort? Or should we just accept this
the way it is?

Thierry

> diff --git a/drivers/staging/media/tegra-vde/trace.h b/drivers/staging/me=
dia/tegra-vde/trace.h
> index e571410..1fcc573 100644
> --- a/drivers/staging/media/tegra-vde/trace.h
> +++ b/drivers/staging/media/tegra-vde/trace.h
> @@ -11,79 +11,68 @@
>  #include "vde.h"
> =20
>  DECLARE_EVENT_CLASS(register_access,
> -	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> -		 u32 offset, u32 value),
> -	TP_ARGS(vde, base, offset, value),
> -	TP_STRUCT__entry(
> -		__string(hw_name, tegra_vde_reg_base_name(vde, base))
> -		__field(u32, offset)
> -		__field(u32, value)
> -	),
> -	TP_fast_assign(
> -		__assign_str(hw_name, tegra_vde_reg_base_name(vde, base));
> -		__entry->offset =3D offset;
> -		__entry->value =3D value;
> -	),
> -	TP_printk("%s:0x%03x 0x%08x", __get_str(hw_name), __entry->offset,
> -		  __entry->value)
> +		    TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> +			     u32 offset, u32 value),
> +		    TP_ARGS(vde, base, offset, value),
> +			    TP_STRUCT__entry(__string(hw_name, tegra_vde_reg_base_name(vde, b=
ase))
> +					     __field(u32, offset)
> +					     __field(u32, value)
> +			    ),
> +			    TP_fast_assign(__assign_str(hw_name,
> +							tegra_vde_reg_base_name(vde, base));
> +					   __entry->offset =3D offset;
> +					   __entry->value =3D value;
> +			    ),
> +			    TP_printk("%s:0x%03x 0x%08x", __get_str(hw_name), __entry->offset,
> +				      __entry->value)
>  );
> =20
>  DEFINE_EVENT(register_access, vde_writel,
> -	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> -		 u32 offset, u32 value),
> -	TP_ARGS(vde, base, offset, value));
> +	     TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> +		      u32 offset, u32 value),
> +	     TP_ARGS(vde, base, offset, value));
>  DEFINE_EVENT(register_access, vde_readl,
> -	TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> -		 u32 offset, u32 value),
> -	TP_ARGS(vde, base, offset, value));
> +	     TP_PROTO(struct tegra_vde *vde, void __iomem *base,
> +		      u32 offset, u32 value),
> +	     TP_ARGS(vde, base, offset, value));
> =20
>  TRACE_EVENT(vde_setup_iram_entry,
> -	TP_PROTO(unsigned int table, unsigned int row, u32 value, u32 aux_addr),
> -	TP_ARGS(table, row, value, aux_addr),
> -	TP_STRUCT__entry(
> -		__field(unsigned int, table)
> -		__field(unsigned int, row)
> -		__field(u32, value)
> -		__field(u32, aux_addr)
> -	),
> -	TP_fast_assign(
> -		__entry->table =3D table;
> -		__entry->row =3D row;
> -		__entry->value =3D value;
> -		__entry->aux_addr =3D aux_addr;
> -	),
> -	TP_printk("[%u][%u] =3D { 0x%08x (flags =3D \"%s\", frame_num =3D %u); =
0x%08x }",
> -		  __entry->table, __entry->row, __entry->value,
> -		  __print_flags(__entry->value, " ", { (1 << 25), "B" }),
> -		  __entry->value & 0x7FFFFF, __entry->aux_addr)
> +	    TP_PROTO(unsigned int table, unsigned int row, u32 value, u32 aux_a=
ddr),
> +	    TP_ARGS(table, row, value, aux_addr),
> +		    TP_STRUCT__entry(__field(unsigned int, table)
> +				     __field(unsigned int, row)
> +				     __field(u32, value)
> +				     __field(u32, aux_addr)
> +		    ),
> +		    TP_fast_assign(__entry->table =3D table;
> +				   __entry->row =3D row;
> +				   __entry->value =3D value;
> +				   __entry->aux_addr =3D aux_addr;
> +		    ),
> +		    TP_printk("[%u][%u] =3D { 0x%08x (flags =3D \"%s\", frame_num =3D =
%u); 0x%08x }",
> +			      __entry->table, __entry->row, __entry->value,
> +			      __print_flags(__entry->value, " ", { (1 << 25), "B" }),
> +			      __entry->value & 0x7FFFFF, __entry->aux_addr)
>  );
> =20
>  TRACE_EVENT(vde_ref_l0,
> -	TP_PROTO(unsigned int frame_num),
> -	TP_ARGS(frame_num),
> -	TP_STRUCT__entry(
> -		__field(unsigned int, frame_num)
> -	),
> -	TP_fast_assign(
> -		__entry->frame_num =3D frame_num;
> -	),
> -	TP_printk("REF L0: DPB: Frame 0: frame_num =3D %u", __entry->frame_num)
> +	    TP_PROTO(unsigned int frame_num),
> +	    TP_ARGS(frame_num),
> +	    TP_STRUCT__entry(__field(unsigned int, frame_num)),
> +	    TP_fast_assign(__entry->frame_num =3D frame_num;),
> +	    TP_printk("REF L0: DPB: Frame 0: frame_num =3D %u", __entry->frame_=
num)
>  );
> =20
>  TRACE_EVENT(vde_ref_l1,
> -	TP_PROTO(unsigned int with_later_poc_nb,
> -		 unsigned int with_earlier_poc_nb),
> -	TP_ARGS(with_later_poc_nb, with_earlier_poc_nb),
> -	TP_STRUCT__entry(
> -		__field(unsigned int, with_later_poc_nb)
> -		__field(unsigned int, with_earlier_poc_nb)
> -	),
> -	TP_fast_assign(
> -		__entry->with_later_poc_nb =3D with_later_poc_nb;
> -		__entry->with_earlier_poc_nb =3D with_earlier_poc_nb;
> -	),
> -	TP_printk("REF L1: with_later_poc_nb %u, with_earlier_poc_nb %u",
> -		  __entry->with_later_poc_nb, __entry->with_earlier_poc_nb)
> +	    TP_PROTO(unsigned int with_later_poc_nb,
> +		     unsigned int with_earlier_poc_nb),
> +	    TP_ARGS(with_later_poc_nb, with_earlier_poc_nb),
> +		    TP_STRUCT__entry(__field(unsigned int, with_later_poc_nb)
> +				     __field(unsigned int, with_earlier_poc_nb)),
> +		    TP_fast_assign(__entry->with_later_poc_nb =3D with_later_poc_nb;
> +				   __entry->with_earlier_poc_nb =3D with_earlier_poc_nb;),
> +		    TP_printk("REF L1: with_later_poc_nb %u, with_earlier_poc_nb %u",
> +			      __entry->with_later_poc_nb, __entry->with_earlier_poc_nb)
>  );
> =20
>  #endif /* TEGRA_VDE_TRACE_H */
> --=20
> 2.7.4
>=20

--PjdKBxAW1cKHRKT6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB1uRcACgkQ3SOs138+
s6F1+w//dI7mbL+cWPPwzJnTQ3rk7zrx08DAu4X58g9FqOLjLqPySAhloCsuAekq
6BZ25/hETrEKi3ehIVlpIICXX/auix4qvrW1U2hNZ9go2hfznFABxJ3jqMGgf/3G
rLeDr7xoD0Ed1s4dN0oDFPv1eZ6lXwTjHdlsKbQ9U4hhkH7wEohOokDqESoifg9s
y/AgfooVQ1IKaRCfL8Ls4yH2uT2FaQKh2y5p28uzhIYrVWJ+0ItJLSXrul8Jqd6M
EKqCg8N8iIwopzSTqWhS7IlGmcWLCox7BJs6VvF3LkDnWxa5VeZx+Ha0g+tvhlMS
O2R9KiwMhMM2sUhqFeqOTIp4oTqI6X4B8qh4IwfLgiHRHhUiMIkfbpAo4K9Mfnv/
yXs2tgR6MkNdn8IQc+9Bo5QaD42NwzxA+fb1lu2B/SHS+9/b4zTay6b8GTB/9Jjz
fmoi4gHu1FLPOqfz94mWQDaRkrDeb3PEVT4G6gJ+4I/xnPnQ3jlY3tJ7fFDx/tqK
/em1uhy8H+f/5zTMr8nH/fTUNFh0TI2bkyQOwP4lpHaYhxnax9/CRmp2FCozqFS1
9eiuKbJU4XDJVVDPoSbYVjeMhri7//KqcyS7+UEicsMCV/4hES5zHBVrb8H+Z9Vs
RWANoklSAgIjBUqCunzIiNhCHTQ75eaqXGgqE6XVILBTuXp2Am8=
=cpEt
-----END PGP SIGNATURE-----

--PjdKBxAW1cKHRKT6--
