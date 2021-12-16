Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CACC2CA6
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 21:04:44 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso448239otj.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 13:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8/HB4TUr3nuRo2TCTqrXve1tRaQ/uHPqILDzAsNvksk=;
        b=er1IzpCST8i94K3KVs7DQMTYcWNeg5F/jCW6lDhrmhRYOaKucKWv2bXPHXvmHjyUqx
         zovMffjAbpGMmP+UjDzRAx8U/nkNeH0lqkPEoBvEay07n6k1MSChhQ0EtbnZ037/8PZS
         El2XRQSlXSgXVGnB7hwAjl44R9erItNrh+wmVhK7CzlrqbVcR8R0ID5UDf7XVJEOORpe
         e0qbbOedLjkXOn83B8pwxqO25W9/UDnzfmCA0dEf+Jta4fyWe60tRyl55pOx3wOm0yXr
         C8NhaOcG7FlXTkCsvqQWJv0KNnqgzyuce+ckubtfTOjuRNl44o03KeMGsP3vhmRnb2LR
         3+kg==
X-Gm-Message-State: AOAM530+NQz+nGQTMnSwTZ5aHTLwTPxpxHBvJIUxObWc13LGV7ABAEDy
	wJuwWIRQsAA8Ka2k5wkH+Q==
X-Google-Smtp-Source: ABdhPJwaw+XBfHtnkt8e4rQRnSXbJ/pQ1FTRtrA5QLx0viKeJhfPqUxOb6a1KcwopQu6edmYrwZCMw==
X-Received: by 2002:a05:6830:25d4:: with SMTP id d20mr14093835otu.143.1639688684195;
        Thu, 16 Dec 2021 13:04:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l39sm1312887otv.63.2021.12.16.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 13:04:43 -0800 (PST)
Received: (nullmailer pid 753209 invoked by uid 1000);
	Thu, 16 Dec 2021 21:04:42 -0000
Date: Thu, 16 Dec 2021 15:04:42 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, abel.vesa@nxp.com, linux-media@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org, aford@beaconembedded.com, Philipp Zabel <p.zabel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hverkuil-cisco@xs4all.nl, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2 01/10] dt-bindings: power: imx8mq: add defines for VPU
 blk-ctrl domains
Message-ID: <Ybup6sUyFCCNH9hp@robh.at.kernel.org>
References: <20211216111256.2362683-1-aford173@gmail.com>
 <20211216111256.2362683-2-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216111256.2362683-2-aford173@gmail.com>

On Thu, 16 Dec 2021 05:12:46 -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the defines for the power domains provided by the VPU
> blk-ctrl on the i.MX8MQ.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> 

Acked-by: Rob Herring <robh@kernel.org>
