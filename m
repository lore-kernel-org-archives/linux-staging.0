Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF1367E
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 19:05:59 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2d07ae0b1c5so9280557b3.5
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 11:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLrFIsE9bo3p9BnVIL7Uc7sprqnSKm0YOW7fBIQdERM=;
        b=zABTJTUSR5sx8YCFSN7iGcpNZsFLQVgUciMT8k5KoLug5bf+tAH9iidPEkWIywlB6h
         M5Sd3JqAEp0N+gex97OF3EnxwnI1OQzAlzRNNO9qxnPZsssvHkfXai60ynHuFXMzYrJR
         7r2kcGmBzLSpxO2KDV1h4yXE6++KdBXjXrsORTrKtO5XflolT5FPQltGNuli6hl50O2F
         0JPq3o3/883BCbxVCd9d3MalcuhVoFqFjJUcH6IjSk4cp4lIJ2c8bIkn8WT/lcA/f/9V
         Y5MPs+qJenJTO2jjyeKE7CVZqyhzIvQJ/d11QzMx2Fr/8cW1Q1s0+bCjXVIJAq0AV8QI
         n0qQ==
X-Gm-Message-State: AOAM532smisixXFiMtyunIkVTQNni9ysJ2Xhl2+w1gwfdimuQEAkVjzf
	uYx6bYNspEHmY5KwYg7+hk72gIcGZkbwFQd3vTs=
X-Google-Smtp-Source: ABdhPJyFOmiGOmRDkw8czUhuWEAUWZI3b6hfKAcdDSxdtm3oSTgs7z2noREt7vOvPl7JarLhxJEUxltkCz2WrL99cSU=
X-Received: by 2002:a0d:c244:0:b0:2d1:1fbb:180d with SMTP id
 e65-20020a0dc244000000b002d11fbb180dmr3902361ywd.196.1645038358332; Wed, 16
 Feb 2022 11:05:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220215174743.GA878920@embeddedor> <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal> <20220215193221.GA884407@embeddedor>
In-Reply-To: <20220215193221.GA884407@embeddedor>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 20:05:47 +0100
Message-ID: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Kees Cook <keescook@chromium.org>, 
	GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, 
	linux-s390@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-xtensa@linux-xtensa.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, 
	coresight@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, netdev <netdev@vger.kernel.org>, 
	Linux OMAP Mailing List <linux-omap@vger.kernel.org>, 
	"open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, target-devel@vger.kernel.org, 
	mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, sparmaintainer@unisys.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	"open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, greybus-dev@lists.linaro.org, 
	linux-i3c@lists.infradead.org, linux-rdma@vger.kernel.org, 
	"open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, 
	"moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> > On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > >
> > > > These all look trivially correct to me. Only two didn't have the end of
> > > > the struct visible in the patch, and checking those showed them to be
> > > > trailing members as well, so:
> > > >
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I'll add this to my -next tree.
> >
> > I would like to ask you to send mlx5 patch separately to netdev. We are working
> > to delete that file completely and prefer to avoid from unnecessary merge conflicts.
>
> Oh OK. Sure thing; I will do so.

Can you also send the ACPI patch separately, please?

We would like to route it through the upstream ACPICA code base.
