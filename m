Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF077B
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 11:34:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j4so7029993lfk.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Dec 2022 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjU7gmeecy9X61DB+8CnNlr7X7DQnou4PN68yDZ7iyk=;
        b=xqC+4AXl8dQjgVXLH4YDTPUBgck4CaGtIFcFIIodspgqI6JcJCxLVhAHZPe1vUKrVU
         KfrFh0eDRyPvq9dCj+aiJWr0WPsIbRMZ+BxpCoCzz4gfxkzT5wMfxkC3sUqqUjVbAZFq
         Ra5tLu6Se62k9Txy16A7+RStF0Eb88H9j+tU8bOfD5g+wGqY++Zya42Y5/zL2oO2VGGL
         jmJJ7ZN9AVIuFmyPEmMv5CHS66NytjOSfylxmQMrHOfSaYAxP6Ym+xvMGNhtLD1FtkOm
         kaD3lO/rprhWd51PwYq6hId/45whAZsU++aApjIxItcaUau3/5izl2rTjCalX6639HC6
         Ev+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjU7gmeecy9X61DB+8CnNlr7X7DQnou4PN68yDZ7iyk=;
        b=KMqbZ0xUnB016rd77bxRQ1cwasyvSrOrIyVymhkXBEvWMoohL9IYH9MlWQZLxDPq2+
         DThTJpfLu9pcqCJzUzME2FuZlPwhU35TSxOPFJbVtVhd+I7wG+N3kLnStlGgqYHlPfnB
         rkTlrS114E/k8bZ2qht+Fg3Xpjj/O9G6qUKw7Fm/F/NRelAqZANLoqScASzvaxk1OAaN
         wIfVQQQm9YejUQE99ktg/WWMdrmh3hsJSQw5Yay/br4e5kVW7ZDWZD1pJW+tUl79HDn1
         sOlSuGiGd2YmqCLJKhCJuoSQlTdlcT816Xxnlu6NLWv+IZZHGNnRA1YWNzogaNK2ptp2
         gY2w==
X-Gm-Message-State: ANoB5pk+88fNHv6r5bUyjApXM7WV0fYWpR9wnwWD598d5uyJXlCLSVY4
	hEnRnr66JBIDozE/KfB1adL+QQ==
X-Google-Smtp-Source: AA0mqf7Pu/NQeIo3r9+lq4/ieJWfM9TAq2n5oJUUrQKDBvMVWk362OTbtxfdjbZaH+0tV6uJgkQsdA==
X-Received: by 2002:a05:6512:260f:b0:4b4:caeb:c9b1 with SMTP id bt15-20020a056512260f00b004b4caebc9b1mr16910934lfb.500.1669980891389;
        Fri, 02 Dec 2022 03:34:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bp25-20020a056512159900b00497a0ea92desm986276lfb.135.2022.12.02.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 03:34:51 -0800 (PST)
Message-ID: <dda27c55-0d95-1407-f5a0-94123298e50a@linaro.org>
Date: Fri, 2 Dec 2022 12:34:49 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-3-luca.ceresoli@bootlin.com>
 <20221201231636.GA1660613-robh@kernel.org> <20221202091117.52a9a8f0@booty>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202091117.52a9a8f0@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2022 09:11, Luca Ceresoli wrote:
> Hello Rob,
> 
> On Thu, 1 Dec 2022 17:16:36 -0600
> Rob Herring <robh@kernel.org> wrote:
> 
>> On Mon, Nov 28, 2022 at 04:23:17PM +0100, Luca Ceresoli wrote:
>>> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
>>> input module. Add it to the allowed properties and augment the existing
>>> nvidia,tegra20-vi example to show a 'vip' property.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>
>>> ---
>>>
>>> Changed in v2 (suggested by Krzysztof Kozlowski):
>>> - rename "i2c3" -> "ic2"
>>> - add review tag
>>> ---
>>>  .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
>>>  MAINTAINERS                                   |  1 +
>>>  2 files changed, 69 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>>> index 782a4b10150a..5b5583c2b562 100644
>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>>> @@ -74,6 +74,22 @@ properties:
>>>    avdd-dsi-csi-supply:
>>>      description: DSI/CSI power supply. Must supply 1.2 V.
>>>  
>>> +  vip:
>>> +    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description:
>>> +          Input from the VIP (parallel input capture) module
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/graph.yaml#/properties/endpoint  
>>
>> You can drop 'endpoint'. You only need port nodes if there's no extra 
>> properties in the endpoints.
> 
> Oh, nice, will remove in v3.
> 
> Krzysztof, can I keep your Reviewed-by after this change?

Yes.

Best regards,
Krzysztof

