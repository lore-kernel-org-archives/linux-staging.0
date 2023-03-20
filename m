Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48AD1876;
	Mon, 20 Mar 2023 13:38:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l12so10371744wrm.10;
        Mon, 20 Mar 2023 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679319506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51uVJkyDalBaEbq0Zr1Qk2lA5Oa+MTvPoyiLzc1llIo=;
        b=nhasUHpFJPxVNmsU6YfL1uZpowS+Py5R20L9AFDutR02F9olSs2zd8Ffh89QfssGv0
         eOIDPccFzSdivxdpcsK3z4nTZ6EszJQ9oJhnbnHxDgfRtNYh08EBpk/fbT1vDTi2YnRy
         eQiKUDKQMHldEqESLa7DsZgNlV3TU5e6j60WW5Lpe5LtKFJMtgJdx6oUTw582olXKrw2
         JnGtKtvdkgAiyhNmiQk1PKW11e6L2oixZZL4ld++dUCdity3udyQxwDsVFm7iGMd+S8F
         Qq9q354lxuehDk/FYJhSFjp0KHufJZ+rMhAt3kQin/74NLTOqPWF3UccJ6nQHwcbigH8
         DDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679319506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51uVJkyDalBaEbq0Zr1Qk2lA5Oa+MTvPoyiLzc1llIo=;
        b=KzzG+3z6RKIx7VB2pob/qolhL2WNjBg3F7vVp66ngE/r6yuvDKAXoWWWaPFBLkDKi1
         YswadpEGgEXVN1Y/JWRNKwWURIer/rTCVVmxHPliL2yS+SMovIF7JXMGQ6/6n9FOvTZE
         TbZxbZJ5Rq+J0aY/bWaBA3+8rKt9JcGPlUEAAwyO7CNGaX9tOn3mFb4CNNd1HM1rGVdt
         g29apDZwgqjg/uGOhgqwtvaWIZ2vVAjZoIdxhTE+72GtOSi/3hT2CtsyCeCYhDeTKitB
         X44uT2wz0v7ouSZ55hs1O3mnj6AI1FtEyqzQg8WCKv8lA6rihtJzW0F5TzUPaLFYoE6m
         YBVw==
X-Gm-Message-State: AO0yUKX1IUWtdNy8EW5kauwlkNuMBTUInOzYiAIShgfS/igTFnt6XTma
	MYOYwcoJhzbvmRSUDmo9phc=
X-Google-Smtp-Source: AK7set9dxahlNH0DGyVFe9/275dtO0/1JI4UTKq43T21QYcGw218o0XVMUU6mRcx6Rjjkw1DubpEgA==
X-Received: by 2002:adf:eb0f:0:b0:2d6:6af:4891 with SMTP id s15-20020adfeb0f000000b002d606af4891mr4374015wrn.3.1679319506046;
        Mon, 20 Mar 2023 06:38:26 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d4ad0000000b002d51d10a3fasm5668309wrs.55.2023.03.20.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 06:38:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: axis-fifo: initialize timeouts in init only
Date: Mon, 20 Mar 2023 14:38:24 +0100
Message-ID: <3180435.l52yBJDM9G@suse>
In-Reply-To: <ZBf+XDN8GM0xDDCq@khadija-virtual-machine>
References:
 <ZBN3XAsItCiTk7CV@khadija-virtual-machine> <2222576.3ZeAukHxDK@suse>
 <ZBf+XDN8GM0xDDCq@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On luned=EC 20 marzo 2023 07:34:04 CET Khadija Kamran wrote:
> On Fri, Mar 17, 2023 at 11:29:25AM +0100, Fabio M. De Francesco wrote:
> > Khadija,
> >=20
> > Congratulations for having your first patch in Linux, via Greg's staging
> > tree.
> >=20
> > It will take some time before it reaches mainline, although it is alrea=
dy=20
on
> > its way to get upstream.
>=20
> Thank you! :)
>=20
> > On gioved=EC 16 marzo 2023 21:09:00 CET Khadija Kamran wrote:
> > > Initialize the module parameters, read_timeout and write_timeout once=
 in
> > > init().
> > >=20
> > > Module parameters can only be set once and cannot be modified later, =
so=20
we
> > > don't need to evaluate them again when passing the parameters to
> > > wait_event_interruptible_timeout().
> >=20
> > Greg made you (and indirectly me notice) that the statement above is a=
=20
kind
> > of short-circuit because it misses to make the readers notice that you =
are
> > dealing with specific permissions granted to these two module's=20
parameters.
> >=20
> > Please take a look at the permissions associated with those parameters:
> >=20
> > module_param(write_timeout, long, 0444);
> > module_param(read_timeout, long, 0444);
> >=20
> > Can you understand what '0444' stands for? What if their permissions we=
re
> > instead something like '0666' or '0664'?
>=20
> Hey Fabio!
>=20
> I understand that 0444 shows read permissions only.

Yes, correct.

Only "read" permissions for owner, group, others.
Obviously, when the module is initialized, "insmod" can pass actual values =
to=20
the arguments. The point is that from that moment onward nobody is allowed =
to=20
change the initial values associated with this variables, but they can stil=
l=20
be read at will.

> I am trying to make sense of this. As the permissions do not allow
> write, so the value cannot be configured afterwards.

Yes, if with "afterwards" you are intending after they are set at insmod ru=
ns.=20

> Instead of saying 'cannot be modified later', we should talk more about
> permissions here too.

I'm confused by this statement. Can you please rephrase?

> Am I getting it right?

Not sure, it depends on what you meant with the previous phrase.
=20
> Thank you!
>=20
> Regards,
> Khadija

You're welcome!

So, thanks for working on this patch as long as it takes to get it done.=20

I think the lesson to be learned is that in our community there are barrier=
s=20
to the entry of substandard products and therefore people have to do their=
=20
best if they really want to see their work applied.

These tasks are not for the "faints of heart" :-)

=46abio



