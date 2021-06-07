Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0C70
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 07:11:25 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id t140so11857129oih.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+NastY+Pz10EdPGFzVizvekdrbEdVuCZEWQNd3dSGc=;
        b=NayZbL975oqS/yu2/h7tbWBXBvH1j6sbZZLPUPSwI/2Mxmxeo645wx1OvJdIPw6QCi
         d1OKTtEOHqOyINjzrV7pZw1j/Rb5xJj4gm744AUxS+ewHPJxXo5gC2W7A6q+uuSy7e6Z
         4/wRSxXHcJO/PdgQksAMM1MkyERXp0vu0bCHtaCj1LAQUq1MaLjettpaawGa0c8Ut/zw
         M19ebh6W+4jku1IY2D9aFvu4TFrLksBCy0PSjCX89y6xKC8DGE/5p/QQA4l21l6Ar3pb
         ZzKvmnChsQEF18JQCnlYN60bLh9jN3UTNy9nDRoXWyrpRdZK+CLwPSFuJfi9+jvasiZp
         X4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+NastY+Pz10EdPGFzVizvekdrbEdVuCZEWQNd3dSGc=;
        b=eQg4Ff6yYro/GdVtyg7yM7mV3m0y7cfORvqoD2UMJEvOmPDN3rruDfU+JWRo1I6ARH
         ReQY4ysMXUC4U6epzD4ABnTl3P4A+h5Odseoq2KMCc4r6YpsdWKiFk2eKSd7vcwhQjpr
         GILa9oXPDg8BF68U1se7NvfPGZ7HjewYuvJyZVcPb1NSNi4WOP+lhY7i1gKEquqO1IHW
         iSXR51oF8SaNGyuAkT3f/wEDAi5zGKve/QSD2H52TDw/dl1SMTrxyyOTgpGy/PBZ+Bf3
         tycooB4z9vnX495ykFnSc7v12S3StW/EKlNzcYKsP02oLPkkoQdvmxNAVjhdxa1RX/RL
         /zeg==
X-Gm-Message-State: AOAM532tQblMZk4f0y369mJzF8/kE0MbjChc6SUppG5ebUuW/pHa1W6R
	wsXAXct2zVhZ0B0VhVfhyxN1cT5O+9WVmDmjUbc=
X-Google-Smtp-Source: ABdhPJwwUfX0S0cI6Q5aNoudGXTRkUCNLRR3lpBrMDBehrlvrn6OZGUn/ZeeycD4mAg2dX9PrvldyHUPAMIVb7/wVFE=
X-Received: by 2002:aca:efc1:: with SMTP id n184mr18561881oih.23.1623049884722;
 Mon, 07 Jun 2021 00:11:24 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com> <20210607065934.GM1955@kadam>
In-Reply-To: <20210607065934.GM1955@kadam>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 7 Jun 2021 09:11:13 +0200
Message-ID: <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > node to the root port childs. Hence we have to adapt the way device
> > tree is parsed in driver code to properly align things and make all
> > the stuff work.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> It sounds like this commit needs a fixes tag?  What does "to properly
> align things and make all the stuff work." in terms of what the user
> sees?

I submitted this driver to get mainlined and when bindings have been
reviewed I've been told to move this stuff into child nodes. Until now
all was also being properly working but with these properties defined
in the parent node. So I don't think any Fixes tag is needed here. So
hopefully changes on this patchset are the last need to get this
properly mainlined. I've been told to just make a 'git mv' without
zero changes from the staging driver, that's why I am submitting
changes to staging before.

>
> regards,
> dan carpenter

Best regards,
    Sergio Paracuellos

>
