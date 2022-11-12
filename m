Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30B6ADB
	for <linux-staging@lists.linux.dev>; Sat, 12 Nov 2022 21:52:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (d5152d7bc.static.telenet.be [81.82.215.188])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D1188B;
	Sat, 12 Nov 2022 22:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668289923;
	bh=z4by1LPPrBEvm+MnM3qkDhLKqex0JxEX/cFb063yd8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgEc2gwHV0e/dellfXFV6tbCzLsjJA+poCAcalC8Ys4Eex9g0/GUZmyiA1sbyqEqQ
	 L1ynVNuWlL5nXqiVitJi57aIsXAqpXbGFwkoZS1u//gD4TYBOW65hybPDS65C1W5hR
	 irT7+o6z1sK8wo7J6u5XgpedBfDMu9fG3F0Xs14I=
Date: Sat, 12 Nov 2022 23:51:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: staging: media: imx: imx7-media-csi: Remove a
 useless include
Message-ID: <Y3AVcTmPf9qmdS5N@pendragon.ideasonboard.com>
References: <e60dea85ea3d91b6d8ccdfc061e1dd39dd52c17f.1668288266.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e60dea85ea3d91b6d8ccdfc061e1dd39dd52c17f.1668288266.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

Thank you for the patch.

On Sat, Nov 12, 2022 at 10:24:34PM +0100, Christophe JAILLET wrote:
> <linux/gcd.h> is not needed for this driver. Remove the corresponding
> #include.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index e5b550ccfa22..cb7d8381f6f2 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -8,7 +8,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/gcd.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>

-- 
Regards,

Laurent Pinchart
