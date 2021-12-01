Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9672C80
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 21:57:55 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so37250863otj.7
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 13:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=//K6WrNNdMpHYOkOWh74IhNe5APWD9tbaI8fuCB3qaM=;
        b=d8HkKS0x6tL4rZgvTjK/X87KfzX1asp/nI20i91ukh0WJ2oO14hytBc5Eq/LKpypX2
         d30xy5Nz5gVQA97FnrKvmyAWnkn00I0+Dlncl5UGyK8aTImoHD2XJOt7ADRZeYqr5PWq
         kpfmHP8ZY0r7wIk/O1P0zfrFUtWjUBOdVQJn52eYazTBWf12MxSKZSHC0WD8VFFfJt2w
         xSatrr7FF2gHDJ+jRnh/WvhbQu7fwpn59qAdjba795Ry4vo0aRmTzs3w6OIPZDvRwiah
         5OUWQ6Tcu9eoPzde8C43pXmt1gZe/wUQVS0/OstSYEs02Zmdo0ggDrTU/YbN3gLt04gW
         xd1Q==
X-Gm-Message-State: AOAM531RXeAosUQUH6U1Ms8ecoYCw8KfKBEG0djb0j/3pxLJ/fvXlhu4
	93p8mBx5ea3ndBQk1nuxpzUXLTF6Bg==
X-Google-Smtp-Source: ABdhPJxU0ByCUmBkqgOAJ1D4kaYrkltxru1tMYSyrRfbzYfu6ugRNzCqfZ2w09Xc+nuehdoGMGvvQQ==
X-Received: by 2002:a05:6830:4391:: with SMTP id s17mr8280415otv.118.1638395874824;
        Wed, 01 Dec 2021 13:57:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u136sm479201oie.13.2021.12.01.13.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 13:57:54 -0800 (PST)
Received: (nullmailer pid 2750212 invoked by uid 1000);
	Wed, 01 Dec 2021 21:57:53 -0000
Date: Wed, 1 Dec 2021 15:57:53 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: maxime@cerno.tech, linux-fbdev@vger.kernel.org, robh+dt@kernel.org, dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev, david@lechnology.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] dt-bindings: display: sitronix,st7735r: Remove
 spi-max-frequency limit
Message-ID: <Yafv4ZJ1gDWgWDT5@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-4-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-4-noralf@tronnes.org>

On Wed, 24 Nov 2021 16:07:54 +0100, Noralf Trønnes wrote:
> The datasheet lists the minimum Serial clock cycle (Write) as 66ns which is
> 15MHz. Mostly it can do much better than that and is in fact often run at
> 32MHz. With a clever driver that runs configuration commands at a low speed
> and only the pixel data at the maximum speed the configuration can't be
> messed up by transfer errors and the speed is only limited by the amount of
> pixel glitches that one is able to tolerate.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../devicetree/bindings/display/sitronix,st7735r.yaml         | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
