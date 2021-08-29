Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE93FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 15:14:39 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id l24so6344966uai.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CE5DJ6I0bkqbGScS9NHu7P+t4w7mOT4FbVurC5+UIKw=;
        b=K3bPJ2wK1Ok8UQJoPWFjDCOt5KkMvjpWTPPSd9kxvWAMw+Nj4rDoLHfDJ0fbbOkvAe
         4nWdOKLhtdcPZjm+XVRqzhVjbwCgHFH0FfycB1Gsv5uYILSKGJE0shs1IWZnX9HaFC6l
         OWsz/iqcv8ei2cQ5PyNRRBIPlu2plTUnUhSBIkpl+GCChA5MTPJ5WKlK7pO5bNWvE1oA
         2DcsUGoMzwh+tnuO26O5hK34zvoPauqqO+VvOA6kP1gWWR2p1v1uwr7GcnXJjKzNn3DW
         QNxECArl3/9SL9vmAn/KkS3O2NyXCf8vB1Ud3hiKMRxk9mQu0C7HUV8SrtQXFPyZKBc0
         BjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CE5DJ6I0bkqbGScS9NHu7P+t4w7mOT4FbVurC5+UIKw=;
        b=JEtoxCiaJhbHUFZgsPSplFTz1bNqNoTKmCJ6TSRumsPsn5yHsnQsmvUjmC9mAcSY3f
         AzMHcND64x6L/7XD0PHxJwEqnWg+nQEmtcign47MwhAE5S6Ef9i44ke+9xWJ4Tf/5tF2
         ta8Pxk4a0SaKRZDgSixQ3XtuHm6Z31Y5g9cPFmKrW0xKPvK0/ERJGg8oHwfAkVOQxwg9
         6Mzsn/2e+ksw9+BCdx33PKRARkpANtYoplDMwXr4XVrJjC9IuxnW+/auiA3cOsnL7zs/
         JqAoTwwKKXlHolFYkndyn4yz0aRx0xNmkOIbo8O+NsviIvjpx9MXI4aho3tIWVloSAGN
         oWZg==
X-Gm-Message-State: AOAM533+SPyCgSrlU0HYdG9tyuP2SjWherg63rzQeCG2sSttbzlymruk
	a3hYUB03oMeD/+QVCYLfpAJy3063O64DfNQ9tbM=
X-Google-Smtp-Source: ABdhPJxNSz5alZOAE48+fiABe+l62fCRif3TJvSSlHYrT6MwKcd1hDeR6n/NQU69bkZyVPpmgdcFW9QTxYeo0z62LWY=
X-Received: by 2002:ab0:26cd:: with SMTP id b13mr12684124uap.98.1630250078925;
 Sun, 29 Aug 2021 08:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210822161005.22467-1-sergio.paracuellos@gmail.com>
 <20210822161005.22467-4-sergio.paracuellos@gmail.com> <YSip4/kMNOG4uYC3@kroah.com>
In-Reply-To: <YSip4/kMNOG4uYC3@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 29 Aug 2021 17:14:27 +0200
Message-ID: <CAMhs-H_0ytYCoBLj9GJDjHSPPHLC6_oBsm-V9s4FjhE7NY8TCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging: mt7621-pci: set end limit for 'ioport_resource'
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-staging@lists.linux.dev, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 11:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 22, 2021 at 06:10:05PM +0200, Sergio Paracuellos wrote:
> > We have increase IO_SPACE_LIMIT for ralink platform to get PCI IO resources
> > properly handled using PCI core APIs. To align those changes with driver
> > code we have to set 'ioport_resource' end limit to IO_SPACE_LIMIT to avoid
> > errors.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks. Since I am planning to move 'mt7621-pci' from staging to
'drivers/pci/controller' and send v3 after the next merge window, I
prefer this patch to go through the staging tree. For the other two I
don't have any preference and it is ok for me to go through mips or
pci trees. So, Bjorn and Thomas is up to you if you are ok with the
changes.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos
