Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA217C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 18:40:24 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-df22f50e0cso3657131fac.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Apr 2022 11:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fk/O5aak+N33KC9MIWPLIbExEcKor3AEJLX4blCgxJs=;
        b=SiPYCiMvqlOnvvJ12rA9PeRsnBQ11JhSBGYiHNiXnWO8U2t9FYIrag87+HlowHzOEq
         QEfHwgntR/KK1/HhqDFmq7d6SWGjTpYI9ow3bjFcWPyvhmV7rm80rjtzGQMsZ31C/DtH
         qvdaWhXfwNGg6vGHD2P1RcPUurQvw88GTUCGxMudpjFWdGYF4XpSG11+ySZ6qfrMiWoM
         gdsl41WsJBa+BUr7WopTFUC5/k0PTeMgtN241IKFzHfGo603ShuW2Xirn4Wh71qQHehX
         aGbFURiydzAR/YSx/IXwBf9AthIiGhteSjKuIMVqCVEPbuxrUMtu+VjjEfnqLBqlb7R4
         FHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fk/O5aak+N33KC9MIWPLIbExEcKor3AEJLX4blCgxJs=;
        b=gXjDPAlhYTxuG783vlqTp1MO29XpKjHo09Y5YjLC7az+/7FJfQDxMKPEtFW25sDJKD
         ccn7Wqnrc7WzPvZXXwqNMAkereVmblMuGpJfBBHOKnYhjcTb8NLgFqSP2FUHp0lA1VEM
         BfQvt047fJYOhQ3LX9g2IpWqEBD7x9jt7xiM+udxnPAfaPfrfAuu3dPFe54zKpXWeZlg
         huc4Xty/tvHGZRxyEOCNpmbeMqBKJuOp3RkeFJCPZKZhljQOitaKsBH4IH6fQ9nFsY/0
         YihBo7A4SMzUl7N7YL+5bjhhSx27EfpuCdCoSU1zlt29Zvu1DuAQpTOhW3jqcKfDXuO4
         hFew==
X-Gm-Message-State: AOAM5319utGyn14jkeOJJj9BfTqaSMR4PGgFoeT+soi09EZ3vrZQsEFB
	8f3bxtF1UrnbrSrVQodpuoc=
X-Google-Smtp-Source: ABdhPJw6ApqVyzvZkE7AP2DkgyzvazCou+czbhV9toVYHjwbY7GETxfBbM9+pBT/ROWOZi1K0zLWVw==
X-Received: by 2002:a05:6870:2041:b0:db:1a12:6cb1 with SMTP id l1-20020a056870204100b000db1a126cb1mr5437381oad.153.1648838424030;
        Fri, 01 Apr 2022 11:40:24 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1004? (2603-8090-2005-39b3-0000-0000-0000-1004.res6.spectrum.com. [2603:8090:2005:39b3::1004])
        by smtp.gmail.com with ESMTPSA id y16-20020a9d6350000000b005c9653ab377sm1381170otk.17.2022.04.01.11.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 11:40:23 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <782f0115-e45f-1aff-a152-5d403c990b31@lwfinger.net>
Date: Fri, 1 Apr 2022 13:40:21 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: Fix PPPoE tag insertion on big endian
 systems
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220401151257.3414576-1-linux@roeck-us.net>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220401151257.3414576-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/22 10:12, Guenter Roeck wrote:
> In __nat25_add_pppoe_tag(), the tag length is read from the tag data
> structure. The value is kept in network format, but read as raw value.
> With -Warray-bounds, this results in the following gcc error/warning
> when building the driver on a big endian system such as alpha.
> 
> In function '__nat25_add_pppoe_tag',
>      inlined from 'nat25_db_handle' at
> 	drivers/staging/r8188eu/core/rtw_br_ext.c:479:11:
> arch/alpha/include/asm/string.h:22:16: error:
> 	'__builtin_memcpy' forming offset [40, 2051] is out of the bounds
> 	[0, 40] of object 'tag_buf' with type 'unsigned char[40]'
> 
> Add the missing ntohs().
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Cc: Phillip Potter <phil@philpotter.co.uk>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index d68611ef22f8..31bcd495ec04 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
>   	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
>   	int data_len;
>   
> -	data_len = tag->tag_len + TAG_HDR_LEN;
> +	data_len = htons(tag->tag_len) + TAG_HDR_LEN;
>   	if (skb_tailroom(skb) < data_len)
>   		return -1;
>   

Strange that a BE compiler would generate a warning for what is actually an 
execution error on LE platforms.

I prefer be16_to_cpu() to htons() as the former makes it clearer what is 
happening, but I suppose that is a matter of choice.

Reviewed_by: Larry Finger <Larry.Finger@lwfinger.net>

Incidentally, Sparse shows 3 more __be16 problems in this routine. I leave their 
fixing to you.

Larry

