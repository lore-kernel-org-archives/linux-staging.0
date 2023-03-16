Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88329A5;
	Thu, 16 Mar 2023 11:13:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id bi20so958139wmb.2;
        Thu, 16 Mar 2023 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678965205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTuzaEtkdad3SduDOVpM+9N/ZmAnSzF8vvyumGkuLF4=;
        b=Cpa+nq0CzvtmFmE69T/iPZ6OVlFndUFiNVmjbOV8xzoiqyyv4EDfSiA+BLlOvoj5S3
         +EhTvIksk5X8Sn10oPxNv+2SnceF3dF9YEIKuCTSM3QMECCWZYE6FsWu1x1FJuOdQfeb
         ARNndVdNW7q42AkZ53SPzMAGQom4REgbSdKUOZBQI05yOoq7c0cy0imO8vTbU0esn0O2
         TSKDYPunkV1UlvLBxH/RC27ICvbHgD85Xi4oj5DZUaQEiRwAjPUSo4nZrt4O2/opP0ex
         3bXjc9Bejdfr5wNVmhwOR4ZP/RQh9oFvywc58EWlJzSiWNI3GZ6+bRebkgZWekBgUmKP
         20mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678965205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTuzaEtkdad3SduDOVpM+9N/ZmAnSzF8vvyumGkuLF4=;
        b=SZDE1McPXSwlZeqx5qkzot6l8YLRPo7HhA95GXZB1EtRrWFTvSuA3H7zpbxeHpWaiF
         GMKRr4MilpaqKQ6kdWrb2bbT4H8qXQJYyPnXkIIFNQr6NjaQ+HOWKkd55ROlelmCbrVW
         pE+jSWAIQJef9V4kneES85m7JVQ1lFGS7Dwn1Ap6c77YylzAnGneiSu6bje+AAr9r4yE
         JqUo6JcJIkTYqrS5ZhEhjHM8xbYHmJXlSyzqNv+uFwq2BPOqCzeOIkS8npLZ0BqzT4/4
         0EHaN9QyJ6AmlHCfhGd9/+0f4NNDwfJo0GNjCuupseBvxeBZODWs34wjx/z6pKm4eitY
         ouKw==
X-Gm-Message-State: AO0yUKXn7w1bFiRrNSaBiw2xq5D/ZfHwEEQGmTXnsd0xr+Fy08HLVdgG
	Dx1FYmtoLGcFKh4ypJpb1uM=
X-Google-Smtp-Source: AK7set/H2duo12KyBsoS0hMmwXxkNb7VuKuY/1BxrCfP7+ga4GEby607n7kYdKjgd04g47RThZEOmw==
X-Received: by 2002:a05:600c:3113:b0:3e2:24a0:ba26 with SMTP id g19-20020a05600c311300b003e224a0ba26mr21354109wmo.16.1678965205397;
        Thu, 16 Mar 2023 04:13:25 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bc059000000b003e21f959453sm4576877wmc.32.2023.03.16.04.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:13:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Alison Schofield <alison.schofield@intel.com>, outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Date: Thu, 16 Mar 2023 12:13:23 +0100
Message-ID: <1797409.3VsfAaAtOV@suse>
In-Reply-To: <ZBLmev7BaIhYQXIz@khadija-virtual-machine>
References:
 <ZA9mThZ7NyRrQAMX@khadija-virtual-machine> <3096768.uvML7RA1vL@suse>
 <ZBLmev7BaIhYQXIz@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On gioved=EC 16 marzo 2023 10:50:50 CET Khadija Kamran wrote:
> On Wed, Mar 15, 2023 at 05:44:47PM +0100, Fabio M. De Francesco wrote:
> > On mercoled=EC 15 marzo 2023 14:56:27 CET Khadija Kamran wrote:
> > > On Wed, Mar 15, 2023 at 02:13:51PM +0100, Fabio M. De Francesco wrote:
> > > > On mercoled=EC 15 marzo 2023 13:32:55 CET Khadija Kamran wrote:

[snip]

> > > > I suppose that "w=3D1" is a typo. The option is enabled with "W=3D1"
> > > > (capital
> > > > case, Linux and all UNIX-like are case-sensitive).
> > >=20
> > > Okay. I should re-run it with "W=3D1".
> > >=20
> > > > > But it is taking a lot of time, is there any way of
> > > > > speeding it up?
> > > >=20
> > > > What is you choice for 'X' in "-jX"?
> > >=20
> > > I used "-j4".
> > >=20
> > > > Did you try with the exact number of logical cores?
> > > > Are you building into a VM with enough logical cores?
> > > > If you are building into a VM, did you reserve enough RAM?
> > >=20
> > > I am using Ubuntu 22.04.01 with the help of VM on VMware.
> > > My machine has 13GB RAM and 2 processors(4 cores each).
> >=20
> > Therefore, you are using a Linux guest on a Linux host. This is a wise
> > choice. However, you didn't say where you are running your builds...
>=20
> Hey Fabio!
>=20
> I am not using a Linux guest on Linux host. Sorry if I did not explain
> it right. I am using Windows 10 and in order to run Ubuntu, I have
> created a VM(on VMWare). This VM has 13GB RAM and 2 processors(4 cores
> each).
> Thank you!
>=20
> Regards,
> Khadija

Khadija,

I'm not yet sure whether or not you are doing well with reserving 13GB to a=
=20
VM. First of all you should better use multiples of 2GB. Furthermore it loo=
ks=20
too much memory unless you have a total "real" RAM in your host exceeding=20
18GB. You must be sure you are leaving enough room for the Windows host to =
run=20
smoothly and avoid too much swapping to/from disk.

At the same time I doubt that you can reserve 8 logical cores (2x4) for=20
running the VM on VMWare.

However, we have time to investigate and adjust your configuration (if it=20
really needs to be fine tuned). I'll try to reach you on IRC, open a privat=
e=20
window, and assist with this task ASAP.

At the moment I'd prefer to see you focusing on getting your first patch=20
accepted by Greg.

Thanks,

=46abio=20
=20
> > I mean, the better things to do are the following steps:
> >=20
> > 1) Your workspace with the staging tree should stay in the host.
> > 2) Shut down your guest in order to have all RAM and all logical=20
processors
> > available for the build.
> > 3) Run "make -j8" in the host. Since you shutdown your guest VM you can=
=20
use
> > all 8 logical cores and the maximum available RAM (without the VM drain=
ing
> > resources while building)
> > 4) When the build is done, switch on your VM on VMware with at least 4
> > logical cores and 6GB of reserved RAM.
> > 5) Mount your cloned base directory as a shared folder between host and
> > guest. 6) In the guest, 'cd' to the shared folder and then run "make
> > modules_install install" (in the guest, attention). This will install a=
nd
> > configure the kernel, the modules, GRUB2 and everything else in your gu=
est
> > VM.
> > 7) Reboot the VM and test your patches.
> >=20
> > This procedure will speed up your next builds.
> > The fundamental point is that you don't need to partition precious=20
resources
> > while building, Do everything without running the VM and switch it on o=
nly
> > for install and tests. Since you only build in the host but never insta=
ll
> > and boot in it, you don't risk any system's damage.
> >=20
> > This is what I do for Kernel development purposes.
> >=20
> > I hope it helps to answer your question about how to run fast=20
recompilation.
> >=20
> > Fabio
> >=20



