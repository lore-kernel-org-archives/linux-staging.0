Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6917F
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 22:24:40 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id nt11so315899pjb.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 15:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrhRnlztM32IaZrIGZ9Mi5bnSi+S4AFi7dtGVRZ3+oE=;
        b=lxGFxypI3awP4jFNDHn9zjYNhCggd/GIfQmD8Hl1CdGYU4MNCyFNk9r05maXP8F22G
         HdaczcdSjxSQu4pazGCUjomJ0bST5B9nWtVdqw1Bl4Qx5VxRvquT2As9HgOJsjD626xE
         R1L882FgllHUtXsys4b+sA0gL6I4YGZilh1cXW14V8QPLS0H+JG8J2nF/GTeE0cl0Ht9
         oVad7U14wENl9sBb8SKKAes/kZKHoTxke6i3L+ornLWZ6wmD8NgUq5KrbDG68+aeyPhS
         9+zwpkTfhK6stWLcqmKMdxCIMkHjsvYygE36Bds305cuWqccbqdYlBs7ExOVXEuh9WSK
         wzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrhRnlztM32IaZrIGZ9Mi5bnSi+S4AFi7dtGVRZ3+oE=;
        b=olVAWCfaDWR4PMgzK9KOWdDo1Q4WnenwdexKXjl+ZXni3djVk9yFvfDM0sb5MVnFlh
         lXeJXqDycUow3wJHY2PQ2C6+DPqPSmF/t75/8ZKCzWqOiKAsj/YYIj+t0emGXC2EjwLK
         /7NiU4ZkFK+Ow9VKLdDlaGrkTxC8LpxkgnEshVsDvD6jyZtupEuOdarc3+ytjrEw19p5
         YpC6tBlIIvCbAWrEpxeH9+r/H50pScZjh59Abl+LSW5eggXk47tawtEcHFRZlG1TzWg+
         5w3wsM9BygqCmqFJ7r4Pf+pWI5VwSB0hwi6eaFlYs/D243SmyDo8yLzuViohfiGkfZeW
         2I/A==
X-Gm-Message-State: AOAM532EX34hx7mRiaO/+MinOWemHcc7sA61cm4ShH5jHc8wjgs9cQ6L
	57N7bWAOV56nVNJDXz7T4RFfsHbw97HtC+x9N0v560K6nonJZAf/G8Q=
X-Google-Smtp-Source: ABdhPJxYEaa4G0PKpfOtWkOuWJlc/+m01d8/a9mzzT44r+II16GS1SFt58hWCXe5dgu781qx1ubqndrSao0dUKuOrsw=
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr368854pgu.82.1628634280452;
 Tue, 10 Aug 2021 15:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210810074504.957-1-phil@philpotter.co.uk> <CAK8P3a2n6WfsQUKP7W4VytJ6K=CGcfOz-eSc=6FzvkANWkk87A@mail.gmail.com>
 <YRJTgMI5CaG7VdGx@kroah.com>
In-Reply-To: <YRJTgMI5CaG7VdGx@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 10 Aug 2021 23:24:29 +0100
Message-ID: <CAA=Fs0khyHV4AytW=smDMmKtR2Dv8QazcOBuuNpPfN+Z0nc_AQ@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove rtw_ioctl function
To: gregkh <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Larry Finger <Larry.Finger@lwfinger.net>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Aug 2021 at 11:23, gregkh <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 10, 2021 at 10:08:31AM +0200, Arnd Bergmann wrote:
> > On Tue, Aug 10, 2021 at 9:45 AM Phillip Potter <phil@philpotter.co.uk> wrote:
> > > -int rtw_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
> > > -{
> > > -       struct iwreq *wrq = (struct iwreq *)rq;
> > > -       int ret = 0;
> > > -
> > > -       switch (cmd) {
> > > -       case RTL_IOCTL_WPA_SUPPLICANT:
> > > -               ret = wpa_supplicant_ioctl(dev, &wrq->u.data);
> > > -               break;
> > > -#ifdef CONFIG_88EU_AP_MODE
> > > -       case RTL_IOCTL_HOSTAPD:
> > > -               ret = rtw_hostapd_ioctl(dev, &wrq->u.data);
> > > -               break;
> > > -#endif /*  CONFIG_88EU_AP_MODE */
> > > -       case SIOCDEVPRIVATE:
> > > -               ret = rtw_ioctl_wext_private(dev, &wrq->u);
> > > -               break;
> >
> >
> > I think these functions are all defined 'static' in the same file, so
> > removing the
> > caller will cause a warning about an unused function. Better remove the
> > called functions along with the caller.
>
> I get no build warnings/errors with this patch applied, which is odd.
>
> So I'll take this for now, but a follow-on patch to remove these unused
> functions would be great to have.
>
> thanks,
>
> greg k-h

Dear Greg,

Many thanks, and of course, I shall prepare one now.

Regards,
Phil
