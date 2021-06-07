Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67382F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:09:44 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id z3so17782304oib.5
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osW09MCk+hN/uw5i6SDvsHcT0H/kM3ZoYCDxlqPn58g=;
        b=NwMT+fUfKMKUInPydmuPJHqEYpFR6fr9vhQv+p2ii6jRjkOUvZxsKVJQPt2rytwsXW
         SkF+XMspIemzz9XtxNhqN6XslYLtBwSavm9Y4exeXFcuwTfFiOXZ/gsgBXqAuCOcRwZV
         cfkFRSozmH2LU69BNtuXGd1mE30b04ZxjYlAX2+1q1+XPfY+aaSgaFxquxF8WNc0gHEN
         DKcVWUldpw+pwmMvte7re33IAx9osGsipdS45oIBSclN/rMq4GqF7AJ/o4Jehnd0hrw9
         MtSvWAZXyJyQEUeZgTM/B4kwyYBu7Eve94+7eOg1YfPSQjWlRSY4LElftybP85h6hvBp
         usrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osW09MCk+hN/uw5i6SDvsHcT0H/kM3ZoYCDxlqPn58g=;
        b=iQYg1irX8IqC0UUSbaR/r0Aq78F15QdokM7RWOAhlJFVy1fW7tGOZEZTijGoKYEXSC
         yC/9hfiI7F4J3qBEqhSreDYFjWe0uqWPl4EsXigLrpBRS0C2+0jzkxxPRVwDxRbN5dun
         EoIB8HVr2t2kF2k4ibwAJeeNuJy10EHseczjYRSMtFlrRjrU1516WuHPfZHogoZJ/xVF
         Xy/dHXoyKJI88xh9ZIBLXrYMNEtUnaYMKwOvKCPQwM5nTudiRLrKtW/bfzdl4pt10smG
         JgKbmn3KaeHe49Pzl2nnOEgzncBa//nApdrcyqph6VZCM9Y/RvWMzEIMS/86Cer5RjFy
         PgTA==
X-Gm-Message-State: AOAM530RHwbO/sgF4rqf6kXp06mvHMZ6s/Rxvk+OF4yJoX371f0QViak
	jGsv0YMbLuXDHh3dBnp/0vuW8FI7Qsn4WOvPkqM=
X-Google-Smtp-Source: ABdhPJxhgydqxuVH01sxbccUUNqnQr3f0zFZ363Ib0TZBWxlykd0HdVaeN4zEH5DfSVANi5tNaNSgMSHAeM9b1PbTc4=
X-Received: by 2002:aca:efc1:: with SMTP id n184mr19188508oih.23.1623067783802;
 Mon, 07 Jun 2021 05:09:43 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com> <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
 <20210607103736.GR1955@kadam> <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
 <CAMhs-H-X8njQxVG=d5929HL1H4sJ3g7-PQ6T-rzzK4e00QQzYg@mail.gmail.com> <20210607120541.GG10983@kadam>
In-Reply-To: <20210607120541.GG10983@kadam>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 7 Jun 2021 14:09:32 +0200
Message-ID: <CAMhs-H8LW5WSYpe02f4sEs3ZJE97_L3bUApvLfb93pfny_1_aA@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 2:05 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jun 07, 2021 at 01:30:58PM +0200, Sergio Paracuellos wrote:
> > Hi Dan,
> >
> > On Mon, Jun 7, 2021 at 1:10 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > Hi Dan,
> > >
> > > On Mon, Jun 7, 2021 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> > > > > Hi Dan,
> > > > >
> > > > > On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > >
> > > > > > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > > > > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > > > > > node to the root port childs. Hence we have to adapt the way device
> > > > > > > tree is parsed in driver code to properly align things and make all
> > > > > > > the stuff work.
> > > > > > >
> > > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > >
> > > > > > It sounds like this commit needs a fixes tag?  What does "to properly
> > > > > > align things and make all the stuff work." in terms of what the user
> > > > > > sees?
> > > > >
> > > > > I submitted this driver to get mainlined and when bindings have been
> > > > > reviewed I've been told to move this stuff into child nodes. Until now
> > > > > all was also being properly working but with these properties defined
> > > > > in the parent node. So I don't think any Fixes tag is needed here. So
> > > > > hopefully changes on this patchset are the last need to get this
> > > > > properly mainlined. I've been told to just make a 'git mv' without
> > > > > zero changes from the staging driver, that's why I am submitting
> > > > > changes to staging before.
> > > >
> > > > I'm really trying to understand how this affects the user experience but
> > > > it sounds like you don't know either but you were told it was the
> > > > correct thing and it seems to work?
> > >
> > > What do you mean with "user experience" here? So to work with the
> > > future mainlined driver we need the dts file to be aligned with device
> > > tree parsing code. If we move these properties into child nodes
> > > (previous patch do this) and the code is properly aligned, for the
> > > user the change is transparent. This SoC is mostly used in openWRT
> > > where new versions compile new code and device tree completely so I
> > > don't expect any compatibility problems also because of these changes,
> > > AFAICT.
> > >
> > > > That's not ideal but I can live
> > > > with it I guess...  I guess hopefully no change but it's just a
> > > > correctness issue?
> > >
> > > Seems that the bindings are more correct, moving the properties into
> > > child nodes.
> > >
> > > >
> > > > Btw, we moved from devm_reset_control_get_exclusive() to
> > > > of_reset_control_get_exclusive().  Does that mean we need to add a call
> > > > to reset_control_put() in the remove() path?
> > >
> > > Yes this has moved because we need to access the child node with
> > > 'device_node' instead of 'device'. It seems there is not another
> > > possibility with devm_* like the ones we have with clk and phy apis.
> > > Ok, so I have to manually call 'reset_control_put'. Will add it, thanks.
> >
> > Should this be enough for error and remove paths, right?
>
> Looks good to me...  I'm not an expert on this at all...  (When I ask
> a question about something it's never rhetorical question so if you had
> told me it wasn't required then I would have accepted that as an answer
> as well).

I see :). But in this case since we are getting that without using
devm_* APIS the put is needed, AFAICT.

Thanks,
    Sergio Paracuellos

>
> regards,
> dan carpenter
>
