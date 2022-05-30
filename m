Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6A28F9
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 11:22:38 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id gh17so20201257ejc.6
        for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VZHUKR0IHFYL6ayBsErLDOGwzJgu/d6jiiX5vyOAisk=;
        b=mmUekXcDdIYDwa8P28lVVVA4ROxj0K0LQApMxt/O+OwKivkZoQhq25Iewy6XW4NSDK
         SaC8x5h8gNzwDgGqVmkguXtzuFnYy1vreELcw8s/HudqCmc0NysaQX8pRnjBzHBUnyD0
         x+ydUgrdKKFvwQ5k2nfwVM9br5ezdckE2ddT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VZHUKR0IHFYL6ayBsErLDOGwzJgu/d6jiiX5vyOAisk=;
        b=IfxlEpy8TMrWoBQAKKyPkRWRgIi7Wxt7XECw+8Xu33vq53M9zqcJhqhMpP2krbMNiH
         WItQhHPh5VSsAQPlDgs3iTKIIYBbiYe5+fJQ5sW6ZRk0CFfRqZpgdR1epj75msa4s6j6
         kHxd2in2rJJ9FbN8R+3Y90vBEezyuS2hiHi3sjjhbQX3VgK9GUICOv5X2Fm3USHPkiPs
         Sd+I9mJAxGdUVKAwoqJoVVwLjjCCuCptU7oPAwo4LBGRIS2NAmDPGVkS8scxbvUD0zbN
         cg1WJSPBJZsU/drQtsW9UZ1BCpu5folDEO/kyEdlJX2BOTQYZIMKIrICI+tQdb2FCyv0
         0IKQ==
X-Gm-Message-State: AOAM532YhEMmuC8SDtQb9BNWL44w72qd6uwb6PIoO+mgVyVd/7pvBZ8M
	JBgZTefObixFxe+NDjLTqABGug==
X-Google-Smtp-Source: ABdhPJwJfyWVmxcwcnbxwax6buYE4Db4h473DEuVne798zPPEEF10yoIJqDMpJr3tb9Vmq0YXzQIMQ==
X-Received: by 2002:a17:907:9895:b0:6fe:991e:efe3 with SMTP id ja21-20020a170907989500b006fe991eefe3mr47246097ejc.74.1653909756465;
        Mon, 30 May 2022 04:22:36 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-2-39-143-183.cust.vodafonedsl.it. [2.39.143.183])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090646cb00b006fee7b400e6sm3807355ejs.111.2022.05.30.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:22:35 -0700 (PDT)
Date: Mon, 30 May 2022 13:22:32 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp-mt9m114: Fix pointer dereferenced before
 checking
Message-ID: <20220530112232.GB99280@tom-ThinkPad-T14s-Gen-2i>
References: <1653897481-25681-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653897481-25681-1-git-send-email-baihaowen@meizu.com>

On Mon, May 30, 2022 at 03:58:01PM +0800, Haowen Bai wrote:
> The info->data is dereferencing before null checking, so move
> it after checking.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 00d6842c07d6..3c81ab73cdae 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -616,13 +616,15 @@ static int mt9m114_get_intg_factor(struct i2c_client *client,
>  				   struct camera_mipi_info *info,
>  				   const struct mt9m114_res_struct *res)
>  {
> -	struct atomisp_sensor_mode_data *buf = &info->data;
> +	struct atomisp_sensor_mode_data *buf;
>  	u32 reg_val;
>  	int ret;
>  
>  	if (!info)
>  		return -EINVAL;
>  
> +	buf = &info->data;
> +
>  	ret =  mt9m114_read_reg(client, MISENSOR_32BIT,
>  				REG_PIXEL_CLK, &reg_val);
>  	if (ret)
> -- 
> 2.7.4
> 

Hi Haowen,
Looks good to me, thanks.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
