Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AF2C80
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 18:26:13 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so88136ote.6
        for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 11:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BQAasxDLRS1u9jevsqz8RUI1IQpuWssfa8XgMkeur6c=;
        b=SdQThctv5OjP4Hr7Cq/VISMad0Lf5K7ESG6UbOM3vUXtNGLF6be9xPbiNEkuAdTlPU
         MJ+S1ZB8+JjCJbRj4uWEg8GfUSEqwDjpWm/caNxI2cZ4RGWT6J4OG6pcZu4DtXz2RJdd
         U63bxHOLJx/wGVggE1orpWNg1IX7BI88nwdVo5flNF4sdS5FHPwMCsYsvqz+g8ElsgIG
         L1PV5HMbG+ivTz+QuOnu4rz7brTwTpAg+95sHNuhVPuhyYPJOpeRgZzh0oUa7/gJ8CyM
         1GrzbN7K9VfKSKcfRAWVH6BtRwjfIJ/+OuWHEiB3FvwHsO93lZ9sElW2Doi8PrWMGUHP
         FVew==
X-Gm-Message-State: AOAM531N3nt41Tn4pWi0M5jOi6857XEEui8DsJtVjUyND0taoUGUp1vh
	R/5HfXnizH20fBcP4n2j/g==
X-Google-Smtp-Source: ABdhPJzrPUgfiX7MCdky9cKW18XrYY61ThSzah9ZAbYUAzImP9lRZ0wTfi2Q4neBpbAQk1qFjQMx1g==
X-Received: by 2002:a9d:72d5:: with SMTP id d21mr4142623otk.181.1634235973111;
        Thu, 14 Oct 2021 11:26:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c21sm728207oiy.18.2021.10.14.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 11:26:12 -0700 (PDT)
Received: (nullmailer pid 3678542 invoked by uid 1000);
	Thu, 14 Oct 2021 18:26:11 -0000
Date: Thu, 14 Oct 2021 13:26:11 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, devicetree@vger.kernel.org, neil@brown.name, sboyd@kernel.org, john@phrozen.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: add dt binding header for
 Mediatek MT7621 resets
Message-ID: <YWh2Q4FA0t2uDZSW@robh.at.kernel.org>
References: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
 <20211006112306.4691-2-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006112306.4691-2-sergio.paracuellos@gmail.com>

On Wed, 06 Oct 2021 13:23:03 +0200, Sergio Paracuellos wrote:
> Add dt binding header for resets lines in Mediatek MT7621 SoCs.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  include/dt-bindings/reset/mt7621-reset.h | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt7621-reset.h
> 

Acked-by: Rob Herring <robh@kernel.org>
