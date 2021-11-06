Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748F2C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 19:29:31 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id w15so12954415ill.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5S6oQSzI834Iq+y/PJsVU3pi6el1YaKIV954k4n6RMQ=;
        b=UiZbGakcgOV1ffXXBmQspTcmFlEla9iw4wdf1aLVyVJcGa2EcSSVGqraQROkP8tnQD
         JXQ1n8KhHx9dADC/zfL1QmfxPzmK/EJ97qGdFwGH5QcEaNZduvMaRqZ4LTRPOXmjgZOX
         d6DtAoQJDmHRxfvaVHNlnYecDquLdfCOIuT10AMNqrw9R9zqnvas5A8ldtLmdRQF/wKi
         ZxRukZ/wIGKeFmh6VBNOdQEHy7Sv0UrSngB7gSCBf0XM+3+Ee68G/RLAB9LrVvifhQcY
         8h3bGWqsYsSzuAkbgraRnWHjWXsCMR1B8iapKcr59aER+Abpm1kb5OG0DNFnkWEsEZbx
         6h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5S6oQSzI834Iq+y/PJsVU3pi6el1YaKIV954k4n6RMQ=;
        b=p8A9TZlJeRLtugSp88HN2PFflEAcqg+78T8cSwDejQcsZS5D5ZhPby43p64uWvLu9i
         qq0cePQ5JHZSRfE6NrczLvr2/l4oK/3Eav/yK7pA5+7x3SdS0IDYF7dMzNJz2JPhGFlg
         9dGej1ekpyE5Tcm98h5aTk8V66B/KGhywKEp53NIHRfEu1qu3RBQGmXfeH/xptvC23jd
         da9noukyF6k3xHJqC+s869VfAGu4VKkFUpdLcmneZCxK6ORyev2A0YqjNr3Vy6zbYP97
         pYDfO2vy++3pGZyN+TXpSB0ludjshr8RBMCVPVFhIrHRGjhaO0f4HK2U7oD+DdVxis+V
         LZ/g==
X-Gm-Message-State: AOAM533KI6Zbc6akaxo0yi2VN3IwG3HrQ6BcfftCP6kZdA8G4CLN44Sq
	6v1VxUCF88mkXazFjNsT3Yo1EoN4MZh/Y7WIc0M=
X-Google-Smtp-Source: ABdhPJwfe8jKkeaxvD7PV0Eo8MXwKHF6Tv/izaMXCvpW488EAk+tPOlNufHjedBPHTVeIoPLkvbYE0W59fdv+Q3JdQ0=
X-Received: by 2002:a05:6e02:1606:: with SMTP id t6mr22439624ilu.40.1636226970801;
 Sat, 06 Nov 2021 12:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com> <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
 <CABtXzjQk87ZhYcc2h5mU0mR+6zC7rKrpP-g6uE=DxE56NXQXpA@mail.gmail.com>
 <YYa0e98JTsE0PPDL@equinox> <CABtXzjTkER+2KzsfhcYVN+gDGWUTmpX=2smdfine_fa-b+nsRA@mail.gmail.com>
 <21b97629-00b1-0fed-a4f3-fc318372aea2@lwfinger.net> <YYbJxFAAFuIA8t6W@equinox>
 <YYbOI9DC0pYQRQVD@equinox>
In-Reply-To: <YYbOI9DC0pYQRQVD@equinox>
From: Zameer Manji <zmanji@gmail.com>
Date: Sat, 6 Nov 2021 15:29:04 -0400
Message-ID: <CABtXzjTCb+Qe9tiVVoJ=3P2yTxdZgAwd7_rnbcY7N7ByOguRsw@mail.gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Pavel Skripkin <paskripkin@gmail.com>, 
	linux-staging@lists.linux.dev, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	Michael Straube <straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I was able to build and test a kernel from Phillip's github repo and I
can confirm the patch fixes the issue I observed.

Thank you Larry and Phillip for your help. Would it be possible to
have this patch queued up for a 5.15.1 fix? I was
testing out 5.15 because I read it would be the next LTS kernel.

On Sat, Nov 6, 2021 at 2:49 PM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> On Sat, Nov 06, 2021 at 06:30:28PM +0000, Phillip Potter wrote:
> > On Sat, Nov 06, 2021 at 01:09:23PM -0500, Larry Finger wrote:
> > > On 11/6/21 12:16, Zameer Manji wrote:
> > > > Hello,
> > > >
> > > > I would be happy to test the patch. I am not an experienced git user
> > > > when it comes to
> > > > taking patches from mailing lists so I would appreciate it if a commit
> > > > was pushed to a
> > > > git repository that I could pull down.
> > >
> > > Sorry for assuming your level of familiarity with Linux. I find that anyone
> > > that can do a successful bisection is pretty adept. Unfortunately, I do not
> > > control the repository, thus I cannot push patches.
> > >
> > > Please tell me how you read E-mail. Do you use a local mail client such as
> > > Thunderbird? If so, I will send a special patch form that can be installed
> > > with git.
> > >
> > > Larry
> >
> > Hi Zameer,
> >
> > Just setting up a temporary repo now with Larry's v2 patch applied. I will
> > share the URL shortly so you can just clone/pull from it.
> >
> > Regards,
> > Phil
>
> Here we are: https://github.com/PhilPotter/linux_temp.git
>
> Just clone from that - that is the current staging-testing tip + Larry's
> v2 patch on top. No commit history to save on uploading 2.5 GB worth :-)
>
> Regards,
> Phil



-- 
Zameer Manji
