Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309AF2CA6
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 21:05:21 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id u74so678699oie.8
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 13:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wBWBDIKDtMNMEZft+TTE9DeJ68Ulb1CH0US1EWQAqhM=;
        b=EC1BrXVeDsPKSCnIYqDzeUP5HjDhWgIILak4sPJlA+BkGm3GJC7OPG3cxP5e2xophW
         4Q4lMQ+x9vVCxan871sVwYbq1uO8QaThIiLCXyGbUnohmirzGwiO3XHxOnrUu905n7gM
         zfvDx+MGSbySXKL0CwrO6LNJCZ/dokCIxvevMT3qxv9KEMnGAaTUG+95yVdnutYtfLUU
         J/ur690CM3eU1GeXz82llp5n3JdKf6WVMoZuDWuAvWmN5lsguS+bnAo6mC1zvQm3yTZJ
         CFIRtHeHnJgL7tswQG/xXLpExylO+1etME6qnr1xC19ehXLgIKtPCFhH5KoJE1y6By1f
         w8lg==
X-Gm-Message-State: AOAM531UIxegSeWX3KLr0GwaLgKaNEIT5rmCcQrmIJGyuhzaTwWsXivP
	cAAgYwGAk9jdma0YOwLDSg==
X-Google-Smtp-Source: ABdhPJzigkqlrgFC4xd4dqm3MxexTeJm4Cz8GKPJf8U5cXT5Ywt3kr4LVr/xc4M6lxP9YQ3P/LxMjg==
X-Received: by 2002:a54:480a:: with SMTP id j10mr5605512oij.34.1639688720371;
        Thu, 16 Dec 2021 13:05:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o10sm1220978oom.32.2021.12.16.13.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 13:05:19 -0800 (PST)
Received: (nullmailer pid 754215 invoked by uid 1000);
	Thu, 16 Dec 2021 21:05:18 -0000
Date: Thu, 16 Dec 2021 15:05:18 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: benjamin.gaignard@collabora.com, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, abel.vesa@nxp.com, linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, aford@beaconembedded.com, Shawn Guo <shawnguo@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, hverkuil-cisco@xs4all.nl, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 02/10] dt-bindings: soc: add binding for i.MX8MQ VPU
 blk-ctrl
Message-ID: <YbuqDr0dRNsfMglV@robh.at.kernel.org>
References: <20211216111256.2362683-1-aford173@gmail.com>
 <20211216111256.2362683-3-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216111256.2362683-3-aford173@gmail.com>

On Thu, 16 Dec 2021 05:12:47 -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the DT binding for the i.MX8MQ VPU blk-ctrl.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
