Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488B2C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:37:38 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id i22so4804248ual.10
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxcRb8gr4SpF2DMjLqlTwo13cSaFWOSV5XE3MwUicyI=;
        b=db4+DAy8Uz7gP/I9Xn54OKCWF4cGDeOuEItpxMaiZMt92BWA4hNu+Pm+BkxtMw63XM
         BOn+LfTKBBsZmONx/xKz70HFiBJ6QYGovM5VIVl7wVe2pMai3kdgkvfeTTNYGZubpoNN
         bokjkstmVhVZopyftu1XG5a+t6dJMlAtyCwACg0kC2nSeFHMZ/axSxUX6q4tNdvtezml
         j8CsWF/Rxh3rcfGFOcPUYcuX3a8nlrLSUB5ELqGp0oDdu+ylGLizQfAJ5x5i3WBCUNxP
         D37qVYvRM6CqujB6Bwqz08d8Fz82NnziellRPvjABo2lyl5AoOpRYkS4L5kbxeYB40or
         GAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxcRb8gr4SpF2DMjLqlTwo13cSaFWOSV5XE3MwUicyI=;
        b=HL/N94UVIjjIvGyaCfsKvkXc8dbiuP6wYu9GxMbC8Ep1yG14tVbH8TU/ZKny1bmsgI
         mKaxUPSNKFP+7MH3bE8D73KpH4mzIk1U6c/Bk/nk7aH/0JnLxhFy95lMzLokTRz46NcI
         iynypMoeWSZL6t0kpLTt+/qPygWDDIH9JYWTiQG29uBNcxzvt4EgQK2uaoZz9aAAoB8g
         K9xqQA91yvsjxYsHXpwT0u6U4gPJhum4ADwqvMnmJ08EMWokUEYUullUmQVyDbFh9vKC
         FNcylYjSibCbF1bN24GC5lbtBzqk07gi7Zv/8mt+WUv8xrwrcVXS9T4F4l5q4i8xDjnZ
         6OCg==
X-Gm-Message-State: AOAM531YtiDbDM2q98t2PyLwlZ/G+so9pWB4HZ++OJlpQ8fXvj65uRk2
	nMDSk/4fYSYlmZV6dEiOGYOmGFdQWqeOh8kEwuw=
X-Google-Smtp-Source: ABdhPJyzpBClbTmqbZmfhA3mn+1Qp0LXAicY2s06fKSIvW+sGYrz/Otz/V5gQcYWrmT8RraKPR+d/TOvABOTcx4E+xA=
X-Received: by 2002:a05:6102:3ec3:: with SMTP id n3mr27949127vsv.48.1634571457725;
 Mon, 18 Oct 2021 08:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
 <CAMhs-H_BKw8e6hObS3Tx-iO44xbyZh2Q+=jVtxykJ=6hx1Rheg@mail.gmail.com> <YW2T06FWg2pGreOL@kroah.com>
In-Reply-To: <YW2T06FWg2pGreOL@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Oct 2021 17:37:26 +0200
Message-ID: <CAMhs-H8C25So=1=xn3Yk_WgHGm5dUL5=3B3PYOURx1CQYRZ8Hg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: mt7621-dts: get rid of nodes with no in-tree driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 5:33 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 18, 2021 at 05:29:16PM +0200, Sergio Paracuellos wrote:
> > Hi Greg,
> >
> > On Sun, Oct 17, 2021 at 9:06 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
> > > The normal approach for a dts file to be mainlined is start with those stuff
> > > which is already mainlined and get rid of the other stuff. If needed it will
> > > be properly added afterwards together with the suitable device driver. Hence,
> > > remove both nodes from the device tree include file.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
> > >  1 file changed, 36 deletions(-)
> >
> > I noticed PATCH 2/2 of this series was added but not this one which is
> > the first one in the series. Since I did not see any mail or something
> > complaining about it... is it possible you missed it?
>
> It did not apply to my tree as it seems to already be there.  Try
> rebasing and resending if it really is not.

It was not there. Odd. I have just rebased and resend the patch alone.

Thanks,
    Sergio Paracuellos
>
> thanks,
>
> greg k-h
