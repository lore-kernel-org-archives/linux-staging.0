Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44373FC5
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 19:49:16 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso9733538otr.13
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0KsoWtKkhaXMiBJDC0/XxZwnXXQWFGw8B4mYJMIPHr0=;
        b=MqitZGHalLjkzj4n0XLkGxxrrv0AtQP7jx5zO7svuzebLG9N+/e/2twxC1uIzW19TR
         mwNXV0atgH/i53tFEEYFvFh+hZ6q78Oxko+Xr2KgohgBq1dDycJUvSseSUzWwGjKEbfl
         aFyIPPAP3I5TmAUnMZ+++7mKj5uRdmXpLDDWZHjt4twd/QUUkSNlvhewOuzb5NDsi1ug
         /nNXpLyPaTNrdysQLp6nXECsmv3wx+TsLKchJg9MlCAOiMC+WUwPSfJO4Bf2/wKbgfie
         bzI6mSBpz68bUgna+KF6nJPSHPSq5svhuekbVe83xGnjQYDoKYJAR9XZOY/QsqrXec4Y
         DiMQ==
X-Gm-Message-State: AOAM532eJD3GSHbMgwt8vlaZ5sdHnzpYJdGjcgU2i2Xu5xH52ocOxjFg
	3u3gP3p1TYvCSjJRZBEU8A==
X-Google-Smtp-Source: ABdhPJxEEp/Qsw3alHt8zhmxwHRpVnbr0IilY/Bi03MDyZNTmeQPJrTz7p+nPBP14eKxCi6oX/vdRA==
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr6143201otj.306.1631821755916;
        Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
Received: from robh.at.kernel.org (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
        by smtp.gmail.com with ESMTPSA id z7sm948074oti.65.2021.09.16.12.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
Received: (nullmailer pid 1377102 invoked by uid 1000);
	Thu, 16 Sep 2021 19:49:11 -0000
Date: Thu, 16 Sep 2021 14:49:11 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Lucas Stach <dev@lynxeye.de>, linux-mmc@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org, 
	Lee Jones <lee.jones@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-tegra@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-mtd@lists.infradead.org, 
	Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-spi@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 08/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
Message-ID: <YUOftwuVt7EqtA5I@robh.at.kernel.org>
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-9-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912200832.12312-9-digetx@gmail.com>

On Sun, 12 Sep 2021 23:08:06 +0300, Dmitry Osipenko wrote:
> Memory Client should be blocked before hardware reset is asserted in order
> to prevent memory corruption and hanging of memory controller.
> 
> Document Memory Client resets of Host1x, GR2D and GR3D hardware units.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
