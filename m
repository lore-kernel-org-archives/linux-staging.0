Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E26FA1
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680539058; x=1712075058;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TUR3EjtNbhZlzWg+BnATQOoTCZuxIFb7QTevEqWMtbU=;
  b=spuBJ8lITJw1eKA2PRbVh4PtXge45sT6U6fXUbi1FtZv8D4GazqNCXpl
   iaWao4SRU7dtSm5Scag3ebKYqnAUSct2xn28J+K81u9qA7RkJB0rsCgvx
   /ZqEphpfN+ClJH5gEwUz2hQb8C0uNgZ4nA0Vq+HSi+QKOVBpallqfpENW
   Z4UoIHEEU3ftig4LlOc7Jkr2r58dKhRm80p624mRQrgJkV2N8RbDNcD/b
   emuDChpAZ4PYFKPidJM3RHCOaPvm3AJeHW/t0kS2x2wM6K2EepUg5DJL4
   nvXDvJloVkoGlwfyLNwN4lHIkPj6FrJDP4aB73ORTDqgnt+kawK9vQVcW
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,315,1673938800"; 
   d="scan'208";a="207937073"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 09:24:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 09:24:10 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 09:24:08 -0700
Message-ID: <3a883f8b-9f28-34cc-84f2-e6efc5186140@microchip.com>
Date: Mon, 3 Apr 2023 18:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/24] staging: media: atmel-sama5d2-isc: Convert to
 platform remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Eugen
 Hristev" <eugen.hristev@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-7-u.kleine-koenig@pengutronix.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230403154014.2564054-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2023 at 17:39, Uwe Kleine-König wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks. Best regards,
   Nicolas

> ---
>   drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index ba0614f981a2..cc744cea1d0e 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -580,7 +580,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
>          return ret;
>   }
> 
> -static int atmel_isc_remove(struct platform_device *pdev)
> +static void atmel_isc_remove(struct platform_device *pdev)
>   {
>          struct isc_device *isc = platform_get_drvdata(pdev);
> 
> @@ -594,8 +594,6 @@ static int atmel_isc_remove(struct platform_device *pdev)
>          clk_disable_unprepare(isc->hclock);
> 
>          atmel_isc_clk_cleanup(isc);
> -
> -       return 0;
>   }
> 
>   static int __maybe_unused isc_runtime_suspend(struct device *dev)
> @@ -638,7 +636,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
> 
>   static struct platform_driver atmel_isc_driver = {
>          .probe  = atmel_isc_probe,
> -       .remove = atmel_isc_remove,
> +       .remove_new = atmel_isc_remove,
>          .driver = {
>                  .name           = "atmel-sama5d2-isc",
>                  .pm             = &atmel_isc_dev_pm_ops,
> --
> 2.39.2
> 

-- 
Nicolas Ferre

