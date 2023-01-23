Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5B7C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674476877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8EL4a7vt9YoRH2uQ3LUcgsvGE0j3ZgGDUhZzXtuW0o=;
	b=YEdpnmPPRY2XX7uPk1Dfj9AdJPz50VW4m2ihh/gkKkyzhUWXOJRk2R2AUdvlN2elqpzJF9
	IT/wN/1smAz7HwPS3AREe/QJ9Ge21u0wJcmNFGsixzFLPd/j13ThGfIndwt4cCroEOGNy8
	w9ToMsDyKII771b/fHC/A4ZXlDh54M4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-zmRGgNsAOzinrtvHsmc32Q-1; Mon, 23 Jan 2023 07:27:56 -0500
X-MC-Unique: zmRGgNsAOzinrtvHsmc32Q-1
Received: by mail-ej1-f72.google.com with SMTP id sa32-20020a1709076d2000b0084d4593797eso7621645ejc.16
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 04:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8EL4a7vt9YoRH2uQ3LUcgsvGE0j3ZgGDUhZzXtuW0o=;
        b=Psxs+aeYh5AdXSRv8Phi69vw60e3k08CiNAwErAR1eKJLV5E3yys5NkkBgrSJOT1Pp
         zU6v+j0zxmjmIa2zpgvKQpAqjdKkGWUVNcAHyAIGDVY/juv/QSZVi+XuCR5XTwntXoBr
         04DQmAOP+nV/5ztE6GfEoYz8wzXXcafcRSKP0LqFv/nQf91164p9TooAcrfA/6Ih3I7Q
         mXGbPCyI3Rs0J6e7Tgc3AV2PPoWJW7jG5zB4elxV9K+fAqsb3L3EVWo3HHuAE4t04grC
         snM6ANpjkn4kfJ+/6f712OgivcjgeNojpjsAMNksjk44huO1RxZhzbi1bmnJUoEHFfka
         /NiA==
X-Gm-Message-State: AFqh2krcqQdnLFPs4bm3ak6TZdNtmVfnIe5bDDt36msMNQgurQ//C6AE
	8JV6L1zQt2bjKC/AZ5bCUVS+fPkQOGdKNjSgKpY6LY0Mq5njLpetm5S/XwqAqDU0nvZQYuauaLU
	jduZ2Uplu6BhKR7UQAGNWTP43dQ==
X-Received: by 2002:a17:906:6b13:b0:872:cc12:f712 with SMTP id q19-20020a1709066b1300b00872cc12f712mr22432602ejr.43.1674476875554;
        Mon, 23 Jan 2023 04:27:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsUq/Q66Db25Cp9CBpPwyu76f1Jixb+J0Ie/WrZ2C239Oa3Z1Glt23XEHOuP2EHwbgYtOS2Vg==
X-Received: by 2002:a17:906:6b13:b0:872:cc12:f712 with SMTP id q19-20020a1709066b1300b00872cc12f712mr22432586ejr.43.1674476875307;
        Mon, 23 Jan 2023 04:27:55 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm21647277ejm.8.2023.01.23.04.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:27:54 -0800 (PST)
Message-ID: <cba8bfbf-187d-3ba2-3d2d-cdac88fa9362@redhat.com>
Date: Mon, 23 Jan 2023 13:27:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] media: atomisp: pci: Replace bytes macros with
 functions
To: Brent Pappas <bpappas@pappasbrent.com>, andy.shevchenko@gmail.com
Cc: ailus@linux.intel.com, error27@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, mchehab@kernel.org
References: <CAHp75VcxvPZOZpGMSQXkCFv+WekHckMJkympfdR0ih72AjjkNw@mail.gmail.com>
 <20230118160739.26059-1-bpappas@pappasbrent.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230118160739.26059-1-bpappas@pappasbrent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/18/23 17:07, Brent Pappas wrote:
> Replace the function-like macros FPNTBL_BYTES(), SCTBL_BYTES(), and
> MORPH_PLANE_BYTES() with functions to comply with Linux coding style
> standards.
> Replace multiplication with calls to array_size() and array3_size()
> to prevent accidental arithmetic overflow.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>

Thank you.

I have added this to my personal git tree now and I will include
this in the atomisp driver pull-req which I will send to the
media-subsystem maintainer in a couple of weeks.

Regards,

Hans




> ---
> Changelog:
> V1 -> V2: Use size_mul() to perform size_t multiplication without risk of
> 		  overflow.
> 		  Remove the inline keyword from function definitions.
> 
> V2 -> V3: Add commit message.
> 
> V3 -> V4: Use array_size() and array3_size() for multiplication.
> 
> V4 -> V5: Fix indentation.
> 
> V5 -> V6: Try again to fix indentation (use tabs of size 8).
> 
>  .../staging/media/atomisp/pci/sh_css_params.c | 38 +++++++++++--------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index f08564f58242..7e111df5c09d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -98,17 +98,27 @@
>  #include "sh_css_frac.h"
>  #include "ia_css_bufq.h"
>  
> -#define FPNTBL_BYTES(binary) \
> -	(sizeof(char) * (binary)->in_frame_info.res.height * \
> -	 (binary)->in_frame_info.padded_width)
> +static size_t fpntbl_bytes(const struct ia_css_binary *binary)
> +{
> +	return array3_size(sizeof(char),
> +			   binary->in_frame_info.res.height,
> +			   binary->in_frame_info.padded_width);
> +}
>  
> -#define SCTBL_BYTES(binary) \
> -	(sizeof(unsigned short) * (binary)->sctbl_height * \
> -	 (binary)->sctbl_aligned_width_per_color * IA_CSS_SC_NUM_COLORS)
> +static size_t sctbl_bytes(const struct ia_css_binary *binary)
> +{
> +	return size_mul(sizeof(unsigned short),
> +			  array3_size(binary->sctbl_height,
> +				      binary->sctbl_aligned_width_per_color,
> +				      IA_CSS_SC_NUM_COLORS));
> +}
>  
> -#define MORPH_PLANE_BYTES(binary) \
> -	(SH_CSS_MORPH_TABLE_ELEM_BYTES * (binary)->morph_tbl_aligned_width * \
> -	 (binary)->morph_tbl_height)
> +static size_t morph_plane_bytes(const struct ia_css_binary *binary)
> +{
> +	return array3_size(SH_CSS_MORPH_TABLE_ELEM_BYTES,
> +			   binary->morph_tbl_aligned_width,
> +			   binary->morph_tbl_height);
> +}
>  
>  /* We keep a second copy of the ptr struct for the SP to access.
>     Again, this would not be necessary on the chip. */
> @@ -3279,7 +3289,7 @@ sh_css_params_write_to_ddr_internal(
>  	if (binary->info->sp.enable.fpnr) {
>  		buff_realloced = reallocate_buffer(&ddr_map->fpn_tbl,
>  						   &ddr_map_size->fpn_tbl,
> -						   (size_t)(FPNTBL_BYTES(binary)),
> +						   fpntbl_bytes(binary),
>  						   params->config_changed[IA_CSS_FPN_ID],
>  						   &err);
>  		if (err) {
> @@ -3304,7 +3314,7 @@ sh_css_params_write_to_ddr_internal(
>  
>  		buff_realloced = reallocate_buffer(&ddr_map->sc_tbl,
>  						   &ddr_map_size->sc_tbl,
> -						   SCTBL_BYTES(binary),
> +						   sctbl_bytes(binary),
>  						   params->sc_table_changed,
>  						   &err);
>  		if (err) {
> @@ -3538,8 +3548,7 @@ sh_css_params_write_to_ddr_internal(
>  			buff_realloced |=
>  			    reallocate_buffer(virt_addr_tetra_x[i],
>  					    virt_size_tetra_x[i],
> -					    (size_t)
> -					    (MORPH_PLANE_BYTES(binary)),
> +					    morph_plane_bytes(binary),
>  					    params->morph_table_changed,
>  					    &err);
>  			if (err) {
> @@ -3549,8 +3558,7 @@ sh_css_params_write_to_ddr_internal(
>  			buff_realloced |=
>  			    reallocate_buffer(virt_addr_tetra_y[i],
>  					    virt_size_tetra_y[i],
> -					    (size_t)
> -					    (MORPH_PLANE_BYTES(binary)),
> +					    morph_plane_bytes(binary),
>  					    params->morph_table_changed,
>  					    &err);
>  			if (err) {

