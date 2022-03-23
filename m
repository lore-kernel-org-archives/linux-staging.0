Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11881B72
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648050574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4t9kavJSuWG3T394Vw0tvPWs8TWctqC32p4OaxhLmc=;
	b=d7Is+EDjPTwa8dHBezehB2IoxyAnU55v1uN/qbzDSr/Wo8/w8O8x1Nib8A78DDBM7a9dqn
	Zz5rY1ht56dwIWG7OqXLC3meM0R1E3rQkmTq2dUTTE3AP1mtRHV9KY378PWKgcvQHEyGmF
	KU9zqGnzRady+XkIlorNdEJ8xgrHaO4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-nrgGN6y_OrOJhEQRkBFKzQ-1; Wed, 23 Mar 2022 11:49:33 -0400
X-MC-Unique: nrgGN6y_OrOJhEQRkBFKzQ-1
Received: by mail-ed1-f72.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso1306583edh.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 08:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O4t9kavJSuWG3T394Vw0tvPWs8TWctqC32p4OaxhLmc=;
        b=4dJXaV1EvjbE8lfkUx082YhVxnhabwEgHStBvSuIFAo3NGegr4CeXRnSWtJE0V/htX
         S1qQHPCW2no/E//k7md+gFzVyFBo9s1NIXzfWCAx9dfEaY02s/Y5wz97rZB+k6CMWui2
         FQQj2pnDIqT507kyhhxLdRXacticlrX5mz+zUo0W0T0pGQCeQIqQ2zn0VkHfxAmKtwzx
         5Tc6HurOI3bx2rUzarsQTon5qrppYZoPIp/kn6ANz47sMCnD04qroP+0Dsex6NE8CJQ+
         vPfseyVgBjQ/lPDhZb7QXdXwcrqtJIdYL9whXniH/CldRaO4S/xiY82kDAWgBTs3lkMS
         zMzw==
X-Gm-Message-State: AOAM531cuUsJuoK0K7gurAy64C+/vn+Q41Gj91QGJ7pJun/8QDLxjt8Q
	3PsC2wW+L0DOpNRsstXv0f/P5W2aDTp7Vo1mR628RVHwhiSiA27SYLu+pM+12oirs4QBAKlHZni
	ZRYdyFYih4gPqQ+XyzBM0YdHZDg==
X-Received: by 2002:a17:906:3a04:b0:6d0:8d78:2758 with SMTP id z4-20020a1709063a0400b006d08d782758mr621245eje.685.1648050572132;
        Wed, 23 Mar 2022 08:49:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCxvE1wTBNgh0BMjbEc6Wy/6EM5zeycNP/xCY2D/KAM9DkY/y/SnuCIV5ahvDHaOu1C+g+lw==
X-Received: by 2002:a17:906:3a04:b0:6d0:8d78:2758 with SMTP id z4-20020a1709063a0400b006d08d782758mr621226eje.685.1648050571968;
        Wed, 23 Mar 2022 08:49:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id nb38-20020a1709071ca600b006e02fed87ebsm105415ejc.17.2022.03.23.08.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 08:49:31 -0700 (PDT)
Message-ID: <13a5173d-d4c6-4539-8303-e6a5ff72ef13@redhat.com>
Date: Wed, 23 Mar 2022 16:49:30 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] staging: rtl8723bs: Change rtw_ndev_notifier_call message
 to dbg
To: Chris Morgan <macroalpha82@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, kuba@kernel.org,
 saurav.girepunje@gmail.com, Chris Morgan <macromorgan@hotmail.com>
References: <20220323154237.21736-1-macroalpha82@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220323154237.21736-1-macroalpha82@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/23/22 16:42, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The message received in the kernel log for the state of the notifier
> call doesn't seem to be of much help to end users. Changing the message
> type from info to dbg to hide the message unless you are debugging
> the kernel or the network subsystem.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 05482341eefe..bc58bd8c38b2 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -389,7 +389,7 @@ static int rtw_ndev_notifier_call(struct notifier_block *nb, unsigned long state
>  	if (dev->netdev_ops->ndo_do_ioctl != rtw_ioctl)
>  		return NOTIFY_DONE;
>  
> -	netdev_info(dev, FUNC_NDEV_FMT " state:%lu\n", FUNC_NDEV_ARG(dev),
> +	netdev_dbg(dev, FUNC_NDEV_FMT " state:%lu\n", FUNC_NDEV_ARG(dev),
>  		    state);
>  
>  	return NOTIFY_DONE;

