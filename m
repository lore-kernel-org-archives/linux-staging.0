Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704919F420
	for <linux-staging@lists.linux.dev>; Thu, 24 Oct 2024 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754911; cv=none; b=O/J6k6KkHxYadEhg/48xvx1HNfnUSIC9oZyU8khmr7SrlFFGjeY0xhDjI00Yyhd8H/q01Vpnf4jGTNG0nq0IesJ+YGuxpOlSMxJtPIgEPZOGrScecNPhjEj+YDSfIkuffTKg0Z7u4MpI3SrE7XVwk84UDgWu4BR7jbv7GrqkZ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754911; c=relaxed/simple;
	bh=ZtJJpAbqMdpdoXmmBuRnIgoG9V/xCS2Vppl3tp08FS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAVGavgoG5qPCOhV1HgBNLMBPzpp+ttRx+FJzPsS0iF0+QXcpN5t1RNeQ+KX+87GmXfE+bvBnERN2dit+lYl4Mg5CLA6QF/IhqFKV41zpxAvEx8YDydStor0WIulji4Nl/8ZLHRAsrA54uBBfmacNBxvINYlNtiUQ7YfDi5ptis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GNbAzL+v; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNbAzL+v"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so392469f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 24 Oct 2024 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729754907; x=1730359707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxOUrhJfsj2Yyo7Z+zyHQ67FbF1Rk6t8sl02neWyWkY=;
        b=GNbAzL+vbJQT3jJBv2fVyV+lL1lsoJquHjNyJD8LfNBhIDJhyzSkRWhUFL3YzVwpVH
         PBbM6ClSqLs7rti1BFv9JfvdYrxXyrAN+iOibA4zKbh8VWVGcw9MlqwiZD9++bp2MRvo
         ouoSEMk7NNqO8xzvPhBMpO8GxtxXXg6pFoTEjjpOrxKVIyO8t7AdT2udYGisp1jo4cSe
         311YabfMVW4LkDS9YjtKpRQ7Tm/ereMqHe+qZ5X0wQAiqqTuhJMdiCWHjvkDY/tw520a
         w7vkxdI2sNNXnW/82ft4o2Ta5AnhrNTErq41t4SQXYCt70goe0g27jSbS9kLZkJkjDgH
         UtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729754907; x=1730359707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxOUrhJfsj2Yyo7Z+zyHQ67FbF1Rk6t8sl02neWyWkY=;
        b=IYyurRdVGBt5Vxe4XcW8D7RNtDIq64cyZAt28sZfZ7EusiBEUSEd/M9TLhRP7ubF2t
         VwcNn8aen+6cR9hRlY+0mKtDSygVMNgFbXpyLnbzaqr8+s3iHNPgc739v90H6DZd99iX
         XmWdfVI28gqjNBRtnIHqMFpU0KlK/rBYqgw8kpsHV060yZ6yAigl9lPVUd6VJacxjEIk
         3kUocLY1WvPEZGr2a44RUmDSwRn4wRCAYmNV2bzDyOEr2sHXr+zD60zsIEblRQRsOKQ+
         DHRikQBgFHNKWqI+WaGkp9P8ZSfpKr3QvskqWFUiiBiayTH+hzQ8H1S1dx61XUwmfdRA
         xsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA5cU6mHP3mYKMdnPK1Ex3X5a4SDgZNwVrJBv5AAhyTnwotwPQunWUf/CQQm4iE6iB7zGzZEJoyJ/yI00X@lists.linux.dev
X-Gm-Message-State: AOJu0YyH2w7noZuOYYelNcqxbA0K5kJwL/nTz6fZz8hk4aFcCGNqNpJU
	md6l8uszewWxgl/QRsUkAi+eglExr1s8H+aEkicEvU0fau5ghwH8uBNmmo+wGwI=
X-Google-Smtp-Source: AGHT+IEkc14OXpDtF1URWR3t+XH91jps08DOypXXI/ENusMPhUEulRqck3KhgtV8dhuWSr0NvGRsZA==
X-Received: by 2002:a5d:45ca:0:b0:37c:ca01:98e9 with SMTP id ffacd0b85a97d-37efcf00572mr3479995f8f.6.1729754907152;
        Thu, 24 Oct 2024 00:28:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm10668926f8f.61.2024.10.24.00.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 00:28:26 -0700 (PDT)
Date: Thu, 24 Oct 2024 10:28:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: change remaining printk to proper
 api
Message-ID: <f61d8272-4af3-40d6-a333-e7731c3fc5ae@stanley.mountain>
References: <20241023231155.16940-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023231155.16940-1-rodrigo.gobbi.7@gmail.com>

On Wed, Oct 23, 2024 at 08:11:55PM -0300, Rodrigo Gobbi wrote:
> As part of TODO file for future work, use dyn debug api for
> remaining printk statements.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> I didn't use the netdev_dbg() over drivers/staging/rtl8723bs/hal/hal_com.c
> because I noticed now that rtw_dump_raw_rssi_info() and the hal file is a 
> little broken with -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA, maybe we can 
> fix that in a next patch. 

How is it broken?

> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index faa6ed2b320d..5994e574ae99 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -909,10 +909,11 @@ void rtw_dump_raw_rssi_info(struct adapter *padapter)
>  
>  	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
>  		if (!isCCKrate) {
> -			printk(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
> -			psample_pkt_rssi->ofdm_pwr[rf_path], psample_pkt_rssi->ofdm_snr[rf_path]);
> +			pr_debug(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
> +				 psample_pkt_rssi->ofdm_pwr[rf_path],
> +				 psample_pkt_rssi->ofdm_snr[rf_path]);
>  		} else {
> -			printk("\n");
> +			pr_debug("\n");

Just delete this line.

>  		}
>  	}
>  }

> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d18fde4e5d6c..b845089e8d8e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -72,7 +72,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
>  	err = sdio_claim_irq(func, &sd_sync_int_hdl);
>  	if (err) {
>  		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
> -		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
> +		pr_crit("%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
                ^^^^^^^?

regards,
dan carpenter

