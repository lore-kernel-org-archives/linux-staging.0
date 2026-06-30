Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D23DD526
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845986; cv=none; b=LvURZdOKuxpE2LI7Sq+fPeU5kbBfbNxWF+V/C456DYFZQ9nRsxEVn5CfZ7+Ds28LrxXwXwEAXXCJXlMRKl965lM1qYkMZcuMReNkYXEL52pnfSfLvcXNCSt5jF2ps7MDz4nP6jUp6aah9udmSMos6AP5gO8d7SnwyTJQRZp/wEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845986; c=relaxed/simple;
	bh=TM3lyK9Sb9Y4b0/e2BYwMPDJS+VDqJQGll2tCdyfabE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muUw2WdlKWIHutZz7Xmv7z29/XEQB3gy1jSuD3Xg0ZOwj04uwNWxcynqPgOrxl0mKjCeqqEd3t2DSXoXa3YrovkXhn1l3T5xs5FJ6FU0pmQZ0qPIcRrV0JokM3eozn+k5cO7qOo0mADbUWn6GFKAlg5gnXgjfXcH0H2WsIcCM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDxpe/24; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDxpe/24"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43d3a0dabb0so3135123fac.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782845984; x=1783450784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVDK+7rfTbcz4GcngokUtqAZsOvebPGcWgNYsKQ5g3w=;
        b=HDxpe/24HeNGebZ++eC2TuKdTxWFHCPWEVA9NvZ7qtNxj7E7xVa/FDHVmkDKUAafnX
         VkjRQ9c22yFbea6Y9DwWHl/R3rejhVC+9CoXtSRalwqScA+wDckbVx99LCFtD4/+Wj88
         E7OpGOA4xKQ9eHjUmzGkya8TbDRNvvKBg0tKdKTiaG7Tr6BPQfJS0jtfQwlfoRyObqwb
         B8e6UzePKmeLPT1EUWhS1o56kItN6qIjgurhyjmM9iwJUlHMK+UzGFoA2Jv2muZW+mzI
         y57gx1FGvmR+23neAPdPi7xOw38gj5A7YL2Glqnd9WYG+5ZDuttFN4XtJy7t82zWgnrP
         Y65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782845984; x=1783450784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVDK+7rfTbcz4GcngokUtqAZsOvebPGcWgNYsKQ5g3w=;
        b=jeBd7aU8MqUkd75MfCle7KZSZRk9goNsB5EtaH/pUMw2U1nuvS3vZ6piYa+ek0aFuX
         K784NqIUei1V6elzS7QTbyEdEiGcYGEi0cAQlG4oHMx++wyrdpUxTKom/WjihncOsqzm
         R1sNPPp/BgW/+l5K4xLLodL3TsHowsFa1Q9NWeQfHPO+oL5RzGs4qw17TqTVpE8wDlME
         yg/1nAXMcATrsMi8WpfXvDQx67ypfs/pd7gvfBDJG9EvplMLLrp/YnSbyEJuPjl//OXF
         30CPdwrfp3idUSyXaD7k5XzJ2rWacLCjuNrssJ6nMsKtcVjdrCEi5frLzvRuI50GpkJf
         DjVw==
X-Forwarded-Encrypted: i=1; AFNElJ/WMHVlpaKvG6bZr72Dw30yAyqOIwXAQUplp+Zp/gteLuj8rycZqrlCZYduIAvJMNV+yTDNSrAAXOilSv9x@lists.linux.dev
X-Gm-Message-State: AOJu0YzNHmwsZs05p5v7F9/aVQSSOU3fkGem5MD1l/3eqhRYupV2FWet
	SXlNgBQI427dfAFvCCh+1nof3U6IqkqI79mu2wRWmJs/PCYCPxuOba4i
X-Gm-Gg: AfdE7clJsVZGhkpoit9bLaHhjK3nNJ8d/uBy3qsoBLBK7fwE9regFLHlPR+yGSOO1TR
	86A+8NJys504jJJ80aQKEzsTi3AP/qiVtMPvxDebGnl/Zc81pni49VJj4D9FVffycCWdlfyP+O+
	yFpTPsZQ0E0uKS6/VKFyfP6IVsVg6KErmGROX8wOD3Zxp05EnMKoZ0X1JpXfbo+AgNVcLvFbAcb
	4CDSd26pwKOXjaN7pDmiCL81KMW2MIsKH74AG1bKgOwOIP3GrmpsFgO+GXAV8jEBkhk4gXIzu9I
	ap2Pt7liEXVoCfW/bFlKKB140Y+8zHjUPg0NFOse+9hPcnH4e/S010frSGEcoJ4rAVfg7aNAFhR
	BiE475+VmFnKkZagjyRb6arcrN7BQ+8vRyCuxc6aespZ4rZC/w3LkAeJi6F06aVOJQo/8MgNlUW
	BABQxW
X-Received: by 2002:a05:6871:8b87:b0:44a:f310:407c with SMTP id 586e51a60fabf-44af3106221mr787596fac.15.1782845983676;
        Tue, 30 Jun 2026 11:59:43 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbee3b97sm3008034fac.10.2026.06.30.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:59:42 -0700 (PDT)
Date: Tue, 30 Jun 2026 21:59:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio: split
 gb_audio_gb_get_topology()
Message-ID: <akQSGNfanqg7tzJ5@stanley.mountain>
References: <akOy6ORYkzHxodYU@stanley.mountain>
 <20260630164602.37663-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630164602.37663-1-adi25charis@gmail.com>

On Tue, Jun 30, 2026 at 10:16:02PM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> Split gb_audio_gb_get_topology() into two functions:
> gb_audio_gb_get_topology_size() to fetch the topology size, and
> gb_audio_gb_get_topology() to fetch the topology data into a
> caller-provided buffer. This moves buffer allocation out of the
> audio_gb protocol helper and into gb_audio_probe(), where it
> belongs, addressing a long-standing FIXME.
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
> v2:
> - Store size as size_t instead of u16, per Dan Carpenter.
> - Move the size validation (size < sizeof(*topology)) out of
>   gb_audio_gb_get_topology() and into gb_audio_probe(), before
>   the kzalloc(), per Dan Carpenter.
> - Fix dev_err() format strings so %d is no longer printed first;
>   put it at the end of the message instead, per Dan Carpenter.
> 
> Compile-tested with `make M=drivers/staging/greybus modules`.
> All modified files (audio_codec.h, audio_gb.c, audio_module.c)
> compile without errors or warnings. checkpatch.pl --no-tree passes
> clean on all three files.
> ---

This v2 patch is built on top of the v1 patch which we're not
going to apply.  It needs to be folded into the v1 patch instead.

>  drivers/staging/greybus/audio_codec.h  |  4 ++--
>  drivers/staging/greybus/audio_gb.c     |  7 ++-----
>  drivers/staging/greybus/audio_module.c | 12 +++++++++---
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index be5a2a86b..b45cd257d 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -179,9 +179,9 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
>  
>  /* protocol related */
>  int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> -				  u16 *size);
> +				  size_t *size);
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology *topology, u16 size);
> +			     struct gb_audio_topology *topology, size_t size);
>  int gb_audio_gb_get_control(struct gb_connection *connection,
>  			    u8 control_id, u8 index,
>  			    struct gb_audio_ctl_elem_value *value);
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index e6356643d..2e6f155d8 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -9,7 +9,7 @@
>  #include "audio_codec.h"
>  
>  int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> -				  u16 *size)
> +				  size_t *size)
>  {
>  	struct gb_audio_get_topology_size_response size_resp;
>  	int ret;
> @@ -26,11 +26,8 @@ int gb_audio_gb_get_topology_size(struct gb_connection *connection,
>  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
>  
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology *topology, u16 size)
> +			     struct gb_audio_topology *topology, size_t size)
>  {
> -	if (size < sizeof(*topology))
> -		return -ENODATA;
> -
>  	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
>  				 topology, size);
>  }
> diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
> index 1163cf093..806533f03 100644
> --- a/drivers/staging/greybus/audio_module.c
> +++ b/drivers/staging/greybus/audio_module.c
> @@ -239,7 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	struct gb_audio_manager_module_descriptor desc;
>  	struct gbaudio_data_connection *dai, *_dai;
>  	int ret, i;
> -	u16 size;
> +	size_t size;
>  	struct gb_audio_topology *topology;
>  
>  	/* There should be at least one Management and one Data cport */
> @@ -307,7 +307,13 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  
>  	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
>  	if (ret) {
> -		dev_err(dev, "%d:Error while fetching topology size\n", ret);
> +		dev_err(dev, "Error while fetching topology size: %d\n", ret);

Just leave this one as-is.  It's from the original code.  Although
you added the word "size" so I guess that kind of makes changing it
acceptable as well.  The rule is you're allowed to make minor white
space changes to line you're touching.  So I guess either way is fine.

> +		goto disable_connection;
> +	}
> +
> +	if (size < sizeof(*topology)) {
> +		dev_err(dev, "Invalid topology size: %zu\n", size);
> +		ret = -ENODATA;

I would probably have said -EINVAL is more appropriate.

>  		goto disable_connection;
>  	}
>  
> @@ -319,7 +325,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  
>  	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
>  	if (ret) {
> -		dev_err(dev, "%d:Error while fetching topology\n", ret);
> +		dev_err(dev, "Error while fetching topology: %d\n", ret);

This change is entirely unrelated so it's not allowed.

regards,
dan carpenter

>  		goto free_topology;
>  	}
>  
> -- 
> 2.53.0
