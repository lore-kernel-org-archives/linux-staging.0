Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819936D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 15:05:28 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso14902561oti.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DN+Pv7shK2P5BW650iRpB29dWVvYcWcUHF2JuKWInlk=;
        b=Ku1nVe5iO8Xtqeg8NkdHqrYdN21nd8yNnCo+E/U016S9pQabMx3O8P+3jQ0YAykN+Z
         yKuil8NO5EmGUWi+vPhbdxWBxGZC/HiGdyD6tgX2nK1hvA8HEnO8/mgbyl3fxXVfO96i
         edZs8cxghO6icquJGY3+z9X7XlK8q+XJjH2b8hjrLv+yDS2vYOtZmAALPmiUfbFwqLDN
         f0UVl3T8AcfL0fiHd6lnIXFeWc5PaFLiCoQ7bXuhN0sKUskgF1YxYo2Yvy/oAQC2B5Rd
         LGqsZbaR2Aw4xXqPrdAMjv4hZQTcWUpnjiNQ38C6FrlhLNAHdHvxI39s1hsKY8N37ffB
         yHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DN+Pv7shK2P5BW650iRpB29dWVvYcWcUHF2JuKWInlk=;
        b=rkZrQ/L9v+Cq5vCAbAYo0z54DpQMS9uNVWHlFNqjAmCI1UulDv8q0f6g1y7+DA7NLO
         csCdKJ82ci/xH1XUq9/Mn2LF5QtT5BW0jToVA4jztf6HT6ReAMhOIN6awaloirgG9x3f
         fjZwctg4RihOfZUlTIM+M5c59c1WVOLOtS21eH5dBql90y2LtnkOoJrpjrttXJGXJ10T
         9eI2CDrtjDTrjbyDER+2y62DGl3JnkPsbO27JwwnqRIDE+IzMc1W/9sWSpFcz6NstbsO
         eRCrE6YILwxciIPI9MQFCMXePIiV2+B9eJkMQNWrcbhRxno4ZQ7tsPFlwz6fln8wYrba
         4vUA==
X-Gm-Message-State: AOAM530tLA8ZikbMcnZgjSHWbhfBUXdvz8xbkljJEdxsomO7RIy6Jk9t
	0YseyCVPUhg7SbK9gHlBbEST40osGxreb8VoLFo=
X-Google-Smtp-Source: ABdhPJxMmR4LNN56EPbSCX8BVUWg86qNpB+y7ccxvarcSgUadi7QTQ2hahI9B6z8WD7xNHJJwllxLNzogaENQhQq868=
X-Received: by 2002:a9d:7f8a:: with SMTP id t10mr26302185otp.239.1617721525118;
 Tue, 06 Apr 2021 08:05:25 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406130556.1417-1-fmdefrancesco@gmail.com>
 <YGxsExq2fcQvrN99@kroah.com> <CAPj211u9MHgtjeZGUPsLxU3HkbJ8cr2EUL0v9HA7LE9-b1uUoA@mail.gmail.com>
 <alpine.DEB.2.22.394.2104061652590.2882@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2104061652590.2882@hadrien>
From: FMDF <fmdefrancesco@gmail.com>
Date: Tue, 6 Apr 2021 17:05:09 +0200
Message-ID: <CAPj211uct7K7e2Kcz7drmWGcfuTRQYTWHFRvrA9ah-JmBTotsg@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: hal: Remove
 camelcase in Hal8723BReg.h
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 4:55 PM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 6 Apr 2021, FMDF wrote:
>
> > On Tue, Apr 6, 2021 at 4:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Apr 06, 2021 at 03:05:56PM +0200, Fabio M. De Francesco wrote:
> > > > Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
> > > > are not used anywhere else, therefore this patch does not break the driver.
> > > >
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
> > > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > >
> > > If this is "v2", you need to put below the --- line what changed from
> > > v1.
> >
> > It is a v2 only because you made me notice that I forgot to cc
> > linux-staging and linux-kernel.
> > So I sent it again, but probably I shouldn't have changed the version
> > number because nothing else had changed.
> >
> > > Please fix up and send a v3.
> > >
> >
> > No problem at all. I can explain in the patch v3 what I wrote above.
> > May you please confirm that a patch v3 is the correct solution even
> > when nothing changes in the code?
>
> When Greg acknowledges your patch, everyone who is concerned with the
> patch should see it.  So he needs to pick up the right version of the
> patch that has everyone in CC.  He can use the version number to choose
> the most recent one.
>
> The version numbers don't appear anywhere once the code is committed.  So
> it's not a problem to move up to the next version for any reason.  On the
> other hand, if you skip a version, it can be a problem, because someone
> may wonder if they missed some useful information.
>
> julia
>

Thanks for your clear explanation of these details of the workflow,

Fabio

> >
> > Thanks for your help,
> >
> > Fabio
> >
> > > thanks,
> > >
> > > greg k-h
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/CAPj211u9MHgtjeZGUPsLxU3HkbJ8cr2EUL0v9HA7LE9-b1uUoA%40mail.gmail.com.
> >
