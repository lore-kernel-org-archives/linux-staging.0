Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D07628
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 10:42:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p12-20020a05600c430c00b0038cbdf52227so356652wme.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DFfOJE9o2HqAJOSqBaJFQFfutWgZMKV4kI/WYj73AZY=;
        b=WkdbAVUeg++bdea+vhZthWfIKaO5ibIym7B19DfJlss0ygAzE8WtcxGgk3Rq9sfFed
         UwgqLMLZKc6Y5I+J0KyeK+hsrns5AZtsO4FdBKxgXLtHgiGpPPS6eYt4h5NuD+eqzrs8
         RLLj0Gz4hLS8zETFMySV+vWfhFXY5tlf1zSLiPqTs5B62TnVhn+jFjDyu77AyJ6j/UaZ
         5xMfZNuKmut2DhAcvKoRWuqv6jjpfmj9nmbrHqpIc/4/So2tfdOZbdQZNfONwnZPj4hC
         vIyxAzVxXxI1zAMtF4rg90j5QD4xanY1EHUcO/HsV4bsTH4VQTWmnFs6nz4SUmxImV5Q
         nsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DFfOJE9o2HqAJOSqBaJFQFfutWgZMKV4kI/WYj73AZY=;
        b=6QvIDSIfNjsCD3q0XSwrgB9aqXqo1TWVNGaStn9pZw11znSfVs1ItCPQ3LOtxsTiFO
         iUBA//NLzREObOHw0uPzzG4fcnB0hr2BsrVk7czETT9swj91ycmP6w+yoisv7IN/fmLX
         wPM9UbSTn1w4WQ+3DniDPKHlcQy5GoGz/f3D+Bwc01EtRJBYuBdKoF1NYZuDhR80Si7j
         VG8sI1fNkLiQN/BQ2QZ+f3Tz9OR54ldxow6CRUkt7/M/esBxj5JAOzWASShd/mzoyRC4
         8AdeHhilg5xg2mJvLH7mLRRuExzwhDkLAPotzXShiD8nrWWDITt8gs2Fj8fiklduSYZO
         c6BA==
X-Gm-Message-State: AOAM532QjHK+QDdmQO0zuk+VGAXjzAFIowHFFuhY8y5W3ERr0Gm7Pjlo
	Z2iEM+bG4wJmsXlUlPoIPX8=
X-Google-Smtp-Source: ABdhPJx81q0d4bF09rUxEJOf+ippZhBk0x9Q/jaLlDzPBAcA10A2VFYKheCupIeUBtiYMxr654a3Ww==
X-Received: by 2002:adf:db4b:0:b0:203:e76f:fc45 with SMTP id f11-20020adfdb4b000000b00203e76ffc45mr20818549wrj.549.1647945744429;
        Tue, 22 Mar 2022 03:42:24 -0700 (PDT)
Received: from leap.localnet (host-79-37-100-169.retail.telecomitalia.it. [79.37.100.169])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b00381141f4967sm1903414wmq.35.2022.03.22.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 03:42:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Sathish Kumar <skumark1902@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8712: Fix CamelCase warnings
Date: Tue, 22 Mar 2022 11:42:21 +0100
Message-ID: <1786742.atdPhlSkOF@leap>
In-Reply-To: <3a85ae64-00c1-6483-f1d7-c12abdd3ff3a@gmail.com>
References: <20220318101440.13887-1-skumark1902@gmail.com> <YjRswrHu0JUm9331@kroah.com> <3a85ae64-00c1-6483-f1d7-c12abdd3ff3a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On marted=C3=AC 22 marzo 2022 05:30:29 CET Sathish Kumar wrote:
> On 18/03/22 4:58 pm, Greg KH wrote:
> > On Fri, Mar 18, 2022 at 03:44:40PM +0530, Sathish Kumar wrote:
> >> This patch fixes the checkpatch.pl warnings like:
> >> CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
> >> +   u8 blnEnableRxFF0Filter;
> >>
> >> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
> >> ---
> >> Changes in v2:
> >>      - Remove the "bln" prefix
> >> ---
> >>   drivers/staging/rtl8712/drv_types.h   | 2 +-
> >>   drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
> >>   drivers/staging/rtl8712/xmit_linux.c  | 4 ++--
> >>   3 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> [...]
> >>
> >>   	do {
> >>   		msleep(100);
> >> -	} while (adapter->blnEnableRxFF0Filter =3D=3D 1);
> >> +	} while (adapter->enable_rx_ff0_filter =3D=3D 1);
> > Ah, that's funny.  It's amazing it works at all and that the compiler
> > doesn't optimize this away.  This isn't a good pattern to use in kernel
> Do you mean the following code is not a good pattern in kernel?
> do {
> msleep();
> } while(condition);

Exactly, this is not a pattern that works as you expect :)

I was waiting for Greg to detail something more about this subject but,=20
since it looks like he has no time yet to respond, I'll try to interpret=20
his words.

(@Greg, please forgive me if I saying something different from what you
intended to convey :)).

The reason why this pattern does not work as expected is too long to be
explained here. However, I think that Greg is suggesting to you to research
and use what are called "Condition variables".

Take some time to research and understand what the Linuc kernel uses for
waiting for completion or state changes: struct completion,=20
wait_for_completion(), complete(), and others.

Another related mechanism are the Linux kernel "Wait Queues". Do some=20
research and understand how to use wait_event{,_interruptible,timeout}=20
and wake_up{,all,interruptible,interruptible_all}.

If I recall correctly you may find one or more of my own patches to
r8188eu where I use those API (git-log is your friend).

I hope that all the above will be sufficient to start with.

Again, Greg please correct my words if I'm misinterpreting what you
requested to Sathish.

Thanks,

=46abio M. De Francesco

> > I know it's not caused by your change here, but perhaps you might
> > want to fix this up to work properly?
> >
> > thanks,
> >
> > greg k-h
>=20
> Do i need to replace the above code with some other mechanism?
>=20
> If yes, please let me know which mechanism i should use? Or what should=20
> I do here?
>=20
> Note : I am new to Linux kernel development and looking forward to learn=
=20
> and contribute.
>=20
> Thanks,
> Sathish
>=20
>=20




