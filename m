Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D85F1373
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650452840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUFhF3hl2SKfIxx89PLl432LqDZkfSZvjeGeXMqsrlg=;
	b=DlP6HBVAzN85ERZBfKj73Xwblojf2/57/+XM/SD3c6wNy4SGhZq7Gxn+l5f8f9kSbqwFPU
	E+WTyGEOO3YF2+08YLt1ldp3oWBG+mr9qvaMa1Zc+dVhGrSBOTg2mNWVykhiU5HIABNpEt
	SbPwc5guF2k5wTDnAj2QHBl2BwHp5RM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-IJszUgjRMjqfi-D1o3wwFg-1; Wed, 20 Apr 2022 07:07:19 -0400
X-MC-Unique: IJszUgjRMjqfi-D1o3wwFg-1
Received: by mail-ej1-f72.google.com with SMTP id sb12-20020a1709076d8c00b006efa121ff38so782287ejc.16
        for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 04:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TUFhF3hl2SKfIxx89PLl432LqDZkfSZvjeGeXMqsrlg=;
        b=T3l1LKZEMP3liV7a/C8HjIj+YiD9raRCBDFlXwTeza+NYLQIpxdoq5WnUXLz1BAvMS
         3GVqOE+RBNyQpbCcJACQT/dor3UjPTEsUYbyj/bFoTs4EqMeq3S9WsJ6RL0YQp2ePT8Q
         OsxUw+nryotoclgqdmjZYOBIVWmDZcJhrnI+xre3AiA+Sr71eZK2DzIYAkS3CAHFz3Ve
         SUQTSHga7kUVe8rEPjsW/VvsW0UlWfcwqvXN1S++PkZxs/pRR6Bq0O2ruCy90K7qK3go
         OxPZPZfPGD1AViNypCquq3hX8JlP1IUtEZFa2OZe5zCRQ/mE3Ehk/4p4bButExg3VCLj
         GwTg==
X-Gm-Message-State: AOAM533PQpuxbIZyBo6ORHwDxoquA95ER3zu0GL0JF1hw+sKO5uJUyhh
	9RmRNL/C1r3KrheP1TibsXDyOFOrZoWsN3xd4mdkJlP8S7tBWvWbdkm06AiDV9QKqd4Mr5/5JRr
	9gv7MgTF1lZ3VgyWTyElBYqw5kw==
X-Received: by 2002:aa7:d292:0:b0:41d:7933:1f00 with SMTP id w18-20020aa7d292000000b0041d79331f00mr22321197edq.237.1650452838092;
        Wed, 20 Apr 2022 04:07:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4xkdSFzHKfg4PBYhoD0/mOJsBUEzZ2dXQcXai1pQkf6+YZSMmE+Tg6Ubf6jiqCkiDSYI/Sw==
X-Received: by 2002:aa7:d292:0:b0:41d:7933:1f00 with SMTP id w18-20020aa7d292000000b0041d79331f00mr22321172edq.237.1650452837920;
        Wed, 20 Apr 2022 04:07:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u6-20020a170906408600b006e87d654270sm6560779ejj.44.2022.04.20.04.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 04:07:17 -0700 (PDT)
Message-ID: <2d096f20-dbaa-1d49-96e9-a7ae6c19f7fe@redhat.com>
Date: Wed, 20 Apr 2022 13:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in
 hmm_store()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>,
 Martiros Shakhzadyan <vrzh@vrzh.net>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, outreachy@lists.linux.dev
References: <20220413225531.9425-1-fmdefrancesco@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220413225531.9425-1-fmdefrancesco@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/14/22 00:55, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. The same is true for kmap_atomic().
> 
> In file pci/hmm/hmm.c, function hmm_store() test if we are in atomic
> context and, if so, it calls kmap_atomic(), if not, it calls kmap().
> 
> First of all, in_atomic() shouldn't be used in drivers. This macro
> cannot always detect atomic context; in particular, it cannot know
> about held spinlocks in non-preemptible kernels.
> 
> Notwithstanding what it is said above, this code doesn't need to care
> whether or not it is executing in atomic context. It can simply use
> kmap_local_page() / kunmap_local() that can instead do the mapping /
> unmapping regardless of the context.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, hmm_store()() is a function where the use
> of kmap_local_page() in place of both kmap() and kmap_atomic() is
> correctly suited.
> 
> Convert the calls of kmap() / kunmap() and kmap_atomic() /
> kunmap_atomic() to kmap_local_page() / kunmap_local() and drop the
> unnecessary tests which test if the code is in atomic context.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>


I've successfully tested this on both the front and back cams
of a chuwi hi8 tablet:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 46ac082cd3f1..54188197c3dc 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -482,10 +482,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
>  		idx = (virt - bo->start) >> PAGE_SHIFT;
>  		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
>  
> -		if (in_atomic())
> -			des = (char *)kmap_atomic(bo->page_obj[idx].page);
> -		else
> -			des = (char *)kmap(bo->page_obj[idx].page);
> +		des = (char *)kmap_local_page(bo->page_obj[idx].page);
>  
>  		if (!des) {
>  			dev_err(atomisp_dev,
> @@ -512,14 +509,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
>  
>  		clflush_cache_range(des, len);
>  
> -		if (in_atomic())
> -			/*
> -			 * Note: kunmap_atomic requires return addr from
> -			 * kmap_atomic, not the page. See linux/highmem.h
> -			 */
> -			kunmap_atomic(des - offset);
> -		else
> -			kunmap(bo->page_obj[idx].page);
> +		kunmap_local(des);
>  	}
>  
>  	return 0;

