Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273602F23
	for <linux-staging@lists.linux.dev>; Thu,  3 Feb 2022 13:16:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id d10so8725098eje.10
        for <linux-staging@lists.linux.dev>; Thu, 03 Feb 2022 05:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bdyf7D6NeIfikPS/uqe99QCdtkoBXMfRD7d4Vkt8KZ0=;
        b=fnO4Z9ikvpsMPCsKu6x6QsuM8vFnXR7m2mYfr5RDy4CHjqdkG4l8mUCcQ3/A/ZVq3N
         Tiw9v8aDR+6j+MTTtKmYvP1/T6tCYwgGtshXIsljrlWgPPwefokeevA26/GU4gJlJ73R
         v0dAV3zxaUspQD+1z4tJbSqZGpYqAUUrBgUa+a+D6zSSAVrMHHcbvxZV/40hWQSwQAq7
         gZw6dMjO/DSilkrdUsV9tG53PBkShl+rCqf7H55tqCNq1oH9Wz5gpzenx95pIk2CUHH1
         D6nvoKHkradIsoR9S6Ugx8D65IEEi7P2NlMyirZyNM8K87yMmopmd2hD1WODbzd5MuUD
         IIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bdyf7D6NeIfikPS/uqe99QCdtkoBXMfRD7d4Vkt8KZ0=;
        b=NHRZi8Ezl6dPyqqoo5MsZubDTmv4YG4iD0u3yobxHW67hQQcFssrgBjM0PY9a6pSd9
         89YU7QwVIybhrgfkVN11Y2w123mDe4f1tgfgezyUhTb7RxEDPdmZWFbIozX2ngZfXgNR
         oOOkumbksCPNMZE8xFe7blk64crTy9+RH8pOsCnSUFbFmA7sP7p50fboMRff9gXnoy84
         2mqQzQs/36YpoTO+JYeqOOCW/T3VTmMGxEN0hbDfcp6EC8mDEMEskwg70Tl2kKX/7i4b
         Y6CbnVBzOrG9e8lMsw8xtqP7pJjlDMWm7sz2G4J/RW2Jo62atuBwZegzCU/xhDxKgzap
         14yw==
X-Gm-Message-State: AOAM530EHhCAQyqn2wX+L661pjJAxd2Of/uFHiYnVXSO+afgdPkSIeDD
	kjSRJE4TDq7dGJrCQdX/8rEOcE7FbNCiruSVJTg=
X-Google-Smtp-Source: ABdhPJxk9m897IDjpBQJ4LNiGZxfQhz/ry40RQmM9zo6kAM1YbhCHKqydSjqdaAq8TwWy4Z9YFP8VO86vKIUQc2JKdU=
X-Received: by 2002:a17:906:4787:: with SMTP id cw7mr25116328ejc.504.1643894214217;
 Thu, 03 Feb 2022 05:16:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125171129.472775-1-aford173@gmail.com> <20220125171129.472775-3-aford173@gmail.com>
 <43e29322-fc4d-2c72-86b2-1f41fb05a2f9@xs4all.nl>
In-Reply-To: <43e29322-fc4d-2c72-86b2-1f41fb05a2f9@xs4all.nl>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 3 Feb 2022 07:16:43 -0600
Message-ID: <CAHCN7xLRnCRUwOLLW=EF2XdFY+V4EHqcGG-tj2SymiBL5Cki0w@mail.gmail.com>
Subject: Re: [PATCH V4 02/11] dt-bindings: power: imx8mq: add defines for VPU
 blk-ctrl domains
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shawn Guo <shawnguo@kernel.org>, Adam Ford-BE <aford@beaconembedded.com>, 
	Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 2:46 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Shawn,
>
> Can you take patches 2-4 of this series or shall I? In the latter case I
> need your Acked-by for these three patches.

If necessary, I can tweak the YAML file.  I just need to know if I
need to resubmit the whole series of just the one file.

adam
>
> Regards,
>
>         Hans
>
> On 25/01/2022 18:11, Adam Ford wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This adds the defines for the power domains provided by the VPU
> > blk-ctrl on the i.MX8MQ.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Acked-by: Rob Herring <robh@kernel.org>
> >
> > diff --git a/include/dt-bindings/power/imx8mq-power.h b/include/dt-bindings/power/imx8mq-power.h
> > index 8a513bd9166e..9f7d0f1e7c32 100644
> > --- a/include/dt-bindings/power/imx8mq-power.h
> > +++ b/include/dt-bindings/power/imx8mq-power.h
> > @@ -18,4 +18,7 @@
> >  #define IMX8M_POWER_DOMAIN_MIPI_CSI2 9
> >  #define IMX8M_POWER_DOMAIN_PCIE2     10
> >
> > +#define IMX8MQ_VPUBLK_PD_G1          0
> > +#define IMX8MQ_VPUBLK_PD_G2          1
> > +
> >  #endif
>
