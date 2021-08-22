Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86073FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 20:25:07 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id l12-20020a4a94cc0000b02902618ad2ea55so4762436ooi.4
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bmqpliNkb/094MxV6QHJZFPABtXQSbh+VW+dL1e7K80=;
        b=iEXXicu0IkA+WDA8cnmhaZ/9F4aueoVx4xzKHAUvUsEqe+V5Q6TO0S+zqkO+Vu1RIW
         WZUvT4Ufh3nvOM/QRrB/hDzDTOVI794tsO/VOLjxxp+QFTpNc1rq00koFhXzXXNJ/L5c
         4pxhr7y4sJDkZ40JgZMyt2Fqk1uooFx8izkEWA1dzHkGa9naeH8jT0MTLPCZ30jIoKap
         IEBJCQwWZBO9nt17zJP20MZ1PsCi4aUt9KXPBnVbXnjrjWr1yEcCYVjn3YRiJhiTQOpo
         elnb8OQP4xl8JcBFIU7YNMEYfYuLeKZ0u/UF4KffYu5qImwloUO69BY+cLHYIR514dHT
         V4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bmqpliNkb/094MxV6QHJZFPABtXQSbh+VW+dL1e7K80=;
        b=AHm33x3cSRbAOv4SktM63GJtFFI9rtMswNfZNtAbTosCZEpONENUSHUkK6+uA94rPs
         +5AcjFEa2fbUvQsvSkvoBaRjo7GdbV+nRhR+picjvaRMunTXPGiVvnTS6l//BRRqk+0e
         NcLdv31WvlGuODmgGGsPDuOdR/r0JKDnVqixarkY9F/g96ufweYeSodynQwQKW8MK1LB
         Xbf8IwSOBLxHrFhArzY9tjhJbMdAVqxDPpNyrx55QofsjQFVuInCLY5oWoPOGtSNgy97
         xe9ZUld94FMme/6d/jO96q6DG5WL8GcOYH8u+xTHydM/OBsk1S4vK73S9X5pOLAXcYFY
         Luhg==
X-Gm-Message-State: AOAM531upWgrK4jWHU00xOeZVygoUEzKmezyNNHlnUrvFMum3rcsYQEW
	KAiWT2PFjmj46y3RN+NvKD8=
X-Google-Smtp-Source: ABdhPJymDottKPNee2tDP8BQlzMP4zQzssgEtS0WYrLveWx1JxJxi5uP3rDx3ceMDGAjP0blYXWSQA==
X-Received: by 2002:a4a:9f53:: with SMTP id d19mr9480242ool.8.1629663907073;
        Sun, 22 Aug 2021 13:25:07 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id a6sm3235834oto.36.2021.08.22.13.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 13:25:06 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v3 5/5] staging: r8188eu: incorrect type in assignment
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629562355.git.aakashhemadri123@gmail.com>
 <876b83dad76a6f561879da0db1fbb25b251374d4.1629562355.git.aakashhemadri123@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <2188755e-33b1-bbe9-6f9b-e184830612ba@lwfinger.net>
Date: Sun, 22 Aug 2021 15:25:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <876b83dad76a6f561879da0db1fbb25b251374d4.1629562355.git.aakashhemadri123@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 11:18 AM, Aakash Hemadri wrote:
> Fix sparse warning:
>> rtw_br_ext.c:516:57: warning: incorrect type in assignment
>      (different base types)
>> rtw_br_ext.c:516:57:    expected unsigned short
>> rtw_br_ext.c:516:57:    got restricted __be16 [usertype]
> 
> *pMagic holds __be16 change it's type to __be16
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 83a4594a4214..14cf13516d34 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -474,7 +474,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   		/*                Handle PPPoE frame                 */
>   		/*---------------------------------------------------*/
>   		struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
> -		unsigned short *pMagic;
> +		__be16 *pMagic;
>   
>   		switch (method) {
>   		case NAT25_CHECK:
> @@ -512,7 +512,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
>   
>   						/*  insert the magic_code+client mac in relay tag */
> -						pMagic = (unsigned short *)tag->tag_data;
> +						pMagic = (__be16 *)tag->tag_data;
>   						*pMagic = htons(MAGIC_CODE);
>   						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
>   
> 

For all 5 patches,

Ack by Larry Finger <Larry.finger#lwfinger.net>

Thanks,

Larry

