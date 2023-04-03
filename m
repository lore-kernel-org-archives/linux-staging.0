Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B536FA1
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680539050; x=1712075050;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Jb7mW8GgKs3X7qIWTnQ9maer3rwE4789mQjXaeVBpE=;
  b=lJ3kmhoEy3JkM7jinXdXjuM9+79h3FN3an+/sN2xwOIv6Dxa0ng2XZFT
   PtKHOAIDWeBTLN8AGLIw032iPiBKnkmvUeFgiB5EuFIvx4WpRB+xqhmEE
   MnW3HM1/jrjHOv6y0BiTnUJbDDAwlmHl7sJBQuU3uWpByQ0eWV2pCEcV3
   h1fVJK2diDNFptwTnfBI8I2YSLwDN2RS+QQIJ3OCZNd34YptDKmDdddur
   /E++X8CBaxaeeABZaj5u1W1Cc8PJKn23H7TvholBn+tChj5/Ptj/2blcu
   N5QLuvddGdmagRirl9UrjMqzQM0AygtzdlcaaSLaWarwO0vYF6qyhNlQf
   w==;
X-IronPort-AV: E=Sophos;i="5.98,315,1673938800"; 
   d="scan'208";a="208610422"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 09:23:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 09:23:49 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 09:23:46 -0700
Message-ID: <9ffe89c5-260a-a95e-0e7b-b5eca0b8c050@microchip.com>
Date: Mon, 3 Apr 2023 18:23:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/24] staging: media: atmel-sama7g5-isc: Convert to
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
 <20230403154014.2564054-8-u.kleine-koenig@pengutronix.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230403154014.2564054-8-u.kleine-koenig@pengutronix.de>
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

> ---
>   drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> index 01ababdfcbd9..315bfc4ac4ff 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> @@ -549,7 +549,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>          return ret;
>   }
> 
> -static int microchip_xisc_remove(struct platform_device *pdev)
> +static void microchip_xisc_remove(struct platform_device *pdev)
>   {
>          struct isc_device *isc = platform_get_drvdata(pdev);
> 
> @@ -562,8 +562,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
>          clk_disable_unprepare(isc->hclock);
> 
>          atmel_isc_clk_cleanup(isc);
> -
> -       return 0;
>   }
> 
>   static int __maybe_unused xisc_runtime_suspend(struct device *dev)
> @@ -601,7 +599,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
> 
>   static struct platform_driver microchip_xisc_driver = {
>          .probe  = microchip_xisc_probe,
> -       .remove = microchip_xisc_remove,
> +       .remove_new = microchip_xisc_remove,
>          .driver = {
>                  .name           = "microchip-sama7g5-xisc",
>                  .pm             = &microchip_xisc_dev_pm_ops,
> --
> 2.39.2
> 

-- 
Nicolas Ferre

