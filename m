Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A839E9D4
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428156; cv=none; b=fTaToAA0/Co9r9jTHiI0sptUJlTGy0oY6SmPfQY8elnb/DRD0Y8s1BpYJgcGshnWpeXRBAZbc2hd5ehshH+MwFvmJ364p7qELvLnD4DnB4mcDFS4xDOBbmgeCc0wby4YSgLDnvn6Kyn0N3iKg1tY/ne/NEDirV8uJIO2g7IuujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428156; c=relaxed/simple;
	bh=tcec3sDKMqBqgAYrgEhHY06LBuZ2HogGmYwlwz9vjsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y++2C5Aqo/eSSLtxFhniiPEYsy02LzlQX+zt5WvXXdaS4pT81TAWQ6thPmhR6OoRvalGSy33cKp8CYEe44jCOjjyD0mdipSzMVNN4PusQnjnbm02JPZ4fvU0l0ZIaVZmLqNLO58QTxuVo95FJStHbs+kbQxBO+av4p1HVv8jB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdZul4f8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdZul4f8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49040362e4aso8118915e9.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428151; x=1780032951; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6P8i4+hxrVSvyhHSAfNJJWz98Pd2QFGALJK0/zV9FM=;
        b=BdZul4f8qdEhbyisc+Cub16HgLo2LCa6nqWnELSnguoZKBQydVrdxzlbwd4oII9EtO
         OcrZXGnUN6I7BAZwz79reG25zkMFqhjMEfGNmLtpY2RVRRJV+Ib/zyRL+YCkNXbJPUpE
         Ob1VPZf+FrUxpDppTdI9JX+rTw+zkSb57tRYP0q9WBY9v5HVaB7RKU144gg0It6XVN0B
         TMdvd4w9rOwvTb3KOwBdE61/KaiEXFuGw3ETKvTGSHeS4pqIHFbkWP+WmdCtPmkZ0mIa
         cSSPAHEJ2qQHJkXh+L9IvSTB7So6nP/mIOtURm6T7XK95kGHkHkREky835PIFc3Cv4jg
         DOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428151; x=1780032951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6P8i4+hxrVSvyhHSAfNJJWz98Pd2QFGALJK0/zV9FM=;
        b=frwdO28ixEoI2lFbqggKv0O0NftekRPPEm7in11h7L227K6pkiHRjtDY64qs2ZNc3z
         EcXLe95b60l0QBRB3+aQ4oRlhLw8SrHsKCQkl/60wcqpuQm65MnoqU1boVk8xGRdB+bs
         ogG4SvrlPdliMGrZR1sUfsS6yhVUKuunLiA9j9ZOXKrhRjOUWVP5ymVBNEr3U7hgCEXM
         /EJwgxVPcrcd49gKUlKaFsLLSiLZ65aFybfy/SxiKzDZXTd+Kb06XQhf5LI9nXRtXk2R
         TVMz9NErb3Zl/AMuIwV+1UlcU1xDXjzoGuoZqNPNVy5c6n7k8O7Y5qeH5TZD1/dnFj2Y
         vj1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8uyMQXnEkSNS2c24mTo5KqTiFQ85symGcoFWWHwtYIKz88Pf5hiGlpuWAx1+P6X0AFfOrj72E3qlQr3Yu+@lists.linux.dev
X-Gm-Message-State: AOJu0YxYcerW1P43f6TuRU7LevZ95ynj7aXpcPHCbmG/8OHMrU6HlH0C
	9hOjpw3OhgLvFOn34XbRB2IvM0huxpe8tp9MxfVIL1KcVhc86zD6Pfng
X-Gm-Gg: Acq92OHZFUhkDR2saGD5pitQI5ggjjDPJty9XmQ2I8zNtUupOx2SC8+ASV+TDfEq7+h
	nldX1A+yWnSsPbyVFRCKqmhQYvcc04qxxWswZcDuSsZcQe6PUp3W0dBjK71LVONpjgUBpVtHS7i
	CrsroU4y9XFTY4TD7I3UxLlFfkUNoRW2y5aGzBDb+5qmwOPPvwzavDE90KLsLG/3j2/upkD9tf7
	TNaAtX4Ke7jWUE2z4YkSbjvr7YH3OvxedBOSFlK1kMJhdho4N/+zaR2NLRWlxxA+9j+HMCDn8Zd
	GrpVH7CIsZyl4oNXNbGw7wn961ea02Idqc8KBuY+zaQkRtC3FT6HklVpi3kUUsnPmA54L7WYlgT
	5o4sqFn1nN0EX8hBcTXJBbvkxJ9tD6ETp90Enc5j698KZ9u9pp/hBKJLXgu2BCEAM8EEZ7csOoC
	WidmffRV40J7B66AjDt570fYB8PdLz5eIGfA==
X-Received: by 2002:a05:600c:3542:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-49042482812mr25713405e9.7.1779428150667;
        Thu, 21 May 2026 22:35:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm1148504f8f.25.2026.05.21.22.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:35:50 -0700 (PDT)
Date: Fri, 22 May 2026 08:35:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	m.steinmoetzger@gmail.com, guojy.bj@gmail.com,
	straube.linux@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up if-else logic in
 odm_HWConfig.c
Message-ID: <ag_rMv-4wSNuaeIx@stanley.mountain>
References: <20260522050429.161273-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522050429.161273-1-diegomancera.dev@gmail.com>

On Thu, May 21, 2026 at 11:04:29PM -0600, Diego Fernando Mancera Gómez wrote:
> Refactored redundant if-else blocks to a cleaner else-if structure in
> odm_HWConfig.c and fixed indentation to use tabs as required by the
> kernel coding style.
> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please wait a day between resends.

>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index c88d669cb086..2e47734a0ae9 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -228,18 +228,11 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>  		odm_parsing_cfo(dm_odm, pkt_info, phy_sta_rpt->path_cfotail);
>  	}
>  
> -	/*
> -	 * UI BSS List signal strength(in percentage), make it good
> -	 * looking, from 0~100.
> -	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
> -	 */
> -	if (is_cck_rate) {
> +	if (is_cck_rate)
>  		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
> -	} else {
> -		if (rf_rx_num != 0) {
> -			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
> -		}
> -	}
> +	else if (rf_rx_num != 0)
> +		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
> +

No need for this extra blank line.

>  }

regards,
dan carpenter

>  
>  static void odm_Process_RSSIForDM(
> @@ -437,4 +430,3 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
>  
>  	return HAL_STATUS_SUCCESS;
>  }
> -
> -- 
> 2.43.0
> 
