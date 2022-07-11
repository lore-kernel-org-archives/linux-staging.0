Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D102F33
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 21:31:18 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-f2a4c51c45so8219262fac.9
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 14:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7n3w5NrYm/9yYQ9V3SfFW9a8qDSCjRoKWMuBQnXHsKY=;
        b=QF2Xg2MtsK/2ZJ5WRBoMc1k5dYw3waxhgvcwNXEs49H04i1zrRJ+XGgvXMp2a3/dBT
         Fj1lxulUt3GWzoOVkCuz5iym2Y/voMfIVC3x25c0CZjmU4zGPUSEM0hgN3bps3Hc1SeL
         dApGt5NcFK7DGw7ubR2HMVGx3DcAT5SRMKIWM3W9SeyYJKOSlkeFGd+hDKh46u3O7BWV
         8QE7GMo6nazUqPpwO1rF9zWL2bcv+Hvb5Y2pfxZzaugVbZSMpo8wxmJUQ5Yzkz7WR29F
         +HE4WZT6U9+R1L7CrOLKRi6wFUIExrp1vfbHOLeDeOk0JAw+OOfHwkRLc2kXPKstqqpY
         9xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7n3w5NrYm/9yYQ9V3SfFW9a8qDSCjRoKWMuBQnXHsKY=;
        b=xNWxzIFMXPcLxH0CjKOGaM/eH2YcBILgAxbUAq5RDSb4YwphyEF+9UFe9Ryktqj1fL
         cYoqdNjOV7D8UHLwUxnZB2AIoK7CwKKSS8XMPvMDYgm2soocOSS1/EFaiAr9tbsFRH68
         nsPS9uRbklPXKXRp5UeV3yQ14Bl7F310E2bJDgGDCa9D1dGtKZ3JhjHj6IIhxPMe5G2D
         RYzDyaXfLaFHdJ6qKux0MCmGWDgpCaAnXzNHTJoNfmw3sUBaCZFkRCj3UXc/JtVmDHEQ
         r/+Gc2iL/r0TfA3aGi3ZseaSe+LzToj6Z4EepEDenw9XNwXM1EoP1cZaIpvrfN3jGepJ
         60tA==
X-Gm-Message-State: AJIora/PwIp5koOKqOTdDIzjJBQogbT0XnAn0T7vlvNNBjMKioO6txOB
	Ca/TpAaNaQhNPe7tsyOjxIQqTg==
X-Google-Smtp-Source: AGRyM1uCR2BXqc5p8Qeh61l5nCwoRNGtIlvjIbxcjNc7ZgDeSlXAzU+yt0Alh5FtkTzmQL4KovhBtQ==
X-Received: by 2002:a05:6870:204c:b0:101:6275:67de with SMTP id l12-20020a056870204c00b00101627567demr196501oad.101.1657575077220;
        Mon, 11 Jul 2022 14:31:17 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id t19-20020a05683022f300b0061c4ceeac81sm1535097otc.49.2022.07.11.14.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:31:16 -0700 (PDT)
Date: Mon, 11 Jul 2022 18:31:11 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
	samuel@sholland.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] media: cedrus: h265: Add a couple of error checks
Message-ID: <YsyWnzdTZ0bC733i@eze-laptop>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
 <20220620175517.648767-6-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620175517.648767-6-jernej.skrabec@gmail.com>

On Mon, Jun 20, 2022 at 07:55:15PM +0200, Jernej Skrabec wrote:
> Now that we have infrastructure for reporting errors, let's add two
> checks, which will make sure slice can be actually decoded.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index cfde4ccf6011..99020b9f9ff8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c

Now that you've allowed setup to fail, I would suggest
to have some documentation/comments on struct cedrus_dec_ops,
to set the expectation/rules for each ops, including the
call paths for each operation, which of them are allowed to sleep,
etc.

> @@ -435,9 +435,17 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  	 * instead of start of slice data. Padding is 8 bits at most (one bit set to 1 and
>  	 * at most seven bits set to 0), so we have to inspect only one byte before slice data.
>  	 */
> +
> +	if (slice_params->data_byte_offset == 0)
> +		return -EOPNOTSUPP;
> +

AFAICS, cedrus_h265_setup is called from .device_run.
We've been discussing control validation before, and I think the
ideal place to do that is v4l2_ctrl_ops.s_ctrl, if that's
at all possible.

Driver's mem2mem device_run are executed in the context
of a work_struct and the failure won't really get reported
up the stack.

>  	padding = (u8 *)vb2_plane_vaddr(&run->src->vb2_buf, 0) +
>  		slice_params->data_byte_offset - 1;
>  
> +	/* at least one bit must be set in that byte */
> +	if (*padding == 0)
> +		return -EINVAL;
> +

Maybe this is something to check at cedrus_buf_prepare(),
when the buffer is queued?

Thanks,
Ezequiel

>  	for (count = 0; count < 8; count++)
>  		if (*padding & (1 << count))
>  			break;
> -- 
> 2.36.1
> 
