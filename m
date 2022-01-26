Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BC29CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 06:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643179419; x=1674715419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hzPPq4isgNfFzq9vN+MNEiO/zlWFlWHgofFezQJOQ/Q=;
  b=bQ05hb0Nes1eaiuplrTFhe1wgXeT6lB98cPrKeG/XsokMHGn83dVC3MI
   V5Qk6Oc9Z655ISVX/q6SfzfMljvWIewy3jtyp+Mi8tgwgMWI5EKPqIeGo
   MmYM5v4cdjAZOTs1zeagMcA2QQn7kpgZrx/3pyHZez03xL06lFTNGESbK
   +WmYp5DdWbYW9EZestDMMkFIu5faXzDecYDbdHaDNVodWQEE93/XOIdQF
   5+KastwLBsRfpE8Ova5FUYb15aSMQ+JIi0DoL+pnnMBJXpULEmZ7gUPpn
   /kk45TAuufFE6VyWFwTAiUyHqDwbdj2gPCs0tvZfmx5AXZrY9wydDVBKG
   w==;
X-IronPort-AV: E=Sophos;i="5.88,317,1635199200"; 
   d="scan'208";a="21710555"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 07:42:26 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 07:42:26 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 07:42:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643179346; x=1674715346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hzPPq4isgNfFzq9vN+MNEiO/zlWFlWHgofFezQJOQ/Q=;
  b=SoezRi0go/RoYqZ7DSfpecFGn5iNSoUacCrpgOGSTsjv8BdhtIMqrq4f
   8GQQdc4U8sLgjNa7Lw65J0ryYi6XXF/IwceR/S3KVTi9oQXJrTufL5xPm
   VMCYzKnwKEbOgE2TsJEOxbC6VHuiEjzPJZHnmwO7oHoE/NELrJ1KknR3j
   jWQaEURzvbJf7DP1Zj152W2fjnpzj3bLOBjUNbFBX/ufDxPvrjF8SZcjC
   vhmEq0V72t7MCgA7Kj+tWie15djzWlvYuqUW2Vm2bJypkIIrK/Ne6sAK9
   DjJA8RoA+i3o9sqr/+piRK/fx6sBWwM+M6Tk8RclJQd823SsInpZ7VxkU
   A==;
X-IronPort-AV: E=Sophos;i="5.88,317,1635199200"; 
   d="scan'208";a="21710554"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 07:42:26 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 65492280065;
	Wed, 26 Jan 2022 07:42:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, aford@beaconembedded.com, cphealy@gmail.com, Adam Ford <aford173@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: (EXT) [PATCH V4 01/11] arm64: dts: imx8mq-tqma8mq: Remove redundant vpu reference
Date: Wed, 26 Jan 2022 07:42:24 +0100
Message-ID: <5426078.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220125171129.472775-2-aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com> <20220125171129.472775-2-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 25. Januar 2022, 18:11:18 CET schrieb Adam Ford:
> The vpu is enabled by default, so there is no need to manually
> enable it.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi index
> 8aedcddfeab8..38ffcd145b33 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
> @@ -272,10 +272,6 @@ &usdhc1 {
>  	status = "okay";
>  };
> 
> -&vpu {
> -	status = "okay";
> -};
> -
>  /* Attention: wdog reset forcing POR needs baseboard support */
>  &wdog1 {
>  	status = "okay";




