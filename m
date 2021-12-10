Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EB62C99
	for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 15:36:26 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id bf8so13721535oib.6
        for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 07:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kCCPtwBcvbN1Xz9t9SiQk1iylp71eIv8+Pkz9dWfX/o=;
        b=cY7LKG0eOxSU+EiCJ0bhPzA8pv7Ppfqk0SmlUSLrdjScmMy1AfFqYWxzb+E5HvxDl8
         7W/XpBpewgcsXa1tujfDiK53IjphjrvsBP14SLnL/DL7hPgzVMEI3RD7dGVPpbt66coQ
         NaiId9Z2Rgp5GFcVngtkhzn2b4uFMOvLC3Ju7SjXb4IsWxfOBCjbAOTD05EG8JtnP90I
         q9oyB7RPz2W83knynSssZL5Vj9zfv75Od2SMI93QqzpjPM9H+B3zQiTzuayDXunz7Vu4
         vAl6w77gqTg8D4uEOtjkR8dq30coAa4CjexIetVSuWMk8raRiJIYp7kVuf5x1vLiTh7t
         qNzg==
X-Gm-Message-State: AOAM531ninQ9syxjrYhyFIeUbLAzaTrJCgZIO2bsd6S0XP3xdSLHEkhl
	1H4g84Tw9iFOh66SlB1m+w==
X-Google-Smtp-Source: ABdhPJy6coMM+bLPVOCY2Fuho8xxQorQekIDB7d7Gxhw3bYyY/I6wGSBwaXEbWSrUY0EBeP0ei+R3w==
X-Received: by 2002:a05:6808:10ce:: with SMTP id s14mr12444004ois.137.1639150585255;
        Fri, 10 Dec 2021 07:36:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r23sm588332ooj.37.2021.12.10.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:36:24 -0800 (PST)
Received: (nullmailer pid 1396912 invoked by uid 1000);
	Fri, 10 Dec 2021 15:36:23 -0000
Date: Fri, 10 Dec 2021 09:36:23 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media <linux-media@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Chris Healy <cphealy@gmail.com>, Adam Ford-BE <aford@beaconembedded.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, "open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 04/10] dt-bindings: media: nxp,imx8mq-vpu: Support split
 G1 and G2 nodes with vpu-blk-ctrl
Message-ID: <YbNz94G3vwbHCMdB@robh.at.kernel.org>
References: <20211208225030.2018923-1-aford173@gmail.com>
 <20211208225030.2018923-5-aford173@gmail.com>
 <YbHZvysazqYeZ8h3@eze-laptop>
 <CAHCN7xKrHSSsqS9DNL1tMH1Ctpz16FsSgcVbSHXzUWF98v738Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKrHSSsqS9DNL1tMH1Ctpz16FsSgcVbSHXzUWF98v738Q@mail.gmail.com>

On Thu, Dec 09, 2021 at 05:36:04AM -0600, Adam Ford wrote:
> On Thu, Dec 9, 2021 at 4:26 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > Hi,
> >
> > Thanks for the patch.
> >
> > On Wed, Dec 08, 2021 at 04:50:23PM -0600, Adam Ford wrote:
> > > The G1 and G2 are separate decoder blocks that are enabled by the
> > > vpu-blk-ctrl power-domain controller, which now has a proper driver.
> > > Update the bindings to support separate nodes for the G1 and G2
> > > decoders using the proper driver or the older unified node with
> > > the legacy controls.
> > >
> > > To be compatible with older DT the driver, mark certain items as
> > > deprecated and retain the backwards compatible example.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  .../bindings/media/nxp,imx8mq-vpu.yaml        | 83 ++++++++++++++-----
> > >  1 file changed, 64 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > index 762be3f96ce9..eeb7bd6281f9 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > @@ -15,29 +15,39 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: nxp,imx8mq-vpu
> > > +    oneOf:
> > > +      - const: nxp,imx8mq-vpu
> > > +        deprecated: true
> > > +      - const: nxp,imx8mq-vpu-g1
> > > +      - const: nxp,imx8mq-vpu-g2
> > >
> > >    reg:
> > > +    minItems: 1
> > >      maxItems: 3
> >
> > Is it really useful to keep the deprecated binding nxp,imx8mq-vpu
> > as something supported by the binding file?
> 
> Since I was told that the driver needed to be backwards compatible, i
> wanted to make sure that any attempts to build the old device tree
> would not fail

I'm not convinced changing the binding at all is correct. 'The driver 
structure is changing and I want the binding to align with it' is not a 
reason. Are G1 and G2 actually separate, independent blocks where we 
could have 1 or both of them? And what about other platforms using this 
block?

Even if the driver handles the old binding, a new dtb with an old kernel 
is broken. It's up to the platform to care or not, but you have to 
highlight that.


> > In other words, can we drop the deprecated binding from this file,
> > while keeping the support in the driver for legacy device-trees?
> 
> I was trying to represent both the old driver binding and the new one
> at the same time.  I thought that's what I was told to do.

I don't care so much if we have a schema for old binding. I'd rather 
have warnings if the binding has not been updated. Eventually I want to 
be able to test for compatibility by testing DTs with different schema 
versions. We've got to get to 0 warnings first though...

Rob
