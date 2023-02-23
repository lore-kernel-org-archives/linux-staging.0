Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604711FB5
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 07:00:53 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id h16so39145405edz.10
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 23:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6V1kgFkz+2nmuQRL3q8czZyEspOUTUcUgYJRLDxG5Jo=;
        b=h8jtJEetutWZ+CFqdIFBLdMLgBt/HsmmoreRRsSiEFyjsfNAQ+2h3Jogr0VJZDiz71
         SdBLFosZ61lDdEzPyUFgJOjv+HB1IMwTFn+FZT2WefFyvUwp1m9CtMVaObnZEZ6lV6PG
         LP2oAkOPgSJcAYaWIdt3HSWCrcp6qUdrcBYgl9O4QwdWHmsv2UlDp6hinz2OaEmrAqiR
         AAUrQEoBC4TzbfUblLFrgEoVvp8DhnZjXhG0ZCqQJVByWtu8OkT7CvLxxPjbdxCwmnZ5
         Tfedo+dmciYzcX9EmSJ70cd0IbGv1hkKcvxJnP3g3+k0M8qjhKkiRz2X5fAs9q3iNzI0
         L9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6V1kgFkz+2nmuQRL3q8czZyEspOUTUcUgYJRLDxG5Jo=;
        b=lBK22q+fon6k05EyqG6JDHVFg52SiBI5E+DxNLSo4K2oUwuC22Yo0zDQXOvFW0t5Ub
         c5l67bEWezvUV1nsPV39fKHfHQMLyzhGcGOYO77yjRnPY5Tb3zX6v4nJ4/SGQ/lWX7pu
         xPtyWbSVzt6paiXND1W7i2oqXga1LEVMa0TpVJHlFVSVHwLm20oKajkTaDEuh/Y5lcwZ
         chnXFwYGd+Mg08nr5u4Sk/eUINBCA/cgNE48IEai0mgfxhdl0KYuBboLgZoT9wsXaBs+
         nrNu8NuZ1M6J0jO9k8JXiXvRrEJhIcS3ns9ecnqu1GMZkSYqovejh0v8aCcWaWCMBeGP
         OjmA==
X-Gm-Message-State: AO0yUKXhvwb6Izjz9BqvJ5+rQmHH4YKBPzERYE7/+Lhqp7mHCVTzbK0Y
	KAU+9GyZo9v39VP5ZFRsgtQ=
X-Google-Smtp-Source: AK7set8ZuKaSbrQBJ3a8M+xYxT2z6oxVHpwoR5gtoCZW2lx53fTy63X3CNCbD1dMJt4V9SMvFl3Phg==
X-Received: by 2002:a17:906:7394:b0:8b1:2614:dea6 with SMTP id f20-20020a170906739400b008b12614dea6mr17645055ejl.1.1677135651535;
        Wed, 22 Feb 2023 23:00:51 -0800 (PST)
Received: from [192.168.0.100] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id me19-20020a170906aed300b008b17662e1f7sm8764897ejb.53.2023.02.22.23.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 23:00:50 -0800 (PST)
Message-ID: <0893bcc8-a06d-1f99-8887-3731b8e5a9f8@gmail.com>
Date: Thu, 23 Feb 2023 08:00:49 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: r8188eu: fix a potential integer underflow bug
To: Dan Carpenter <error27@gmail.com>, Phillip Potter <phil@philpotter.co.uk>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Deepak R Varma <drv@mailo.com>, Charlie Sands
 <sandsch@northvilleschools.net>, Mahak Gupta <mahak_g@cs.iitr.ac.in>,
 Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <Y/YfzZeFCAPiZ6RV@kili>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y/YfzZeFCAPiZ6RV@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/23 14:59, Dan Carpenter wrote:
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
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..f49e32c33372 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -538,7 +538,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   		/*------------------------------------------------*/
>   		struct ipv6hdr *iph = (struct ipv6hdr *)(skb->data + ETH_HLEN);
>   
> -		if (sizeof(*iph) >= (skb->len - ETH_HLEN))
> +		if (skb->len <= sizeof(*iph) + ETH_HLEN)
>   			return -1;
>   
>   		switch (method) {

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
