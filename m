Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9FF3FC1
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 15:34:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so895pje.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8B7cD0D9ZFwyRPa4aYEuuZAbEVPjLVcuT/MQvCFZ4E=;
        b=T4SZZPrPT2o7P4c6l1hWht9BmeX9neTWX/U9dCtFAbIDE0jFkgSuUtfVVsgSgMVeg6
         vwdxfvvT4RhLD0BOfJ2GKCfyccZkXF4pgONNsjLUk994SrSUOJeuoxdndAA5E9ybRSUH
         wZZcsiiiO0FWr5PSZXbaiS9IyCiAH4t4yfJCtF1sLnMfRsoyC06pucJ9wy4SQ+0OXMPN
         bGtw5iEm1ZCG3Kf+w/sFsSVnlP4uKITchdNOv2oTAdsjIvUcqrE8xuRKOATKgC4rYn65
         t0hlXbk694aBoUWouJY04jcvk2IFb/pLZH2OT7MFNY6SjVrayJ8VfjEXPga9uwE066i2
         A61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8B7cD0D9ZFwyRPa4aYEuuZAbEVPjLVcuT/MQvCFZ4E=;
        b=rMs12COe8raP0BbR+4a5dDvLFFar5svMOE/brIUBJ1qnAK5WTw5bfJxov72yYrNI0q
         rOmE2jX6kyQyGgZAuzEcprPNuUjdwm/wt44DGD+JMauSSzNVQXfUuDTEYSJw/wiU8fvj
         Pv7FUKRkA8R97duhC6cwDwcm1JL55LJ1aVknW2RroIY+YvO3mfnfL8GVX+e0DMiaOQm8
         5e5DG9oKpfYsUHQliBboQRPAJ5vEdenypUgbU4t6LN7BHEVcGMbAN+A3fdhJnjUFqP8x
         QJhy+mzZaCzKwCsyq4T+AfNTwlEcXSYym6ppGuYp/TXakdDTz3pbEB1IN1x/PXcdVTUk
         7sPQ==
X-Gm-Message-State: AOAM532nCmNJTpMz2nUAVdEz7WztuFlM9jaHmTtT7zEhP5t9wK2d4gcA
	d1YEjsGyGbrpMEw8e5dbfNnBRq3lcizokn1aTrsGaApIlGgRCg==
X-Google-Smtp-Source: ABdhPJw041CRUdRva8kjcC5J0upx/B6SBQaO+F/VUwnh+Onnt9D4eC4ldqppLqBgvXeAalzPVlvZc11RXwrJnP5sjG0=
X-Received: by 2002:a17:90a:8801:: with SMTP id s1mr12491424pjn.166.1630510487915;
 Wed, 01 Sep 2021 08:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+wyH3Pj6DV_m8wqCV5yujhjRwTwVNs6dK4i9JO-Y3ys6w@mail.gmail.com>
 <20210831133533.6aayzjghdakrhy56@h510> <13366651.n50aozgL3V@localhost.localdomain>
 <20210831230014.cp46vho2hnndacjp@h510> <CAPGkw+zpYsovnXL_4GfjsQ60fqre+xyiwvwKuDj_fHPTKEfzeQ@mail.gmail.com>
 <YS+cexhuqldPaACs@kroah.com>
In-Reply-To: <YS+cexhuqldPaACs@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Wed, 1 Sep 2021 17:34:36 +0200
Message-ID: <CAPGkw+z+uepM0hiNh48xjjD7=2rpgr+RSLzMcHbw2iE=8y+xqQ@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bryan Brattlof <hello@bryanbrattlof.com>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 5:30 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 01, 2021 at 05:20:13PM +0200, Krish Jain wrote:
> > On Wed, Sep 1, 2021 at 1:00 AM Bryan Brattlof <hello@bryanbrattlof.com> wrote:
> > >
> > > On this day, August 31, 2021, thus sayeth Fabio M. De Francesco:
> > > >
> > > > I just want to *really* thank you for the hard work you got involved and that
> > > > you carried out with one of the highest levels of professionalism (and
> > > > patience :)) very few of us could ever equal (not I, for sure).
> > > >
> > > > I thank you also not for the technical hints you gave to Krish, instead for
> > > > your your choice "to not rob [you] Krish the opportunity to learn".
> > > >
> > > > Actually I was tempted to write something like "first do this, than that, and
> > > > finally run this tool". But I was able to desist, by learning from you how
> > > > people should be helped for real.
> > > >
> > > > Most of us here should learn by your attitude.
> > > >
> > > > Thanks again, seriously.
> > > >
> > >
> > > Thank you for such kind words, Fabio.
> > >
> > > I was very lucky to be, and still am, surrounded by people who
> > > demonstrated this idea to me when I was young. I am very happy to see
> > > others here see how beneficial and helpful (in the long term) learning
> > > this way can be.
> > >
> > > I'm grateful to have found and be a part of this community.
> > > ~Bryan
> > >
> >
> >
> >
> > Interesting.
> >
> > "make drivers/staging/android/ " works now (finally!) and shows me the
> > errors when I mess up in the file  ashmem.c for example.
> > Furthermore, " make CCFLAGS=-Werror W=1 drivers/staging/android/    "
> > outputs the same errors too just more verbose. So it works completely
> > now, However, "make CCFLAGS=-Werror W=1 M=drivers/staging/android/
> > " just takes to new prompt line and does not output anything. Do you
> > know why?
>
> "M=pathname" is different than "pathname", you are asking for different
> things to happen here, so depending on your kernel configuration,
> different things will be built (or not built).
>
> And don't mes with CCFLAGS settings for building the kernel unless you
> _really_ know what you are doing.  For staging tree work, it's not
> advised at all.
>
> good luck!
>
> greg k-h


Oh ok, thanks Greg. I only attempted to use "make CCFLAGS=-Werror W=1
M=drivers/staging/android/" as that's the command Bryan used earlier
and it worked.

"As for your patch, I built the driver using:

  $ make CCFLAGS=-Werror W=1 M=drivers/staging/android"


Can you tell me why this is the case? And whether I can just start
working on an android driver patch and testing whether the android
driver builds successfully using "make drivers/staging/android/ "
instead of that command, would it be the same effectively?

Best Regards,

Thanks so much for helping a high schooler learn his way around the kernel
