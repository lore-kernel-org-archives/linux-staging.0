Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D3137D
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 06:52:48 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id m6so20576705qvq.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680504767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ScELMrj/DoIDUcUWC7sj2bAmfQjlVNhGGYZVGhw9aYo=;
        b=AXGBCtNlSyF6Bm+Wx4W8B50HFUyZ5J1uz2x3FgtNKOO5pinP85hqxxDvnJvqFiR7Ch
         RDnb/H/zomSuHcNyC48R/cAiQ/yhNsV0/lUnxf2ET6E6fIpAJ/UzJxcw+SJp1pxdE2Ps
         SatS3XAouc1piiTKLz/5ioOAk40Tph5CQGv8kbER5IKgelcEpwschPNPimOYWmbQKgP/
         k/xA6SvD33H7q94cuLP+RJz8UWjCOUp2ubI/3/uszI8S9H/wlHgdRKkIrOhK+0Ta5i4e
         E6GRAtlKlSNUNOtv2GWFzDf9RZpe3nk7tJmwPVWyrg36SKnyZ5OGQlo/KHBUj2zkYCqq
         Qlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680504767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScELMrj/DoIDUcUWC7sj2bAmfQjlVNhGGYZVGhw9aYo=;
        b=7vXazr/dqr9GsGGkBgzXpBmAce3aeR4fSFBkPF6krDEmcy7jxHugOnVGwSL/OlVU/9
         S0/jyrbBVkvMpPf5JBP8JcYopLDDLHK2XhJNkKAQCONbojkvJ9jdH2xVMgNCLy1e1p2L
         UhZ/HWouqfQP3TGonFk3qg+8mwCT5waqfgjh7LEkDqewsbyf/a7YtqzTTmFPa4qrqQFv
         AiZr5YS3BZS7+NTzeBO0ERlWf0Y40wx3itnYZ4Jmd/kRstVnMne0j4CDSBxtnTwnjIy4
         iAswMGjFr1GvWb1eiAjkjSYvecwEFyqk+j16qUnqCkvYAlo2EOS7yyVc7yv18FoHHtNm
         PjpQ==
X-Gm-Message-State: AAQBX9eyOdTkoe5CvkFWs0LJrmHRKQJ6hjdUVPHdoxUmbYkIpM/PahQ9
	Zx6ZIcTQX5fosfJgtLA1pm0=
X-Google-Smtp-Source: AKy350Y3xTSmIDbtZpBPsLaYrgPJeXVB/xCCpaISJmh0sryLwSNXwoAPt9syxale8IeV3i1yDakHQg==
X-Received: by 2002:ad4:594d:0:b0:5a4:548e:4ed6 with SMTP id eo13-20020ad4594d000000b005a4548e4ed6mr56509613qvb.40.1680504767275;
        Sun, 02 Apr 2023 23:52:47 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef05:8700:853c:3ba5:d710:3c1d? (p200300f6ef058700853c3ba5d7103c1d.dip0.t-ipconnect.de. [2003:f6:ef05:8700:853c:3ba5:d710:3c1d])
        by smtp.gmail.com with ESMTPSA id mm17-20020a0562145e9100b005dd8b9345f4sm2390844qvb.140.2023.04.02.23.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:52:46 -0700 (PDT)
Message-ID: <0fc93adff7ef33857881ffa94bbd77433abab362.camel@gmail.com>
Subject: Re: [PATCH] staging: iio: resolver: ads1210: fix config mode
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-staging@lists.linux.dev, linux-iio@vger.kernel.org, Michael
 Hennerich <Michael.Hennerich@analog.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Lars-Peter Clausen <lars@metafoo.de>
Date: Mon, 03 Apr 2023 08:54:44 +0200
In-Reply-To: <20230401152425.2dae5505@jic23-huawei>
References: <20230327145414.1505537-1-nuno.sa@analog.com>
	 <20230401152425.2dae5505@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2023-04-01 at 15:24 +0100, Jonathan Cameron wrote:
> On Mon, 27 Mar 2023 16:54:14 +0200
> Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>=20
> > As stated in the device datasheet [1], bits a0 and a1 have to be
> > set to
> > 1 for the configuration mode.
> >=20
> > [1]:
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ad2=
s1210.pdf
> >=20
> > Fixes: b19e9ad5e2cb9 ("staging:iio:resolver:ad2s1210 general driver
> > cleanup")
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> Oops. Younger more foolish me bug (back in 2011 so I'll cut myself
> some slack)
>=20
> Applied to the togreg branch of iio.git (not rushing something in
> that is in staging
> and has been broken a while without anyone commenting!)
>=20
> I don't suppose this means you are going to get this ready to move
> out of staging?
> *looks hopeful*
>=20

Eeheh, Unfortunately not on the top of my list right now... But, if I
happen to find some hardware hanging around, I might eventually get
into it.

Funny enough, this was actually reported to us in one of our support
channels which means there are people actually using the driver even
being it on staging.

- Nuno S=C3=A1


