Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F42CA3
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 12:09:04 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id b16so42958923uaq.4
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 04:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8lp2UnjEidvC243D8ySx2ayoKmQ8Mrm2ZTxLTvCR7T4=;
        b=Iih5iHto2nGi19mzdVfhLkdAH//FfLBE0LfaWypVqZ8rnVVTn5UkMnW+yEY1hlRCoY
         57YVnuHB98OcCsZN6rto5P5hiM3RxvODmPJ+B4PNG/bqg9p+hjvruiIOod/03X60bNmU
         OBmB0NXkYAXcA9AAabOulCawt3a38OFsjp3z2RpD5hYI9reZH9cgCPdJb4cTuYjMkhZW
         TS3l/G1UeMOjpztXO4INYU6T7H9655NjFnC62WiyZSqMMHTb+H9NvARU5pofuTSwO5d7
         tbGofO7cQ6qTcX9cYB0FgBYwyFJ++deONgDimQfPczKKiq/qA2lo2ys5A40RVyaK8WxC
         74xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8lp2UnjEidvC243D8ySx2ayoKmQ8Mrm2ZTxLTvCR7T4=;
        b=bWjJBCNGGb+6OiGNpUAOIaoCvCQBXkN93q5g4uLz6iSNosZfN0EC834q2wd0ETOEwS
         69uz+4JjWO+VGhgqnJFrQs9WZofU4z3EqpiA7Ir1oDT/UsLQZyxoPHjqFssoEyiVrrZW
         W+QchKPtLX1BPp3SUrBoLJDJCUdlgOsegTlyFRrg+N0i0m1Gx0ehtGu6N6rjbiCCFyop
         PxBVYBDG4UefL9fHdsfgK3r0KI0KCk6jUuDK6iuN6BVRBH/WXglEdlsceTbuPGlfxwg4
         sniH8p/leRtUXZ9DSuBFZgralbMJCon5wNywnndIyyP3ju9RxIHoOudWPS1LYKA9Pb3a
         Hd/A==
X-Gm-Message-State: AOAM531uyabQrmmQ3ED/blmDpxo4soU67Qqi6cAsatcPDJuVTReAv+y2
	RDvrMD5fcPcwXhMYF9J5uykf/3ffFSq37fNSE+g=
X-Google-Smtp-Source: ABdhPJz5i4SlUp/3c7rAKDRo5jIIwdmYK5W5no/4gweeJqRnjgqcHJFS7H28mZWz4UESnosZ9HFZzfeObxMSdz66cVw=
X-Received: by 2002:a05:6102:3f12:: with SMTP id k18mr9209036vsv.76.1643198943090;
 Wed, 26 Jan 2022 04:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com> <YfE5MOkQRoHQV7Wf@kroah.com>
In-Reply-To: <YfE5MOkQRoHQV7Wf@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 26 Jan 2022 13:08:52 +0100
Message-ID: <CAMhs-H8s0d=PswQDR86Tq-bQt634Z6rdFYHTE+DFepsthmKAYA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] clk: ralink: make system controller a reset provider
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 10, 2022 at 12:49:26PM +0100, Sergio Paracuellos wrote:
> > Hi all,
> >
> > This patch series add minimal change to provide mt7621 resets properly
> > defining them in the 'mediatek,mt7621-sysc' node which is the system
> > controller of the SoC and is already providing clocks to the rest of
> > the world.
> >
> > There is shared architecture code for all ralink platforms in 'reset.c'
> > file located in 'arch/mips/ralink' but the correct thing to do to align
> > hardware with software seems to define and add related reset code to the
> > already mainlined clock driver.
> >
> > After this changes, we can get rid of the useless reset controller node
> > in the device tree and use system controller node instead where the property
> > '#reset-cells' has been added. Binding documentation for this nodeq has
> > been updated with the new property accordly.
> >
> > This series also provide a bindings include header where all related
> > reset bits for the MT7621 SoC are defined.
> >
> > Also, please take a look to this review [0] to understand better motivation
> > for this series.
> >
> > Regarding the way of merging this:
> >  - I'd like patches 1 and 4 which are related going through staging tree.
>
> Patches 1 and 4 now in the staging tree, thanks.

Stephen wanted all to go through the CLK tree since PATCH 3 and 1 were
also a dependency... Can we get all of them through the same tree,
then? I am ok with both CLK or staging trees.

Thanks,
    Sergio Paracuellos
>
> greg k-h
>
