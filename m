Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0D3FC9
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 18:23:21 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id j13so4412902uaq.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 11:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hK4OhSiTNsNfjE6KJ9kkf4rjTqcI5urGy7xo3IPDC3A=;
        b=Q69CYp0o33+bNhPhgJw6tfQEU2jevmksNOnLa45BJW4J860ZLdd5As8XnBiijsgNxl
         9fPQdXYUniDiNOBhPJuO7PUM16sHw4NDcviTLntp3swnZ8DAJywhF/lmbmrUSWqIZJNF
         XMvzN8O0geUzG58BQFhfCMZPNXjRXZRTnOV/NM9zVAApRYCNrGV131CpOlTlfvfeMS9J
         8S7/QdGD9jwNWl1W00hdv/q3B/EkrS3gIYF/3V7iUf6zDtjARM979ySKNfJT12HngGKU
         Lf0IGu5hOQ6HwLNVwR+MLbt5KKe/IRnx2UJIAxZgrmmy4U/Mjkvep7lhg00ICW5yijUa
         NZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hK4OhSiTNsNfjE6KJ9kkf4rjTqcI5urGy7xo3IPDC3A=;
        b=55Gc7E+QC43wzAYv+VFs9+Klp85xgXcrPpXVESxAQVhyLVeA5o7JHbTJj/Pm8ze7vx
         LVK+nfI6ywcIlWqLm+XdKP98KrMp/H9QNj7v58tX2BvUrl6o1Il9J0Qm71llSGdHOgnC
         0Xc0nd4vPOnApUlFOnhUzbgi2uH70qZAzO2OW7FlkB4ky3xty555zl0DvXJLcZfapHjH
         qM3cVfmWI6uvCBCasFIC1NmHZvT/kXge/nkKIUQ2XxRg9fyGv3X6NleIwd87NL//9ziC
         n+Tx6Wv161gtbPuE0jdQD0gSQbjgtCHhBrjCcjrERQAF/llZEzGGsMKKI3omHxfU7QDz
         kTSQ==
X-Gm-Message-State: AOAM530iKNfNH3ZKJPoYkEow3Iz5ADK+MizBKP7eKUTld/zxrnDEEL/h
	VJ+feCPQ35tLw4bx9H8cdCYPRvEU+1RIRB8dG4c=
X-Google-Smtp-Source: ABdhPJwnjNUHh5SCs2J6EKDd+0hWKi+8Yf7wGYGlpYeVF/BzjvF24T+BLeEgDVKFumFPqVNBHKKdnwmMLny4AzCRO9A=
X-Received: by 2002:ab0:5548:: with SMTP id u8mr8021640uaa.0.1633371799913;
 Mon, 04 Oct 2021 11:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
 <20210926145931.14603-3-sergio.paracuellos@gmail.com> <YVtCtGcLjNcO2NJ0@robh.at.kernel.org>
In-Reply-To: <YVtCtGcLjNcO2NJ0@robh.at.kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 4 Oct 2021 20:23:08 +0200
Message-ID: <CAMhs-H9TDEWEffDn7hBQxT127RNU4eUtPxaSciuiis0fPqTN_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt: bindings: add ralink RT2880 resets device tree
 binding documentation
To: Rob Herring <robh@kernel.org>
Cc: linux-staging@lists.linux.dev, John Crispin <john@phrozen.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Mon, Oct 4, 2021 at 8:06 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Sep 26, 2021 at 04:59:30PM +0200, Sergio Paracuellos wrote:
> > Adds device tree binding documentation for resets in the ralink RT2880 SoCs.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/reset/ralink,rt2880-reset.yaml   | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml b/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
> > new file mode 100644
> > index 000000000000..88eddeb4ee45
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/ralink,rt2880-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ralink RT2880 Reset Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +description: |
> > +  Ralink RT2880 reset controller driver which supports the SoC
> > +  system controller supplied reset registers for the various peripherals
> > +  of the SoC.
> > +
> > +  See also:
> > +  - dt-bindings/reset/ralink-rt2880.h
> > +
> > +properties:
> > +  compatible:
> > +    const: ralink,rt2880-reset
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +required:
> > +  - '#reset-cells'
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/reset/ralink-rt2880.h>
> > +    rstctrl: reset-controller {
> > +      compatible = "ralink,rt2880-reset";
> > +      #reset-cells = <1>;
>
> How is this h/w controlled? If this is part of a system controller, then
> it needs to be documented as such. IOW, you need to document the binding
> for the whole block.
>
> Do you really need a child node here? All you need to make a system
> controller a reset provider is add '#reset-cells' to it.

I am just documenting what is already mainlined (see [0]) in order to
get mt7621-dts out of staging at some point of my life. What am I
supposed to do? Should I rewrite all already mainlined code? Because
if that is the case we need to rewrite tons of things from the ralink
platform...

I'd also like to know what we should do with those nodes already added
to the dtsi file that have not got associated compatible driver
mainlined. Can we just get rid of them?

Thanks in advance for clarification.

Best regards,
    Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/reset.c

>
> Rob
