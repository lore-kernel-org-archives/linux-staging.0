Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDFB3FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 12:24:18 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id fs6so6481186pjb.4
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eDSaIJBqh+izHPHHriK0NAbuzPQM6rniHf8ccvF9oRs=;
        b=BVmFAl20QChh3w25z5aDgoAKDDnhhkARn6uI4phpX6GDyw622uxGX2KjOTbiDs5fsP
         opqrJCD3yhDboc1OrxRpiH2EP8V2D11O83tpY52YhBV1UQM8QrhCX5xaBg6etjO0XaIi
         nJjS9CCLJJ8QMcG7O4qBf9+SPEGKCGRG8PV4n1bpkAKwUD1iryhvUZboJcND5rKZsyn8
         B2D3vBYKUqk1zZdEcMf3LLmf7vHA3T4P09OOC7ngADHOm22lrQnzF5IPpBuXlHk14ZHK
         WNY3GJhrMpQ0GamhEvokcCBce1ANBS/RnJY5pQxLtzWMaClUpHaWHN+mt7rpI7SAm25q
         hJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eDSaIJBqh+izHPHHriK0NAbuzPQM6rniHf8ccvF9oRs=;
        b=akDd/jMGoFigUTksI1jkcllECzXgRotBY+nSTnOFgIvVAv7ryjsd/Fcde+Ev8FpgpM
         I5CEsxILzDwj99gxSxBdyQFMZBF3F/H5BAadj042if7aT3baZ2gpQe4JgzU5f8KLyWOT
         Y8xRUbuKosOu9EXiokuRUtZZY3XiyXfqebaDeP+Nc8Tp46oVBim1cp1E1NOPksjzX87x
         x87j45aHoQEtyZtxzBVBgN9iduXx7+xOvn95Rx1NXuMxDcV0Y22dB0O3L4UshQMB35h+
         OBmvxZpYoN9gX7r0k1cCo3fsmiRUQR7s6GAwVEUg760djoTpicq1k7GuRnIV0U4VE02S
         AXLQ==
X-Gm-Message-State: AOAM533qKukii8NfChOAB6lVS7kxMzJKsVPmTCcBYT/nOfpo6UpP60vb
	puIApWG3q5JC/J3E9JcC790=
X-Google-Smtp-Source: ABdhPJz/o8n/4ad+NPvZNYaUzA9JcQz/YeHan0RbJDRnNWXh1T3Oshas5k5zn67kbuyR+RvSDa/LFg==
X-Received: by 2002:a17:90b:388f:: with SMTP id mu15mr15814347pjb.41.1630153457491;
        Sat, 28 Aug 2021 05:24:17 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id l75sm4167671pga.19.2021.08.28.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 05:24:17 -0700 (PDT)
Date: Sat, 28 Aug 2021 17:54:11 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
Message-ID: <YSoq6wRQYneYI6N1@user>
References: <YSFgrLUfXzgcT6k4@user>
 <CAA=Fs0kByg1NztU+Nf__RUzTHuVh_q2hvcyh+3JqXiVgn+_VeQ@mail.gmail.com>
 <1821445.fzUCeO1EU3@localhost.localdomain>
 <YSJEu3sbnR6uIach@kroah.com>
 <YSduG401BA80Xnsb@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSduG401BA80Xnsb@kroah.com>

On 26 Aug 2021 12:34, Greg KH wrote:
> On Sun, Aug 22, 2021 at 02:36:11PM +0200, Greg KH wrote:
> > On Sun, Aug 22, 2021 at 01:06:09PM +0200, Fabio M. De Francesco wrote:
> > > On Sunday, August 22, 2021 1:58:10 AM CEST Phillip Potter wrote:
> > > > On Sat, 21 Aug 2021 at 21:23, Saurav Girepunje
> > > >
> > > > <saurav.girepunje@gmail.com> wrote:
> > > > > Remove the condition with no effect (if == else) in rtw_led.c
> > > > > file.
> > > > >
> > > > > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > > > ---
> > > > >
> > > > >  drivers/staging/r8188eu/core/rtw_led.c | 5 +----
> > > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > >
> > > > Thanks for this, looks good.
> > > >
> > > > Acked-by: Phillip Potter <phil@philpotter.co.uk>
> > > >
> > > > Regards,
> > > > Phil
> > >
> > > Dear Philip,
> > >
> > > Before acking, please check at least if it applies to the current version of
> > > the tree and check if it compiles without adding warnings and / or errors. :-)
> >
> > That is not necessary or needed here, I can do that when I apply the
> > patch.
>
> As proof of that, this patch applied just fine to my tree right now...
>
> thanks,
>
> greg k-h

Thanks greg
