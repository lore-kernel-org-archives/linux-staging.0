Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECF23A0
	for <linux-staging@lists.linux.dev>; Wed, 14 Dec 2022 07:00:38 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id t17so42315081eju.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 23:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7e0Of+yNggFNTT7AHup7iSgLPisczF+WTo4peuI7E0=;
        b=oLYduO/svctaPUUIvjKHhbAziz4+h7+BlTMkWyrSUMfhbpNHtcso5doxP2987y1O0M
         /sGqsnbr+sS47YK04iljE/6Ote+ZNUJcAsaHK5JXQFPMIhwlqrcjtzJOFJ0iY9JxV/lM
         oZnGCviGTHJcyR/kn5lIs2tRrBDAdc+/Txd7sJLTKy4eWoP/DWSyMuvtgwmEa+OYR9Ry
         zV24DZVU7w2Ghg12HYf4lq2/mg8oyjuDBdQ5lbNj/OF4ZqQ+9f91dzWGpQHtLOMs+eBz
         ufJ4hXxsmqqyH6UpvNPBsG0YAO6ZfnTB+WXNaMhEMs+EZeIosdPa1kx5FkAC8HoSlh3J
         gD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7e0Of+yNggFNTT7AHup7iSgLPisczF+WTo4peuI7E0=;
        b=ojzfbuZQBb+pCYXxjlafKNo+POTK3OaffKEmRm10dBWfZmDhRoFdcRlK4GCMwAd0DE
         glm7QNhqvpcC5WRE7Y/WoNP6SI34omOmYg4VtVtszwc7BY/s3mcukDRiXyBGqbQy/x8E
         VSBiQvdARAU3SEwQANNlBQGHCikhs6Eru0glpADEhjB/Z8rDtvbw72lpT/D1rXKIkvZD
         1cUxE8mX1bTTo0wX3xthMDjwqu6Gu8eKB+fxr+l8XPzvsCDph565/Si4/KOdmX6rpoob
         OWNtUDLX+sgXIqqTt1bde7XOCc78bXt8w0O6u2xt6ERuMXJiZAAczASYZCZmbUlE/WiM
         A97g==
X-Gm-Message-State: ANoB5pkJlsAqvEZMcNbU8NvSG/2BBcZEj90l31pVac2Wlw8RVTzehtcX
	ItSq1g0xckeuPt/CbsdaKaI=
X-Google-Smtp-Source: AA0mqf7LPFQisApzeY4K08BVpyr/pt+y6yMEzTq3Tlw9EezhBbM376MYa33gkmW9SkuHMGle9/9zVg==
X-Received: by 2002:a17:906:85c2:b0:7c1:27d:3df8 with SMTP id i2-20020a17090685c200b007c1027d3df8mr4535615ejy.4.1671001237148;
        Tue, 13 Dec 2022 23:00:37 -0800 (PST)
Received: from ?IPV6:2003:c7:8f35:4b22:9653:a94c:c63a:fa1f? (p200300c78f354b229653a94cc63afa1f.dip0.t-ipconnect.de. [2003:c7:8f35:4b22:9653:a94c:c63a:fa1f])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906318100b0077f20a722dfsm5393913ejy.165.2022.12.13.23.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 23:00:36 -0800 (PST)
Message-ID: <c1887a83-25c2-0979-e790-04cdd5ad4aec@gmail.com>
Date: Wed, 14 Dec 2022 08:00:35 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: vme_user: Add spaces around "<<"
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>,
 Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <Y5jYuKfm9d59h6bd@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y5jYuKfm9d59h6bd@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/22 20:55, Abhirup Deb wrote:
> Add spaces around the "<<" in adherence to the Linux kernel coding-style.
> The issues were reported by checkpatch.pl.
> 
> Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
> ---
>   drivers/staging/vme_user/vme.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> index 98da8d039d60..a74724457d29 100644
> --- a/drivers/staging/vme_user/vme.h
> +++ b/drivers/staging/vme_user/vme.h
> @@ -54,20 +54,20 @@ enum vme_resource_type {
>   #define VME_R_ROBIN_MODE	0x1
>   #define VME_PRIORITY_MODE	0x2
>   
> -#define VME_DMA_PATTERN			(1<<0)
> -#define VME_DMA_PCI			(1<<1)
> -#define VME_DMA_VME			(1<<2)
> -
> -#define VME_DMA_PATTERN_BYTE		(1<<0)
> -#define VME_DMA_PATTERN_WORD		(1<<1)
> -#define VME_DMA_PATTERN_INCREMENT	(1<<2)
> -
> -#define VME_DMA_VME_TO_MEM		(1<<0)
> -#define VME_DMA_MEM_TO_VME		(1<<1)
> -#define VME_DMA_VME_TO_VME		(1<<2)
> -#define VME_DMA_MEM_TO_MEM		(1<<3)
> -#define VME_DMA_PATTERN_TO_VME		(1<<4)
> -#define VME_DMA_PATTERN_TO_MEM		(1<<5)
> +#define VME_DMA_PATTERN			(1 << 0)
> +#define VME_DMA_PCI			(1 << 1)
> +#define VME_DMA_VME			(1 << 2)
> +
> +#define VME_DMA_PATTERN_BYTE		(1 << 0)
> +#define VME_DMA_PATTERN_WORD		(1 << 1)
> +#define VME_DMA_PATTERN_INCREMENT	(1 << 2)
> +
> +#define VME_DMA_VME_TO_MEM		(1 << 0)
> +#define VME_DMA_MEM_TO_VME		(1 << 1)
> +#define VME_DMA_VME_TO_VME		(1 << 2)
> +#define VME_DMA_MEM_TO_MEM		(1 << 3)
> +#define VME_DMA_PATTERN_TO_VME		(1 << 4)
> +#define VME_DMA_PATTERN_TO_MEM		(1 << 5)
>   
>   struct vme_dma_attr {
>   	u32 type;

I propose to use the BIT macro as checkpatch proposes it when I apply 
checkpatch to your patch. Please also correct the number of tabs to align.

Thanks,

Bye Philipp

CHECK: Prefer using the BIT macro
#37: FILE: drivers/staging/vme_user/vme.h:57:
+#define VME_DMA_PATTERN			(1 << 0)
