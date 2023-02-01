Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27667E
	for <linux-staging@lists.linux.dev>; Wed,  1 Feb 2023 01:41:11 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1442977d77dso21739784fac.6
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 17:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARcpraQzdyShL/3uOhJbU55iw6ZjqLdVd5dZPXUPPKs=;
        b=0LkBJXsj8s4vKwefHLx0FYm0bMAWW47MBoI0U5aUBCy5alxXHnDHA2p7mGHC9LuGJ7
         f0G0t90AolDaH1AGJLOgOFI0X9olKQgCLoUqJxHUJadlJLAKLk3QVBluNKxd/iPoFdKx
         9XWOPusuC50XIXLd4g4UgyJDuCzOsGpQgT0N3Gkl86HBDNZyAXXrM/0ppty6T0DzR0oB
         4jTQRjb9r/VgbzYIXXCFp0La2b7QT0KKXGaziM7q+jw7NpKae0ShyL6NX9n2s69trT7P
         3+p2FubJpoR+Vzyfo3ZHc1Mr4bp3SkG60B0yyeEdZd9dj4j6VN4p0mLsFdOgM8OaTJoW
         5m2w==
X-Gm-Message-State: AO0yUKXBtC6P3I0XZoSG1+t95calZREUy6B0mMiweQv0JUwno8huDm0K
	k9c8cFo3r9n7gshrLg2Efg==
X-Google-Smtp-Source: AK7set+7vdv8wCpcZTaEjMIlQXTj5qX8pbN6bW9oRbbgZSH7MorUaN+g7rqVEpjZGOJmdPN5Wr2Oyg==
X-Received: by 2002:a05:6870:315:b0:15f:b59a:55f1 with SMTP id m21-20020a056870031500b0015fb59a55f1mr123340oaf.16.1675215670603;
        Tue, 31 Jan 2023 17:41:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id lm27-20020a0568703d9b00b0015f83e16a10sm7267887oab.44.2023.01.31.17.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 17:41:10 -0800 (PST)
Received: (nullmailer pid 2293844 invoked by uid 1000);
	Wed, 01 Feb 2023 01:41:09 -0000
Date: Tue, 31 Jan 2023 19:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sowjanya Komatineni <skomatineni@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Richard Leitner <richard.leitner@skidata.com>, Rob Herring <robh+dt@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, David Airlie <airlied@gmail.com>, linux-staging@lists.linux.dev, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Message-ID: <167521566867.2293789.16573974181219415861.robh@kernel.org>
References: <20230130141603.323221-1-luca.ceresoli@bootlin.com>
 <20230130141603.323221-3-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130141603.323221-3-luca.ceresoli@bootlin.com>


On Mon, 30 Jan 2023 15:15:44 +0100, Luca Ceresoli wrote:
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v4:
>  - complete the removal of 'channel@0'
> 
> Changed in v3 (suggested by Rob Herring):
>  - drop 'endpoint', unneeded as there's no extra properties in the
>    endpoints
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
>  - rename "i2c3" -> "ic2"
>  - add review tag
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 60 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

