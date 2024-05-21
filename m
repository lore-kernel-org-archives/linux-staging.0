Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C820DD2
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716318262; cv=none; b=D3jxbxDyUAr+msLgfnkwPYCl58UbGnQoxPsYOaVbiv+bgmcQMQGafy+wzoLEDO+QPPjstKYdcHV6VZGgD7lLBehZNrJIQJwfywGgOppgmLSM7639BBRrx8BtOyqI44BSetX7dFZwdeZ13ACUa6A1Zp0eiq6HsrcKCqitI3W47D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716318262; c=relaxed/simple;
	bh=ICGvHXx5Pi7B8c6ZI2iMxTPlw9FEC5JhgOAcp5rNuU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nlj60tj0lGSmAGMls1ES5w1tVlkO6g5gskxYYjQ9oIsWdSKOxUZWsjr1kAFVPQlS9OO+QpmXn8ypqocXTdmbLcmSfQ2BcA8wM6UfAO0QLBAMdB7OocjPtBdkyxtwL80d+7PjuWPVsv+wRvywK9mmeWmxI/2VWmfw/q2bzsOfywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYkd0gbq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYkd0gbq"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-574d96f71efso1713493a12.2
        for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716318259; x=1716923059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7BbdMvzxHRPPnX9HXmTB+/r8rJ0cnISZJHlssmxst0=;
        b=YYkd0gbqH6R7MKlj1GCAdmHcuEXO+tvtbaVcUj19eHbkVK9mnZGkzVILX6IjcOnjDD
         AvKEFmNIRMQ6iHJ2kThRg9Q18bvSuSiJF/3tnpTgwuiwgikINHWAHA//z0/ei43uHCYv
         FEq99UEmB7ohr7i4nb6Fqbbe77zfJMOKvr0qji1Im1EcZCm6J7rHXkQ0phSNQAigxDGp
         fq2jcSJn5iO5jw5Hu1nz2XCcY8wXC60meb4NIE2nufbNS17AiBjAhfU87yW0nVUcA2Zo
         PNEq6zu+RtV6h9ckyn46YYWavzVuxKZiUcT7ALpVqkGpMUy9rvUupiOkam4uQU1F7dqg
         Ws9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318259; x=1716923059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7BbdMvzxHRPPnX9HXmTB+/r8rJ0cnISZJHlssmxst0=;
        b=ZZ7jkej1FPFICka76VOUtqsiXXeDKyX9DxOqLyuRJ5XCpB3j8VcEvZqXJVHZUV47xY
         eVpT9hd/AVVejaVCWDGS04jdqXWr5qUM0+54BaXGdWC/cbEy2qZoEDekyncS+D1b80QX
         PBpBaJm0/lKi4CeZageQuR9MEGYgMej0ok1W2vRvX9K1tjmntkHaQeNBo873XdXWjZc6
         eUD1n1TqzClNrkuYrDnQ5z3/0z4bwcMjjZi61frAvifzLO8EF/J0PqtMj937iiD04cQn
         v50a6Y2kxyW6e1jTCKlVqQXzgmv98EEzcJr/kQ37SO5DR8l24iEr1OJ/lQkE3zAwhq39
         Fi1g==
X-Gm-Message-State: AOJu0Yzc3WroJ0SJ7rJu/wxOfsvsBvfa8/lTkPegX3Po109KDYbUAXzg
	c/pLjQFZhIP8De3UnMlTI5ZJUnAsVBg7uCa6bk+TZIy54/x+rPVhSBwykw==
X-Google-Smtp-Source: AGHT+IHUac7tJmtKxXzHJ6SsIT21nq89zj38jGbFcbJJvWers0GZS/G0ZI/0eWleUKMHNwXD+rhd3g==
X-Received: by 2002:a17:906:a0c7:b0:a5a:580f:8e74 with SMTP id a640c23a62f3a-a5a580f9031mr1755816566b.5.1716318258510;
        Tue, 21 May 2024 12:04:18 -0700 (PDT)
Received: from [192.168.0.103] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0173asm1670478266b.179.2024.05.21.12.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:04:18 -0700 (PDT)
Message-ID: <faa1bcaa-0be2-4381-86fd-5f108a11869b@gmail.com>
Date: Tue, 21 May 2024 21:04:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Fix spelling mistake in rtl8712_xmit.c
To: Roshan Khatri <topofeverest8848@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 rcengland@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240521143617.53139-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240521143617.53139-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/24 16:36, Roshan Khatri wrote:
> codespell reported misspelled aggregation in rtl8712_xmit.c. This patch
> corrects the spelling to increase code readability and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl8712_xmit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
> index d7d678b04ca8..12f2fdb1b3cb 100644
> --- a/drivers/staging/rtl8712/rtl8712_xmit.c
> +++ b/drivers/staging/rtl8712/rtl8712_xmit.c
> @@ -247,7 +247,7 @@ void r8712_construct_txaggr_cmd_desc(struct xmit_buf *pxmitbuf)
>   {
>   	struct tx_desc *ptx_desc = (struct tx_desc *)pxmitbuf->pbuf;
>   
> -	/* Fill up TxCmd Descriptor according as USB FW Tx Aaggregation info.*/
> +	/* Fill up TxCmd Descriptor according as USB FW Tx Aggregation info.*/
>   	/* dw0 */
>   	ptx_desc->txdw0 = cpu_to_le32(CMD_HDR_SZ & 0xffff);
>   	ptx_desc->txdw0 |=

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
