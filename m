Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365370
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:35:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id b1-20020a17090a8001b029017700de3903so3180998pjn.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2b78OZpenAvJt0eoxLKAfP0tLPyfmgTwRZGkxtYzeLA=;
        b=LZ+zO0kxagawAzsrEpYF27u6LNlH0NSGid8lIeGZMiDIxk0GPq6aiXljcJE8WldFi/
         CMZv8+sdzs7oM32aIBBEbEAjj/wH8xVl3ejxYxlYIblu4oSJ/exJQ05XxPKZgvgXZ4z2
         3DU/Gk8oN54g7vUHVG2FIvgmGAMP368HxnANuTDCPfKiPL4tm8OpnTVldxvmI3MUb3Ha
         O/AR8gW+g5tj6XCf45EnuNHR2sZaey6rzEEupGwrUYx6o3ggNGV14PX7qvnTAupEFCUb
         ZAryuLwEbImaopATkpG7mOmusxxdlrztod+KvaOX6IOqg1x0qmDhsxAXcAGxIK/0N6hm
         GUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2b78OZpenAvJt0eoxLKAfP0tLPyfmgTwRZGkxtYzeLA=;
        b=FJKQz4BJgmi5rNCmx8ZdjPM5tQg4eEiMKw2UHNA2EXqVBTHHWPEZy3EwyLFFuRBAzd
         Hbbb8VaCCZpWHunOQbb171qlbgWu3XKCSdoEqDERBQSLO3dEgI8OCUMuY8w3Rye2axpF
         Pfz9G3aiTxNo46RnAJHHwHGQjU3hhzs4kiWMJ7ypIWku3EPexqK4UiP0pLo/pDrrRJuI
         LU/GO8bJG8ZAF9JgEDYzsCrnwbsyAI/GqpzYYUySCYwsoyowFl5u38Yj6oR8XnZTwSzy
         oDCX1IfAMwGs/o4gSzaCdh7ggkFFEJZ4X7z/Ftf9OeG2EhsTNaS9FbeX/z+f24646att
         ZZYw==
X-Gm-Message-State: AOAM533RNaf5TqL4h/40Sb8CsZkjVGOc3cKCWXRpkX1Xz5Fhn1pY8BdM
	Rlt4ZkACO67TMfjnhk2HxAkTJ1Nq/EW5D3aTSvVnDA==
X-Google-Smtp-Source: ABdhPJxydjg3Rt+AvDZaBOTkDUYTPxKqsMkCNd6VfIy9jHlzOfB3C2njSPhmgif6+xFNhy3lnVa/SwhIdJBYrQYZ5fo=
X-Received: by 2002:a63:b1b:: with SMTP id 27mr23745829pgl.318.1627396506135;
 Tue, 27 Jul 2021 07:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210724001055.1613840-1-phil@philpotter.co.uk>
 <YQAE1q9ZWRPHqfK5@kroah.com> <CAA=Fs0nwOBUoCSbwzaE7TTQab_BZcCy2SL1RJby+Hmo=URw_Pg@mail.gmail.com>
 <YQAOdEz9GfhpCeBZ@kroah.com> <c42ded8d-8027-eee3-c1c5-54e0736a1758@lwfinger.net>
 <YQAYER8JxrXG0f+G@kroah.com>
In-Reply-To: <YQAYER8JxrXG0f+G@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 27 Jul 2021 15:34:55 +0100
Message-ID: <CAA=Fs0nBBe34Wqqj2pKHc0BGWTNgCsA28rMeFKSXBw_Sr80-bQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] staging: rtl8188eu: replace driver with better version
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jul 2021 at 15:28, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 27, 2021 at 09:13:09AM -0500, Larry Finger wrote:
> > On 7/27/21 8:47 AM, Greg KH wrote:
> > > On Tue, Jul 27, 2021 at 02:25:34PM +0100, Phillip Potter wrote:
> > > > On Tue, 27 Jul 2021 at 14:06, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sat, Jul 24, 2021 at 01:10:48AM +0100, Phillip Potter wrote:
> > > > > > I had to break this patchset up a bit to get around the file size limits
> > > > > > on the mailing list, and also I removed the hostapd stuff which is
> > > > > > userspace related and therefore not required.
> > > > > >
> > > > > > The driver currently in staging is older and less functional than the
> > > > > > version on Larry Finger's GitHub account, based upon v4.1.4_6773.20130222.
> > > > > > This series of patches therefore:
> > > > > >
> > > > > > (1) Removes the current driver from staging.
> > > > > > (2) Imports the GitHub version mentioned above in its place.
> > > > >
> > > > > Let's do (2) first before worrying about (1), given that we can't get a
> > > > > version of (2) that actually builds yet :)
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > Dear Greg,
> > > >
> > > > I'm confused - v3 patchset builds fine for me after applying in
> > > > sequence from 1 to 7?
> > >
> > > Why does kbuild report problems?
> > >
> > > Anyway, please let's just add the new driver in a new directory, get it
> > > building, and then we can remove the old one.  That way patches will
> > > continue to work and there's no confusion when backporting patches as
> > > the code bases are different.
> >
> > I get no kbuild problems in the staging-next branch. I have no idea why the
> > test robot is reporting errors.
> >
> > Keeping the old rtl8188eu directory and builds will result in 3 drivers
> > competing for the hardware including rtl8xxxu, rtl8188eu, and r8188eu.
>
> I will only "keep" it around for a day at most.  I will delete the old
> driver, I just do not want the "new" driver in the same directory as the
> existing one to make it easier to handle changes over time.
>
> thanks,
>
> greg k-h

OK I'll do another patch set tonight after work without the removal
patch at the start and with the new driver integrated into kbuild
alongside old one - the directory name is different already, but they
share the same module .ko name - will leave this as-is if the old
driver is scheduled for deletion soon though. Many thanks.

Regards,
Phil
