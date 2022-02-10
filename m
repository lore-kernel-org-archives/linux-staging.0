Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F852F22
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 06:44:45 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id a6so2267943vkc.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 22:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vATQV96HIV875DpM2fnnEa+rKLHrA6ZG+qfAprHu1e8=;
        b=DCGcZiebBFSTnkF9RGqM9hnYnWCcnAxcDZSEpbKWKeQs1KM3bM00eS9vRY+lkpxjD0
         GJoLV0IkKyT6IE1DPL0KegouXUMN33zgsVDuDCJ9JSSaoKUNqPsoO+uZmNBpwf3aoZfg
         Knoa4fPaLPMLT838YRhdjoDyRSH+9CAsKxF9FolpTEOLrM1z5L3VXHROzC1ZtHqrGxJK
         lRr2MiDnRrx6oaYralUySq+SzFeGN7DMSAUI00EyRefKX6bh3Jfy/13oOneZysryApyp
         Q0KbB5DIV+5rt8E2mutj+QMH7Z4uistgIpvFzqesllNC7vq+lm8hBVEqKKtyBt7XsVCp
         XzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vATQV96HIV875DpM2fnnEa+rKLHrA6ZG+qfAprHu1e8=;
        b=W7BucipvRbIgWrNX1w18e+9CZTs2sRBhs3zxCydtNMbZ0+j0xBfiPGNyF39h/jo7mA
         Sy7Q/TcTZx8DmxzXlCHPraCxSn9zWkAPRK4Ucn0rF+548w8bIvNqOiSLzH7Zflib8WDD
         73myM8usAag4mi7lSA19iyenEGTleA2em4/7d6OXnuyGlz+HlUbJERzImje6juIbhCrx
         9BmkgJ1Kb/ZWpPz+Ic6HjVzGgFX+Sqf3Nkxop6XslyU0VhBU1cGBjxkR64USQbzcXYy+
         omXng8jCPZnWcomlcjWJD2zdC7Dkriy9v51rhFcBFDyW+Z0gz0SNy1D9kRPj7gVLU7Lm
         4YSQ==
X-Gm-Message-State: AOAM531J6f2/pd+BLX/0c/x0BpvrhNxmzYL87lm/Lxu7pg+9M+r78/HV
	3Q5pWI4CMtZO5Ob5S8xs70Yypi3FG3hXiUj9Tcc=
X-Google-Smtp-Source: ABdhPJy4f9xIFUUmiX+BmjO+7FRRofRm71wdEsoGHAiePfWX1OQdeIlGzUShnt/VNT67jJifn+eRplmpDmZ6oamSjDc=
X-Received: by 2002:a05:6122:17a9:: with SMTP id o41mr2314279vkf.1.1644475484513;
 Wed, 09 Feb 2022 22:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
 <YfE5MOkQRoHQV7Wf@kroah.com> <CAMhs-H8s0d=PswQDR86Tq-bQt634Z6rdFYHTE+DFepsthmKAYA@mail.gmail.com>
 <YfE7LNFuf79i3oAQ@kroah.com> <CAMhs-H9c8zF=v2tu5Y1OsFRP6esOi5zrUceqS_OUiJ=MSfCvRQ@mail.gmail.com>
 <20220205025548.AA1BBC004E1@smtp.kernel.org> <CAMhs-H82J5DC+m0V==tQKKYyqsu30kGLkdUbMRU+nsyLb8sL3Q@mail.gmail.com>
In-Reply-To: <CAMhs-H82J5DC+m0V==tQKKYyqsu30kGLkdUbMRU+nsyLb8sL3Q@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 10 Feb 2022 07:44:33 +0100
Message-ID: <CAMhs-H9RSjgW1-dafqDqbfBaQ4iH6NFDLoRHqjt=f41zAEcC-g@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] clk: ralink: make system controller a reset provider
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Sat, Feb 5, 2022 at 8:31 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Sat, Feb 5, 2022 at 3:55 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Sergio Paracuellos (2022-01-26 04:45:31)
> > > On Wed, Jan 26, 2022 at 1:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Jan 26, 2022 at 01:08:52PM +0100, Sergio Paracuellos wrote:
> > > > > On Wed, Jan 26, 2022 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Mon, Jan 10, 2022 at 12:49:26PM +0100, Sergio Paracuellos wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > This patch series add minimal change to provide mt7621 resets properly
> > > > > > > defining them in the 'mediatek,mt7621-sysc' node which is the system
> > > > > > > controller of the SoC and is already providing clocks to the rest of
> > > > > > > the world.
> > > > > > >
> > > > > > > There is shared architecture code for all ralink platforms in 'reset.c'
> > > > > > > file located in 'arch/mips/ralink' but the correct thing to do to align
> > > > > > > hardware with software seems to define and add related reset code to the
> > > > > > > already mainlined clock driver.
> > > > > > >
> > > > > > > After this changes, we can get rid of the useless reset controller node
> > > > > > > in the device tree and use system controller node instead where the property
> > > > > > > '#reset-cells' has been added. Binding documentation for this nodeq has
> > > > > > > been updated with the new property accordly.
> > > > > > >
> > > > > > > This series also provide a bindings include header where all related
> > > > > > > reset bits for the MT7621 SoC are defined.
> > > > > > >
> > > > > > > Also, please take a look to this review [0] to understand better motivation
> > > > > > > for this series.
> > > > > > >
> > > > > > > Regarding the way of merging this:
> > > > > > >  - I'd like patches 1 and 4 which are related going through staging tree.
> > > > > >
> > > > > > Patches 1 and 4 now in the staging tree, thanks.
> > > > >
> > > > > Stephen wanted all to go through the CLK tree since PATCH 3 and 1 were
> > > > > also a dependency... Can we get all of them through the same tree,
> > > > > then? I am ok with both CLK or staging trees.
> > > >
> > > > That's fine with me if they all go through the CLK tree, but there will
> > > > be a merge issue that I already fixed up in my tree.  If you want me to
> > > > drop them, just let me know.
> > >
> > > Stephen, what do you prefer? Is it better all going through staging-tree then?
> > >
> >
> > Sure take them through staging tree.
> >
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Thanks, Stephen.
>
> Greg, can you please take remaining patches 2 and 3 through your tree, then?
>
> Thanks in advance for your time.

Please, let me know if you prefer me to resend the remaining two
patches with tags added to make this easier for you.

Best regards,
    Sergio Paracuellos

>
> Best regards,
>     Sergio Paracuellos
