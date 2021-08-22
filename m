Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA633FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:13:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id x11so31617849ejv.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 09:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2SclzWe/a+WHkI1+v9aVDE2qt3aD/Uh5+eAnEPqlEbs=;
        b=Qow3Ok83b3Bry6lK3StPcchMLgt9renc1q+k7fPDsgvv4a2E/yskrCZkCwdn269C7N
         DUBh1N7mH7X4wfNBaUqV/Kaqb2kgDuu5Un1ODEuRgIpZrkGBSrZbdBZlg+vSnaqvN8dg
         ogNE5Hfi0UQ3krDC0xZyM7iR42orCWW4VryvI7x2+7IVG0oQMgxJ4a7wqQo5aEHVVe7J
         BEAZsl59fDluy71KTKVY8WLUkl5jW1RR1hyfuZEbp+m1uzu1wZODt9pjsQ0V9KRIBGbI
         f+TqP4yUi9NMYdB6lZDpWIFB67Q20diJ+DX+0dAG+N5smr0jT7Vm42DgzPDYSvnk2C9Q
         0SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SclzWe/a+WHkI1+v9aVDE2qt3aD/Uh5+eAnEPqlEbs=;
        b=V71EN6iBN6QmtLTbockCi7e3uEs1P0nmHpDUh2OIQuV1OJhkeZhAXOd5doKkesoFA4
         FSnanR16CferfQZH838HtP5QJVz/DyeryAUop/GWRCeLIk4aJb+ycfMLdMaduKB9OWyV
         IvgPfGgFmu6A0V85yA+OtDgcHE3l6tQNdia9dvjMA3l5E6E2sNJh6rGj0E0o8c+pk5M2
         FVHT12jL1mM8+kPWu/4rEXp1sPDK2Y/CAFdk8z3iQeWChWF0WXRYPxkJgiHcAZmwpGe+
         k6ea4+dd9479zgyUqvfcRSQeBHjb6NmIT2ZguS/GHV+cNb3cBY8Bqg5Cc4Xwmxo31+Nj
         CIMw==
X-Gm-Message-State: AOAM532uma5kfJRJtN6C+u4T/h4lJ0SOC0gRS5HuJuHlBVQS2S639Iwk
	j1ZlkpCEzjTjN8+0dlMN6sM=
X-Google-Smtp-Source: ABdhPJzoSyc7f19QewE/rEJBkxA/iBhxjuOrTs4J7MWU0qD+0RQaGG1zSqJcq/TSHIJ0SQItdqK/dg==
X-Received: by 2002:a17:906:af4f:: with SMTP id ly15mr31842423ejb.175.1629648828905;
        Sun, 22 Aug 2021 09:13:48 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id i6sm5925824ejd.57.2021.08.22.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 09:13:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Subject: Re: TODO list for staging/r8188eu
Date: Sun, 22 Aug 2021 18:13:47 +0200
Message-ID: <2244233.5Ao9Nzikjg@localhost.localdomain>
In-Reply-To: <CAA=Fs0n9pJSRuC=LQ1WsSziaup8XsSax8cQAySb8jMHBQa4X0A@mail.gmail.com>
References: <1897566.d8lQ4HMSh1@localhost.localdomain> <2099975.VbY6Rib6K3@localhost.localdomain> <CAA=Fs0n9pJSRuC=LQ1WsSziaup8XsSax8cQAySb8jMHBQa4X0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Sunday, August 22, 2021 5:09:47 PM CEST Phillip Potter wrote:
> On Sun, 22 Aug 2021 at 14:50, Fabio M. De Francesco
> <fmdefrancesco@gmail.com> wrote:
> >
> > On Sunday, August 22, 2021 2:36:57 PM CEST Greg Kroah-Hartman wrote:
> > > On Sun, Aug 22, 2021 at 09:41:20AM +0200, Fabio M. De Francesco wrote:
> > > > Dear Larry, Philip,
> > > >
> > > > >From what I understand how the development process works, drivers in
> > staging
> > > >
> > > > should have a to-do list in the TODO file. Please read https://
> > www.kernel.org/
> > > > doc/html/latest/process/2.Process.html?highlight=todo#staging-trees.
> > > >
> > > > Could you (as the maintainers of the r8188eu driver) please compile and
> > > > provide the above mentioned list?
> > >
> > > Why don't you provide an initial list for people to work off of if you
> > > feel it is needed here?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Unfortunately I'm not able to tell what is needed to do to have a driver
> > improved so that it can be moved off staging. This work should be better
> > addressed by someone who is much more experienced.
> >
> > For example, I read from other drivers TODO lists that cfg80211 and lib80211
> > are required but I don't know what they are.
> >
> > Regards,
> >
> > Fabio
> 
> Dear Fabio,
> 
> I believe Larry is working on hooking up CFG80211 again (he mentioned
> going quite for a few days to work on it). As for other stuff that
> needs doing, a few things come to mind:
> 
> * Removal of dead code (whether or not this includes the
> debugging/printing macros is a matter of opinion, I would say yes
> personally) such as unused functions, struct fields, etc.
> * Correction of code styling in the kernel (e.g. there is a lot of camel case).
> * Use of in-kernel functionality and removal of unnecessary wrappers
> where possible.
> * Removal of the HAL layer and migration of its functionality into the
> driver as a whole - this is an important one I would argue.
> 
> There is likely to be lots of other items not on that list, but that
> would seem to be the basis of a TODO list if we need one?
> 
> Regards,
> Phil

Dear Philip,

Thanks for this initial list. I suppose that every driver in staging should have it.
If you like I could send a patch with the list you prepared, unless you prefer to
make it yourself (since you wrote it). Please let me know what you prefer.

We shouldn't forget that from time to time new people decide to enter kernel 
hacking through staging. I think that a list could help all future newcomers.

Thanks,

Fabio







