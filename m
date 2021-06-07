Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E092F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 11:11:08 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id t140so12375802oih.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rEorkXcPbsZLwawiqocQHrToA1zK5IlIifpXmY4IUYQ=;
        b=N+P7aQW6ZUsSJYcfbH7lCjUr016s2JzsUYZyK+jWK2paTc8/Dv2ciiIFjarE4z5k3z
         ksLJpbDDYrRSFZnxXixAz6x1EZtTPjGK6dAEt+3FFxXwQHIms2/YesYU47joegilGHyV
         YVJnwRm6nO1llfB49G0EN0Y0GqsfhiWt897bDrsTYIoenaYvONvlT/sbbuIIHWqzaHQe
         zBxXRvso9EUcd8QRvWaUfOyyxYnLpP/9SZpQ7o80okqbIQr97C2mptjdNWTOibXU4cwE
         8VUM9XKNQTO9PiQOPGKEZXVnrl5LQe+W9/224ef4yOd/m2Y9Ta44JxI75Mxv3DmsXZJL
         ewWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEorkXcPbsZLwawiqocQHrToA1zK5IlIifpXmY4IUYQ=;
        b=fRlQYAALRCwvylhJ+3R3CUftZUvJKP7H3pdhKl77r9/dCBIPLpswd9cuw0c42CuZjH
         9Qkb4i/M4EXNiqntICAWAFb1KZSPhaWiFjPwt8unRPhTAiU30TK7nz8/TZJzvzoERjaC
         mW4plQhj0RqZKIGZ6CBMoOW4hKibvsHAsBWHPCW9pxLWCXlJqr62xWNYITCvQ+p4HNf1
         Xm8j4lCGRkeODMw4+WEZCgSEO+dmc82G8CNI2444H140kU9W8aK7SAPsSVnHTf6HSpw+
         qa+NKJjXBZ7qiNT85QfzPYkVG7E6wTgtMslhJAgbvvomjTVB3VpnZ1CjUvGZjS48oYtK
         cpCg==
X-Gm-Message-State: AOAM533RB9sBDelWHZHjZEP6Ux/FJfSqtGv/dDhNfm2VHXRqvp6YaSWX
	P6MhZUNziIcUHdBEphPz29dwesUT8EXKzF8i/pw=
X-Google-Smtp-Source: ABdhPJwoLESiOP0RmdUoTQJr7fMJCYwM++6NNSNdPjWp5QmDPtMWX50xq+xF/Dxq41JJntoesPFQf+6R+Z0XMRZKMZM=
X-Received: by 2002:aca:efc1:: with SMTP id n184mr19038060oih.23.1623064268122;
 Mon, 07 Jun 2021 04:11:08 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com> <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com> <20210607103736.GR1955@kadam>
In-Reply-To: <20210607103736.GR1955@kadam>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 7 Jun 2021 13:10:57 +0200
Message-ID: <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, Jun 7, 2021 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> > Hi Dan,
> >
> > On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > > node to the root port childs. Hence we have to adapt the way device
> > > > tree is parsed in driver code to properly align things and make all
> > > > the stuff work.
> > > >
> > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > >
> > > It sounds like this commit needs a fixes tag?  What does "to properly
> > > align things and make all the stuff work." in terms of what the user
> > > sees?
> >
> > I submitted this driver to get mainlined and when bindings have been
> > reviewed I've been told to move this stuff into child nodes. Until now
> > all was also being properly working but with these properties defined
> > in the parent node. So I don't think any Fixes tag is needed here. So
> > hopefully changes on this patchset are the last need to get this
> > properly mainlined. I've been told to just make a 'git mv' without
> > zero changes from the staging driver, that's why I am submitting
> > changes to staging before.
>
> I'm really trying to understand how this affects the user experience but
> it sounds like you don't know either but you were told it was the
> correct thing and it seems to work?

What do you mean with "user experience" here? So to work with the
future mainlined driver we need the dts file to be aligned with device
tree parsing code. If we move these properties into child nodes
(previous patch do this) and the code is properly aligned, for the
user the change is transparent. This SoC is mostly used in openWRT
where new versions compile new code and device tree completely so I
don't expect any compatibility problems also because of these changes,
AFAICT.

> That's not ideal but I can live
> with it I guess...  I guess hopefully no change but it's just a
> correctness issue?

Seems that the bindings are more correct, moving the properties into
child nodes.

>
> Btw, we moved from devm_reset_control_get_exclusive() to
> of_reset_control_get_exclusive().  Does that mean we need to add a call
> to reset_control_put() in the remove() path?

Yes this has moved because we need to access the child node with
'device_node' instead of 'device'. It seems there is not another
possibility with devm_* like the ones we have with clk and phy apis.
Ok, so I have to manually call 'reset_control_put'. Will add it, thanks.

Best regards,
   Sergio Paracuellos

> regards,
> dan carpenter
>
