Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563DC70
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:29:14 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so12201840pji.5
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+p/vb8Nh3bZn0qfhOImjTyqVNq1MlM0FRF8GGlBxUc=;
        b=qQWU0Xwu5tF7zhG3txv3x6kiRCSsotxMmRnDbRQVXHCaKlCiWqD10QXUAlMddyU+pk
         xFITmDg4/TAhu0BZVlyWw7e3fX63V7A2035wmSjG/MTqoCcmGMgLwmnZ9Ewt+hk5Urpa
         sD5jkyZvCZ27Dp8HzbQkWYMxWm6rwWmRBOZ8aMC0C+TvniiQ5HSSnyTu1urskro5a5Ar
         42zafCfGhlSf56Hmw8nB5jkdpZ8Vs+v0sDIcvRKtYRp0p975kIYVQ0/phCWZ5BrrpeUf
         gQyBY+H2CskMeZGePvsI636NyaDU9wjTcr0fxO97HHjpUpIzNo+/0Dr5isGtbQJqdzWc
         /ZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+p/vb8Nh3bZn0qfhOImjTyqVNq1MlM0FRF8GGlBxUc=;
        b=bMsys/oU0hdCZ8qTwG/1d0iFYGcVdqzKfDRGGohSx0faSTBWWUyPNtWteAldnuXgVw
         r0Gz1VTU8A01ZB1bmiS/C3Y+6lAkFDz3kLh3lJ+Xvw+GeBkhsh0ptiG1gATZPmKFvwMy
         JxwziGM9TJ8HTvRSV8EtWE/H6NVa96N6x1/RIvborAAsexvTIR4rUt3jEuvtmTxCWojY
         tVDLN6zX65gmcodwff8KA8796uFf88pEb1iSGGME4CilnfodaW2iGKWiu08mMfEWs1I0
         3wYtBsLeDNNQ62fqYloiDmrmq01bawJW5D1OSHBvwW2CYxnYj38lTGEKaA8CiqW+EUn9
         MCfw==
X-Gm-Message-State: AOAM533g1tw+ie1swkXaNpOZYJVFhAoEt8QOv7VGW37bOs5Dcu19W/Mc
	soTpH7CLeWl15eKhxMBXQtD/J03Wp4jHoYWsuhTkHA==
X-Google-Smtp-Source: ABdhPJzcBaCYUrXG7U8HwgdTdWC/E8gWuT4Ng7D5uFteTeqCoXOELTwCbYpl0dJO594uus5VXzsLAP02mG5aSZyTlQ4=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr1118476pgo.208.1628724553856;
 Wed, 11 Aug 2021 16:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210810235047.177883-1-phil@philpotter.co.uk>
 <20210810235047.177883-2-phil@philpotter.co.uk> <YRN+6yLnjQTM6LJU@kroah.com>
In-Reply-To: <YRN+6yLnjQTM6LJU@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:29:03 +0100
Message-ID: <CAA=Fs0k+ZuW4OQUCn3gqiqQUOiF6N7ycS8wunPOVt2rrWEC56w@mail.gmail.com>
Subject: Re: [PATCH 1/8] staging: r8188eu: remove unused functions from os_dep/ioctl_linux.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 08:40, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 11, 2021 at 12:50:40AM +0100, Phillip Potter wrote:
> > Remove unused functions that are now no longer called as a result of the
> > removal of rtw_ioctl in a previous patch. This includes functions not
> > directly called from rtw_ioctl, but anything in that specific
> > call-chain.
> >
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 1538 ++----------------
> >  1 file changed, 127 insertions(+), 1411 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > index 4e21801cbfcf..1ccc5f8de1ee 100644
> > --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > @@ -1539,7 +1539,6 @@ static int rtw_wx_get_essid(struct net_device *dev,
> >       wrqu->essid.length = len;
> >       wrqu->essid.flags = 1;
> >
> > -exit:
>
> This is not a "function", but a label that was not used.
>
> I'll take this but be more careful next time in the description of
> patches as to what they are doing...
>
> thanks,
>
> greg k-h

Dear Greg,

Sorry about that, I had even made a mental note to mention the label
explicitly, but it somehow slipped out of my head. I dealt with this
in the same patch as it was one of the build warnings I uncovered.
Thank you for taking the patches.

Regards,
Phil
