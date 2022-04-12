Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA77B
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 09:53:48 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id c6so6541977edn.8
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AkVeS3a8EOgJCI7taXEOSueT1F/9iu1WjMPXVz5t0OM=;
        b=DXQFxzUBZrSWjyf1SQB0KWaNd5EnJ1CjA7KgQkRSFKh1NG9tM9mlpfhduyc5qGFmn1
         q8kOK+QdVXfAfuCkMku1nK9WbmGlR1+opEUKDQXMDPtur2fw55c2e//psWPPmjLc83ul
         WSFRL5RolZqBBasK6HBrOGkUsL7ETOzoVMBN+7NkkOHGSuy8c1n8zuDitpFiJZqEr+cw
         tkJYea3e6UA5eZYaW7W2a0Rm5qJawXkULzYfDkY6XZXSEA0T9E28uQGNw81F0r8/r3RY
         V47qqvxvw7kluf4gOxYqksJ/5mwOJUuXetdD8Z1CAdjIoObTRNooxkJG7veYCWm/qL4N
         zl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AkVeS3a8EOgJCI7taXEOSueT1F/9iu1WjMPXVz5t0OM=;
        b=0IjpiTbhaOaaYo6g8U4Tj/usRJHGIbtev6vu1fOUYb4dLcXDHYIKSieFWKSMIPk/U5
         nv2PzVX6WvQIu+CvOAYTZCZ35t2SfuyWcTzWuCd+TaFLL8bcyFywpU52ivv4sPSGD5Lz
         i+djh6YT06K4MDjspvwWz2F/o1LhZquvyh0ic3L+utLUDN+mC2yDXKMGAzquggpfR40+
         KceN/hzh0dFqK0rPtA+wvKQxWNrw0b/f7mZvlP76pc9MXmyKuBtdliVXqY+DM1S8NNi0
         8UP3pj2MLz+ywcndJZRsMGmL+01D5n44ffagr8Sxm6Y3uNSqQ7LK452G3k/g6ocpPQgf
         PRkQ==
X-Gm-Message-State: AOAM531nr2PYlN0J9Ks0pxReF3Wb3InxpCCbzz3MYFqVu9JbEYPBQ7ug
	yDN7UOd+djLD+C0PEsRF6k0=
X-Google-Smtp-Source: ABdhPJzxk/99mygfKqOVg/8e1fwoyQ7REMllcxW5KV8GSfggKkGv6IrNXD9A4XthW/W7HsL0uqyjRA==
X-Received: by 2002:a05:6402:198:b0:410:83e3:21d7 with SMTP id r24-20020a056402019800b0041083e321d7mr38115046edv.159.1649757226168;
        Tue, 12 Apr 2022 02:53:46 -0700 (PDT)
Received: from leap.localnet (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709064a0100b006e89334f5dfsm2338416eju.136.2022.04.12.02.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 02:53:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, Vihas Makwana <makvihas@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2 0/7] drop some unnecessary wrappers
Date: Tue, 12 Apr 2022 11:53:42 +0200
Message-ID: <3484215.R56niFO833@leap>
In-Reply-To: <20220412050630.GY3293@kadam>
References: <20220411102136.14937-1-makvihas@gmail.com> <37499399.10thIPus4b@leap> <20220412050630.GY3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On marted=EC 12 aprile 2022 07:06:30 CEST Dan Carpenter wrote:
> On Mon, Apr 11, 2022 at 10:34:44PM +0200, Fabio M. De Francesco wrote:
> > On luned=EC 11 aprile 2022 12:21:29 CEST Vihas Makwana wrote:
> > > Drop some unnecessary wrappers and update all the references
> > > accordingly.
> > > Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.
> > >=20
> > > v1 -> v2:
> > > Drop the wrapper functions with underscores prefixed.
> > >=20
> > > Vihas Makwana (7):
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_init_cmd_priv
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_init_evt_priv
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_init_mlme_priv
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_free_mlme_priv
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_alloc_network
> > >   staging: r8188eu: drop unnecessary wrapper _rtw_dequeue_cmd
> > >=20
> > >  drivers/staging/r8188eu/core/rtw_cmd.c     | 145 +++++++----------
> > >  drivers/staging/r8188eu/core/rtw_mlme.c    | 179 +++++++++----------=
=2D-
> > >  drivers/staging/r8188eu/include/rtw_mlme.h |   4 +-
> > >  3 files changed, 135 insertions(+), 193 deletions(-)
> > >=20
> > > --=20
> > > 2.30.2
> > >=20
> > Formally, you are removing the wrapped functions (or helpers, if you=20
> > prefer) by moving their code into the wrappers. To say that you are=20
> > removing the wrappers is not correct.
>=20
> I once had someone make me re-write a commit message four time just as a
> kind of bullying and then at the end he was like, "You said NULL
> dereference instead of NULL pointer dereference so I had to re-write the
> commit message and I added some comment to the kernel git log explaining
> how you suck." =20
> So these days I have made it a rule that if you're going
> to complain about commit messages then you have to write your own for
> people to cut and paste.  Otherwise people are like, "You're too stupid
> to read my mind.  LOL.  Do it again."

I'm assuming you don't believe that I attempted some kind of bullying simil=
ar
to what you had to face when you sent the above-mentioned patch.

Nevertheless, I was expecting some sort of reaction from you but I think=20
that you are misunderstanding what my intentions were.

I didn't suggest a re-write of the commit messages. I just pointed out that=
=20
those messages are formally inaccurate but that these kinds of small formal=
=20
inaccuracies won't ever prevent Vihas' patches from being accepted as they =
are.

It's only that, IMO, if people start to take care of being formally correct=
=20
in drivers/staging, even when they do simple changes, they train their minds
to improve their abilities to communicate in the future when they eventually
decide to submit much more complex patches in other subsystems.

> But in this case the commit message is fine.  The key things with a
> commit message are:
>=20
> 1) What's the motivation
> 2) What's the effect for the user
> 3) Are all the surprising aspects are explained.  Do I have enough
>    information to review it quickly.
>=20
> Removing wrappers is the motivation.  No need to explain that further.
> No effects for the user.
> There were no surprising bits.
>=20
> It's fine.

I agree with you: "it's fine". I respect your opinion and your pragmatism:
after all, here, everything is pretty clear, so why bother?

However, writing accurate and formally correct commit messages takes the=20
same amount of time of writing inaccurate messages. So, why not do better=20
next time?

Again, I don't suggest to do so now. Not for these patches, because it woul=
d=20
only be a loss of precious time.

Thanks,

=46abio M. De Francesco=20

>=20
> regards,
> dan carpenter
>=20
>=20




