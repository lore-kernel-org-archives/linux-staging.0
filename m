Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2F3FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 22:20:40 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id oc2-20020a17090b1c0200b00179e56772d6so2791512pjb.4
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LwNvxZKMitO0Rw/qXWBsKZM0jbr8PbwBZ6KzlDWrj38=;
        b=Yxg5jiZeizLqXFq7skpFHurv6UeDBB1ajk6SlOQaybKkAZA1W64Zk3Peev2HbDnNXv
         0BZGwB93qVVqwhBai71crUZQsqbGJ6wmEx33aBc0QZzFYqma8/wkDYACdtBxFgixQY8N
         BYZUDILXZUUDh2MNyMc/crWwCBMQ0OGI6/Pr3LDzjO7uGfRJaC9V09bsCZinNO4M5EPe
         Jo/id83WvEqMFRAj/IzdtRIXbgEKq+VaN/7qbM+QcXFQ9pQm9BrLj4x6/6bxej7uWdaC
         D8Kfs+fGhHKuQEnTZ/D0uk0v6p/kLImPTTmAJbA5oaxynIkaqmRi8NHDReIn1havok3q
         JYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LwNvxZKMitO0Rw/qXWBsKZM0jbr8PbwBZ6KzlDWrj38=;
        b=VbUTUcAlMCuMEWmGin0DBSAEhL3uSqDzMUXnJU53/CBJPBErJq2lfkrKTnCMeWXQLc
         KVKWhP3jmrxSj7DkpkD0N103FjfvYOljEn9bnQ53Ut8i4fjNkV9se1TcJ2O2A+K8o7uU
         pAs6zUbpdswZDkme3BiOYiuSqAaB5OstgvM9zNbEp16KvHH63rL+8pDlCHNEckklLvdw
         Ob1HaO1LLwSUAHhcoPoqL26Pc77gyaWJE+hQC/wrUx5nfl55yZi+kipiw5kfF7KzbZTp
         POSPT6siAats8yHBC5UIOKqc9W0SH9OefYk6+xkBElxHzR2MIYKRHXLDUHNuhpLmD8ri
         u2wA==
X-Gm-Message-State: AOAM530vCJEDM205rMcJNVmgeoBuUUlVXRUx+p0QooogNSaHjzKW87A7
	JYKmJsBgjFOGzvU+U474k8aWZMfacJHJMg3NXHAKIg==
X-Google-Smtp-Source: ABdhPJy4YJefTzMEhYUMj9nSJ2oLGKn6kgACMeJKGYrfKQW0apBQtKGolYCLvnWBk0LGsgWQXjNTjcvC7dRAY3588dA=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr6815678pjq.217.1629843640483;
 Tue, 24 Aug 2021 15:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210824142823.16845-1-fmdefrancesco@gmail.com>
 <2327592.S5L5zkRU50@localhost.localdomain> <a5bfab84-16cc-52ad-5cdb-038765bf0b36@gmail.com>
 <1730935.6n1DRfr91A@localhost.localdomain> <8984a400-0d1a-07cc-cff4-c0eeef81fc79@gmail.com>
 <YSUb1BPAGmP9wngU@kroah.com>
In-Reply-To: <YSUb1BPAGmP9wngU@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 23:20:29 +0100
Message-ID: <CAA=Fs0nQ9tfQ7xyVsJ3NYfDOdz6wBruKHS=eATRAx6gBZ5kmVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Skripkin <paskripkin@gmail.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Aug 2021 at 17:18, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 24, 2021 at 07:04:31PM +0300, Pavel Skripkin wrote:
> > On 8/24/21 6:59 PM, Fabio M. De Francesco wrote:
> > > On Tuesday, August 24, 2021 5:43:26 PM CEST Pavel Skripkin wrote:
> > > > On 8/24/21 6:39 PM, Fabio M. De Francesco wrote:
> > > > > Oh, I know where it comes from... :)
> > > > > > It's a patch of mine that is in the queue, waiting to be
> > > > reviewed and applied.
> > > > > Please see: https://lore.kernel.org/lkml/20210819221241.31987-1-fmdefrancesco@gmail.com/
> > > > > oh.... there are _a lot_ of pending changes :)
> > > >
> > > > I guess, we need smth like public-mirror with already reviewed and
> > > > working changes
> > >
> > > It's becoming a serious problem. A lot of times I see people who is asked to
> > > rebase and resend, not because they forget to fetch the current tree, instead
> > > because the tree changes as soon as Greg start to apply the first patches in the
> > > queue and the other patches at the end of the queue cannot be applied.
> > >
> > > Anyway,I understand that Greg cannot apply a patch at a time soon after
> > > submission but in the while the queue grows larger and larger.
> > >
> >
> >
> > It can be easily fixed. We need public fork somewhere (github,
> > git.kernel.org ...) and we should ask Greg to add remote-branch to his tree.
>
> No, not going to happen, sorry.  I will catch up with patches when I get
> the chance and then all will be fine.  This is highly unusual that there
> are loads of people all working on the same staging driver.  No idea why
> everyone jumped on this single one...
>
> relax, there is no rush here...
>
> greg k-h

Yeah I'm with Greg on this one - we don't need github forks etc, my
strategy has thus far been to just wait for staging-testing to
coalesce into a more up-to-date state and then work on top of that as
needed. Extra forks just introduce more complexity and more to watch +
keep track of in my opinion, as the e-mails still keep flowing in
anyway :-)

Regards,
Phil
