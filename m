Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E92F81
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 19:16:58 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso29136180otm.4
        for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFKHkdJ/TiTXIjZ61s8CUp/eOXsXcoYTAeerWwPKQQc=;
        b=KKmpmScmGCnRb2n5yZnt15wSgZqeNc0MwejlDkH9XKIhana5b62yO9zea7aBu+wZLe
         tSy29MfzGcHaZSEHJfUP0SlldG5v9kKvlBv8hHNLVEg0aePS9OSgN82ubHM27kFri9Hb
         tbQJq/Wq09mPvKoLP6NyG9tw68Z+rhdbvDDxgWRqEyJXvrnCVGm5mQbgGmvqhQcxvoLO
         E8g/3KaZUhJAbNTwQfZz9wkxCNuyXngN/tnsGSnfgD8yv46FF6QbGzGd2sElgL19Fvju
         fIVs9QsTftssrkCQ72Yvq3521HCcXwPoMfdXzyUQPBwXUP/xELiCjtGmBKOIC1A63Qvm
         LEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFKHkdJ/TiTXIjZ61s8CUp/eOXsXcoYTAeerWwPKQQc=;
        b=LBXrKAlw1dsZQe03MTCzofXXXHn+jnxfFck6o0QKT4gz78NfmzD9ZK4XnVxzrBKyZv
         ZqN7JRdlxa+yzJWXU0gKecf8pYSu07SLHKkrkjCUXx8U9gyRp4pLcyugsrL1GVI6GqFL
         c5Vfm5fyEb6TeGs8+ejUxsWH+P69vnO9DQ4hHmc1xvKOJR4lU0pgwgXYgyF7q/wLnbAr
         FSgvhydRWJeiM2PTeCaWSpysjyowWMb/lcqwqlE1bYZ++O2X3bB3ps3vLMG0+7ukzmZP
         rg5hR6PEseqCX70Uh6OhSUrHQ+iq+lN2GSAVMoawFXfRy81TvW3vtN4vhIm30qdo9C0V
         nJaQ==
X-Gm-Message-State: AOAM533Q8xNVAr+hY1QxG0OcCbO3HqFNJY8iBR/DNrG3VOzC/K2kK6dB
	xp035+Oi+q2IylTkEq6cEZ0/F/tsu3wWtA4Hl94=
X-Google-Smtp-Source: ABdhPJxuiqTLKR0jY2x7Mzae5sGw4GmHH/gcF0XZOd5CvZE0EHQQZPlFqR+JmcV96hu0Lu53i3715OdCAgAsmxky9Ak=
X-Received: by 2002:a9d:3e4a:: with SMTP id h10mr88230otg.252.1619119017805;
 Thu, 22 Apr 2021 12:16:57 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1618785336.git.lucas.p.stankus@gmail.com>
 <54a9eaeaa42d47037b2a07bd933e6dfade745d02.1618785336.git.lucas.p.stankus@gmail.com>
 <20210420193746.GA3632576@robh.at.kernel.org>
In-Reply-To: <20210420193746.GA3632576@robh.at.kernel.org>
From: Lucas Stankus <lucas.p.stankus@gmail.com>
Date: Thu, 22 Apr 2021 16:16:21 -0300
Message-ID: <CACKVXZDtUync4HnScJnMEj=Gh7bukUUpnPrtE0w1PPgCZOHORg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: staging: iio: cdc: ad7746: add
 binding documentation for AD7746
To: Rob Herring <robh@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 4:37 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Apr 18, 2021 at 07:49:51PM -0300, Lucas Stankus wrote:
> > Add device tree binding documentation for AD7746 cdc in YAML format.
> >
> > Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> > ---
> >
> > A minor note about the adi,excitation-vdd-permille property. Jonathan
> > suggested the name to be adi,excitation-vdd-milicent, but I was unsure of
> > the milicent naming. With a quick search I found out that the common way to
> > call a thousandth is 'per mille'[1], but I didn't find any use of it in the
> > kernel documentation. Any thoughts about it?
>
> Seems okay to me.
>
> > [1] https://en.wikipedia.org/wiki/Per_mille
> >
> >  .../bindings/iio/cdc/adi,ad7746.yaml          | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> > new file mode 100644
> > index 000000000000..a2a7eee674ba
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/cdc/adi,ad7746.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
> > +
> > +maintainers:
> > +  - Michael Hennerich <michael.hennerich@analog.com>
> > +
> > +description: |
> > +  AD7746 24-Bit Capacitance-to-Digital Converter with Temperature Sensor
> > +
> > +  Specifications about the part can be found at:
> > +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad7291.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,ad7745
> > +      - adi,ad7746
> > +      - adi,ad7747
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  adi,excitation-vdd-permille:
> > +    description: |
> > +      Set VDD per mille to be used as the excitation voltage.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [125, 250, 375, 500]
> > +
> > +  adi,exca-output-en:
> > +    description: Enables the EXCA pin as the excitation output.
> > +    type: boolean
> > +
> > +  adi,exca-output-invert:
> > +    description: Inverts the excitation output in the EXCA pin.
> > +    type: boolean
>
> 'invert' assumes I know what the non-inverted signal is. Sometimes that
> makes sense, but if you can define in terms of the inverse that would be
> better. For example, for a normally active low signal, name the property
> 'foo-active-high'.

Thanks for the feedback!
From reading the data sheet I couldn't quite grasp what would be an inverted
excitation output, but I don't have a lot of experience with CDCs. Maybe someone
with more experience could help out with a better suggestion.

>
> > +
> > +  adi,excb-output-en:
> > +    description: Enables the EXCB pin as the excitation output.
> > +    type: boolean
> > +
> > +  adi,excb-output-invert:
> > +    description: Inverts the excitation output in the EXCB pin.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      ad7746: cdc@48 {
> > +        compatible = "adi,ad7746";
> > +        reg = <0x48>;
> > +        adi,excitation-vdd-permille = <125>;
> > +
> > +        adi,exca-output-en;
> > +        adi,exca-output-invert;
> > +        adi,excb-output-en;
> > +        adi,excb-output-invert;
> > +      };
> > +    };
> > +...
> > --
> > 2.31.1
> >
