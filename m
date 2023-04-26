Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A634C2FD
	for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682508880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcFHYmE9eSf6Aa8aneAvxOqMLzSM/o9Xb/3ty4/Hoek=;
	b=WfPyMzVUfnOfpYfYNjd55Fsz+7Sy0o9nj+wxeUBy8hl2yPKJoe10krjDVpLsavIUqKaFMG
	VOSetv4ljGNU1/XtezzEX79w3ZrTRSZ07jINiHjFc5/nyQfj9ZBrcI00jsJbQVsKhSFoQZ
	xhHdhliEEwyFRL6WEnB7y6OEMe4HPEQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-xR-U9ZXjPoqbSz3IrIZTsg-1; Wed, 26 Apr 2023 07:34:36 -0400
X-MC-Unique: xR-U9ZXjPoqbSz3IrIZTsg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f734c6cf8so656672166b.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 04:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682508876; x=1685100876;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcFHYmE9eSf6Aa8aneAvxOqMLzSM/o9Xb/3ty4/Hoek=;
        b=j4UAinE2a+bXuCqA0uzPuFzp1hqAsHBJOVe+cClIaXIcn0CNisEL/m98/YmOzKLuZ8
         b+dXG1ck2FWwCD4Bm+ofDNZ7NZC7nDd1xKcs026eKnkVtJpTWjTWnKM+I0KyLQ+eZrtb
         azbwrswUhbVoem4GIVcNIloV8ZU2w3bQf58DasQaiZN4dvwgmzahCycyh3ipHFxb+X67
         tfA7Wz4J2OgVDY00gn+6Lh5L2i4OJERp6u76ZgIkCVTNUoK1J7B3m0rJYnQjS+lwEK44
         5hAkPYYLstMNdecRyNlLK7Xm7DpZ8u5dCNHj4TllArJJcYPWttIn6EzqgLFGYMm6cwky
         LHpA==
X-Gm-Message-State: AAQBX9fvs89vDQxPFbzF34qnzgPo+Vge2FjOulmH5d2c69kAfIiJepZx
	JHpLItwHqsvnLKvBGEaphjijybww71RQE0WA0OSpDZPwvchmqsPGI0Rmw42WwrIw61CKIcUzlir
	Ek77Ar6rVydsUGj4uKAo1oVYtYg==
X-Received: by 2002:a17:906:5fd2:b0:94e:ea6d:fa98 with SMTP id k18-20020a1709065fd200b0094eea6dfa98mr16119425ejv.28.1682508875876;
        Wed, 26 Apr 2023 04:34:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEqj6dzeTlQ89eyM3kWqnhwRaKKQ7uieU6JW6FZ/shKhrG4rhkrg7WUIh6YYdTRbTWP4R8ww==
X-Received: by 2002:a17:906:5fd2:b0:94e:ea6d:fa98 with SMTP id k18-20020a1709065fd200b0094eea6dfa98mr16119401ejv.28.1682508875575;
        Wed, 26 Apr 2023 04:34:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b0094f05fee9d3sm8150732ejj.211.2023.04.26.04.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 04:34:35 -0700 (PDT)
Message-ID: <2fd56895-3f2e-83d7-46d4-c97eaf72d9e8@redhat.com>
Date: Wed, 26 Apr 2023 13:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] staging: media: atomisp: runtime: frame: remove
 #ifdef ISP2401
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-3-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-3-hpa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 4/25/23 09:48, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 are determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../media/atomisp/pci/runtime/frame/src/frame.c   | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> index 83bb42e05421..425e75f7dda7 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> @@ -601,9 +601,9 @@ static void frame_init_qplane6_planes(struct ia_css_frame *frame)
>  
>  static int frame_allocate_buffer_data(struct ia_css_frame *frame)
>  {
> -#ifdef ISP2401
> -	IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
> -#endif
> +	if (IS_ISP2401)
> +		IA_CSS_ENTER_LEAVE_PRIVATE("frame->data_bytes=%d\n", frame->data_bytes);
> +
>  	frame->data = hmm_alloc(frame->data_bytes);
>  	if (frame->data == mmgr_NULL)
>  		return -ENOMEM;

This is just a debug log message, IMHO it is best to just completely remove
the message for both ISP models.


> @@ -635,11 +635,10 @@ static int frame_allocate_with_data(struct ia_css_frame **frame,
>  
>  	if (err) {
>  		kvfree(me);
> -#ifndef ISP2401
> -		return err;
> -#else
> -		me = NULL;
> -#endif
> +		if (IS_ISP2401)
> +			me = NULL;
> +		else
> +			return err;
>  	}
>  
>  	*frame = me;

This one is also weird. I have checked the only caller of this and it
does not matter what *frame is set to since as long as this returns
non 0 the *frame is ignored and the functions always returns err
(just outside of the context of the patch).

So this can be simplified to just:

	if (err) {
		kvfree(me);
		me = NULL;
	}

And then fall through to the original code of:

  	*frame = me;

	return err;
}


The me = NULL is not strictly necessary but setting *frame = NULL
on errors is a bit cleaner and may help catch future bugs.

Regards,

Hans






