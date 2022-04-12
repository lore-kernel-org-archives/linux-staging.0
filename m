Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9651FA6
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 11:30:55 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id x20so6597153qvl.10
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmIj8CIsQl1XMgKvHW9DEhngM3kgzslh2VipMPLIr4Y=;
        b=UCZUXuUONNwn36sGMFQJJISoneJjqJMOj8d49lKzQtTkD/ArlbicVTa4YCX0Y44JiH
         x792rD7rkJyLPBhYk8T1aI+UtnBjbFVE9mPKHZh/RQgZiItPKidpYFyE+tSCW7CPOVHP
         GV0dofYw1KO+xj3DwFTRe61j8J0csJSk+O9KZ2qhd9Dhgex6wn3iauHWmuUvvw2ka4Cj
         4PH41XethCMfUdGjnwWiOewOO0Cfi2ZlY96LOvyYndhM9ppfSPmodbdbY0tOeClJVp4A
         Wf/LClDPVr8JhBup09A9kGSAJ5KuGvv+N188dks2doA+Ji3DLo6HSe5OvSb1pKboa3iL
         uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmIj8CIsQl1XMgKvHW9DEhngM3kgzslh2VipMPLIr4Y=;
        b=2wzzBI3OdT+uA19VUBzZVdEZvztfXZHRmDc3e89lZBb0e2Ok++ojCGKTLvIPElkoN4
         n5c5KDpRbXbqNH+kc/OhHT6Aiw3mUlLfdOeb39MA4/n8SjyU13Kzb9dPdVWCDmpUboWu
         rOko5q+RvE56McbJgzBjYnUaxPPk+UNWwXIhVm6wK7spwTy3ogB7zk+IpBBKK+loFl2d
         KozinAkTJPHNktTkyvCnCw+6viIaCbj7Av4SOCUp7/u4pxfIf7ysm/qCkeykdotYzhg/
         fZnSSWChT0/zagV7bwHl5QF1Nbtu1YHKiR+HhDk58KcfNly7UPTYMCAplcb70aVNd1ZK
         xsvQ==
X-Gm-Message-State: AOAM532hQqzFs+JNtedGgHfgkZApl3THbH5/EHPhaNTFqEUeX5ZqCiBu
	uFohm5xb+gLXmz6nBiebEPcsPZ8ds12L6zsq/Ok=
X-Google-Smtp-Source: ABdhPJxRQarE0ErahkpO4Cbrv/62NgURgoOHCn61vzPjZbfX6LdeNkwvMrRit0ear6/l0ZhBQhjA0H7seBl61Dib/No=
X-Received: by 2002:ad4:5642:0:b0:444:47e1:b244 with SMTP id
 bl2-20020ad45642000000b0044447e1b244mr7255566qvb.4.1649763054331; Tue, 12 Apr
 2022 04:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220412103629.8029-1-fmdefrancesco@gmail.com>
 <YlVXV4J41KBzKHtm@kroah.com> <2976258.CbtlEUcBR6@leap>
In-Reply-To: <2976258.CbtlEUcBR6@leap>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 12 Apr 2022 13:30:43 +0200
Message-ID: <CAMhs-H_JJ7JVccYjdoj5opTt6R5CHRBwQ05tXPuFgenpCuyy4w@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Remove D. Kershner from Unisys S-PAR maintainers
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liu Junqi <liujunqi@pku.edu.cn>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Colin Ian King <colin.king@intel.com>, sparmaintainer@unisys.com, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Tue, Apr 12, 2022 at 1:08 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On marted? 12 aprile 2022 12:41:27 CEST Greg Kroah-Hartman wrote:
> > On Tue, Apr 12, 2022 at 12:36:29PM +0200, Fabio M. De Francesco wrote:
> > > The email address of David Kershner is no more reachable. Remove his
> > > entry from the MAINTAINERS file for UNISYS S-PAR DRIVERS and change
> > > the status to "Orphan".
> > >
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > >
> > > v1->v2: Change also the status of the entry to "Orphan" and rework the
> > > commit message. (Thanks to Greg Kroah-Hartman).
> > >
> > >  MAINTAINERS | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 3ed62dcd144e..9283c63565b3 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20184,9 +20184,8 @@ F:  include/linux/cdrom.h
> > >  F: include/uapi/linux/cdrom.h
> > >
> > >  UNISYS S-PAR DRIVERS
> > > -M: David Kershner <david.kershner@unisys.com>
> > >  L: sparmaintainer@unisys.com (Unisys internal)
> >
> > Again, please drop this "list" as it obviously is not going to anyone.
>
> OK, I'll also drop the "L:" line. I wasn't sure about it because I see
> that there are other entries marked as "Orphan" and the list is still
> there. But you are right: although the "sparmaintainer" list address is
> not bouncing, it looks like nobody care to read messages there.
>
> > And really, this whole code should be removed, no one seems to be using
> > it, and if they are, we can easily revert the removal and mark them as
> > the maintainer.
>
> 1) If I remove the entire drivers/staging/unisys/ I suppose that, in
> MAINTAINERS I should also remove the whole entry called "UNISYS S-PAR
> DRIVERS", not only the "L:" line.
>
> 2) Furthermore, I understand that I should also should change the relevant
> Kbuild files, otherwise all builds of staging would fail.

Correct.

>
> I'm sorry for asking but, as you probably recall, I have no prior experience
> with removing drivers from trees and with the Kbuild's infrastructure. I'll
> take some time to read how it works.

Check this patchset [0] I sent a bit time ago removing two drivers from staging,

Hope this helps.

Regards,
    Sergio Paracuellos

[0]: https://lore.kernel.org/all/20211113192045.32153-4-sergio.paracuellos@gmail.com/T/
>
> Are the two arguments above correct?
>
> Thanks,
>
> Fabio M. De Francesco
>
>
>
>
