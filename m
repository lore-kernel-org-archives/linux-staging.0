Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53435390
	for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACvtT3E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK113Awfl6OWkpPlOKRE5e32nRk0EPC7dusyF+tpu2M=;
	b=ACvtT3E1D4Q63Ngg8x9RbJM3jWN+ZL+0ZLK6SDa9jTvUxzg7TOww3JFIUBtq8XrmJ4sayy
	vp6/2L/uj9t7qNEQ8if3/rAKkjA0Ziqg8eFJwy8Tw+6hWGRcA3DsUMPNUEYOrqFPtDAPMj
	zvjAWDd2R1iSv2JN0nMF2oKzq6ulUbg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-oVTpfzg_MwqAaDPHn-hCSg-1; Sun, 31 Dec 2023 04:50:01 -0500
X-MC-Unique: oVTpfzg_MwqAaDPHn-hCSg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5564b72bbffso2263a12.3
        for <linux-staging@lists.linux.dev>; Sun, 31 Dec 2023 01:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016200; x=1704621000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tK113Awfl6OWkpPlOKRE5e32nRk0EPC7dusyF+tpu2M=;
        b=K/4WI9JOzfXw28D0W5PUifPf2iJnJijIqDeTIrSNP71l6Bp/BOMDY0gqnxX9lz8hIr
         1e025bXLoQQiZYhUwJk8VTMVWiwW/IpAdeMMzN2q8BmXkAfheyKs5GdqOryW90wk7Mym
         hNM4tlYerwJoG8ydNWdLfWw9qjE2u/mAbuuF4s/u/ztir65FwEpMKQUgX2AoQLiMovzB
         wDYIFL+iyepNsYoT+NwoyIuWK3DHwF6HcfYZCfKL97/XG8vFH1VgalwHrCUSscLZAKax
         8+gK3egYNa1kEG64a/C/4YSJCdWGMCj0OfS8LPHbuTtWLE6drkxLeFCzP3OdpmyXO2JB
         lPxw==
X-Gm-Message-State: AOJu0YwqzyOrD3LdJIixAEJn+0nFe0xjC5oat7U2mnO5NajB7WiowVMo
	e/53M+KoS575uaEiPiFZttaPrLw3WsBfdAtj3aMsFQcubb/shSMwPQrA6P9P6/arfxVngiej3vM
	fs1jRh5ZbhmeJ8/Z9tE4EWsO2D0sxcFO9gQ==
X-Received: by 2002:aa7:dac5:0:b0:555:65c0:e72b with SMTP id x5-20020aa7dac5000000b0055565c0e72bmr3651941eds.62.1704016199977;
        Sun, 31 Dec 2023 01:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Hd8+uyhttvW+IY+lq2OUulSHmV7vOvPZBgbXZNJOHhyGzh3vYz6wI+KQXJ17t0X6E4g63Q==
X-Received: by 2002:aa7:dac5:0:b0:555:65c0:e72b with SMTP id x5-20020aa7dac5000000b0055565c0e72bmr3651933eds.62.1704016199772;
        Sun, 31 Dec 2023 01:49:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:49:59 -0800 (PST)
Message-ID: <8cfc7753-37f6-48be-b7ae-dc28022989ae@redhat.com>
Date: Sun, 31 Dec 2023 10:49:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/runtime/rmgr/src: Fix spelling
 mistakes in rmgr_vbuf.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223072245.81630-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223072245.81630-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 08:22, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in rmgr_vbuf.cas below:
> 
> '''
> ./runtime/rmgr/src/rmgr_vbuf.c:201: succes ==> success
> ./runtime/rmgr/src/rmgr_vbuf.c:211: succes ==> success
> ./runtime/rmgr/src/rmgr_vbuf.c:215: succes ==> success
> '''
> This patch fixes these spelling mistakes.
> It is good to use variable name that gives
> proper meaning and spelling error free.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  .../staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> index 2e07dab8bf51..1f24db77fe38 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> @@ -198,7 +198,7 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
>  		      struct ia_css_rmgr_vbuf_handle **handle)
>  {
>  	u32 i;
> -	bool succes = false;
> +	bool success = false;
>  
>  	assert(pool);
>  	assert(pool->recycle);
> @@ -208,11 +208,11 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
>  		if (!pool->handles[i]) {
>  			ia_css_rmgr_refcount_retain_vbuf(handle);
>  			pool->handles[i] = *handle;
> -			succes = true;
> +			success = true;
>  			break;
>  		}
>  	}
> -	assert(succes);
> +	assert(success);
>  }
>  
>  /*

