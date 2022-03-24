Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E323A7
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 18:47:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r7so6791018wrc.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 11:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KDJpjxd6iOA3qWDHcyReo9R0utRfpUnP8h7B7fwBi2g=;
        b=e87zEpQK4iYLMGimBXPpFv5rvmLfcvAXMMTgdJiLaj6aGX6arzv1oGlvgiWbrnCR/C
         5jJPKYsPmKeD4boiifP9eQknuYo14FGvhAdoNZlQAOnwAKCGTg7XAr+UfS8B5zTgUJbx
         GdE+wtG0rbK5GJ0MPjV+FmXMPsJPBVM8nm2If+3iCeXZB+gr0VPhrVoPdHlfteu2yGYK
         4LbKXUCueU8GNMzeNWgmrrdGEBkre7op9ko+THvgJKhH2oqjV7Rucjc8qDvnmLwlrOB3
         x0Y8k/QQlR+czljvlgvjjibU5FWNflomnQ8yJ7r+SXxNmEtlnUaqg2NoMkcphv+Yhzoo
         uqww==
X-Gm-Message-State: AOAM5318EX4RUkmvGQskIVGazHxl5j8uyzfUHL1u+8L9Pa+IShZQOTYz
	64wqjb4M9oUxCttfsEh6gaY=
X-Google-Smtp-Source: ABdhPJyosxIuUQaMs6KYbGUBTrKWWFzdvtClypQ8lyIFfEwbQZ22wFQ5SU62O0nK9gFjmopcNxDwPA==
X-Received: by 2002:a5d:424d:0:b0:204:7fc:d6c6 with SMTP id s13-20020a5d424d000000b0020407fcd6c6mr5601658wrr.291.1648147632374;
        Thu, 24 Mar 2022 11:47:12 -0700 (PDT)
Received: from [192.168.0.158] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id bj26-20020a0560001e1a00b0020597757ebcsm2186322wrb.7.2022.03.24.11.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 11:47:11 -0700 (PDT)
Message-ID: <fdf37f73-6b7a-a96d-6a42-35d870c96f35@kernel.org>
Date: Thu, 24 Mar 2022 19:47:10 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220324172647.167617-2-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2022 18:26, Adrien Thierry wrote:
> Add a new compatible string for BCM2711. This is the chip used on the
> Raspberry Pi 4.
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
> Changes since v1:
> - Removed duplicate compatible string for bcm2711
> 
>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> index e04439b3355b..9cb957facae0 100644
> --- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> @@ -27,6 +27,11 @@ properties:
>                - brcm,bcm2836-vchiq
>            - const: brcm,bcm2835-vchiq
>  
> +      - description: BCM2711 based boards
> +        items:
> +          - enum:
> +              - brcm,bcm2711-vchiq

This oneOf here - just to add description which is copy-paste of
compatible - does not make sense. It should be just enum with
compatibles. At least for 2711 and 2835 (and put them in alphabetical
order).


Best regards,
Krzysztof
