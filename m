Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E55656
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 07:49:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b35so37097590edf.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=BZTSyVeGs8/aAYHNUe9z+r+BB2D+qO6QOFNyHOlxVgI=;
        b=BTUczytBALVoYj9TuBDOkKR7vV1qRVEfFlmrl2op8wmLlKoqOhNGPWVedu91DrOGK0
         x3QegDX1xEGp5PAamq3iNJdD1UkY0uwnu5JVvBEnMseMdADn+SeRlaP0tAaILtIu/Fm5
         yfv36XExRKTvk92mLkGiGBNju1DzPs4zcCScZs4KDNDgMxteE82RMmItIgysOIveRC8R
         E52Ix12mdcBv8bjZovMmoi4a5GDThXSbMV1sFKmOJ7txr7lXC1H2CBcyaUfmpNFQ+jIP
         1mStlWZTfI42MrtpBXUlPGX0zHQAtcSmp6IhOzwCte71qRrTb/S+psaGGfALWV+ikx8x
         +yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BZTSyVeGs8/aAYHNUe9z+r+BB2D+qO6QOFNyHOlxVgI=;
        b=YlrZYIQ8IiUHd+V1D7ipOKH/OT0GCJba/e2jRGQ4BCGRvL/B8ZuxFbfE3iDVLwyW3k
         1LJEZSvZm+/w1ICJ7bOIIS2iJVJXbIfVluqaTcObvRxfMpqOdZuJSiVBguCEhQke8TIS
         XoFUJWudNR2nUIdHl6QfSigTtF3wKrKnTeRkj4EjP6pylwbSzO/XM0eP0pkxJBAtJKvT
         Pl/iHL7oOLEfb51r1FIZk6kPecW4kVMHF0cAEIGyhWZdJryqGbFK8ED2Q4ubdu7wbJyL
         V4t8reBG5wGt39UTKQa65POyUk6NNM43Ss7ZRtXSyH6pj1YmRO5PjtmYT5IGWHtjrNMz
         vDrA==
X-Gm-Message-State: ACrzQf0ua/2FyGe8DQEmBZFipylU84XxsPtjWetNSZ0wElfTX7AX4c1i
	jOy32sx0wE96yM315prxQPU=
X-Google-Smtp-Source: AMsMyM5UYe74UFCvBUoepiqIp+WUu89fqh1/61Dfp+eXGbf1Mn2BbfQjvNp8D7WLaM58cD2J1UvU1g==
X-Received: by 2002:a05:6402:3547:b0:451:3be6:d55b with SMTP id f7-20020a056402354700b004513be6d55bmr10479920edd.57.1663487366859;
        Sun, 18 Sep 2022 00:49:26 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906434f00b007413360a48fsm2309966ejm.50.2022.09.18.00.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 00:49:26 -0700 (PDT)
Message-ID: <8300971d-f8f5-7b8c-146f-fd566059c493@gmail.com>
Date: Sun, 18 Sep 2022 09:49:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: fix too many leading tabs
To: Joash Naidoo <joash.n09@gmail.com>, larry.finger@lwfinger.net,
 phil@philpotter.co.uk, paskripkin@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
References: <20220918050728.3746-1-joash.n09@gmail.com>
Content-Language: en-US
In-Reply-To: <20220918050728.3746-1-joash.n09@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/22 07:07, Joash Naidoo wrote:
> Coding style fix. Fix too many leading tabs and line length. Convert
> __constant_htons to htons
> 
> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 66 ++++++++++++-----------
>   1 file changed, 35 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index bca20fe5c..8e951fc0e 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -604,37 +604,41 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>   	if (!skb)
>   		return;
>   
> -	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
> -		__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> -
> -		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP */
> -			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> -
> -			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
> -				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> -
> -				if ((udph->source == __constant_htons(CLIENT_PORT)) &&
> -				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
> -					struct dhcpMessage *dhcph =
> -						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> -
> -					if (cookie == DHCP_MAGIC) { /*  match magic word */
> -						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> -							/*  if not broadcast */
> -							register int sum = 0;
> -
> -							/*  or BROADCAST flag */
> -							dhcph->flags |= htons(BROADCAST_FLAG);
> -							/*  recalculate checksum */
> -							sum = ~(udph->check) & 0xffff;
> -							sum += be16_to_cpu(dhcph->flags);
> -							while (sum >> 16)
> -								sum = (sum & 0xffff) + (sum >> 16);
> -							udph->check = ~sum;
> -						}
> -					}
> -				}
> +	if (priv->ethBrExtInfo.dhcp_bcst_disable)
> +		return;
> +
> +	__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> +
> +	if (protocol != htons(ETH_P_IP)) /*  IP */
> +		return;
> +
> +	struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> +
> +	if (iph->protocol != IPPROTO_UDP) /*  UDP */
> +		return;
> +
> +	struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> +
> +	if ((udph->source == htons(CLIENT_PORT)) &&
> +	    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
> +		struct dhcpMessage *dhcph =
> +			(struct dhcpMessage *)((size_t)udph +
> +						   sizeof(struct udphdr));
> +		u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> +
> +		if (cookie == DHCP_MAGIC) { /*  match magic word */
> +			if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> +				/*  if not broadcast */
> +				register int sum = 0;
> +
> +				/*  or BROADCAST flag */
> +				dhcph->flags |= htons(BROADCAST_FLAG);
> +				/*  recalculate checksum */
> +				sum = ~(udph->check) & 0xffff;
> +				sum += be16_to_cpu(dhcph->flags);
> +				while (sum >> 16)
> +					sum = (sum & 0xffff) + (sum >> 16);
> +				udph->check = ~sum;
>   			}
>   		}
>   	}

Hi

I was able to apply your patch.

I was able to compile it but the following warnings appeared:

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ make -C . 
M=drivers/staging/r8188eu/
make: Entering directory '/home/kernel/Documents/git/kernels/staging'
   CC [M]  drivers/staging/r8188eu/core/rtw_br_ext.o
drivers/staging/r8188eu/core/rtw_br_ext.c: In function ‘dhcp_flag_bcast’:
drivers/staging/r8188eu/core/rtw_br_ext.c:610:2: warning: ISO C90 
forbids mixed declarations and code [-Wdeclaration-after-statement]
   610 |  __be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
       |  ^~~~~~
drivers/staging/r8188eu/core/rtw_br_ext.c:615:2: warning: ISO C90 
forbids mixed declarations and code [-Wdeclaration-after-statement]
   615 |  struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
       |  ^~~~~~
drivers/staging/r8188eu/core/rtw_br_ext.c:620:2: warning: ISO C90 
forbids mixed declarations and code [-Wdeclaration-after-statement]
   620 |  struct udphdr *udph = (struct udphdr *)((size_t)iph + 
(iph->ihl << 2));
       |  ^~~~~~
   LD [M]  drivers/staging/r8188eu/r8188eu.o
   MODPOST drivers/staging/r8188eu/Module.symvers
   CC [M]  drivers/staging/r8188eu/r8188eu.mod.o
   LD [M]  drivers/staging/r8188eu/r8188eu.ko
make: Leaving directory '/home/kernel/Documents/git/kernels/staging'

Do you have the hardware to tested this code and have you tested it?

checkpatch:
ERROR: trailing whitespace
#74: FILE: 
/home/kernel/Downloads/PATCH-staging-r8188eu-fix-too-many-leading-tabs.txt:74:
+ $

ERROR: trailing whitespace
#144: FILE: 
/home/kernel/Downloads/PATCH-staging-r8188eu-fix-too-many-leading-tabs.txt:144:
+-- $

total: 2 errors, 0 warnings, 147 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

NOTE: Whitespace errors detected.
       You may wish to use scripts/cleanpatch or scripts/cleanfile

/home/kernel/Downloads/PATCH-staging-r8188eu-fix-too-many-leading-tabs.txt 
has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.

On a simple download test it workes on my hardware.

Thanks for your support.

Bye Philipp

