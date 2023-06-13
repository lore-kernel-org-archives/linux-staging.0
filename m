Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C72915
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686649036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjiCa7fyHomUes8Ra9T7Qjm94VOEGQDRQYm/ALeXTi8=;
	b=XvM4cRwypgGHBxlJJCFWXhJb46abnem5F9Nl4t4H3ihbcEzZ/n3/hBnBX6xos/GFVfHsM5
	1cqfHdOERuUeDuUTPkVFssAx9kC8q04JnnjBiR8JTuEbAFXYq80rRrKZnuPA30aSH1CYzI
	jAsba7o+WzEaNb83O5z5LLVpaSPJnxg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-9NUEuA_jOei8f6aRCP_DKQ-1; Tue, 13 Jun 2023 05:37:14 -0400
X-MC-Unique: 9NUEuA_jOei8f6aRCP_DKQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51495d51e0fso4156228a12.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 02:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686649033; x=1689241033;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjiCa7fyHomUes8Ra9T7Qjm94VOEGQDRQYm/ALeXTi8=;
        b=YPgAlYFFkyIP+9hgAUCVN5kky+CFI5T+lOD+DHtHmqg5IcRDpzJClT9fhpH0PRvEgR
         zQXlgCq3YoU11RsafVByXU3o46CZoi5d3R5dLZTM/befw8da7BlbRO1xuDT3UiaLFu0C
         RmGJW0/SBGODMlhJIen90UlwbzL8TpckvGjoAPfFQ6V4HCP4lkzWqsM1pq0eJpu7asNA
         /MfsTwszhAFrQAHyxdYMTPPPx7/olL0bwkqz9wCU0MnPZdR8oiKC1I7Kj1eD1yZQNXYE
         IYqNYaRpIFz94I7OwvCWtqrRQPNbcfbJV0/8wgZS7by+6vImyRLDWj79lHeKM/nHSuQp
         WNUA==
X-Gm-Message-State: AC+VfDwA+82RaFlbVF4kRJ8jnvstWG+6O7UrQeLDL3R/T1exQC3auE3l
	fgDBKmuu9O2qoPGmpdN/h1k0o+z4pmloLHYMzLxVFoAZSTinuGP5fDL2/aNaSbW6vuLWZMO9IMc
	OyPSG9SbEHn7opi42Z/iZMrVwuA==
X-Received: by 2002:aa7:db59:0:b0:514:8e5a:8471 with SMTP id n25-20020aa7db59000000b005148e5a8471mr6581381edt.13.1686649033274;
        Tue, 13 Jun 2023 02:37:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KinlAM8A1bQJFPUHY3xFNpYhGDy+BWt9vyXJL0Okkn/x1Sh6QHGxZslm/vlC0pOo4aMgf+w==
X-Received: by 2002:aa7:db59:0:b0:514:8e5a:8471 with SMTP id n25-20020aa7db59000000b005148e5a8471mr6581365edt.13.1686649032983;
        Tue, 13 Jun 2023 02:37:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7d055000000b0050bc7c882bfsm6029933edo.65.2023.06.13.02.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:37:12 -0700 (PDT)
Message-ID: <d14b9b81-d0a5-e967-0e10-a3d3037e345b@redhat.com>
Date: Tue, 13 Jun 2023 11:37:11 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230612055718.453554-1-hpa@redhat.com>
 <20230612055718.453554-4-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230612055718.453554-4-hpa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kate,

On 6/12/23 07:57, Kate Hsuan wrote:
> Pick up the necessary part of sp_group configuration for both model and
> then copy those parts into a tempetory buffer. This buffer is finally
> written to the ISP with correct length.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

As mentioned in the review of patch 1/3 the sh_css_internal.h changes
from patch 1/3 should all be moved here.

Other then that this looks good to me.

Regards,

Hans


> ---
>  .../staging/media/atomisp/pci/sh_css_params.c | 41 ++++++++++++++++++-
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 588f2adab058..22a9fed006f6 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3720,10 +3720,47 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
>  
>  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  {
> +	u8 *write_buf;
> +	u8 *buf_ptr;
> +
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
> +
> +	write_buf = kzalloc(sizeof(struct sh_css_sp_group), GFP_KERNEL);
> +	if (!write_buf)
> +		return 0;
> +
> +	buf_ptr = write_buf;
> +	if (IS_ISP2401) {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
> +		buf_ptr += 3;
> +		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
> +		buf_ptr += 2;
> +		memset(buf_ptr, 0, 3);
> +		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
> +	} else {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
> +		buf_ptr += sizeof(sh_css_sp_group.config);
> +	}
> +
> +	memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pipe));
> +	buf_ptr += sizeof(sh_css_sp_group.pipe);
> +
> +	if (IS_ISP2401) {
> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_sp_group.pipe_io));
> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io);
> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
> +		       sizeof(sh_css_sp_group.pipe_io_status));
> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io_status);
> +	}
> +
> +	memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.debug));
> +	buf_ptr += sizeof(sh_css_sp_group.debug);
> +
>  	hmm_store(xmem_sp_group_ptrs,
> -		   &sh_css_sp_group,
> -		   sizeof(struct sh_css_sp_group));
> +		  write_buf,
> +		  buf_ptr - write_buf);
> +
> +	kfree(write_buf);
>  	return xmem_sp_group_ptrs;
>  }
>  

