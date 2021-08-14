Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E442FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 16:54:52 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso14880791pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JY7pPLjj/B269stty41QL9NGb4G8n6jLdrZkp/18n68=;
        b=HKoDnzK0/PrmlfEIpY60lBk7/fCES5ZNmTZiiQD/fUX/D9mqkjvjksQDpy0KkWV4gg
         bqUZ7fsovYzQy9y65XdOOiG4w4r5L6sYeIwpd85VG8kGxCD2k0ZrZXWEJ4pmieo/CBIf
         w3Tn/Kku7fmE92HIiTQ1HkLVlwmDZv0QAvglMXZCvYYJJ9S/T3Ffi25aRc7amG4ZKl6p
         UnRSAolSO3XtG6fWXGRxmDoo3J3m0um/2JbZHC8deegQUvAtl+s2HaJr+4JFu8zJQA7S
         F++mX4sy3eZumvK32/gFoaUrRy9HA3suLsckvak8kYVvDwj49GNZgr66ixFxp5hMutXX
         Q3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JY7pPLjj/B269stty41QL9NGb4G8n6jLdrZkp/18n68=;
        b=O60oFl5u2HlPvLsvhDohq7y25jhYVib8KCuyUg1J/8SdFlWYxkxgwI1BUaucF4pwZe
         nypym4iT0bp7pw9hywY+LB/hK2FgCEkbCh6ncvOk2OCxmTqqc44bFjd6DcuTtEp6c/yY
         cJYwqwPYIWo52HJncC6ggUBMTZABliNKj9fAtiU30tJcFbcbsvXvn9AhN6E9HtsnTAjN
         fSJXOANL450z5F9PG/O61Qk2zrIOm40M4ZxbjeWcPJ50ssv9XsOSd6AhCkeV6hXRMg/I
         BLd+jmI04K3mhva7e98uNYSeOyXUETMIz00Nr3d7KmdMAfJINxDNrWg349R7athSxigC
         Tlfg==
X-Gm-Message-State: AOAM5328uYyC4Bc2f878ZUKEqf7cCz/2H8K6OyfXahRXBkfwbWJWRcq/
	DxOih073leVPLs0LhcZwtIFzZGID/tOOfHNNkGsSxA==
X-Google-Smtp-Source: ABdhPJyzauVMKmxIEgzrH7QoiUYrH5ZkZG4IbF0CAJAigPhwmxnF9WDkC7hooa6ju2/StjBttBQaQGBEQUn44Dv3AUI=
X-Received: by 2002:a62:88c8:0:b029:3a3:94e9:8ab0 with SMTP id
 l191-20020a6288c80000b02903a394e98ab0mr7914007pfd.2.1628960091691; Sat, 14
 Aug 2021 09:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210811201450.31366-1-martin@kaiser.cx> <20210812061759.GW22532@kadam>
 <20210813100536.xkjzfq5pstbhdwru@viti.kaiser.cx> <2555683.U4YhqVPOqN@localhost.localdomain>
In-Reply-To: <2555683.U4YhqVPOqN@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 17:54:40 +0100
Message-ID: <CAA=Fs0kyzRjR1b_QfseyKE4mAp4W-Bxa97esf5QDoUFiOhA-zQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] staging: r8188eu: (trivial) remove a duplicate debug print
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Martin Kaiser <martin@kaiser.cx>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 13:42, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On Friday, August 13, 2021 12:05:36 PM CEST Martin Kaiser wrote:
> > Hi Dan and Phil,
> >
> > Thus wrote Dan Carpenter (dan.carpenter@oracle.com):
> > > Please think of the subject and the commit message as two different
> > > things.  Often it's people reviewing on email will only read one or the
> >
> > > other.  In other words just restate the subject:
> > OK, I'll keep that in mind for further patches.
> >
> > > > Dear Martin,
> > > >
> > > > Just my personal opinion, but I'd be inclined to strip out all DBG_88E
> > > > calls totally. If there are necessary functions being called such as
> > > > device_may_wakeup() we can always just keep this part and remove the
> > > > macro call (not checked this function out myself yet). Thanks.
> >
> > I'd agree with you, Phil. Most DBG_88E prints don't say anything useful.
> >
> > This comment from Greg made me drop the DBG_88E removal for now
> >
> > https://lore.kernel.org/linux-staging/20210803201511.29000-1-martin@kaiser.cx/T/#m05d82a
> > 0ca8ed36180ebdc987114b4d892445c52d
> >
> Hi Martin,
>
> I think you misunderstood what Greg was trying to convey with the above-
> mentioned message.
>
> Well, he doesn't like to feed developers with little spoons :-)
>
> I'm pretty sure that, by "Why not use the proper debugging calls instead of
> just deleting them?", he meant you should research, understand, and use the
> proper APIs for printing debug messages.
>
> Please check out pr_debug(), dev_dbg(), netdev_dbg(). Use them appropriately,
> according to the subsystem you're working in and to the different types of
> arguments they take.
>
> Thanks,
>
> Fabio
> >
> > A compromise would be to remove only those DBG_88E prints which are
> > really not helpful.
> >
> > Best regards,
> > Martin
>
>
>
>

The problem I see is that this driver is so littered with unnecessary
macro calls, how do we decide which ones to keep? In my mind, the
better option is to remove them all and then come up with some new
ones in the vein of netdev_dbg() and friends. I could be wrong of
course :-) I tried going down the route of keeping/converting some to
proper calls such as netdev_dbg() and the issue is a lot of the calls
don't have an obvious value anyway.

Regards,
Phil
