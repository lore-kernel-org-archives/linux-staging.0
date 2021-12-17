Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00743173
	for <linux-staging@lists.linux.dev>; Fri, 17 Dec 2021 04:49:05 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z5so3270972edd.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 20:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GJxpDiLpbpPINaOcBipsmIBKGtNQ+pTxcsj8dWvqKk=;
        b=XYX28P5JN9Qi9AqY6RdU8NHuKgyb2ni3yWGjFXejI92Mjdz2ktEGfEELSSPmDUvvYi
         VwQtocGg4rHGd9xMk3Bi7dczQ0gTHV5gGIrlx7knTiCdNgY+HQZBz3LLpZ4Hmn7qVHes
         b6+7t6q1ga50czfzqpOCqajlT9bPCwJePv67e86JcPtB3x8/o2wmaOaJh+aSsocy2jIW
         uiJmVzeCGY4indD/+XgNQjohvs6YD7OA6wjDxp4Lislknx/3m2e9qrNEXEnMidcoVu6P
         3mA3ziprDkCer2OKiwRwYJdJ6zmntOfz6XUSs3BPscVTzwRuSZ3YtGD/NsqR1YnuqO3r
         v4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GJxpDiLpbpPINaOcBipsmIBKGtNQ+pTxcsj8dWvqKk=;
        b=GYpKe6M3kIsFLCd1xoCm2JQuP2M2LC3DOni8ldH9czOL1jgEq+C5AlD0gZ/Rggtmab
         ZvORSkAXAhv6ZZBteyH8ZyLipegtdVdaYceVjA67R4/Dd+nYoPiPdLP7hO047RgSRecA
         OTPRym3cJkJ+D6cG1azp0Tdi5LnEiuXEPk44SBkCYkT8llJXPx6IQQQjo9/Yosd8aDMf
         8ETZiugMVYQx+0kONpBx6+f9FMITNjSt96HZfVOYzaTddRJIl5G+5Yz/APaIevhPq+95
         8FlH4s4K9sS2znNY4b2buVimAZ2GDwcy2maKam4EABfEnwbJb3YX7nGH1TBM3VaaiYhg
         sQkw==
X-Gm-Message-State: AOAM531xkj/b293eEsgSFHCHGDG7wa+Kbqh8IdADVoLD34TyoRcsVCzz
	1bSQOuZC/Me2hc8pEVUZxPFX8Rfk8TViVVIlM7c/kQ==
X-Google-Smtp-Source: ABdhPJzaIuToc0djVyjp+VsjCbme0PeMuRClgq6NqRenM+df1YY9uQXZCbxUdpPkTSZu7ypDqPFBB+GLvvmn9r8MBmg=
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr1138627ejc.363.1639716544065;
 Thu, 16 Dec 2021 20:49:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
 <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
 <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
 <d91532c2c0772f9aa708ead36b2a97203727a7ea.camel@ndufresne.ca>
 <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
 <CAHCN7x+0LwwU_rEST+TZxGquswGKL19gnTy9WLofsXtGAtWqdw@mail.gmail.com>
 <7f94eaacfddb8c5434c17f1e069ea87a17657ce9.camel@ndufresne.ca>
 <CAHCN7xKRzxMBmPbDobWTuvNNSpTXk5XENvfBnfkhRY3eZKhn6w@mail.gmail.com>
 <CAHCN7xJFLNi_g+HX8PCy1Rkgf0jnWpO5QGYVz8nH19xrJkwHrA@mail.gmail.com>
 <CAJ+vNU3zFd=6k_Emc5aafxKkGwCPp4crgOFezQ-E_MbWsn1_EA@mail.gmail.com>
 <fed6c2fd7cf4971062c417ce41ed1e3812b900e0.camel@ndufresne.ca>
 <CAHCN7xK+wROHaqDcsY-3WYFQ82qX17L-LHNL3siSWnWvwFShzQ@mail.gmail.com>
 <CAAEAJfC1xXvemaFP+vTFVJ3S-SpYtrxyZgDamSOgLC1F3ua5xw@mail.gmail.com>
 <CAHCN7x+UMMP6RXsNm0=OC=UTQzh=RKqQo6B7FD5e4eoJAEfmpg@mail.gmail.com>
 <CAJ+vNU1epi9SwPMHkuDmKcb68RLemYF=bsp7AVnzz06zKc2efw@mail.gmail.com>
 <CAAEAJfCpjk5nWWkJYjjDT-YEpJi4pTZqZbzp_if9OGC0HKspzw@mail.gmail.com>
 <CAJ+vNU2we5mGXgYsR6CfimvFXZsc0zktR3fDa-h6RRa02jTT0g@mail.gmail.com> <CAHCN7xJrM9uZUnmx65uTxWEo6HAkjozd3kD3UoEv-pYd5DV4QA@mail.gmail.com>
In-Reply-To: <CAHCN7xJrM9uZUnmx65uTxWEo6HAkjozd3kD3UoEv-pYd5DV4QA@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 17 Dec 2021 01:48:52 -0300
Message-ID: <CAAEAJfBXU-AiKKhkhXzgUSR4p1yefysNuHFycBz3F-GzNewS6w@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To: Adam Ford <aford173@gmail.com>
Cc: Tim Harvey <tharvey@gateworks.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	linux-media <linux-media@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, Marek Vasut <marek.vasut@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Adam Ford-BE <aford@beaconembedded.com>, 
	cstevens@beaconembedded.com, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, 
	Lucas Stach <l.stach@pengutronix.de>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
	Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Adam,

>
> I will post a V2 last today with the Mini's post-processing removed.
> Someone, I apologize that I forget who, mentioned it was fused out of
> the Mini, so the testing I've been doing was with that removed and I
> removed the H1 encoder since the Mini doesn't support JPEG encoding.
>
[...]

Resurrecting this thread here. IMX8MMRM Rev. 0, 02/2019 mentions
post-processor features for G1 and G2.

Have you checked the fuse and synth registers to see if they throw
any useful information about the hardware? For instance,
comparing PP fuse register (SWREG99) and
Synthesis configuration register post-processor (SWREG100)
in both 8MQ and 8MM could be useful.

As I mentioned on my previous mail, even if G1 PP is disabled
on the Mini, I would imagine the G2 can do linear NV12 (aka raster-scan)
which in our hantro driver jargon is a  "post-processed" format :-)

Thanks,
Ezequiel
