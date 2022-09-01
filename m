Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFBA3B
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662020764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A09ae80YMwEtv8c2P0dV0w+SfIPFZiwExmKV//2uEBs=;
	b=WfxLG+6Z0TnPKlx4iwXkzDhBcxdAd6g8RWaHQgFdrnHOknCx9GhfZGbFGq3XADsbqU/NkH
	WKDE5HdflF42zwZQzn3cAMiIh0vXwZrwTj3v37yPXEX5Z4KEUxrjBtO5QCez5zkUwoMalb
	1fANChN8tOqyv5rG5wbRzYYRycM70YA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-RPnoNwbXO_e30n9Rr2AKGA-1; Thu, 01 Sep 2022 04:26:02 -0400
X-MC-Unique: RPnoNwbXO_e30n9Rr2AKGA-1
Received: by mail-ej1-f69.google.com with SMTP id sh44-20020a1709076eac00b00741a01e2aafso5211563ejc.22
        for <linux-staging@lists.linux.dev>; Thu, 01 Sep 2022 01:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A09ae80YMwEtv8c2P0dV0w+SfIPFZiwExmKV//2uEBs=;
        b=rUwLyQQOYTzeZeCCa4XAgqkmlhqLy1Flu2JWwlJTli5r0c6xEN2LwL2Hvmjijeb6OJ
         3cVAZUoYg/2VI7+ga90G7jSNx5k0YEhzyRWR0MqcI1y/WWbBlZXJD1DwQXneNMKvO9dl
         yv2Fta46OSpwdNelihmzupJGw4LWgeWrelh2U299sGDbZscaFE9aXUFKPFqtqGq/WrHv
         wd2ggDLJ4ieFO0F9r6OltHqhK8FUtw2uO/vz4AKgjQAr281xZz8yX/j12IMeDdL17LVz
         GsugMgyPo8wg4zc9jdXonYUi2S2GXIwi5qnhjb8evtP5Szg6308q2WFKrPOe63N3TZJD
         ZIEA==
X-Gm-Message-State: ACgBeo0Ed0GnkE+gGmLUXRQxBgYx2t3x0YO/YtQWJQE/ecDZOTxgmLK0
	AOp7F8/IHfNGDQYyd2rjo0Zm3Q9tW1w3KbOTDhI6GLG3ESNn6V50dZEeup1nFOpJC/wnbQ8NXzv
	BlN0BSsxflEyrjBZI1aBABxzV5g==
X-Received: by 2002:a17:906:c14f:b0:741:8829:6a97 with SMTP id dp15-20020a170906c14f00b0074188296a97mr13300556ejc.232.1662020761713;
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Fnz/LP8fNwC4/7RZT3pjlM3+Chrs0EMIh0lNE1sBrd+eKUL5Prpomwog2Dvkuhdn7LuCiNw==
X-Received: by 2002:a17:906:c14f:b0:741:8829:6a97 with SMTP id dp15-20020a170906c14f00b0074188296a97mr13300547ejc.232.1662020761553;
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g22-20020a056402091600b00447f74138d7sm947603edz.8.2022.09.01.01.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 01:26:01 -0700 (PDT)
Message-ID: <2c35e3ca-3fb4-d91e-38af-841050d58ccf@redhat.com>
Date: Thu, 1 Sep 2022 10:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] media: atomisp: prevent integer overflow in
 sh_css_set_black_frame()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <YxBBCRnm3mmvaiuR@kili>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YxBBCRnm3mmvaiuR@kili>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/1/22 07:20, Dan Carpenter wrote:
> The "height" and "width" values come from the user so the "height * width"
> multiplication can overflow.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll also add this to my set of pending atomisp2 cleanup patches
so that the next time I test the atomisp2 with my local tree
this will also get tested.

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 0e7c38b2bfe3..67915d76a87f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -950,8 +950,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
>  		params->fpn_config.data = NULL;
>  	}
>  	if (!params->fpn_config.data) {
> -		params->fpn_config.data = kvmalloc(height * width *
> -						   sizeof(short), GFP_KERNEL);
> +		params->fpn_config.data = kvmalloc(array3_size(height, width, sizeof(short)),
> +						   GFP_KERNEL);
>  		if (!params->fpn_config.data) {
>  			IA_CSS_ERROR("out of memory");
>  			IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);

