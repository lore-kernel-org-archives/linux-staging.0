Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8D17D3
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 12:20:53 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id j9so11206535qkg.1
        for <linux-staging@lists.linux.dev>; Mon, 02 May 2022 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Fw3WDxeowbTLWz6Ru6lKfna8BJhR9uyUJgU4i6Lx6eE=;
        b=qazHzdbUqUY+JBu1L+Ghkx2BTsogAGkFnOfCjITzugw4bwFjFAMpAJeURp89Vky6/U
         Wq7NNkCMaTSrbP+3ogAErVWWIxYFqqYm+Jv9G8bZp4BmrqTTCEAZtyl3a4p+w5DGCTh4
         IECTzPPzm6l92yy6uxNjRJof9h9SyQVIefJ7gKeY0XV3znaycUFYZcOPUsxl2B3GjQl3
         JRvOynsTsnYdth7qlIWJwStg5aqAR1kGQ1O7D3CDlg6qUqjMVlvS/Nb14OCY+OKBrqGN
         RcAXOllGP+KY4GDsFM0yzL9RhybPRIXscxNdnS8zDVAs8qrhmqi+6dCKdsgOC5rEJvVP
         aovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Fw3WDxeowbTLWz6Ru6lKfna8BJhR9uyUJgU4i6Lx6eE=;
        b=vcwBPy7KZ8E/eHOYtK5wrXxAFg4O6ghKYq33bof3hXUxfJ7nL6izWXvFx9p9knwg6u
         H9P53oiQ5FuGR/uhXP6vSgEdpiwtL6EKN5uk1doLZAVXeSskkMFOp27wzobHxt9//Kl0
         grD5QVSVOlBc56FvwgjbOXSoJ1zqypIJICFjVsrUpZNIL8SRgm7V1iKMRz7skLWWUGN6
         apNk1yUbuT8h25csAsFqAnFOocGPSZDiAXX4V1uyuKphv9U/E9T5YZBL0pco1a3uoLiT
         BjLzMnw/RXLZiSDU7OhWST5lSF9rkzSYa+8ZuyivfrILTvGoUNId0oqNJTLSigQBI21E
         5daw==
X-Gm-Message-State: AOAM5334CK8g5cbMGeTVcIeFyHjxYf6EK25Ctmx3w3uHVFlJYGs16EPf
	g4PLlg+5CXnoOxQHHuAgnUjb4A==
X-Google-Smtp-Source: ABdhPJxumv3g/uljydEcUe9WMgnkePrW46ByZPAaB9YOkcVTpD1uHYDXYtz9wtMJ8bQiOeA++8nw2g==
X-Received: by 2002:a05:620a:44c8:b0:69f:e71f:7a02 with SMTP id y8-20020a05620a44c800b0069fe71f7a02mr2463437qkp.253.1651494052548;
        Mon, 02 May 2022 05:20:52 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id d188-20020a379bc5000000b0069fc347ef5dsm4060820qke.74.2022.05.02.05.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 05:20:51 -0700 (PDT)
Message-ID: <0414bb0816eef95961fe47de96f97f925d29228f.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] Enable JPEG Encoder on RK3566/RK3568
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Michael Grzeschik <mgr@pengutronix.de>, Nicolas Frattaroli
	 <frattaroli.nicolas@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Geis
 <pgwipeout@gmail.com>, Michael Riesch <michael.riesch@wolfvision.net>,
 Liang Chen <cl@rock-chips.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Kever Yang <kever.yang@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Date: Mon, 02 May 2022 08:20:50 -0400
In-Reply-To: <20220429232047.GG7671@pengutronix.de>
References: <20220427224438.335327-1-frattaroli.nicolas@gmail.com>
	 <198ce3981ad15844627581f9519cab67ed2a81c1.camel@ndufresne.ca>
	 <2438841.KJ31GcehEG@archbook> <20220429232047.GG7671@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Michael,

Le samedi 30 avril 2022 =C3=A0 01:20 +0200, Michael Grzeschik a =C3=A9crit=
=C2=A0:
> Since the RK3568 seems to get more and more of attention at the moment
> I would like to ask if somebody is planning to write support the RKVENC
> in mainline. That is the VEPU540 core refered to in the RK3568 TRM.
>=20
> I would start with that in the next weeks, taking the bootlin H1 support
> as an reference to handle the request_api for the encoder part. Which is
> currently completely untouched in mainline AFAIK.

I'm very happy to ear you'd be interest in helping with this. I'm adding An=
drzej
in CC, as he started some base work using VP8 encoder on RK3399 (same HW fo=
und
on other RK SoC) to make this possible. Note that these are a new type of
encoders and a specification is needed to ensure they all have a coherent w=
ork-
flow. The first step was obviously to have working prototype, Bootlin start=
ed
with H264 (but never posted anything on the mailing list). I'm under the
impression they have abandoned it. Andrzej have decided to use VP8 as it is
simpler. The prototype should help understand the basic flow of an encoder =
and
produce a specification for this.

From there, the "easy" part is to make per codec controls, to configure the
encoder. Demonstrating fixed QP, this is about were I believe Bootlin stopp=
ed.
And I personally believe some OSS userland (not just tests) that can handle
multiple reference, perhaps more advance GOP pattern and some basic rate co=
ntrol
would help build confidence in the uAPI. Let us know how we can help, we sh=
ould
avoid doing the same thing, as this is already quite a large project that c=
an
easily take over a year to become mainline ready.

regards,
Nicolas

>=20
> Regards,
> Michael
>=20

