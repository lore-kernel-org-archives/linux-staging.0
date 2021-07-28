Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD23484
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 22:17:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t3so2368012plg.9
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 15:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xt0NXK+H6bJd9bnnm9cvAJ4y45wGQkVige8G5Umi1CA=;
        b=vEaa4dDeac8LD1acoUW9tefGeFHRP/w4agRgkhlQXwXzg34Ehtd7jHBTBFmt+KDzt9
         w+3FYyDN7mQkp9hRCYRkFAol2oq8S0EtTJiRyjDXnEvNbIoT3VyA1y0VxqmPo1WCKg0S
         YoyKegu1GJ/Gc23aQQI5MHRSkeG1FuKs4tQVhWK/VwcRzTZgoHAqevbauG1tIZtSYnbe
         WxE9us2ZJ+b4iKaS0/K8Rzq7VTmDGwKa/LoU7FvjxkuHpIrjxsJTX1W/OL8PJLc5BSBe
         gqajCFdpkWyG5aTzSdWSFnE2M6cNueYKPcTDNp87xWi4PaZwstfSpbmQzkCmqaPJIuqk
         bJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xt0NXK+H6bJd9bnnm9cvAJ4y45wGQkVige8G5Umi1CA=;
        b=cxq/0O8dXufmmWCfEDcXzbeNqc58+2Toh2OdlXOsjB9fdF5jb3DCWEL9EbEpSFfygS
         kTSqF3hnSU+gxG1+v7YWNuyIlXBrU2jmwlAKDuBKohBu7RYnw60xCslOURcBdmQY3tIy
         kyAPMRKyBK0Y2+w9JPZ5H7adrioAxUGQuwfOFKZstNLT05A8/r2BGGVnDwBFwMg9dTQe
         5im56HOGCdFwNlsnBCqQijWiyhd5bxv5o0+DUUqHxEQsT5psoPtl87WllBCLSFzRoapW
         42uVPzp7AgHYbIEroCab3oYjG3NfIrER+37NV8seZ++IvgWJlE1yoEkBM1FfPCWWbPNy
         LWdg==
X-Gm-Message-State: AOAM533L4uGzsAaJPMFYiK0o2Pl8uyHxp4GPTygo1y1gdtUzVLHGM4ih
	g5B8LRF+xGBPN+8yg6uRMj7Wr5C3d0k99m/lsxeBFw==
X-Google-Smtp-Source: ABdhPJypKjcK2osCbLWCRwN08jcNKfs+sWQUroChMf+l64prEvfgvKosw0q8cVPsVYKppcqSUgvmDLDBSlT6FIx2DV0=
X-Received: by 2002:a17:90a:1b01:: with SMTP id q1mr7887939pjq.162.1627510634892;
 Wed, 28 Jul 2021 15:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210727232219.2948-1-phil@philpotter.co.uk> <YQGenmf2m3Tu7FFg@kroah.com>
 <9902deed-021c-ad37-7fc7-f4279886c683@lwfinger.net> <YQGoLPnL8s2buxFe@kroah.com>
In-Reply-To: <YQGoLPnL8s2buxFe@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Wed, 28 Jul 2021 23:17:04 +0100
Message-ID: <CAA=Fs0=bQt8Msaw_CjgjAsmQFjm6U3bag76K9uKHVfMPaehtvg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] staging: r8188eu: add newer/better RTL8188eu driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Jul 2021 at 19:55, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 28, 2021 at 01:41:15PM -0500, Larry Finger wrote:
> > On 7/28/21 1:14 PM, Greg KH wrote:
> > > Hm, I thought this would be in better shape than it is.
> > >
> > > Right now we have 107 .c and .h files in drivers/staging/rtl8188eu/ that
> > > come to a total of 44597 lines.
> > >
> > > So we are taking double the size here?
> > >
> > > I'm all for putting a "better" driver in here, but this feels odd to
> > > me...  Is there major new functionality here that is not in the existing
> > > driver to justify this?
> > >
> > > Ok, let's see how this goes, I'll give it a few weeks to see how much
> > > can easily be fixed up to hopefully get back to at least close the
> > > existing driver size...
> >
> > The major new functionality is that the new one uses cfg80211, whereas the
> > old one uses the WEXT calls.
>
> Ok, that's worth it alone.
>
> > It really is an improvement. It just needs a severe cleanup.
> >
> > I warned you that this code was rough. It took me several weeks to get the
> > old one "ready" for staging. I never devoted that effort to the new one, and
> > you wanted it in a place where multiple authors could improve it.
>
> Fair enough, I did ask for it :)
>
> I'll go through and do a license cleanup tomorrow morning to start with,
> that should knock a bunch of lines off right away...
>
> thanks,
>
> greg k-h

Just stripping the debug code out of this version again will free up
quite a few lines I think as well :-) Will get started on that.

Regards,
Phil
