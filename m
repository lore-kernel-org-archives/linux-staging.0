Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D42CA8
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 12:45:43 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id n14so14333671vkk.6
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oeFZ1F1xCDNSkCC3zvx1x8IPpqPLoE1A/p8p4FpCtcI=;
        b=ZVGtaWpaBb7/zTDQUYd02zGW5ej+fB9Ni2GWkLkMYoMFh/Q3Ed+6lu08HRZwnM4Ibn
         EdrwNrAjeKVIMC6SWjWW+ROZkCF1kT1RLs4eGTtaQ/XDaea+NXDx+2wZ6LKEwB7brBeV
         8cxuX1KlqGPTrSfdaw3EhqcWrSEx7JY5OcEucHOnH98SxehuhaBS4zkX8oKJ+xJ3SmHi
         ubkU6cxklht96f12N/9ksjT4qj2t1tyqwEQkIiwXAywmgbWcL0wrSBj7GW85zCiStnTS
         I+gVCzsUBgGvgbouH9SuuEtscfCBh+9kgsnlgOxbDLTQE0hT1EnHdT10hWTUtf3EPi2n
         jeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oeFZ1F1xCDNSkCC3zvx1x8IPpqPLoE1A/p8p4FpCtcI=;
        b=uXLRRRKqbjSy7g1EHG4MseJ1d2r2Vsr/dGA2qQ35/FsOWuE4BNpF2G1HXDb5CoYOay
         HP3lJVNteNgyHrhuoDduD1ZTxemdBQUqkWp2FD0aWp6dBrja70iJyY4S7oQJEi5ONNji
         0Hxc5DCZ1sHu3DnzL3KDOuzBjq/e56Yeq8OwazCcu2cICfU1tAo80JZT7Yql1YHzXfgi
         k2gt/Gkt4TrQwj+oVhuDTFNIvm2AzioCUN2ZCZT2Isz5uIth4KHwNNUQINWm2GJl1aN2
         onOM2/B3jKxeMq8aAYVHuZSqDQMLKg00TC2W3IaUIFcXKlLyO1saHssl2xGji482HDZs
         jrsA==
X-Gm-Message-State: AOAM533PwOgmFAt4cBf1iLLso5EzOFdmXKZ1VRMXHj+Qoj5o0zc+JXuI
	qq+ugENUv0NG5O7DH0DSoKbkeRKKhwExzKnMhxM=
X-Google-Smtp-Source: ABdhPJw2/kvCWaVfdeHkWcdx6kf6eHrJ0ds9yVYC+9izkBB4SxRKp0tBY20gUsabLtsv9cMExP6fvP7vqgriXc4RovY=
X-Received: by 2002:a67:fdce:: with SMTP id l14mr3908513vsq.70.1643201142807;
 Wed, 26 Jan 2022 04:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
 <YfE5MOkQRoHQV7Wf@kroah.com> <CAMhs-H8s0d=PswQDR86Tq-bQt634Z6rdFYHTE+DFepsthmKAYA@mail.gmail.com>
 <YfE7LNFuf79i3oAQ@kroah.com>
In-Reply-To: <YfE7LNFuf79i3oAQ@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 26 Jan 2022 13:45:31 +0100
Message-ID: <CAMhs-H9c8zF=v2tu5Y1OsFRP6esOi5zrUceqS_OUiJ=MSfCvRQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] clk: ralink: make system controller a reset provider
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 1:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 26, 2022 at 01:08:52PM +0100, Sergio Paracuellos wrote:
> > On Wed, Jan 26, 2022 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jan 10, 2022 at 12:49:26PM +0100, Sergio Paracuellos wrote:
> > > > Hi all,
> > > >
> > > > This patch series add minimal change to provide mt7621 resets properly
> > > > defining them in the 'mediatek,mt7621-sysc' node which is the system
> > > > controller of the SoC and is already providing clocks to the rest of
> > > > the world.
> > > >
> > > > There is shared architecture code for all ralink platforms in 'reset.c'
> > > > file located in 'arch/mips/ralink' but the correct thing to do to align
> > > > hardware with software seems to define and add related reset code to the
> > > > already mainlined clock driver.
> > > >
> > > > After this changes, we can get rid of the useless reset controller node
> > > > in the device tree and use system controller node instead where the property
> > > > '#reset-cells' has been added. Binding documentation for this nodeq has
> > > > been updated with the new property accordly.
> > > >
> > > > This series also provide a bindings include header where all related
> > > > reset bits for the MT7621 SoC are defined.
> > > >
> > > > Also, please take a look to this review [0] to understand better motivation
> > > > for this series.
> > > >
> > > > Regarding the way of merging this:
> > > >  - I'd like patches 1 and 4 which are related going through staging tree.
> > >
> > > Patches 1 and 4 now in the staging tree, thanks.
> >
> > Stephen wanted all to go through the CLK tree since PATCH 3 and 1 were
> > also a dependency... Can we get all of them through the same tree,
> > then? I am ok with both CLK or staging trees.
>
> That's fine with me if they all go through the CLK tree, but there will
> be a merge issue that I already fixed up in my tree.  If you want me to
> drop them, just let me know.

Stephen, what do you prefer? Is it better all going through staging-tree then?

Best regards,
    Sergio Paracuellos
>
> thanks,
>
> greg k-h
