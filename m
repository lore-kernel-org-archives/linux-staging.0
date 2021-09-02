Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBB72
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 10:15:25 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g11so1034565qtk.5
        for <linux-staging@lists.linux.dev>; Thu, 02 Sep 2021 03:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jY0hv8Hwv+CT3F31rfXY2gXxMi5rZPignVknHkWMmbc=;
        b=W6BnvnkxBsv0zv5VlNH5tPNzy1TMc+MmUgNjHkvbhds2FgaADzlyMDJnF6qT++tUkg
         xjQyrM03fM8Kk2fkbrGcNeypZ7rESkUYl71iMxPixTM3Ncv4FimKqz/AVubZYjOAm8TP
         PTm4aQJNk5lsbHfIcGQMvBol4wmbzwqD6paEA7sSFbBQUgSDYafHcRrE5CuQRdaQhMp7
         EHqrWd0SuK+dzK/VqquRZbxsep+9ZX/E7Ejk70MbjvzQv7ublsz9mVlx4cYSsz1sQQ1I
         Apq3DEoudOvrai3Bxf7I2HRydQ6MtTVK+mktHJ6do7AZlE9kwzU8TwTWkRbSwEFeoqUB
         +YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jY0hv8Hwv+CT3F31rfXY2gXxMi5rZPignVknHkWMmbc=;
        b=krjBAWFjewon+CHj3OW0Ldyz4HyrbmEgHhOKMO7fxmHIy6xZQe2DJnq3r/bLzAwHjR
         oUb6xmy2pjlbPLXjAtiGK3kEq/uFK4l5jrx2wcn+RbUhPJoSuNnmfCed0nVtZCBKGOWB
         XIYuapTwY8uRs7VtMkQAxMTZzKcnTll0E+U+L+g1h6Kv3TNpzTb6sn1bI8tasjmNn7oH
         6uSRiockYokQxyxCjOZAWEvaEeCJ8sbKStB17IdKQDOIlP7uidDZndiZaziyUfBkLw2O
         RFh9QbUrtYae4xVhWUrgJvMHM9iy/LuEHVglHMUhD1nBUtzJB7VzgTWnvTm5sxJkwqNI
         irQA==
X-Gm-Message-State: AOAM531LRkSRd7bfQl0PFxjjUWWdJ/XrqxkH+Eu+Gof3Z8Z5hiaKSf4t
	5KPIZNBI+lBwS4kTsHtqTJ6HBVAVO3OL9rr7kNg=
X-Google-Smtp-Source: ABdhPJyaC7CE9giiu/RlXTNJcKPnXQPD6Hgl274N4dVhoHYR3rwaY0HAtbTD/b1i+5NbQgo6m3HYdTdZ4hgvCz0C1vw=
X-Received: by 2002:a05:622a:148e:: with SMTP id t14mr2191315qtx.356.1630577724181;
 Thu, 02 Sep 2021 03:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210822161005.22467-1-sergio.paracuellos@gmail.com>
 <20210822161005.22467-4-sergio.paracuellos@gmail.com> <YSip4/kMNOG4uYC3@kroah.com>
 <CAMhs-H_0ytYCoBLj9GJDjHSPPHLC6_oBsm-V9s4FjhE7NY8TCw@mail.gmail.com> <YTCWR7oyLWgTDbQe@kroah.com>
In-Reply-To: <YTCWR7oyLWgTDbQe@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 2 Sep 2021 12:15:12 +0200
Message-ID: <CAMhs-H8U-crQHFVQj6j4Y5qs-S2NaW9trH8twKH8AwDR+AAYgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging: mt7621-pci: set end limit for 'ioport_resource'
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-staging@lists.linux.dev, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 11:15 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 29, 2021 at 05:14:27PM +0200, Sergio Paracuellos wrote:
> > On Fri, Aug 27, 2021 at 11:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Aug 22, 2021 at 06:10:05PM +0200, Sergio Paracuellos wrote:
> > > > We have increase IO_SPACE_LIMIT for ralink platform to get PCI IO resources
> > > > properly handled using PCI core APIs. To align those changes with driver
> > > > code we have to set 'ioport_resource' end limit to IO_SPACE_LIMIT to avoid
> > > > errors.
> > > >
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > >
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > Thanks. Since I am planning to move 'mt7621-pci' from staging to
> > 'drivers/pci/controller' and send v3 after the next merge window, I
> > prefer this patch to go through the staging tree. For the other two I
> > don't have any preference and it is ok for me to go through mips or
> > pci trees. So, Bjorn and Thomas is up to you if you are ok with the
> > changes.
>
> Yes, I would need acks for the other patches in the series if this is to
> come through the staging tree.

Yes, I know it. Let's wait for Thomas and Bjorn preference for those
remaining two.

Best regards,
    Sergio Paracuellos
>
> thanks,
>
> greg k-h
