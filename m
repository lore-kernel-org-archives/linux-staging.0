Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E093FC3
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 21:38:05 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id y14-20020a0568302a0e00b0051acbdb2869so10365473otu.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 14:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N7XPfZrpLOPQ3NWuP/cwpVYxz6UbQiCYNHlikEjuLok=;
        b=aWIMoTVoWZNs3yRDn8pUNWaxKg7XQsvdmhbRj3EmZJPwSb6AlzJfB2UNPGfbahts95
         wkTIbGsPD2D8SxBmn08rbtOTq+m4IM+U3cihi57neg+8i310yjAsdz9iwKE5NANCYtIW
         H2B+3fnEeHnjyEZoQgnahSS7QsGSWWg8C7XkRVGUX8QbSUpDeC3d8iwfidVuem6bayU2
         FWQiVc+Ak8vfgrdHIeuQG5Py8MtaCCiVXkzTJrsi5kkiShh7oNK3Qe7SuEQLTvvmZ19p
         05CiZAcuscEZ1BDS89S7XC/XP96IhQyVw+0WClUpxl+FjfmK2B6PuQFtKyr4qRJLlAoM
         WH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N7XPfZrpLOPQ3NWuP/cwpVYxz6UbQiCYNHlikEjuLok=;
        b=oaBlNZYxQOKme+N5vFZr5yeD3rB2xkqsmNz8CkNWeGE2AI2KsjvenFTnlo/iOT4Kn1
         MOSIEOLYTRQOcyH2ZpxxatvJulqnULteyRWWEYqYqrCoGlphXrCNE1fGQXJF6dHEYki9
         Pk3XvWJZPE8/JTzHI/c4xZGlQtfEqpyMrb53K40ZA3oNKo5/toRPgwdmoe7mdvOUGwsU
         yTl2QHtGfyxLWeMJqJwV83R0GufpblFZ16LRJaqt6fv8JQXRs6LSR3/Lu0++y074jjzA
         unXDLtE6UYy6rgrEB65Hsz51AOvueiE87NqgNV99d6sPFyGBG2kyC1FLJ7qqLp4znHHd
         DfcA==
X-Gm-Message-State: AOAM531QQ6sTQ9hJSeXqrR7/ZMcc0GNvQvKmFj4G50unD29r4V3p3drX
	Aj0g7bAn9IK6k9K9Wo/GFcQ=
X-Google-Smtp-Source: ABdhPJzH5eoNOZtzG9sfDPwdjn719WDuQCmILJNb57uiTpUzsBCEH6pfQM2n10F4M0yoDNiJYJtcqA==
X-Received: by 2002:a05:6808:690:: with SMTP id k16mr4514518oig.152.1629495484559;
        Fri, 20 Aug 2021 14:38:04 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id f33sm1761642otf.0.2021.08.20.14.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 14:38:03 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v2 3/5] staging: r8188eu: incorrect type in
 csum_ipv6_magic
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <8bc15e51751c26fd19428f3b4976b7495feecd34.1629360917.git.aakashhemadri123@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <58069e38-a457-9fcc-0a9a-6bfe8723a178@lwfinger.net>
Date: Fri, 20 Aug 2021 16:38:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8bc15e51751c26fd19428f3b4976b7495feecd34.1629360917.git.aakashhemadri123@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/19/21 3:17 AM, Aakash Hemadri wrote:
> Fix sparse warning:
>> rtw_br_ext.c:771:84:    got restricted __be16 [usertype] payload_len
>> rtw_br_ext.c:773:110: warning: incorrect type in argument 2
>      (different base types)
>> rtw_br_ext.c:773:110:    expected int len
>> rtw_br_ext.c:773:110:    got restricted __be16 [usertype] payload_len
> 
> csum_ipv6_magic and csum_partial expect int len not __be16, use ntohs()
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 6a0462ce6230..d4acf02ca64f 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -615,9 +615,9 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
>   						hdr->icmp6_cksum = 0;
>   						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
> -										iph->payload_len,
> +										ntohs(iph->payload_len),
>   										IPPROTO_ICMPV6,
> -										csum_partial((__u8 *)hdr, iph->payload_len, 0));
> +										csum_partial((__u8 *)hdr, ntohs(iph->payload_len), 0));
>   					}
>   				}
>   			}
> 

This patch is correct, but I prefer that you use be16_to_cpu() rather than 
ntohs(). I think it makes the code easier to read.

Larry

