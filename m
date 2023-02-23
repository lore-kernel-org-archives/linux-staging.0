Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C92564
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 11:27:01 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bo30so9853821wrb.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 03:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+hQVuvhZzcYtd7cokSKHFj+kPj7oU92IKueIRii2D4=;
        b=hXyYUjxlefIkK4YIS+VcGhYrA3Es+eYWsT/vLiaeaubRq5TIZ3uWwGsm5RF/oXyxoF
         lyPpYxZqEmMCaL+WQFbee8eOCuuDBUmQzF9FspbT0I+8RlxHjijDIw+9Mejgz2OAXfkL
         InUonIdF1mcunBdDQlRuxLdW70m4L1deGgqxwXXY003aGYcp4IskHbjaXed/n9Gj4flG
         OE8jOWXasXfi6xOrXEnxyzExigIRCLd8MUmNdXIiVlbQmoDznr1T8aslbgktKs6b6qwh
         Uwye0YmL0dLeIqEw+fGCP22ZhEOYbqIuH+IZqYgSakt2R/0GrvwcHX9msY8zX8q7HEhG
         /S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+hQVuvhZzcYtd7cokSKHFj+kPj7oU92IKueIRii2D4=;
        b=qeYNZNRWe1Hr3w0j3QA69gRh5JC4mkj5pkk51KjiUTEnix5t0j0cvDAREZ5iOuK8XM
         nwRObx9P6CRN95t7XJywHLaTXPied+iAwxn7bkSeL8lC9hptSsRkBaSMjlIsHwbjhQXY
         uTqwm7/vOfPHzZc8NR+AGQ3n+WQYLZwBJ/8FnpifegJn0xIWUIpVfVH/6r1QLVC0HSrd
         779Anjp0RTYzlljnd2BCPk+v1pIi+/t7ssH9WuY9+2h+Z8gD7ytfp1e9sHeoICa2YMB+
         Q7t4eqcO1g18CwpO5gbJlS2NYMJkfkbhDdlgibvp8NP8x/WrDxiYU0rz4Boz9Tmb6lbA
         Eujw==
X-Gm-Message-State: AO0yUKX8pELnYMpk0P6lwm+2ygpw/RpkWRhUb6pU6UHya3PdxUl5e5Ka
	cq4NGtHsOJOW8rsXY5e5lBg=
X-Google-Smtp-Source: AK7set83tsQiWgEeieQ08Rc/LpTgt7Wsfl6kGkeoBkFpNFPDKdNCej+XmV81HXCJ68ufWy5b+mCpkA==
X-Received: by 2002:a5d:69cd:0:b0:2c5:9ef9:9bab with SMTP id s13-20020a5d69cd000000b002c59ef99babmr9238732wrw.43.1677151620092;
        Thu, 23 Feb 2023 03:27:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b002c6e84cadcbsm8240620wru.72.2023.02.23.03.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 03:26:59 -0800 (PST)
Date: Thu, 23 Feb 2023 14:26:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Deepak R Varma <drv@mailo.com>,
	Charlie Sands <sandsch@northvilleschools.net>,
	Mahak Gupta <mahak_g@cs.iitr.ac.in>,
	Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
Message-ID: <Y/dNgG2C8TupGJLF@kadam>
References: <Y/YfzZeFCAPiZ6RV@kili>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/YfzZeFCAPiZ6RV@kili>

On Wed, Feb 22, 2023 at 04:59:41PM +0300, Dan Carpenter wrote:
> Here the code is testing to see if skb->len meets a minimum size
> requirement.  However if skb->len is very small then the ETH_HLEN
> subtraction will result in a negative which is then type promoted
> to an unsigned int and the condition will be true.
> 
> Generally, when you have an untrusted variable like skb->len, you
> should move all the math to the other side of the comparison.
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Compile tested only.  This is basic algebra of moving parts of the
> equation from one side to the other and I am surprisingly bad at
> something that I was supposed to have learned in 9th grade.
> 
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..f49e32c33372 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>  		/*------------------------------------------------*/
>  		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
>  
> -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> +		if (skb->len <= sizeof(*iph) + ETH_HLEN)
>  			return -1;

NAK.  On reviewing now, if this is a bug, then there is already a read
overflow a few lines earlier.

regards,
dan carpenter

