Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A452C80
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 18:27:18 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso7699858otl.4
        for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 11:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jGWC+lR+wYDbVMT1L1ZZC3h5YgJZrg1Y2aF9+H5HLgM=;
        b=FQUu6bJs2dxcW46HAOuIKrzuwCQqLjY0VDg7Cb8xx5cS676ZegjOiFLRwby9aKT+cc
         8hGJaqSH7I/l+4wECKVTSabUoLNfPbiK60IHKfOfDLgDCYvf0DjOKISdt7ND1a+Lq2/J
         pnvlmcvYOe4f8SGRzirhl1JgbJzmkCwrY9g7Gm7Jc7+gv8E5wFWVcvMl6MYtDub+nCvM
         bav0/rWW5+aXOqoOC4+Edz3239WaFYYMA41xmHjz+dwU3faBf4QSaAEt8q/29jD4DQzZ
         7e51pBYFnUA9gRtXUONk0AcZemdUy7vbrCg0IxSNHnDBgEfQPud+9COIxPtjrohpO9PZ
         1mVg==
X-Gm-Message-State: AOAM5310OTfEDowYJpCntcT59QfNIMuRf4ESyWBfuDDJy0CWR0Ati83J
	rKFc7ejO+JMUdoB2ejORBw==
X-Google-Smtp-Source: ABdhPJxq1tjfJ4eSnrpN3v3d8W+/LguMMn1W0plg0+QEbNeXwX6LOWFGzG6Lh/sveYBHYh+4NFca3w==
X-Received: by 2002:a05:6830:58:: with SMTP id d24mr3993873otp.22.1634236038219;
        Thu, 14 Oct 2021 11:27:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v13sm765599otn.41.2021.10.14.11.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 11:27:17 -0700 (PDT)
Received: (nullmailer pid 3680304 invoked by uid 1000);
	Thu, 14 Oct 2021 18:27:16 -0000
Date: Thu, 14 Oct 2021 13:27:16 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, john@phrozen.org, sboyd@kernel.org, neil@brown.name
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: mediatek,mt7621-sysc: add
 '#reset-cells' property
Message-ID: <YWh2hMwNMxwNWeBu@robh.at.kernel.org>
References: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
 <20211006112306.4691-3-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006112306.4691-3-sergio.paracuellos@gmail.com>

On Wed, 06 Oct 2021 13:23:04 +0200, Sergio Paracuellos wrote:
> Make system controller a reset provider for all the peripherals in the
> MT7621 SoC adding '#reset-cells' property.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-sysc.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
