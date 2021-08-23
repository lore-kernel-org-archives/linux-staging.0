Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEFC72
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 08:44:33 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r19so25001243eds.13
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OUE9OJKkP1QI+2yCSiJZEjjQO84qj2H/zJA5KUoRH1k=;
        b=JakRxGtZy/y0fP4/Rc73Qh66wozPZY8cqRojRoCax28Q26tDizOEkWQGWP2Paim/if
         YXkJ0U7XR5bGysagH61PZcWIsAjDUtFJGUxfh2wHdJZDpoAwab6IPRZNA1w8uexpRL8X
         kJjdL31aIWmhO681NsZX6GC0xsyg/1pH9fPnG9YgQBT4csXMXMMGfq2F0QKJRDvxPcdy
         3Jv/tPSwWxbTaDodMWurRl6FiQwbpglKvvbQQfZ8RHTx+tL2ql3Ju8aigBR6ticb8s/J
         Z92e/dOr+feH9nC/GLIarXoQnA2ejC6vYNTVMO2Uw6imWZZLW2PNUuIhJiVqLmv/R2PM
         ULWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OUE9OJKkP1QI+2yCSiJZEjjQO84qj2H/zJA5KUoRH1k=;
        b=rmu2KJHl6Bp8kjWOcmpWotADzO3D3mXsAOaisRXtC8hAF+wDoePhCyAS4yar8+WWVI
         lYDP8VZOCC3fWXEbsEn9ZV2SzmYBsIJjyjPlLkxCNEm6u1T85qepPUOhr/kpVQV8mVL+
         8eXZXCHsaiuGVwSr6ykwX14pYne6buMr3tbQrT5RgJO5M8acdAFaNKNNbGyF0QOwKKRY
         mrL0IQfFFJ/u8sDKmUzWW+3AY58OJSMuI0Vdjr0sp+1G7Mn0oNa7ok9XUzhcrLsJPXUS
         AH5K0w9efZfL5Qt5TeLycO/ZY8m9UJ1C0HyzIUCLkiJRbbHE9eqOw3HPSZH/yZ8WMXf/
         xyxg==
X-Gm-Message-State: AOAM533AgXXXoXbRMnYgRk8+wJueTsdiqjMfo6OzhoYL12wq46nyjtpg
	vLTC799HsWI736VZ8c077uw=
X-Google-Smtp-Source: ABdhPJxBKK4cWjt69sE+zbI8RQCEjnmVzTDIEQwFz/b/TTJwzxr3ULHHkeqxXGufz2PMXpW88+UaMQ==
X-Received: by 2002:a05:6402:384:: with SMTP id o4mr36864790edv.128.1629708271883;
        Mon, 23 Aug 2021 01:44:31 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id x13sm7003546ejv.64.2021.08.23.01.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 01:44:31 -0700 (PDT)
Date: Mon, 23 Aug 2021 14:14:26 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] staging: r8188eu: cast to restricted __be32
Message-ID: <20210823084426.yo2mhgbyehkwwz3h@xps.yggdrasil>
References: <cover.1629562355.git.aakashhemadri123@gmail.com>
 <50439a81aca7ce8c3c97ec1c7247f4cd03f645a5.1629562355.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50439a81aca7ce8c3c97ec1c7247f4cd03f645a5.1629562355.git.aakashhemadri123@gmail.com>

On 21/08/21 09:48PM, Aakash Hemadri wrote:
> Fix sparse warning:
> > rtw_br_ext.c:836:54: warning: cast to restricted __be32
> 
> dhpch->cookie is be32, change it's type.
> 
> Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index f6d1f6029ec3..f65d94bfa286 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -649,7 +649,7 @@ struct dhcpMessage {
>  	u_int8_t chaddr[16];
>  	u_int8_t sname[64];
>  	u_int8_t file[128];
> -	u_int32_t cookie;
> +	__be32 cookie;
>  	u_int8_t options[308]; /* 312 - cookie */
>  };
>  
> @@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>  				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
>  					struct dhcpMessage *dhcph =
>  						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> +					u32 cookie = be32_to_cpu(dhcph->cookie);
>  
>  					if (cookie == DHCP_MAGIC) { /*  match magic word */
>  						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> -- 
> 2.32.0
> 

David Laight suggested to use get_unaligned_be32, I am not sure if it's
the right thing to do because as far as I understand get_unaligned_be32
byteshifts the argument.

Can someone please confirm if this change is okay?

Thanks,
Aakash Hemadri.
