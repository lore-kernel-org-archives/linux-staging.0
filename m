Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66A033ED
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 13:11:50 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id x21so6683600ljg.10
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 05:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWNSpfNgmKIkoqMVV5tmWYlIFYhEHax9TrvGPimvErs=;
        b=v4nFmk80qIBizuw3D1YMYQGM+vnSIvdnLk9TyHIG0in5TwlQhnPkUxZ9S2wEGIO7+5
         NloDoVXNp29Tv+V2Ab46XHQlVhufLDrh990FfdE+BCoIabs2Kjsu5+aPGZVZoHtgLY4E
         Asv3aahR7nX4q3ptImiN2N8+/PiZfDlpXIUl1AV2LXskiukPE0YGDHopQfy42JWo9qrt
         RjcBxuxPFUEZJvL+xxHGOm3mC4odbJeVAynBHG5r5Luy+JASyjK9R5dMYXHe5TtcRUSw
         Bjx+cNlKFLPOsmFRX4yckjQy25Tw2A/rEuh0/jCHDai5aJj3brf0FiV2KlBCDADvWndd
         BnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWNSpfNgmKIkoqMVV5tmWYlIFYhEHax9TrvGPimvErs=;
        b=Zl7/LDmOTAtHdJBpXEhbN0RipXh9+RxYw/HuSK/e6pc4YNFkqHBnI/uLUYNvZ4nbyY
         W8Cz8qmwo7tbOEfVe3bfxQW4vvy9MFBV1dbFXHvED8N43eph48KicEI64ng1GKdM+7hm
         jlVIDzm/1VJ/zFuNvpJx4rZEprojJc/B02UTW2Ue/1kRrR0D/8Y4HcIDt0oRfYfbXyKH
         sJA0pkwgcONNZcNnSWPdw1LzgSVTZWKp5T8/NUMWx7EpqbJHhn6PoM5rypsNWXamTV25
         gWbtv6jRkWz7v+JjeIF4urcYVRd2UsWlZeukEE/FEPsx5hayOmrvhSc83NM1gORdVaHN
         2+Wg==
X-Gm-Message-State: ANoB5pnkTUREqFsqMmbXPgoUeNxyTi3CuUDdHZUVedbhrhYvglG/NgBt
	Ec/Om2/N7ufzE9pEDbdIpUq9VA==
X-Google-Smtp-Source: AA0mqf5PKOpsepLXZQM4MZvGilr6TDpkzUoFgDlnpUqKg2bm3LymDyhlqEiF6bM8W2n4RIlehziIUw==
X-Received: by 2002:a05:651c:178d:b0:278:a59c:390c with SMTP id bn13-20020a05651c178d00b00278a59c390cmr2455317ljb.512.1668777108719;
        Fri, 18 Nov 2022 05:11:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n4-20020a195504000000b00492ce573726sm661503lfe.47.2022.11.18.05.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:11:48 -0800 (PST)
Message-ID: <5292cc1b-c951-c5c5-b2ef-c154baf6d7fd@linaro.org>
Date: Fri, 18 Nov 2022 14:11:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/23] dt-bindings: display: tegra: add bindings for
 Tegra20 VIP
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-2-luca.ceresoli@bootlin.com>
 <ca5f3b54-25bd-4dd5-799f-c7bda08cdef6@linaro.org>
 <20221118100800.4950aec0@booty>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118100800.4950aec0@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2022 10:08, Luca Ceresoli wrote:
>   description: parallel video capture interface for the VI
> 
>>> +    type: object  
>>
>> Do you expect it to grow to more channels?
> 
> Not on Tegra20, it has one input only, but for other SoCs it's likely.
> Definitely some (including Tegra20 itself) have multiple CSI-2 inputs,
> and it's reasonable that this can apply to parallel input too.
> 
> Is this enough motivation to make room for more channels, or should I
> remove it since I have no plans to introduce support for other Tegra
> chips?

The best would be to add some more Tegra SoCs here, so that this @0
makes sense.

But I guess the block can be re-used in future, so it could also stay
like this.

> 
>>> +
>>> +    properties:
>>> +      reg: true  
>>
>> const: 0
>>
>>> +
>>> +      ports:
>>> +        $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +        properties:
>>> +          port@0:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description:
>>> +              Port receiving the video stream from the sensor
>>> +
>>> +          port@1:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description:
>>> +              Port sending the video stream to the VI
>>> +
>>> +        required:
>>> +          - port@0
>>> +          - port@1
>>> +
>>> +    additionalProperties: false
>>> +
>>> +    required:
>>> +      - reg
>>> +      - ports
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - channel@0
>>> +
>>> +# see nvidia,tegra20-vi.yaml for an example  
>>
>> That file does not have this compatible. At least not on next-20221109.
> 
> It's added in patch 2. It's a chicken-egg problem, should I add a third
> patch that adds this line only?
> 
> ACK for all other comments you wrote.

It's ok.

Best regards,
Krzysztof

