Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96B3FCD
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 11:20:05 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id s15so1135453qta.10
        for <linux-staging@lists.linux.dev>; Thu, 02 Sep 2021 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2rUgbLwypXDUhfyDjxmoAHRqVm5nElTvA2YszrcfF0=;
        b=LZMbmqj2iCMHR8sDXy4iF4uZoQ4yJAumBT2erprCyab2RxBW7mCg9e7szRElWe7n7L
         aoOI8CVoSmkrb5WLru+tDNZClYHMmJE8h+hJvGCsBmyvtr5wQGmtJrOQrvZzMMOAYvm3
         M5jjdxqeykOzGETyRAKWklP789UYGWPCjMiXuTpP0SV7DoteNKB5JgKfhtRMgiZ5W+cu
         l0LOlAaU7+ExzKooyX6tSa4IO7nbyNOLEGbOjk7Pcp0TxCG5Dc/W6jc/4cK4oYECSP70
         J5J8s4YIjbMBLw9Hh8vhKiPEFNmC8xt2Lo6C0rO4H9jf9ESU1u9o6G8V5RtpPSSGQ3hv
         U1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2rUgbLwypXDUhfyDjxmoAHRqVm5nElTvA2YszrcfF0=;
        b=qlGEE1fafBIsV644gaTt+xxK+AP4sCcmlSnhwDhoKZ3t0GTY4rNv/4tO1yU+JE3drt
         kmF7kIvT6WCChVtubuj2tWxoNljdTfE+q/JHGEGUMR2NXO9j5oQxjHBXRoXiwZRg1EXu
         FUhxgwsQkE8hB1JyRThNjHF9ER7tMd6FD0MkXmA0UPHcz+Nhf3Kii8T0wrzZM2XDhySz
         HXibFZRXC32jH84ce+2Fs7TGTg0SeqGAZ0B1btDgLTxTxZhiBts+sTNVtD9zJTDwaidk
         +0NSEgKeRpYKvlrZqahUPUh85ScnT8l7iIbSrTaBE/y4mZeZvGb1RhBUaLBDh3pkanGQ
         RxyQ==
X-Gm-Message-State: AOAM533cBVVfdIQPr8jpfOBz2PRsE+6WgVzzaANhHr3LeZ7/RO1aH2Nu
	vMqvOlQYNI/9XIrfHSrWirjgVLscurtwJkhUbVc=
X-Google-Smtp-Source: ABdhPJwhNfinimEqrbvBqNoV5kt+KL2rxIpD4Ih1lDUaNUCd18uZPgAzdidqRhaeuxWc/coWCY9MupEdAdYuqYaZYiU=
X-Received: by 2002:ac8:5ec8:: with SMTP id s8mr2447882qtx.26.1630581604692;
 Thu, 02 Sep 2021 04:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210822161005.22467-1-sergio.paracuellos@gmail.com>
 <20210822161005.22467-4-sergio.paracuellos@gmail.com> <YSip4/kMNOG4uYC3@kroah.com>
 <CAMhs-H_0ytYCoBLj9GJDjHSPPHLC6_oBsm-V9s4FjhE7NY8TCw@mail.gmail.com>
 <YTCWR7oyLWgTDbQe@kroah.com> <CAMhs-H8U-crQHFVQj6j4Y5qs-S2NaW9trH8twKH8AwDR+AAYgg@mail.gmail.com>
 <20210902110835.GB7614@alpha.franken.de>
In-Reply-To: <20210902110835.GB7614@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 2 Sep 2021 13:19:53 +0200
Message-ID: <CAMhs-H_1U=X25+q=wDnQ+FGbxXMx1vFpefEMJviFxOc7T0jwjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging: mt7621-pci: set end limit for 'ioport_resource'
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-staging@lists.linux.dev, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 2, 2021 at 1:08 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Sep 02, 2021 at 12:15:12PM +0200, Sergio Paracuellos wrote:
> > On Thu, Sep 2, 2021 at 11:15 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Aug 29, 2021 at 05:14:27PM +0200, Sergio Paracuellos wrote:
> > > > On Fri, Aug 27, 2021 at 11:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sun, Aug 22, 2021 at 06:10:05PM +0200, Sergio Paracuellos wrote:
> > > > > > We have increase IO_SPACE_LIMIT for ralink platform to get PCI IO resources
> > > > > > properly handled using PCI core APIs. To align those changes with driver
> > > > > > code we have to set 'ioport_resource' end limit to IO_SPACE_LIMIT to avoid
> > > > > > errors.
> > > > > >
> > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > >
> > > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >
> > > > Thanks. Since I am planning to move 'mt7621-pci' from staging to
> > > > 'drivers/pci/controller' and send v3 after the next merge window, I
> > > > prefer this patch to go through the staging tree. For the other two I
> > > > don't have any preference and it is ok for me to go through mips or
> > > > pci trees. So, Bjorn and Thomas is up to you if you are ok with the
> > > > changes.
> > >
> > > Yes, I would need acks for the other patches in the series if this is to
> > > come through the staging tree.
> >
> > Yes, I know it. Let's wait for Thomas and Bjorn preference for those
> > remaining two.
>
> I've sent my acked-by for the MIPS patch.

Thanks!

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
