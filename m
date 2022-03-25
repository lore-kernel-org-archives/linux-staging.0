Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E6B46A1
	for <linux-staging@lists.linux.dev>; Fri, 25 Mar 2022 07:16:44 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id bg10so13592305ejb.4
        for <linux-staging@lists.linux.dev>; Fri, 25 Mar 2022 00:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=6YHRcsHOFCm3E4C9FykKyoJxe7PYRENyIsb3tXOaP5I=;
        b=MJ7AY+PpZLP6wcI+djrFmEcl7GcnaK1295f3AIjMtxbte2BZiOGkbTYaqo760Cbnus
         pnBRVWqvYZr59Fukw5G6s9b1de0UQ7sX3zg1fhojr4LecvGoOx3cD+ujKJ54g2DwnQaz
         fgV7Ey9+PEz05xoflx5mJl9BAQ+eFa3OJSIY2/ZmIPQi09QT3Hca88/R1a83MNULETeV
         ykuelv7v4tCR2Czq0ZC5YCsXyHOQTtTq+ssWViUp3Sc72kscqK3QhDfzvblqW+j5miUj
         Z7GNSes/8QYnnGyaRg0eBbTZI+4kJV1n+HldD9GenkQqv8bKi503QCStw6u7G9hT+jBD
         cQ9Q==
X-Gm-Message-State: AOAM533vJgzbrYBAxHG7uUH7BmYtBYgzgCbFxSFUOdtel75IxjX2oqYx
	2bPaJ9d2l5jZk/xPbKR1Law=
X-Google-Smtp-Source: ABdhPJzPzXLNwxYfju2wh9vwGi8cPlhGKuDBZCqBi7gSMRDLYWMBkqfgbdWQbnsDEtFpPc5+JuVk0A==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr9906155ejc.712.1648192602385;
        Fri, 25 Mar 2022 00:16:42 -0700 (PDT)
Received: from [192.168.0.158] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id ga5-20020a1709070c0500b006de43e9605asm2015052ejc.181.2022.03.25.00.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 00:16:41 -0700 (PDT)
Message-ID: <2c6b873f-a971-e79a-6a32-f101bda46e93@kernel.org>
Date: Fri, 25 Mar 2022 08:16:40 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: bcm: bcm2835-vchiq: Add support
 for bcm2711
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrien Thierry <athierry@redhat.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Stefan Wahren
 <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gaston Gonzalez <gascoar@gmail.com>, Ojaswin Mujoo <ojaswin98@gmail.com>,
 linux-staging@lists.linux.dev
References: <20220324172647.167617-1-athierry@redhat.com>
 <20220324172647.167617-2-athierry@redhat.com>
 <fdf37f73-6b7a-a96d-6a42-35d870c96f35@kernel.org>
In-Reply-To: <fdf37f73-6b7a-a96d-6a42-35d870c96f35@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2022 19:47, Krzysztof Kozlowski wrote:
> On 24/03/2022 18:26, Adrien Thierry wrote:
>> Add a new compatible string for BCM2711. This is the chip used on the
>> Raspberry Pi 4.
>>
>> Signed-off-by: Adrien Thierry <athierry@redhat.com>
>> ---
>> Changes since v1:
>> - Removed duplicate compatible string for bcm2711
>>
>>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml      | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
>> index e04439b3355b..9cb957facae0 100644
>> --- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
>> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
>> @@ -27,6 +27,11 @@ properties:
>>                - brcm,bcm2836-vchiq
>>            - const: brcm,bcm2835-vchiq
>>  
>> +      - description: BCM2711 based boards
>> +        items:
>> +          - enum:
>> +              - brcm,bcm2711-vchiq
> 
> This oneOf here - just to add description which is copy-paste of
> compatible - does not make sense. It should be just enum with
> compatibles. At least for 2711 and 2835 (and put them in alphabetical
> order).

Actually, judging by your driver and DTS, it seems that this should be
list of items bcm2711 followed by bcm2836.


Best regards,
Krzysztof
