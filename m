Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07C2C99
	for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 17:03:00 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r11so31333557edd.9
        for <linux-staging@lists.linux.dev>; Fri, 10 Dec 2021 09:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bjh9x/Ylpli2uVjhJ/4r/yMFZV/2WIykTlWdEGNaNJI=;
        b=hV3wZ3388qlFNw2N6RKoglvs/A3jxnZgxpEwjX8QxUGjabVfCr9c0RdWqwqC/5MGZu
         VI0SxLptrAy47hMoO9oyD4lld4OOqjYCY7P8CJ+GYtEmqc3iuCDpor5EMXDexYe/TD9+
         ohp26zcvMGS6A9Vag7oqT9FtN49X6oBqqpb70FK5BpkutkYgwRf2YWvUMxJUZWAmUUsV
         xeBnoAczmd8X9YAtRCqS8J7Jzf1RLKIvki+hcLXagbMSblBaZrItGF0tok1Q6caxvOY1
         DzmF/JccvORjSlcZcBB/Wa82RbjYv4jZvNA2e+kA2jG4aNLujWQKXLAY26m3SnGu9h+A
         6mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bjh9x/Ylpli2uVjhJ/4r/yMFZV/2WIykTlWdEGNaNJI=;
        b=5qXo0Tke1gucnhcXkkBoxmhccw35Dow2HQZCIQ7cYN1/H3ZrC3pGVYT4jPMoEHAlUD
         4an96nF25FgMInQkOHUQSPyMH5nV9n4cvj3h800AcCVGa1lhF3vqsMUgZlPqzYo3dspt
         ZA5tfUUGMMx46PdKbCPcIbiWEv5QaezUMDRXbVcZUPngaAamNtjfA5Hs5KrZYRoNVnvK
         GB47kIVaWBvJ/a5aYEQnzXwujrAgamHkBPYaDk0DDVgLSKlH+LBdy8leTq7MkjJrOMCa
         gGkuWVy4piJ819ARKHgwQUxQjMLE74l7kn6Txo/Yn1lXlNyAWVtCls8nyl7a94N2CuJ6
         rwdg==
X-Gm-Message-State: AOAM533OXp7uJtUMacN4yA32ddmUzzAYohbyYLlUcbpFSoaHlHX/CYPQ
	G7fFHHFQ9If8n+VGutbvHFLXSEAMWkHJDPLFsBE=
X-Google-Smtp-Source: ABdhPJz4rXDCMBTjjIZQqibEwgdwlz+r60DSMKLH73mRTmVhEGgeFUnb3hH1ZrZvCnQexbZUvYbKMnP5S1WRF+KIOgk=
X-Received: by 2002:a05:6402:5206:: with SMTP id s6mr40171950edd.113.1639155777972;
 Fri, 10 Dec 2021 09:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211208225030.2018923-1-aford173@gmail.com> <20211208225030.2018923-5-aford173@gmail.com>
 <YbHZvysazqYeZ8h3@eze-laptop> <CAHCN7xKrHSSsqS9DNL1tMH1Ctpz16FsSgcVbSHXzUWF98v738Q@mail.gmail.com>
 <YbNz94G3vwbHCMdB@robh.at.kernel.org> <c88b7a90f7a3bf94fc0cbb9a6f967ce769d5c03b.camel@pengutronix.de>
In-Reply-To: <c88b7a90f7a3bf94fc0cbb9a6f967ce769d5c03b.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 10 Dec 2021 11:02:46 -0600
Message-ID: <CAHCN7xLQrYy6H3U_yjCevu7F3AtEJJNbA7gdig=dn08hQfXCUA@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: media: nxp,imx8mq-vpu: Support split
 G1 and G2 nodes with vpu-blk-ctrl
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	linux-media <linux-media@vger.kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Chris Healy <cphealy@gmail.com>, 
	Adam Ford-BE <aford@beaconembedded.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 10, 2021 at 9:58 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Freitag, dem 10.12.2021 um 09:36 -0600 schrieb Rob Herring:
> > On Thu, Dec 09, 2021 at 05:36:04AM -0600, Adam Ford wrote:
> > > On Thu, Dec 9, 2021 at 4:26 AM Ezequiel Garcia
> > > <ezequiel@vanguardiasur.com.ar> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > On Wed, Dec 08, 2021 at 04:50:23PM -0600, Adam Ford wrote:
> > > > > The G1 and G2 are separate decoder blocks that are enabled by the
> > > > > vpu-blk-ctrl power-domain controller, which now has a proper driver.
> > > > > Update the bindings to support separate nodes for the G1 and G2
> > > > > decoders using the proper driver or the older unified node with
> > > > > the legacy controls.
> > > > >
> > > > > To be compatible with older DT the driver, mark certain items as
> > > > > deprecated and retain the backwards compatible example.
> > > > >
> > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > > ---
> > > > >  .../bindings/media/nxp,imx8mq-vpu.yaml        | 83 ++++++++++++++-----
> > > > >  1 file changed, 64 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > > > index 762be3f96ce9..eeb7bd6281f9 100644
> > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > > > > @@ -15,29 +15,39 @@ description:
> > > > >
> > > > >  properties:
> > > > >    compatible:
> > > > > -    const: nxp,imx8mq-vpu
> > > > > +    oneOf:
> > > > > +      - const: nxp,imx8mq-vpu
> > > > > +        deprecated: true
> > > > > +      - const: nxp,imx8mq-vpu-g1
> > > > > +      - const: nxp,imx8mq-vpu-g2
> > > > >
> > > > >    reg:
> > > > > +    minItems: 1
> > > > >      maxItems: 3
> > > >
> > > > Is it really useful to keep the deprecated binding nxp,imx8mq-vpu
> > > > as something supported by the binding file?
> > >
> > > Since I was told that the driver needed to be backwards compatible, i
> > > wanted to make sure that any attempts to build the old device tree
> > > would not fail
> >
> > I'm not convinced changing the binding at all is correct. 'The driver
> > structure is changing and I want the binding to align with it' is not a
> > reason. Are G1 and G2 actually separate, independent blocks where we
> > could have 1 or both of them? And what about other platforms using this
> > block?
>
> Yes, they are totally independent video decoder peripherals, handling
> different codecs. While I'm not aware that there is a SKU that only
> uses one of them, there is a provision in the fuses to disable either
> one of the VPU peripherals, so they clearly can work independently.
>
> Smashing them together in one DT node was a mistake IMO. Both VPUs do
> not share more than a common power-domain and use the same AMBA domain
> bridge to hook into to SoC NoC. On the i.MX8M Mini we have a similar
> VPU subsystem, but with nested power domains, so G1, G2 and the new H1
> encoder on this chip can even be powered-gated individually.
>
> I agree that the commit message should point out that new DT + old
> kernel is not a supported configuration. It isn't optimal, but IMHO a
> small price to pay for the ability to handle all the i.MX8M* family VPU
> subsystems in the same way with a proper blk-ctrl driver for the common
> clock and reset block and the VPUs being independent peripherals.
>
> >
> > Even if the driver handles the old binding, a new dtb with an old kernel
> > is broken. It's up to the platform to care or not, but you have to
> > highlight that.
> >
> >
> > > > In other words, can we drop the deprecated binding from this file,
> > > > while keeping the support in the driver for legacy device-trees?
> > >
> > > I was trying to represent both the old driver binding and the new one
> > > at the same time.  I thought that's what I was told to do.
> >
> > I don't care so much if we have a schema for old binding. I'd rather
> > have warnings if the binding has not been updated. Eventually I want to
> > be able to test for compatibility by testing DTs with different schema
> > versions. We've got to get to 0 warnings first though...
>
> I'm in favor of dropping the old binding from the schema. New DTs
> should clearly use the new binding and old DTs shouldn't change
> anymore, so validation is less useful there.

I wonder if it makes sense to have a more standardized hantro schema
for all the users instead of one dedicated to each platform using a
hantro driver.  The unified schema could have all the various
compatible flags so the driver still knows which features are
enabled/disabled and it's very clear who all the users are for it. I
would think it could cover both the encoder and decoder variants as
well.  We do something similar for 8250 serial ports.

If so, can someone from the media group suggest the best one to
follow?  Ezequiel suggested I look at the sama5d4-vdec to help reduce
some clutter in the driver.  If that binding is good enough, should I
just add the compatible flags to that and potentially rename it.

adam

>
> Regards,
> Lucas
>
