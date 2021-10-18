Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7272
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 12:44:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2162B60FD9
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634561083;
	bh=ZL9e3eGrmC0Ie88Mdfl7fImyjuCu2CkK+jQySL6d3Vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fEb/ro9X8stu6JsxQ19s7Nql6khpCBew2NlcN0uqPCTneHJbHh4ingyenLiTJ53hm
	 Xk0o6HYQnQ7RZDpTZcsNV44YV8cYgdgk30gsCNGXDQedYiP+GTLxRD+vhsNcrWCiiT
	 L/D5U0KYr25v8RpORH5ONyZI+UFQUHrh74H3xZI2tepbSOSC4XTKvdI5f+uHvppFaN
	 fg0bft2EIJlTccfhisYHAjB5gOTeH91I1suTsggXkPRk4I1K9e7j1J7ztz8mwwJw28
	 uv0/X1UU3eGHce4cgZFB+/fsxljmWPXaH8kMf6R0pIMJtdwu8TZqHcXjGI7jg+b8cq
	 aAF0OPqJ50kCA==
Received: by mail-ed1-f50.google.com with SMTP id w19so70426958edd.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 05:44:43 -0700 (PDT)
X-Gm-Message-State: AOAM53029MCXrXLALyCunFvDPQ0BwqaldFPcD70/B109oLNvzF0BmrDb
	C81E7+0tNM8eHSH+SPfsDOl/HyO9x2nu8LL+zw==
X-Google-Smtp-Source: ABdhPJyZG95UI3isnS3/MWtVxqmFLZ5yj0gIsUDVGC6LMmsTKPxQeoYUPwe1Dk/0jlKQ0KM0J8+qp2GHh49zFtVlM7w=
X-Received: by 2002:aa7:c357:: with SMTP id j23mr46215878edr.145.1634561079137;
 Mon, 18 Oct 2021 05:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1634475996-6809-1-git-send-email-stefan.wahren@i2se.com>
 <1634475996-6809-3-git-send-email-stefan.wahren@i2se.com> <1634484570.846584.60704.nullmailer@robh.at.kernel.org>
 <c88489a9-53f3-cae2-48bc-5afcf4ca5256@i2se.com>
In-Reply-To: <c88489a9-53f3-cae2-48bc-5afcf4ca5256@i2se.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Oct 2021 07:44:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6v85jWT+BmU1O1AEsYde+e7LtKCDKBtN1nV+O3KTARQ@mail.gmail.com>
Message-ID: <CAL_JsqK6v85jWT+BmU1O1AEsYde+e7LtKCDKBtN1nV+O3KTARQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: bcm: Convert brcm, bcm2835-vchiq to json-schema
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Ojaswin Mujoo <ojaswin98@gmail.com>, 
	Mwesigwa Guma <mguma@redhat.com>, linux-staging@lists.linux.dev, 
	Scott Branden <sbranden@broadcom.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ray Jui <rjui@broadcom.com>, 
	devicetree@vger.kernel.org, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>, 
	Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 17, 2021 at 11:31 AM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Rob,
>
> Am 17.10.21 um 17:29 schrieb Rob Herring:
> > On Sun, 17 Oct 2021 15:06:36 +0200, Stefan Wahren wrote:
> >> This converts the VCHIQ bindings to YAML format.
> >>
> >> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> >> ---
> >>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 --------
> >>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 47 ++++++++++++++++++++++
> >>  2 files changed, 47 insertions(+), 17 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
> >>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> >>
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/1542230
> >
> >
> > mailbox@7e00b840: compatible: Additional items are not allowed ('brcm,bcm2835-vchiq' was unexpected)
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dt.yaml
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dt.yaml
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dt.yaml
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dt.yaml
> >       arch/arm/boot/dts/bcm2836-rpi-2-b.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-3-b.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dt.yaml
> >
> > mailbox@7e00b840: compatible: ['brcm,bcm2836-vchiq', 'brcm,bcm2835-vchiq'] is too long
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dt.yaml
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dt.yaml
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dt.yaml
> >       arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dt.yaml
> >       arch/arm/boot/dts/bcm2836-rpi-2-b.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-3-b.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dt.yaml
> >       arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dt.yaml
>
> i'm confused patch 1/2 ( "ARM: dts: bcm283x: Drop fallback compatible
> for vchiq" ) of this series should prevent this warning. Was it applied
> before running dtbs_check?

No, so you can ignore this.

Rob
