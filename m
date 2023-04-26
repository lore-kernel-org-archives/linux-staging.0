Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D221FA7
	for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682510895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7D6zQfSRqsoWm7uFzM+H07JsF/GP5PB8m9+w162O14=;
	b=AqQuqGteskqnnE0IdwsgaTljZLsEH9Yb1z0bVnS/gAVRgYQGGgvJ+1UEmGR5COg1mN9ESG
	paEUJRgq7lkArz1lFlbOVE6hhqYvBMOkCW+kXYPNqMliGO1DvNP9AwX7mODuhpNhIXrfwR
	909M2gPrlJD+yGeakajIj1oGGJDoue4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-fO0G1KI2Mx6cl3Nlw867Dg-1; Wed, 26 Apr 2023 08:08:13 -0400
X-MC-Unique: fO0G1KI2Mx6cl3Nlw867Dg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9534238ffa6so760676266b.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 05:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682510892; x=1685102892;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7D6zQfSRqsoWm7uFzM+H07JsF/GP5PB8m9+w162O14=;
        b=CmAyZa31Y7O/I887KcouFkU6NRJ93aM7Mife8hr0xfNGDuGFGhoQnOiI65n9MiJgUA
         JSpZQBSUmEHdmZ2XS0772l7Rq+UwUgeBfybiQU1r9nHHHqzBrhK475qnRz8H0lgBVr53
         2tHV2e+PXNTmWQ5NsVCo9m40coSbOOvk/0OIbr0QPUP2FNnR+q+orQHl+/b7zHu1tb0f
         OaA/9Dp1GKsN5Dp6dnm4V6CDWZxA009/nuZghezgXuP8gH6A0M7dytR/EMjykF9HJ9+u
         wllAZOrxqXAwGMQ5tGAIxKoXd2OZ2zHwQTTd/GlI+UeBueqkDpfnxWFSqDukI/W3R3II
         Uv7Q==
X-Gm-Message-State: AAQBX9cV4ymFeIkpPuKKsQiD5ZGJA2mgQBPRm6lvkBGwk/Ve9g6BlPwr
	hEK4EWWCsQvDkSoYo8ZM7z+MdHMQJvKc/ia7HBNqyNDDEXDalJgQPvEs8kZWSrjEE6Wd60QiGqr
	hgn7JTmzxCEpuJMJomZEuozP/Ig==
X-Received: by 2002:a17:906:241b:b0:953:7e25:2156 with SMTP id z27-20020a170906241b00b009537e252156mr14918997eja.51.1682510892653;
        Wed, 26 Apr 2023 05:08:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVe/Rpq76BfRZ+RUKpA1mwy2wgqhwR+8AnNZW60yXZAB0BoQPcCcbuoZhpgW2PjnKPj0ATxA==
X-Received: by 2002:a17:906:241b:b0:953:7e25:2156 with SMTP id z27-20020a170906241b00b009537e252156mr14918974eja.51.1682510892344;
        Wed, 26 Apr 2023 05:08:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id pv22-20020a170907209600b0094f0025983fsm8191204ejb.84.2023.04.26.05.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:08:11 -0700 (PDT)
Message-ID: <e1b4e5cf-269f-9ea7-c2fa-453708385944@redhat.com>
Date: Wed, 26 Apr 2023 14:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] staging: media: atomisp: sh_css_sp: Remove #ifdef
 ISP2401
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-4-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-4-hpa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/25/23 09:48, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 will be determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/sh_css_sp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> index 0dd58a7fe2cc..297e1b981720 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -952,12 +952,10 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
>  		return 0;
>  	}
>  
> -#if defined(ISP2401)
> -	(void)continuous;
> -	sh_css_sp_stage.deinterleaved = 0;
> -#else
> -	sh_css_sp_stage.deinterleaved = ((stage == 0) && continuous);
> -#endif
> +	if (IS_ISP2401)
> +		sh_css_sp_stage.deinterleaved = 0;
> +	else
> +		sh_css_sp_stage.deinterleaved = ((stage == 0) && continuous);
>  
>  	initialize_stage_frames(&sh_css_sp_stage.frames);
>  	/*

