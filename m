Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50772CA0
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 10:33:10 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id q186so5002237oih.8
        for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M9lbSU/ybc6OppgRIX8ZBQPJXb4PzkNkIkqyzEe4vsM=;
        b=h5X8KiOAwvCCoeask1zcBMENoSVPTMzB0G9oA/mLHo88nDVixWpSb7px6ea/B1fPEL
         PkvItn1CwvuTQktdczAAqHeDGBXOYOfOrLz2U+mxe7iuVSUwVTaAEcOAqnvnrVcvfqS1
         h5tS2oE1tTYgRY7YfjUQIijdf9VNx0qvTN4IJLLVTFntzU7jOJfQDSa01XLgSnH3EvZ3
         pEmGFTmgQZT7p4xg7+zEOjpe66HJFk76oAeJhm0Gi1hrITnqHwkuyechpuEh0xvKNaac
         3mMOk3jpmNiwzprGnlDdUxUkeGeterETUL3Z6t7fc3PHj58yCj3ZowkQVhwGMfoI1SQt
         b/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M9lbSU/ybc6OppgRIX8ZBQPJXb4PzkNkIkqyzEe4vsM=;
        b=7E0ZkXbmpuh+LT7eGysuP20F6tBQxJ/UHksXIb1qKDeF+dvohsPFUpzHcIYWiAsZLS
         iZK6xk/8GbMJH21I9A+gjyPd7C35lgv2EjiQeigiRSC46I57Ae+rZTEgKIj7Y2FHyHyD
         yZ2giUo2foP/pFWcuCI7mewmtG/2INozA6TzJHuPsv99EGUqyZsnLOP6ZlHX6A2857w3
         luSL0SbXX8rIwgg/+C65p9QD8Srp9LQwe0O80hAza5lzvQ8+t++kDs9ZzJqRhPQ3ZjSh
         qYUOYe9mE4DewMSGVD9hA5EHtZOAs+Nq0Q0nuqnCSYhlUMXhWRK0Hvca3bJ1anHdXrWw
         TMSw==
X-Gm-Message-State: AOAM530H1g2IgQb30eyCMOvreKygMrkMjyyGzMrYRDXA/OsDL47sj3am
	og6hw20pgt0G1j1mznoBjzp2F9b0ADW+tDeuIi9XYQ==
X-Google-Smtp-Source: ABdhPJy01OZg2SzTN7RAjLIdxIQiBfvVYOOHfj92G4lxP3BuUPFrtmf9Vh+t5p9LhrGQAJTdPvmIkkVRVunGv9b2WW0=
X-Received: by 2002:a05:6808:b10:: with SMTP id s16mr1773942oij.307.1643279589694;
 Thu, 27 Jan 2022 02:33:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de> <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com> <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com> <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com> <20220127062945.GC1951@kadam>
In-Reply-To: <20220127062945.GC1951@kadam>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 27 Jan 2022 11:32:58 +0100
Message-ID: <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-fbdev@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>, 
	Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jan 2022 at 07:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> > dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > The other advantage of staging is the I don't think syzbot enables it.
> > > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > > get him to disable FBDEV.  :P
> > >
> > > The memory corruption in fbdev was a real headache for everyone because
> > > the stack traces ended up all over the kernel.
> >
> > Uh Dmitry disabled all of FBDEV?
>
> No that's the opposite of what I meant.  STAGING is disabled in syzbot
> and FBDEV is enabled.

Is there still any problem with syzbot config?
syzbot configs are stored here:
https://github.com/google/syzkaller/tree/master/dashboard/config/linux
