Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6747823A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 08:35:55 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id s12so3654803edd.5
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8VESBKh1KMoZOvtg0ZXq27EnrJxCWZC/qS4aZqyj6E=;
        b=ckK656tMCZn6XdNyIdpwTuvuc78qcLTit148z0817frs3Lu9U8ibpVJOHuwzuhKteo
         KISbgXg6rdFNPl7WKZMr76PxqxzBTQSCcOYHeXz0g7Gmbo7cocxbefWpjjLPxUdIA9+z
         U6pal+7Wo9FJjtgwgXDQRf5ju2KXZ+7KILzbFoWL2j+W8ftA0sFd8QVT7lZJxPh1/pXP
         ubC67zvY85c1uf0+5fOhJG7IteFg2gRmIHY/ru2pwUYuv1NfyON+cRg7xiXHiB4YSy6H
         9L7vkIf1QxylvC+9MTHKE+bZ180Y7lFbfWceDY/QEQJX5B135Z7oUEl43cb7iAW7Vz9Q
         lCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8VESBKh1KMoZOvtg0ZXq27EnrJxCWZC/qS4aZqyj6E=;
        b=StP5ExPwrc+WyTLouh2UzCr342h9qr2WXdBaX00E28vM6zQ+QycmbWrfQeT847NtPv
         lRkbbuS9X88SqYP14m4/3jdvxgoclbndEUDaY9jO5afPc3jUWxL5TAC+kdslJz97VzUm
         2V8lVkAx8ur1v0Cbzpyy1+7o1xtmzuWj7IJ78YvlugEDm81NCG2bn0H9z4GGWfISdZO7
         0mwSXKLeKbsLikeA8qlSWaQp7ugL1lLrCGPzht/ttg251/o+UiaFeDGpFQgmfYnCcIO8
         6GsYK9eOnoe37r72S1DwP0t1CBNgJ8xbsNFvFoGlJXj4vttG/QJ9nMFqwFUfqxIM6zIY
         qQlw==
X-Gm-Message-State: ACrzQf3MlGwzcPaeM1/f4EaC4i3ytFaFGwTPpdD5WLzk7zMf1+AItkec
	wqxZSO5KLZMswyrJoCIifIM=
X-Google-Smtp-Source: AMsMyM5xQd8XIQIdDn9rJugZguTohqD5xQiQajGEtAeexVP9/CA70pQvYS69d7Z5EXfJhKr4v9a2RA==
X-Received: by 2002:aa7:cf0b:0:b0:461:2271:8559 with SMTP id a11-20020aa7cf0b000000b0046122718559mr44462387edy.92.1667723753732;
        Sun, 06 Nov 2022 01:35:53 -0700 (PDT)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id i28-20020a1709067a5c00b00781dbdb292asm1858629ejo.155.2022.11.06.01.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:35:53 -0700 (PDT)
Message-ID: <f3b1a309-f7bc-a225-90ac-90838a89acfa@gmail.com>
Date: Sun, 6 Nov 2022 09:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: simplify complex pointer casting
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y2dvmdGxQfmK4O6F@qemulion>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y2dvmdGxQfmK4O6F@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 09:26, Deepak R Varma wrote:
> Pointers to structures udphdr and dhcpMessage are derived by casting
> adjacent pointers with size_t. Such typecast of pointer using size_t
> is not preferred. The code looks complex and delicate. Simplify such
> casting by utilizing generic "void *" casting.
> While at this change, remove the unnecessary __be32 casting for member
> variable "cookie".
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a23f7df373ed..e9b0906d0d74 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -610,13 +610,15 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>   			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> 
>   			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
> -				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> +				struct udphdr *udph = (void *)iph + (iph->ihl << 2);
> 
>   				if ((udph->source == htons(CLIENT_PORT)) &&
>   				    (udph->dest == htons(SERVER_PORT))) { /*  DHCP request */
> -					struct dhcpMessage *dhcph =
> -						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> +					u32 cookie;
> +					struct dhcpMessage *dhcph;
> +
> +					dhcph = (void *)udph + sizeof(struct udphdr);
> +					cookie = be32_to_cpu(dhcph->cookie);
> 
>   					if (cookie == DHCP_MAGIC) { /*  match magic word */
>   						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> --
> 2.34.1
> 
> 
> 
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
