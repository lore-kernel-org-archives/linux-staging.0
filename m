Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A835A3FC3
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 21:44:51 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so17160468oth.7
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 14:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sdBtLLcxFh85B7imhpoS1jrj2mYz3GQrzK1SA3JSPBc=;
        b=Ymx1V8TzLYDcDqYJ/At9cSPdQ3bHct1g2Kr6Mtw5NjPyKpRn0fzpgwcpfZwC5DWfOI
         sCBlsjJ9h4mBw5HogM+Iea8kk5/h4yA20FI9rYmLMGm1a0BozIuav8hXt8Uq3pLVjpvB
         PPlG35gEeN1Jm1cVZvzqZiNzh7DWrPkeUHdAj8M3/dBl7xArr2zHXZuB9QHf15F2NznY
         +HrLp0nPzILP5lrEXnysznE2egUIC4Iay0ALS4u7/uZZ6qZHsL1sYdRT2PGej2CxF1f7
         r0aCX6rbwEb2ISBDLlEAxXW2PuGMpNpYzZ8xpMnRi+7UiYH9lmapoXDq8iUbQW3+ljuL
         zGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sdBtLLcxFh85B7imhpoS1jrj2mYz3GQrzK1SA3JSPBc=;
        b=bh0y2ocfj1+jiDZssCSUfuVkNN/aHu5tgikaLiDt8mkAIneEhPMEa0f08LQ+uzNoS5
         MirNPfFROTH1tZ10wuLWM1M+a583PILqs9GDHxL+9OFykmj2Ar4U2jCHjHTvxR14tRpt
         6S/roXenoCSq24szMzXNykGEo3YzJie9Yd0NcgBeDshGdM+09Ac0TuaT9ZaJgMHdY9cE
         95fb6eBwlewqsziK8NR5jMpacrtSKo9Djr6xgVEZ8QJvJ//YHOB7pMFR2JStPV7nVsGM
         fKSamNfR5pqkNH94nEew7SVf+yBafRsOL8hLPrCrS6GoYRAMRiTpo9h87R268ZPjsbQP
         hlAw==
X-Gm-Message-State: AOAM530Z614dhzsFXaVRuz/hsAlalEG9QOuJf/cLopG3xMLnjAN6yOTW
	rpaxEhpvFYHneJ0ZNwh+Y9o=
X-Google-Smtp-Source: ABdhPJyxBZwR57KcXB+D7nrMaUKCONnXfpHfleecCDZgR0sJRFcpOrptgS51YnUefxVerk3Ekc6XgA==
X-Received: by 2002:a05:6808:90a:: with SMTP id w10mr4625994oih.164.1629495890817;
        Fri, 20 Aug 2021 14:44:50 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id m6sm1708799otf.52.2021.08.20.14.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 14:44:50 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <4be5c5fa-c3fd-8c86-e904-8e2e60173380@lwfinger.net>
Date: Fri, 20 Aug 2021 16:44:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/19/21 3:17 AM, Aakash Hemadri wrote:
> Fix sparse warning:
>> rtw_br_ext.c:836:54: warning: cast to restricted __be32
> 
> Unnecessary double cast, remove them.
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 404fa8904e47..6a0462ce6230 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>   				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
>   					struct dhcpMessage *dhcph =
>   						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> +					u32 cookie = dhcph->cookie;
>   
>   					if (cookie == DHCP_MAGIC) { /*  match magic word */
>   						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> 

This patch is wrong. All the documentation I could find tells me that the 
multi-byte entries in dhcph are big-endian, thus the new line should read:

					u32 cookie = be32_to_cpu(dhcph->cookie);
combined with:

@@ -649,7 +650,7 @@ struct dhcpMessage {
         u_int8_t chaddr[16];
         u_int8_t sname[64];
         u_int8_t file[128];
-       u_int32_t cookie;
+       __be32 cookie;
         u_int8_t options[308]; /* 312 - cookie */
  };

The old code was, in fact, correct, but not in a way that satisfied Sparse.

Larry

