Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B86D24
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 18:43:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id cc5so533828wrb.6
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XXL755xKEDAaIr3RDQbYzg0dLX5U1WGFXrDCkU4fSpY=;
        b=J4wPiGC7ovl46qAq7l3sYYxHuoVAfzBgVQ3EGrQ/Y4UUYC9xm06X6ADhTHPLoNnzRV
         GMPM5UtiTcnDUp1qw6c7br5p4dsNKpOg4r/03b/IZBOtOlItu2YkUniSlPFfLgmK6G+Q
         P97NMIFPUOkAnZr3Ra2MP71O8u0t1itle7O0sH5cq2Q+YwUzrqvZhQVJnWGGFZs0UclL
         c1l+YsM/8WMDTBMdXp3voktas6vUgoCSUkfrvoLITW/GntgQB6sWuDpYHdeW0AWfiG/o
         8ZW8S4SnUSafjpqy/7gBS7KHVofu+ZsFeNOlCfFIZf1xjh/9oFFh8LqH7L0jh6tA+FsR
         tMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XXL755xKEDAaIr3RDQbYzg0dLX5U1WGFXrDCkU4fSpY=;
        b=Rfggguo8GozTgjYyEjoDdI55BuE7mtuYPLYezUjoY+nt+rm4YEe5oJGeeXaLZWPOQM
         bbllRc03netiAiAUkeTywW0UmxQo0/jZeD0e7xGrNv4/JCbhOKidk/Pxxji8PejHsEps
         kOF2v9+IyIVJWydM5p5zb3yZsBkGm14B2VKVybh8sb6T3SW+uRjx7bfomU3p8XMlGoO1
         p2NetAXRp5PQYkSNuNIOimma8cxYqg7LlRzR24vmcBh7D6iCKTYbWlKRzvG4Ekeu74GU
         ekDDSWOV6mf/z3oe3uvSuvF2xJcp8uIetuO8d7dP09hcUf/r89bLfybkdOQXf+7T+K05
         8p5A==
X-Gm-Message-State: ACrzQf3Rnau0720u2qbFcl42QcrS4ciF6Blq9JSVzfC8+RkjLkKKoQ02
	/GOuv8EO2FI0k0oue0YIqJI=
X-Google-Smtp-Source: AMsMyM6pYWIPMktvaPsLH3jpYC7dKvRYqa7TuL4nvhCWs/913tf3IFdaraB368dR6D/NgTk8prVblg==
X-Received: by 2002:adf:ee86:0:b0:228:6fe1:371 with SMTP id b6-20020adfee86000000b002286fe10371mr11181771wro.684.1663613005942;
        Mon, 19 Sep 2022 11:43:25 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a10:9fb4:d689:f4a2:c991? (p200300c78f3e6a109fb4d689f4a2c991.dip0.t-ipconnect.de. [2003:c7:8f3e:6a10:9fb4:d689:f4a2:c991])
        by smtp.gmail.com with ESMTPSA id bi9-20020a05600c3d8900b003a844885f88sm14032089wmb.22.2022.09.19.11.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 11:43:25 -0700 (PDT)
Message-ID: <e56a77ac-7d63-e428-cc7d-4e512c5e7da8@gmail.com>
Date: Mon, 19 Sep 2022 20:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] staging: rtl8192e: Removes blank line
Content-Language: en-US
To: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>,
 gregkh@linuxfoundation.org
Cc: f3sch.git@outlook.com, guozihua@huawei.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220919142726.9101-1-aruna.hewapathirane@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220919142726.9101-1-aruna.hewapathirane@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/22 16:27, Aruna Hewapathirane wrote:
> This patch fixes checkpatch multiple
> blank line issue
> 
> Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtllib_tx.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> index 933f347fc17e..ee7c1a5e93c6 100644
> --- a/drivers/staging/rtl8192e/rtllib_tx.c
> +++ b/drivers/staging/rtl8192e/rtllib_tx.c
> @@ -895,7 +895,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
>   				tcb_desc->bTxDisableRateFallBack = 1;
>   			}
>   
> -
>   			tcb_desc->RATRIndex = 7;
>   			tcb_desc->bTxUseDriverAssingedRate = 1;
>   		} else {

Combine this one with the other patch.

Bye Philipp
