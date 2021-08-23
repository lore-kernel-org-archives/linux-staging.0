Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972043FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 00:00:56 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 7so13834737pfl.10
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 17:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWw01mf7XVdn/fPm5sHYlAPH6WeJMP6dK1QJWQZ7Avw=;
        b=anRUTAEiU63abVQheRkV6HQRYxPRdUXr08WHdI0Vfs0h5gN3558C6V1S5qSeyO2hOn
         qcvPYI7ru2svqNaT4WD6HoNe6O0LywVLaNo38GeiPpnLLf+QoUydjQvDKylTw8PLK87e
         SRSIG9VAFadnHQ/w34fcRLiNHg4QFjyjfGtVwwPibL/xOLFec3VP54tuznBBaVVgDGf/
         eZO5GpF6sO+wUR3cKQvdzXatHJ8wKmQbe3JpqHLgEfW7H+alDB1phwtTSsjxJRipttQz
         STY1VkNozLmVuM5dW0ItkFD1ye0bd62s/UsmD/pJM2yqsIpJtYPt24vYzFwibJxmU68j
         cKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWw01mf7XVdn/fPm5sHYlAPH6WeJMP6dK1QJWQZ7Avw=;
        b=kvYL1Yt6BsaUJwpyboxb0kJ/+z3xGB1TdaWPvSMU8YkpjW8FA4tDNl+1qLGxTQgnBp
         10Rxxci4Q3APV+XEOjtaE5hWeuufM5oslcq5MByWShQh3bnGFgEPyX6nDXz/9Rq7Cdti
         Jnuh+7JBNE70vOntMI8sBkxMT4aVpz78qNELiH5cklNEFCNDBw+wQs0gPpzDAPuF7E5S
         NrgZS3bpIMcX0BnUDBYe677Vbn2iYjrBQdJ3rPniuTph43nAjRr5wN28sX7RimtzcdK6
         XEJbF6ejpIZbSMPJxvReHxBTDmjFALJGjb1T0LtdVAwd/32djIJ3UbkAkxKikGWq+Z3z
         g1NA==
X-Gm-Message-State: AOAM530we9+sEEDciYAt1SUCP2moaqmg2B7TZjB5LFuU6LSuL9fkVn67
	TcC30nmUEPv2kW2gXV+Mdnm4JvWmGOuTO188iC5MOhB8Xz29VQ==
X-Google-Smtp-Source: ABdhPJxExexkHvIRkMv7ggxJypHwVySIkPfCZ4c4MfRtgapAsP0L/lVVbCdAVlqgZuU6nRWbHSoNjsoXnxhEQ3rSC+g=
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr29632419pgu.82.1629676856057;
 Sun, 22 Aug 2021 17:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1897566.d8lQ4HMSh1@localhost.localdomain> <2099975.VbY6Rib6K3@localhost.localdomain>
 <CAA=Fs0n9pJSRuC=LQ1WsSziaup8XsSax8cQAySb8jMHBQa4X0A@mail.gmail.com> <2244233.5Ao9Nzikjg@localhost.localdomain>
In-Reply-To: <2244233.5Ao9Nzikjg@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 01:00:45 +0100
Message-ID: <CAA=Fs0kQFn56GTWQxNcy8sbazaW=GpJ3Dzcp73dPNHkPpJTWTw@mail.gmail.com>
Subject: Re: TODO list for staging/r8188eu
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 17:13, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On Sunday, August 22, 2021 5:09:47 PM CEST Phillip Potter wrote:
> > On Sun, 22 Aug 2021 at 14:50, Fabio M. De Francesco
> > <fmdefrancesco@gmail.com> wrote:
> > >
> > > On Sunday, August 22, 2021 2:36:57 PM CEST Greg Kroah-Hartman wrote:
> > > > On Sun, Aug 22, 2021 at 09:41:20AM +0200, Fabio M. De Francesco wrote:
> > > > > Dear Larry, Philip,
> > > > >
> > > > > >From what I understand how the development process works, drivers in
> > > staging
> > > > >
> > > > > should have a to-do list in the TODO file. Please read https://
> > > www.kernel.org/
> > > > > doc/html/latest/process/2.Process.html?highlight=todo#staging-trees.
> > > > >
> > > > > Could you (as the maintainers of the r8188eu driver) please compile and
> > > > > provide the above mentioned list?
> > > >
> > > > Why don't you provide an initial list for people to work off of if you
> > > > feel it is needed here?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Unfortunately I'm not able to tell what is needed to do to have a driver
> > > improved so that it can be moved off staging. This work should be better
> > > addressed by someone who is much more experienced.
> > >
> > > For example, I read from other drivers TODO lists that cfg80211 and lib80211
> > > are required but I don't know what they are.
> > >
> > > Regards,
> > >
> > > Fabio
> >
> > Dear Fabio,
> >
> > I believe Larry is working on hooking up CFG80211 again (he mentioned
> > going quite for a few days to work on it). As for other stuff that
> > needs doing, a few things come to mind:
> >
> > * Removal of dead code (whether or not this includes the
> > debugging/printing macros is a matter of opinion, I would say yes
> > personally) such as unused functions, struct fields, etc.
> > * Correction of code styling in the kernel (e.g. there is a lot of camel case).
> > * Use of in-kernel functionality and removal of unnecessary wrappers
> > where possible.
> > * Removal of the HAL layer and migration of its functionality into the
> > driver as a whole - this is an important one I would argue.
> >
> > There is likely to be lots of other items not on that list, but that
> > would seem to be the basis of a TODO list if we need one?
> >
> > Regards,
> > Phil
>
> Dear Philip,
>
> Thanks for this initial list. I suppose that every driver in staging should have it.
> If you like I could send a patch with the list you prepared, unless you prefer to
> make it yourself (since you wrote it). Please let me know what you prefer.
>
> We shouldn't forget that from time to time new people decide to enter kernel
> hacking through staging. I think that a list could help all future newcomers.
>
> Thanks,
>
> Fabio
>
>
>
>
>
>
>
Dear Fabio,

By all means feel free to submit this - there will be other stuff
people will probably want to add to it also, that is just what I
thought of so far. Many thanks.

Regards,
Phil
