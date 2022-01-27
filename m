Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D22CA1
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 08:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475C8C340E4;
	Thu, 27 Jan 2022 08:46:47 +0000 (UTC)
Message-ID: <43e29322-fc4d-2c72-86b2-1f41fb05a2f9@xs4all.nl>
Date: Thu, 27 Jan 2022 09:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V4 02/11] dt-bindings: power: imx8mq: add defines for VPU
 blk-ctrl domains
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
Cc: aford@beaconembedded.com, cphealy@gmail.com,
 Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 Adam Ford <aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com>
 <20220125171129.472775-3-aford173@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220125171129.472775-3-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Shawn,

Can you take patches 2-4 of this series or shall I? In the latter case I
need your Acked-by for these three patches.

Regards,

	Hans

On 25/01/2022 18:11, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the defines for the power domains provided by the VPU
> blk-ctrl on the i.MX8MQ.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> diff --git a/include/dt-bindings/power/imx8mq-power.h b/include/dt-bindings/power/imx8mq-power.h
> index 8a513bd9166e..9f7d0f1e7c32 100644
> --- a/include/dt-bindings/power/imx8mq-power.h
> +++ b/include/dt-bindings/power/imx8mq-power.h
> @@ -18,4 +18,7 @@
>  #define IMX8M_POWER_DOMAIN_MIPI_CSI2	9
>  #define IMX8M_POWER_DOMAIN_PCIE2	10
>  
> +#define IMX8MQ_VPUBLK_PD_G1		0
> +#define IMX8MQ_VPUBLK_PD_G2		1
> +
>  #endif

