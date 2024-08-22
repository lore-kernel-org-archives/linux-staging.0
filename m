Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B711CD15
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 01:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724290106; cv=none; b=kC/u+A/b8X7i9PFr3wA80PfOsQQGhjf4JytKDAiSNaWDyftqXGXIs5Hy7MXH02NRaqZ0FHlab3kaEI+u3E7YoZJ1qr/mARvd833MP1p66JrDUXDRu9QN7zG6pv7UClZF2YqKRbWT3puXeuAb4JihvwCOML1UdMDWcmAGaxzZ4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724290106; c=relaxed/simple;
	bh=xzfTTgldfq6EqhWfiyVE070QtZX8+IPYluuroBdLPpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OD0hgUDPrOsyy/36PXlzHkcgyK+OrY/sYYX7AHjZ5IWB9gu9ctXL2QdtUyeoeIFnqYXGjPUVcRgpHo89M8ttkdTrupxzQvoQZIwQ5DpW4vS0oc14ee1lHuVNsyjRxysAixIZqMtgc7h547IJOaok9FcQ6TF1v+IgxG4qWdZ+rBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lkcamp.dev; spf=pass smtp.mailfrom=lkcamp.dev; dkim=pass (2048-bit key) header.d=lkcamp.dev header.i=@lkcamp.dev header.b=bfhAfKoN; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=E1ZXsVDY; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lkcamp.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lkcamp.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lkcamp.dev header.i=@lkcamp.dev header.b="bfhAfKoN";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="E1ZXsVDY"
DKIM-Signature: a=rsa-sha256; b=bfhAfKoNsjXXrf0jEFfm2KJ2qK8kxg3/bRNl9i/wvp3uLguK98v5tOCSLWvSOR+3Qs725D6JK8mad9WiT4ZMyN3SGBQb29k/4i5iuvdklly5FZBdSGnPYHh0WjIav+uttffr8vhb0dqL0XfcuVmNICotIDxxg/h5l8cZpK4jnrFE+xq0BzN3DzBnws5pIuD+xz3CHP/jJgsmdQfxOsueDuOwMRwtlPEPBh6sVLUmXu7LnkY7Wf79bOLKBxuxWGR/E3kGV/WXr5fxqu16uGg+URS78xBOa5mfkWT2eumoGQhPtrns82IsdpbvF23QaEBH8Wr0Y1YyXsE8UMoUQfnRag==; s=purelymail2; d=lkcamp.dev; v=1; bh=xzfTTgldfq6EqhWfiyVE070QtZX8+IPYluuroBdLPpU=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=E1ZXsVDYZDMDcUwPFUbGSckH5c+hcuhroQEbD4mSl5DJf43I2CN9Wa6fBti1amBMaVzoSV20I8HF8+dGzowMkTnhhfP3Ii3nyr+XkCzlnYbzpjoqYvjMZJ1/2kM2xjT1J9MGz+w07p8+HjOOnxPn2yikDsF3GkNa20ZW33tUGtaeIMH1OEGuGkUaZydvOVZNpt2KY8Oyv4L1/L3WkmN65KtfqSeXzkjJAS8nSflVvjqZjlEccnhYaqlBt/+HpAA6TMSou5N6ueXhLW/PsrTYTeprvmyYVJdGwW/XyjQ3cho/GqHiTWxFaepzPcn3a/X+4vvrKWKCosErjixzC83ksA==; s=purelymail2; d=purelymail.com; v=1; bh=xzfTTgldfq6EqhWfiyVE070QtZX8+IPYluuroBdLPpU=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 40598:7130:null:purelymail
X-Pm-Original-To: linux-staging@lists.linux.dev
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -707946825;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 22 Aug 2024 01:28:18 +0000 (UTC)
Message-ID: <781f552c-3f8e-4b70-b73e-3a23da8b329b@lkcamp.dev>
Date: Wed, 21 Aug 2024 22:31:31 -0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: the alignment now matches the open
 parenthesis
To: Wallysson Oliveira <wallyssonryu@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 /home/sholum/Unicamp/LKCamp_Oficina/linux/~lkcamp/patches@lists.sr.ht
References: <20240822002920.11753-1-wallyssonryu@gmail.com>
Content-Language: en-US
From: Gabriela Bittencourt <gbittencourt@lkcamp.dev>
In-Reply-To: <20240822002920.11753-1-wallyssonryu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wallysson,

On 8/21/24 9:29 PM, Wallysson Oliveira wrote:
> The line 994 in the file drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> was not alingned with the open parenthesis.
> 
> Signed-off-by: Wallysson Oliveira <wallyssonryu@gmail.com>

There's a small typo in your commit message, in "aligned".

> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> index 18b948d4d86d..c7ee71c60a84 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -956,7 +956,7 @@ void rtl92e_init_gain(struct net_device *dev, u8 Operation)
>   					 (u32)priv->initgain_backup.cca);
>   
>   			rtl92e_set_tx_power(dev,
> -					 priv->rtllib->current_network.channel);
> +					    priv->rtllib->current_network.channel);
>   			break;
>   		}
>   	}

Thanks. :)
