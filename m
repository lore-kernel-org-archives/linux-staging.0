Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881271
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 04:11:37 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so19440086otf.12
        for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ZVDcTMbC1aiWsLtnnQkNmtuDQK56GjzbJG6dgvkY6Y=;
        b=gyDmRiMY3fF4stRtW2YLntDpQV69V4WHa/ApTt2f3of6WZxE/xk7681QmOwd7ee4ju
         bvGa5p5z156sgYA9G+G8mCdYErWiyFDewuE/q/Sso4VhnxdlbHa7kUFurfHh15KjAR0J
         dgZS99WzOMtLifcNjRulLMDyzUPAhgUHviuDlDXpPAjhbWf7zbKrnNk2NLjyHWk5mdJc
         WsfSuz+PHVFO8g/eJ1wMdybzclDOl8TWUgsbGZ6uAMdaISZKG/6LtdY9UI8cRz5IHjC1
         UFkvSEJbu2vBz0i+ANEpF3bZ9SeYNGvW2jJvTLeAYD5wdNicaIQdfPCujNNw6Cl8Hp1h
         ZeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ZVDcTMbC1aiWsLtnnQkNmtuDQK56GjzbJG6dgvkY6Y=;
        b=OC2A4TqQRVHYiQaXSKxaW4cmX5TDf3ZtvlP3RRQGO9+v5RhijEYbVnGUkMusowmKob
         PwhgsZRIPP777ahDy8BmvgjLaWlfBtBtlngWrNbXlKIeqjxOaWLADSnCVkqGEvIUT6OU
         oBSL9Lwq7AJ01CRTGs+j091qzDrcGklZZPofNTHd3FbTDHO0IPACv9BSD7/aORkXy9wF
         2HoSxvZj3Btk+zaImkFHjqkZ+DZRgblagiVmztyeC2d+9dsIfE3hW30PE+R/MAbm6REP
         OWs6qSRVyoecxZRkxys1/R5ZYvbfYIgvsws3MC2OMRlYobJFcPSWG4WA/gXQogSE55tg
         eB5g==
X-Gm-Message-State: AOAM531+Co8VTc7nG6Ees2AdU4KRbpbITvDgx3hJ2jIZu2ABc56/faX4
	MOsHALef3P5EHhSwSVwt5FkonsSexkr6mRYMkqY=
X-Google-Smtp-Source: ABdhPJxukURS5VskjkpMQX+3qeDMmAefANqTt+R52x8btgKpfpTR0p8ud7jPVz6NkRG2Zkn8noPlDXCz3HQy4F75ZKM=
X-Received: by 2002:a9d:2ae8:: with SMTP id e95mr29656787otb.72.1620792696803;
 Tue, 11 May 2021 21:11:36 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMhs-H-1f72=7C3j1jCmdLU8+5LurPO6nRVcvPJO_rxPitQBnA@mail.gmail.com>
 <20210511204758.GD18185@alpha.franken.de>
In-Reply-To: <20210511204758.GD18185@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 12 May 2021 06:11:25 +0200
Message-ID: <CAMhs-H_4YPevS5KuuTrhXAzMVfPrTiosg88Ch8s=iXYrkJ2biw@mail.gmail.com>
Subject: Re: Some doubts about mt7621-pci mainline place
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, May 11, 2021 at 10:48 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, May 10, 2021 at 08:43:51AM +0200, Sergio Paracuellos wrote:
> > in staging and is properly using the pci generic APIs instead of the
> > PCI_LEGACY which seems that all other drivers in 'arch/mips/pci' are
> > using. The driver is generic enough but it needs mips iocu region
> > configuration that is done in the driver itself. So here it is where
> > my questions come. Is 'arch/mips/pci' the place to move this driver?
>
> moving to arch/mips/pci would work for me. Could you look at converting
> the driver to PCI_DRIVERS_GENERIC instead of LEGACY ? I want to
> get rid of PCI_LEGACY...

Driver is already using PCI_DRIVERS_GENERIC, so as soon as I get
bindings validated I will send patches to move into 'arch/mips/pci'.

>
> > Is the driver the correct place to configure the iocu related with
> > pci?
>
> I see no problem with this at the moment.

Ok, good to know :).

>
> Thomas.
>

Thanks,
    Sergio Paracuellos
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
