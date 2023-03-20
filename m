Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FB1846
	for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679305837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss6kVDpqjW5IIsm4uryKZ88uo+KrVDW16y6KeLjlJYk=;
	b=O1fHbx/GjsUCJUp+j9dcYDc93nGWZOgTyTpyAe0g1+GDPUwco63wFTE56NjEjq/kTCroBW
	4k2YlBJTTKzKzrmi9OAuKYTjjG9dZSouZIgdDWLOTEZOkZxpd/oC4VvE0+e6Ukc+O6eypl
	kEvfyOX2VApiEx+HpmM+4Y4gYBUqNNA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-JTJl-T2rPwqqqqNTTr8kog-1; Mon, 20 Mar 2023 05:50:36 -0400
X-MC-Unique: JTJl-T2rPwqqqqNTTr8kog-1
Received: by mail-ed1-f70.google.com with SMTP id k30-20020a50ce5e000000b00500544ebfb1so7096416edj.7
        for <linux-staging@lists.linux.dev>; Mon, 20 Mar 2023 02:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679305835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss6kVDpqjW5IIsm4uryKZ88uo+KrVDW16y6KeLjlJYk=;
        b=OI1Pk7QxGREEIf2JCZ/kWrVm6xWTUopK7Pqd1dXsDH7+X9r1etETTsQabqu6+IFG7a
         bNFQS0KD9qtqZSHSWA1PZJQ17SsMQt4x6u7/hf1790Lerr/WfqH8o4PeNytP60GpRfKz
         PkOGwd7XSpQg9DTxh3wh5Put209qZxj7WfWXIYusHOQLxw83gtyyqTjcPT1bqCttCkMK
         VF9WK15r4mqdnJO3P/Xl1hU28Ac8Cm+ucSkfFC74orbkeJ3Yve6JZoXUbm1WaBmA29oF
         ig0vOy9TlA9wHBK84xuYWp73kqabNun3j+iaqXOqWpSG0triMf6ul5vkP2kTdU2Xnf11
         r41Q==
X-Gm-Message-State: AO0yUKX+HmK6+WX4Qzhz8HbNvVTDaPqK7nDZsvqlMZwvRgsbzfoTdQPB
	WnNf3seGiqmKQZBFog9I6Lh1Guo/WXZQVl+ZTGW6RlhucfY0UWD3fM0TThtZLST8VuxdqqEvHpu
	YylvehpKV8VD2SmGIvhIRYor/rQ==
X-Received: by 2002:a17:906:fe4c:b0:92f:22b1:57f9 with SMTP id wz12-20020a170906fe4c00b0092f22b157f9mr9854310ejb.2.1679305835064;
        Mon, 20 Mar 2023 02:50:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set/47JPtGexk0TSuJX1KiZr+LwW7LBb1OTu2U07PVmduBtikRfn1f3Orewm9RB9+y1JlZkjZQQ==
X-Received: by 2002:a17:906:fe4c:b0:92f:22b1:57f9 with SMTP id wz12-20020a170906fe4c00b0092f22b157f9mr9854299ejb.2.1679305834816;
        Mon, 20 Mar 2023 02:50:34 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s26-20020a170906169a00b009200601ea12sm4127757ejd.208.2023.03.20.02.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 02:50:34 -0700 (PDT)
Message-ID: <9b8bc631-435d-7c4d-d605-be10092242c8@redhat.com>
Date: Mon, 20 Mar 2023 10:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] staging: rtl8723bs: use inline functions for
 dvobj_to_dev
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev, namcaov@gmail.com, straube.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Julia Lawall <julia.lawall@inria.fr>
References: <20230319201134.253839-1-eng.mennamahmoud.mm@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230319201134.253839-1-eng.mennamahmoud.mm@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/23 21:11, Menna Mahmoud wrote:
> Convert `dvobj_to_dev` macro into a static inline function.
> it is not great to have macro that use `container_of` macro,
> because from looking at the definition one cannot tell
> what type it applies to.
> 
> One can get the same benefit from an efficiency point of view
> by making an inline function.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
> change in v2:
> 	edit commit message.


Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/staging/rtl8723bs/include/drv_types.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index 82159e1c7f9b..ea6bb44c5e1d 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -305,7 +305,11 @@ struct sdio_data intf_data;
>  };
>  
>  #define dvobj_to_pwrctl(dvobj) (&(dvobj->pwrctl_priv))
> -#define pwrctl_to_dvobj(pwrctl) container_of(pwrctl, struct dvobj_priv, pwrctl_priv)
> +
> +static inline struct dvobj_priv *pwrctl_to_dvobj(struct pwrctrl_priv *pwrctl_priv)
> +{
> +	return container_of(pwrctl_priv, struct dvobj_priv, pwrctl_priv);
> +}
>  
>  static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
>  {

