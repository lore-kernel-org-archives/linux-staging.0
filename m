Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEEE70
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 09:04:49 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id e4so19207326ybn.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dOVxQw7hzMqouTzTMaPZlulc5riwZNLlilwvv6ofE+E=;
        b=sQ97r/JNoBCJgkPUntBNSlD3p7drzkqCjEcAHwx/Lziby3BbKxI/N9EJy+iBdMs4E/
         c7+GimebIBY68m9tGcdstovhH6LRib3ysxl541hZW0f84BOJm2vBNNOJsMHug79eHEtU
         65NdPF7JYp863KHp7FcMV9EvbIPJwm3vKgwIxquaSh//MDbM5CFpwoxd6YdI56CFqBI1
         3M8Y0QvtTWGJWl4g1epX9EDyfHF6nbFwVwH8toXc0mu9U1j32/dwufi58nqpDMYDMRCJ
         UM0ACj/l4HfwstG6CR3Cm1ohopUsOdHRqRXkLXMXb8scIpuEPRGOgZft+0z6aMaBHkHF
         rQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOVxQw7hzMqouTzTMaPZlulc5riwZNLlilwvv6ofE+E=;
        b=qKHPv2sPB17aPi/nOsDICSPH1nA0fyc5YQQJteI6lR3X4eqZ+PqgUvQFI+RPMsNIoz
         wsPUInqikWOmZR1ebtYeIXDAwg3qPT6dHp5oPPYPsu0Xhy+e49AlrmkqzzI/LoLgeIsF
         UfHLPNbdg74WYkoU4156tVQXpGPqeQ6Uwg01ZRx9PLuMuw8UKnLjNsXWcfEfHL78Zepa
         8Mo+pkHWpuqGJy/bD1ucLwTADQNcUobe869v+x2pZ/2NyDTpd+0L918VYmCcbCIOtf55
         D9F+qxXQLR3ldJuDRvWUMYLsg4m2f37ROOxxv+U+URK4VJbeCUkbIrWEvKLEl1nFSbpw
         uXzw==
X-Gm-Message-State: AOAM530J96hNfHXBm6e6eiMPdNirzk4Y1msCF0T9J+K+CboYA7HLr8QQ
	GS3J6FvXEPkgC+pk9ld0dFNj9E5nwwhIUyjpJQ0=
X-Google-Smtp-Source: ABdhPJyrKEqicYc3NhFDQcYPh9BmSWMMTJbWGej2LVyhJGiCSkSNvAjmLhOmgZ6vY7YnZswvIRqqBYRbX1HyMmKrk1Y=
X-Received: by 2002:a25:d290:: with SMTP id j138mr28773857ybg.151.1627981488909;
 Tue, 03 Aug 2021 02:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803071811.8142-1-lukas.bulwahn@gmail.com> <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
In-Reply-To: <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Aug 2021 11:04:38 +0200
Message-ID: <CAKXUXMygDgw6oehMshsHuDo8a5j01=wErDxpgA9oiW-KMLF7=g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update STAGING - REALTEK RTL8188EU DRIVERS
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 10:56 AM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> On Tue, 3 Aug 2021 at 08:18, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 55dfa29b43d2 ("staging: rtl8188eu: remove rtl8188eu driver from
> > staging dir") removes ./drivers/staging/rtl8188eu, but misses to adjust
> > the STAGING - REALTEK RTL8188EU DRIVERS section in MAINTAINERS.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   no file matches    F:    drivers/staging/rtl8188eu/
> >
> > A refurnished rtl8188eu driver is available in ./drivers/staging/r8188eu/
> > and there is no existing section in MAINTAINERS for that directory.
> >
> > So, reuse the STAGING - REALTEK RTL8188EU DRIVERS section and point to the
> > refurnished driver with its current developers and maintainers according
> > to the current git log.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210803
> >
> > Philipp, Larry, please ack.
> >
> > Greg, please pick this minor cleanup on your staging-next tree.
> >
> >  MAINTAINERS | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 36aee8517ab0..ef32c02b3e4d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17723,8 +17723,9 @@ F:      drivers/staging/olpc_dcon/
> >
> >  STAGING - REALTEK RTL8188EU DRIVERS
> >  M:     Larry Finger <Larry.Finger@lwfinger.net>
> > -S:     Odd Fixes
> > -F:     drivers/staging/rtl8188eu/
> > +M:     Phillip Potter <phil@philpotter.co.uk>
> > +S:     Supported
> > +F:     drivers/staging/r8188eu/
> >
> >  STAGING - REALTEK RTL8712U DRIVERS
> >  M:     Larry Finger <Larry.Finger@lwfinger.net>
> > --
> > 2.17.1
> >
> Sorry, not sure how I missed this :-)
>

No worries. That is what janitors are good for... ;)

Lukas
