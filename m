Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F01373
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650452815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAoKseYG0ZFXZ4TIIvPqFWraz/lYMRREh5HCpMpt4SA=;
	b=A1rIxFCjzxIKEnsurTeUa4DbsdDJhQ4fe7gUdO5Jme0ueFE5zsHwW3UawOxFLNPVZE4tHQ
	/nfFboVnTwANjiHt+sXLfU2+RDWjkrdSz07FaFdqEw72YqJ+UKqgh8XANIHqHqetmhNc0W
	NI11H7v7528g7X9W14vUFHoJOY/KITM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-jDN7S3P4Mg203QfcMjwVcw-1; Wed, 20 Apr 2022 07:06:54 -0400
X-MC-Unique: jDN7S3P4Mg203QfcMjwVcw-1
Received: by mail-ej1-f70.google.com with SMTP id sb12-20020a1709076d8c00b006efa121ff38so781754ejc.16
        for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 04:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nAoKseYG0ZFXZ4TIIvPqFWraz/lYMRREh5HCpMpt4SA=;
        b=IbZmg4vbyyX+fhdUQrtWNzVUvb+EDG3EwCYDRUOKAkTP425IVrIOT29hynNjw4ItTT
         vbpP/p0jpHd6HkInXYI4olrCjkSQZOd5GI9snqeoejo1SxAXDwtjBYdrmpVkm9rC56h8
         Bw2KPimX6Ik+ABv8WaHnb6+MpY3Wb4a5ySj9LdkEUohiVCXVLOMRgT3yv9v7KnEVxqP8
         247T3G8+BCDrq+TpRGAApGdX0TuqQeABamYk3IIdI/VcwswVNk7r4AugWT+0AAZ3V7Ky
         aMrrxt1+kjHp8Fi+exXSWxoQjNQOnxy+leknHIUY4sJtdReJWzedk3SODJSVgRkyV7Z7
         2vJQ==
X-Gm-Message-State: AOAM531LKIlVgvob3ok54qMqzkVfLpnMx9qgpI1Tg3qxpaLsBrnlHNyC
	HBh3XVKBalDtT/XU2QI+LjOhbwdzFnssCBAnIcM19Onk2tNHdrprDOPn8UkB5TeicIyIunMkJqk
	jiinCbTwsXaGBM7qD87j/1+72Zw==
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id u19-20020aa7d553000000b004164dfc126dmr22214667edr.213.1650452813008;
        Wed, 20 Apr 2022 04:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4lQnFeV1UHw8eIKZeNMMfyCfsjkXPEdIsO3tYie3sWTmFFwMJD3/SNL1PcBjG6qYKpen0OQ==
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id u19-20020aa7d553000000b004164dfc126dmr22214651edr.213.1650452812873;
        Wed, 20 Apr 2022 04:06:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id yy18-20020a170906dc1200b006d6e5c75029sm6477872ejb.187.2022.04.20.04.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 04:06:52 -0700 (PDT)
Message-ID: <b0aed731-b56f-4378-b50e-fc0cbccbdb84@redhat.com>
Date: Wed, 20 Apr 2022 13:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] staging: media: atomisp: Convert kmap() to
 kmap_local_page()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>,
 Martiros Shakhzadyan <vrzh@vrzh.net>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>
References: <20220408223129.3844-1-fmdefrancesco@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220408223129.3844-1-fmdefrancesco@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/9/22 00:31, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page() where
> it is feasible. With kmap_local_page(), the mapping is per thread, CPU
> local and not globally visible.
> 
> load_and_flush_by_kmap() is a function where the use of kmap_local_page()
> in place of kmap() is correctly suited.
> 
> Convert load_and_flush_by_kmap() from kmap() to kmap_local_page().
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

I've successfully tested this on both the front and back cams
of a chuwi hi8 tablet:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index c1cda16f2dc0..6394385b6637 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -350,7 +350,7 @@ static int load_and_flush_by_kmap(ia_css_ptr virt, void *data,
>  		idx = (virt - bo->start) >> PAGE_SHIFT;
>  		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
>  
> -		src = (char *)kmap(bo->page_obj[idx].page) + offset;
> +		src = (char *)kmap_local_page(bo->page_obj[idx].page) + offset;
>  
>  		if ((bytes + offset) >= PAGE_SIZE) {
>  			len = PAGE_SIZE - offset;
> @@ -369,7 +369,7 @@ static int load_and_flush_by_kmap(ia_css_ptr virt, void *data,
>  
>  		clflush_cache_range(src, len);
>  
> -		kunmap(bo->page_obj[idx].page);
> +		kunmap_local(src);
>  	}
>  
>  	return 0;

