Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5106376
	for <linux-staging@lists.linux.dev>; Fri, 21 Apr 2023 05:19:48 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-506bcf9aa50so406960a12.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 22:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682054387; x=1684646387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jztjxvTx1Nd++gm+Nl8nvs6/BoVGQCjSa4YLbCS/iU=;
        b=CIY5AfUxax/7lRHV9DD2QQDT3fYJQ85qqpt+ukT59YfzWsQMfXVdRjMu0Y5vOuTS8Q
         9oNJdrlThg9nxiONZCnqHt8qI7ESvPvIL7+krHMezSDxJy4E4VQFBK2tgxIMqXAiREKw
         2JCQb5WaNpU5xupy9oj73B5tpEd9eEusED8BSt/XDHa91sGFG4pYFMYTB/Dy5PvDQ9H8
         9lqbJdsLBiz1LlXNtWDKlNSOK0HdnwQaLEfIKaVmQO26ggAfimeTlS5nrqI2Q2hItW3N
         M7LDwGlQsroN+TgWM+Y0ypCMFxqy9KuaNjeZzvm8P2Sp0+hE7XqeCzDgPTHQv6h4isp1
         LZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682054387; x=1684646387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jztjxvTx1Nd++gm+Nl8nvs6/BoVGQCjSa4YLbCS/iU=;
        b=CXqbYnS4IIb9xvBExCZP+FcH7tGXCqc8lmm5CJRA13i6LUYhSco4CA/cbnP5pSa0+n
         2lyavLu8Ti71DYn+vmJA5i2cO4xFHTeP/huUYElsgKokQnV/DZ9aI2UgusgRf7Dgnq98
         20gNq0OKexebpchEHx+JoDw9slTfF7JLs+8hbbg1pqgJdll7jfxMu5D9731kOCdGx0Ao
         iAQMXZ4cT6mmsimmglfRmiogWVPYfA4zt5ApCzBQLkjCVigijV3AIO+Me1CrDrsHgsZH
         f1LuoHYbI4VEKP/gPZQwzsrQsNgL8GaVfqyseBzjoH8iiGTChJiZh/myiZMRvWUUY14l
         M3Dg==
X-Gm-Message-State: AAQBX9fRtwCKViflEnKqRK3PRm2erEFK1NAJi/L/PX2OegRiZyDkagcF
	uGnwbbS8s69bDmdEMlxqdzk=
X-Google-Smtp-Source: AKy350b+lT274nfvY5/Go1LqODkZ2O2wa5me4diBj1+Ep8OdDKGWoybWiZ+AeUI46H2HAP38N8jBkg==
X-Received: by 2002:a05:6402:5202:b0:504:b68e:9676 with SMTP id s2-20020a056402520200b00504b68e9676mr3763948edd.2.1682054386589;
        Thu, 20 Apr 2023 22:19:46 -0700 (PDT)
Received: from [192.168.0.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm1478416edx.77.2023.04.20.22.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 22:19:45 -0700 (PDT)
Message-ID: <89c16e6f-4120-c358-3961-8ec1bbdae3f2@gmail.com>
Date: Fri, 21 Apr 2023 07:19:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] staging: rtl8192e: add missing braces {}
Content-Language: en-US
To: Stephan Snyman <rooiratel@tinyglitch.net>, gregkh@linuxfoundation.org
Cc: kamrankhadijadj@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230420133209.4661-1-rooiratel@tinyglitch.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230420133209.4661-1-rooiratel@tinyglitch.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/23 15:32, Stephan Snyman wrote:
> Add missing braces to if/else statements to adhere to the
> Linux kernel coding-style guidelines.
> These issues were reported by checkpatch.pl
> 
> "CHECK: braces {} should be used on all arms of this statement"
> 
> Signed-off-by: Stephan Snyman <rooiratel@tinyglitch.net>
> ---
>   drivers/staging/rtl8192e/rtllib_rx.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index b649d02dc5c8..d44bf261de54 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -264,8 +264,9 @@ static int rtllib_is_eapol_frame(struct rtllib_device *ieee,
>   		   RTLLIB_FCTL_FROMDS &&
>   		   memcmp(hdr->addr1, dev->dev_addr, ETH_ALEN) == 0) {
>   		/* FromDS frame with own addr as DA */
> -	} else
> +	} else {
>   		return 0;
> +	}
>   
>   	if (skb->len < 24 + 8)
>   		return 0;
> @@ -433,8 +434,9 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
>   		if (*last_frag + 1 != frag)
>   			/* out-of-order fragment */
>   			goto drop;
> -	} else
> +	} else {
>   		*last_seq = seq;
> +	}
>   
>   	*last_frag = frag;
>   	*last_time = jiffies;
> @@ -2314,8 +2316,9 @@ static inline int rtllib_network_init(
>   	if (stats->freq == RTLLIB_52GHZ_BAND) {
>   		/* for A band (No DS info) */
>   		network->channel = stats->received_channel;
> -	} else
> +	} else {
>   		network->flags |= NETWORK_HAS_CCK;
> +	}
>   
>   	network->wpa_ie_len = 0;
>   	network->rsn_ie_len = 0;
> @@ -2329,9 +2332,10 @@ static inline int rtllib_network_init(
>   		return 1;
>   
>   	network->mode = 0;
> -	if (stats->freq == RTLLIB_52GHZ_BAND)
> +
> +	if (stats->freq == RTLLIB_52GHZ_BAND) {
>   		network->mode = IEEE_A;
> -	else {
> +	} else {
>   		if (network->flags & NETWORK_HAS_OFDM)
>   			network->mode |= IEEE_G;
>   		if (network->flags & NETWORK_HAS_CCK)

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

