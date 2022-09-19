Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A946D24
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 18:51:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n8so149562wmr.5
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KOHOy6vA9ZnsPk6u3LYcHqNXTndDFya+wLFq+gWL6lg=;
        b=HtLt5xhGAXR9J21gbStTz1uppWovmTC1SebucrN0NgtjjhM2gommhIeP3ma9cgqto5
         QMpFIKt+v0tVQiuxZOGllkxryvfZjUtvqgZq+u8uMAteZY0XNvp/Pq7NLYcYKIKuBtmR
         fuCt+ZI6CAQSS28T9zgA3nENmJRDgMrk8SMihnfsk/q+gy26igMUOnJD+YYSSVcf569x
         quXc2dTZTedZ5gjrZmEukWrX2AoF2z8I40+eZvuqyh+/52644wh7rI3nWjeD2hbiG5jy
         8RwYA2osZl4gSJD5+8E69Y4gl9OMKzwtghrBrvUZp5cxsm/6ARQHC8dY0afKM+shd227
         CJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KOHOy6vA9ZnsPk6u3LYcHqNXTndDFya+wLFq+gWL6lg=;
        b=fPtERFSSWee9APx/gUvAaxPunRWse9LUUXdk2smAXeP8Y9NLMnV6dyW5BaL16guARs
         heZ7In6TIZJfn8WfLh07qijDY+dHOwiRurNA6nEhwzIQCr+rrF+IH28YytOFY+G//GPy
         qbaVdNmEfHAWag+wn1+WFYRiWviZElQkSfoobLbz8xx1QIoHqP11+1NnuZj5FOzTQ27e
         QLIa1B/UcZb/0nrfIsAn87BYMT2WUG3SuWD61Gq9AkES7oP4FOKcUx+SZvmXOe53DTXc
         TMuTVn+k7/Qpg04HM5JzaJoKmCNYsC/mvTjehI8knRu+wWnPFb/DISDVRe7e3qR20IVN
         Z3Lg==
X-Gm-Message-State: ACgBeo3zUt5ZDAFHzD0VP+aQti7PoG2YfrTvf6Lk9bj9Ey8r2xeG3zvL
	4GhkFxJR1Gv2t+PqpDnPmcU=
X-Google-Smtp-Source: AA6agR7YxVWSSigx6zzSDCXal2Mb1B9ah0ovuIRh/oce/tQf90CAo0F1hy6vxd6aeph5TNUHSWZQfw==
X-Received: by 2002:a05:600c:4e4d:b0:3b4:7659:38c with SMTP id e13-20020a05600c4e4d00b003b47659038cmr19927651wmq.176.1663613484783;
        Mon, 19 Sep 2022 11:51:24 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a10:9fb4:d689:f4a2:c991? (p200300c78f3e6a109fb4d689f4a2c991.dip0.t-ipconnect.de. [2003:c7:8f3e:6a10:9fb4:d689:f4a2:c991])
        by smtp.gmail.com with ESMTPSA id c18-20020adffb52000000b002252ec781f7sm14626452wrs.8.2022.09.19.11.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 11:51:24 -0700 (PDT)
Message-ID: <672512d7-06ae-c6ca-280c-13183c5bdd00@gmail.com>
Date: Mon, 19 Sep 2022 20:51:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] staging: rtl8192e: spaces preferred around that '<<'
 (ctx:VxV)
Content-Language: en-US
To: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>,
 gregkh@linuxfoundation.org
Cc: f3sch.git@outlook.com, guozihua@huawei.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220919141624.8765-1-aruna.hewapathirane@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220919141624.8765-1-aruna.hewapathirane@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/22 16:16, Aruna Hewapathirane wrote:
> This patch fixes 2 checkpatch CHECK issues
> 
> Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
> index f651947f6b44..933f347fc17e 100644
> --- a/drivers/staging/rtl8192e/rtllib_tx.c
> +++ b/drivers/staging/rtl8192e/rtllib_tx.c
> @@ -818,10 +818,10 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
>   					 cpu_to_le16(rtllib_query_seqnum(ieee, skb_frag,
>   							     header.addr1));
>   				frag_hdr->seq_ctl =
> -					 cpu_to_le16(le16_to_cpu(frag_hdr->seq_ctl)<<4 | i);
> +					 cpu_to_le16(le16_to_cpu(frag_hdr->seq_ctl) << 4 | i);
>   			} else {
>   				frag_hdr->seq_ctl =
> -					 cpu_to_le16(ieee->seq_ctrl[0]<<4 | i);
> +					 cpu_to_le16(ieee->seq_ctrl[0] << 4 | i);
>   			}
>   			/* Put a SNAP header on the first fragment */
>   			if (i == 0) {


Please remove the 3/3
add a V2 and a change history


