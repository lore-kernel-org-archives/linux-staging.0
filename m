Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE172
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 01:17:11 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so797586otn.4
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 18:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XEHzbtXC9SGv3p+rZWW31lZL4W4bCoeIEjmW3iiT8EM=;
        b=EE7fYg//QmOgErAu4q3KDYU4EHl+1UwpciqA6YQNaJ7aFVpyVJ0eLJdY/FkUpiPId7
         AdM3LQqk57pdra1bMHUPEkCqNzLDmSPrFy3NKAOAwrIpJ7vObtMEKX2cLYtiXL4ixuVS
         oeoePxQQ0r5DxICDVxMl+GQlVqv1B11FbxB62R+54a5SRGG0ajlNVPtDWHLkiTTFFZ0Z
         WZTErmzB+zxvfGq8ye8h9fFdoqWnqb8DizhFEKBHwl5W2HJ4g/6Gvjqmds/N/5RApTWC
         kJKIGyl8k93NyJ8M3FZ5rDUW8eKwF2kezOt+oax4VUIUhgonAMuDGt7fWG/Kww8QaWtZ
         DBhg==
X-Gm-Message-State: AOAM530/v842lL6gdyzdI/38Dr3C126EoK+zeVy8jNCMjd/IBmz0Blfm
	rlux3ZZSzB/ycXg/ab5qMg==
X-Google-Smtp-Source: ABdhPJzvnfsw5vj8+qJCFSRdy3z+gWAr1zQdU+wI2EZ0149D+ruRFQnz03+14sCvIKuRUTBry0K2dQ==
X-Received: by 2002:a05:6830:418b:: with SMTP id r11mr4821586otu.204.1629249430269;
        Tue, 17 Aug 2021 18:17:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j70sm760918otj.38.2021.08.17.18.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:17:09 -0700 (PDT)
Received: (nullmailer pid 1177455 invoked by uid 1000);
	Wed, 18 Aug 2021 01:17:08 -0000
Date: Tue, 17 Aug 2021 20:17:08 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, devicetree@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, linux-media@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, Lucas Stach <dev@lynxeye.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mmc@vger.kernel.org, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee.jones@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Agner <stefan@agner.ch>, linux-mtd@lists.infradead.org, 
	Peter Chen <peter.chen@kernel.org>, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-staging@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pwm@vger.kernel.org, 
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v8 23/34] media: dt: bindings: tegra-vde: Convert to
 schema
Message-ID: <YRxflCWb9ovs9d7H@robh.at.kernel.org>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-24-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817012754.8710-24-digetx@gmail.com>

On Tue, 17 Aug 2021 04:27:43 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra video decoder binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/media/nvidia,tegra-vde.txt       |  64 -----------
>  .../bindings/media/nvidia,tegra-vde.yaml      | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
