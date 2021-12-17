Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145729CA
	for <linux-staging@lists.linux.dev>; Fri, 17 Dec 2021 13:15:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b7so7692317edd.6
        for <linux-staging@lists.linux.dev>; Fri, 17 Dec 2021 05:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Na3iE0j4HNoWRi+U++Qkwp+ou8+ZuFrwaRIy0WfQ2hA=;
        b=N1jr9myxISWFLN1mOI/vHIm7ZWB08fTKGVaFpYwQ27LZJHOjLxTnHX+mLbvy56Ha3e
         +BVHSX0+Yx6xtn1m2T1ICDsnOmPq3bbHQOdrd/l/fQ9ymJcU9DHC1Q3Wd4eQwRs1irAb
         w4QUWGBiNrBEq0UHs2n+58YHaxjSOU9CzA8xUunvBR7P+eMZVAiLVlhDonXwWiiSkod9
         FWKCaEFXjoQPgOD4IowjyWGxZ90LuM17iceNFjjXlBPjORhF7Q4doIEUi66Yz/QyKxeW
         R1Bl5iIjHMIx/qhhCLl9eowquoy8Mfj5HAakVqzMNmKZnjwr5ws+V7SWS0vIvxV6jZKb
         YiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Na3iE0j4HNoWRi+U++Qkwp+ou8+ZuFrwaRIy0WfQ2hA=;
        b=mkNmx3Hk8Mkq1apj9eZcoLu91YVDpoLYto9PiYX6p0JAeFjWGsYFvhqpBNvRF7sK7+
         SRsKwaJaeuMmdhne7F2fSDhYv1CgHu86bW+Lx277KgHvwSmbgIHLpjryTx7oo4crQOX6
         EnayOn+xw5DTb+49xW7IAp/DPKlKEsb5eFEZXtYl3cXpb5CRo1MLUXB5wDDAvHSRIUe1
         s8F5eUcc4SdtbIU/UPi/CxTW4FgMu3c38Z6UnuHYtAyHm2E9U2yEKR3bS1EnPl1X3Ovh
         3na9Pz/1aTG2unzjbpKaMXN4QdmYdvXD8Jyz/FMCbVSrHsKxQEGhH4soiotuQkUBaLsg
         8xsw==
X-Gm-Message-State: AOAM533vsfPDgeSDUhQf1398gf+rXCL4RRPwQtn3M47//d2Su1FK+8Ix
	TG2fKOZtlTgk0tM2Ct22egQLrkLdHY4Wcpc9nX0=
X-Google-Smtp-Source: ABdhPJx2oXs11DBrV0D1boS6MZsPcSRGc/jvpGyJdpjBOAPI0LrBX/9/U5OOGPw9HCXw3XqnpD70MU3f84YkxWLJuzg=
X-Received: by 2002:a17:907:2d12:: with SMTP id gs18mr2529014ejc.198.1639746911717;
 Fri, 17 Dec 2021 05:15:11 -0800 (PST)
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
 <CAJ+vNU2we5mGXgYsR6CfimvFXZsc0zktR3fDa-h6RRa02jTT0g@mail.gmail.com>
 <CAHCN7xJrM9uZUnmx65uTxWEo6HAkjozd3kD3UoEv-pYd5DV4QA@mail.gmail.com> <CAAEAJfBXU-AiKKhkhXzgUSR4p1yefysNuHFycBz3F-GzNewS6w@mail.gmail.com>
In-Reply-To: <CAAEAJfBXU-AiKKhkhXzgUSR4p1yefysNuHFycBz3F-GzNewS6w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 17 Dec 2021 07:15:00 -0600
Message-ID: <CAHCN7xL4y67V6AW5MV=8iudvvGVBWs2LoUhu_2CUJf6bSycgFA@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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

On Thu, Dec 16, 2021 at 10:49 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Adam,
>
> >
> > I will post a V2 last today with the Mini's post-processing removed.
> > Someone, I apologize that I forget who, mentioned it was fused out of
> > the Mini, so the testing I've been doing was with that removed and I
> > removed the H1 encoder since the Mini doesn't support JPEG encoding.
> >
> [...]
>
> Resurrecting this thread here. IMX8MMRM Rev. 0, 02/2019 mentions
> post-processor features for G1 and G2.
>
> Have you checked the fuse and synth registers to see if they throw
> any useful information about the hardware? For instance,
> comparing PP fuse register (SWREG99) and
> Synthesis configuration register post-processor (SWREG100)
> in both 8MQ and 8MM could be useful.
>
> As I mentioned on my previous mail, even if G1 PP is disabled
> on the Mini, I would imagine the G2 can do linear NV12 (aka raster-scan)
> which in our hantro driver jargon is a  "post-processed" format :-)

You're likely right.  I was going on memory from an e-mail from
Nicloas Defresne who wrote:

"I will check the patchset, but you need in the mini-variant to disable the G1
post processor, because this block was fused out. We didn't make it optional
from the start as according to the V1 of the TRM it was there, but that error
was corrected in V3."

In my head I assumed the G2 was affected as well, but when I double
checked his email, and based on the above statement, the G2
post-processing is probably there, so I'll run some tests with the G2
post-processing enabled.  I'll also double check those registers on
both to confirm what they read. I am not sure when I'll have time
because I leave for London next week, and I won't return until early
January, but I'll do what I can.

adam
>
> Thanks,
> Ezequiel
