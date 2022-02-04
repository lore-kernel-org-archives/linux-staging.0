Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AD2F26
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 23:16:38 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id t75-20020a4a3e4e000000b002e9c0821d78so6369628oot.4
        for <linux-staging@lists.linux.dev>; Fri, 04 Feb 2022 15:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Noz2S1R2/8Z3d7zvAFyG3K4LlMUyG1rJ009mn97U+i8=;
        b=Exbvgp6Q7E1QwGgwOekLiphKLvxoCBz4JDeE8UmCfG7kQmP47rZWCCroQMuLx5ri8T
         tKwY7KhAgMSZGjfO64oMpKXkGqtUNuHHGxQa4OkTQmfuY9NE4Tlt1HDoofRsEQU9Ibe7
         34lAOWY+pd6YHFSL1U/X0bofWSn7CDwKVlQ8xF363DJqdiDMoi4FOEWzns+ZlIHfYlYr
         iGImZznUbmnywpe3Xsxef5eUnfRVzIeNKaF2x7E7JjHq3TBGQn+f9IoZdw3mN80fOMos
         XhvbmJGhoWmF6fL+XHbFVdX4pKI2R1fZFy2Gj/3xWa87LC829SKbBqZLxUJxWqQpBWMO
         1mNA==
X-Gm-Message-State: AOAM530w8mBhn/snJgt8z/49s2cyHGEt0mPcVyuOR8uWrLs/BMGuIoRB
	GGk6HgVu0pUfzvrvtk6mTg==
X-Google-Smtp-Source: ABdhPJwHobYCqQ9RVCiAPVCUiGgX7dW2gc1hUD+YsotlyWKPy4uONG+pwbHb8zZ+M6FyRw/WrPeW6w==
X-Received: by 2002:a05:6870:87c1:: with SMTP id s1mr328429oam.347.1644016597248;
        Fri, 04 Feb 2022 15:16:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bj8sm1520290oib.20.2022.02.04.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 15:16:36 -0800 (PST)
Received: (nullmailer pid 3365859 invoked by uid 1000);
	Fri, 04 Feb 2022 23:16:35 -0000
Date: Fri, 4 Feb 2022 17:16:35 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, aford@beaconembedded.com, NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Pengutronix Kernel Team <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, cphealy@gmail.com, linux-media@vger.kernel.org
Subject: Re: [PATCH V4 09/11] dt-bindings: media: nxp, imx8mq-vpu: Add
 support for G1 on imx8mm
Message-ID: <Yf2z0wF2KJKmQ4IS@robh.at.kernel.org>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-10-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125171129.472775-10-aford173@gmail.com>

On Tue, 25 Jan 2022 11:11:26 -0600, Adam Ford wrote:
> The i.MX8M mini appears to have a similar G1 decoder but the
> post-processing isn't present, so different compatible flag is required.
> Since all the other parameters are the same with imx8mq, just add
> the new compatible flag to nxp,imx8mq-vpu.yaml.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 

Acked-by: Rob Herring <robh@kernel.org>
