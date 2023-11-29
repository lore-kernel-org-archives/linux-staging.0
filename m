Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A1510975
	for <linux-staging@lists.linux.dev>; Wed, 29 Nov 2023 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 14AD924E2BA;
	Wed, 29 Nov 2023 15:41:13 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 15:41:13 +0800
Received: from [192.168.125.107] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 15:41:12 +0800
Message-ID: <37f9de03-f058-46db-8c1b-e14239e42b3a@starfivetech.com>
Date: Wed, 29 Nov 2023 15:41:11 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: VIDEO_STARFIVE_CAMSS should depend on
 ARCH_STARFIVE
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jack Zhu
	<jack.zhu@starfivetech.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <81476f48f7774fdd62e95458b160688952bb0068.1701196160.git.geert+renesas@glider.be>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <81476f48f7774fdd62e95458b160688952bb0068.1701196160.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag



On 2023/11/29 2:31, Geert Uytterhoeven wrote:
> The StarFive Camera Subsystem is only present on the StarFive JH7110
> SoC.  Hence add a dependency on ARCH_STARFIVE, to prevent asking the
> user about this driver when configuring a kernel without StarFive SoC
> support.
> 
> Fixes: bba185d141b12787 ("media: staging: media: starfive: camss: Add core driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> ---
>  drivers/staging/media/starfive/camss/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/starfive/camss/Kconfig b/drivers/staging/media/starfive/camss/Kconfig
> index bd184f42c98fa853..9ea5708fe40955e2 100644
> --- a/drivers/staging/media/starfive/camss/Kconfig
> +++ b/drivers/staging/media/starfive/camss/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_STARFIVE_CAMSS
>  	depends on VIDEO_DEV && OF
>  	depends on HAS_DMA
>  	depends on PM
> +	depends on ARCH_STARFIVE || COMPILE_TEST
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
