Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6743939BF
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740947; cv=none; b=Hk8HcTLAClEe16e14NQcjilcRJUqJPX+P0NqCSLr4IJnBbFmN1pVPO7Zb0NQHjbJco7/z/pbAJDZAHZNulug3vQ6CPawez0nXggtV0zkIjhESY6eUfdTVH6frNHBoootGQP6rY7qJxe6mwHU5zqpK0k32VrI+FMFlFuZH1hgTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740947; c=relaxed/simple;
	bh=2AWxLFKXB5aN5ahu3T9KAb379aODjysVkRSBME+F/I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyphLQIZvEwM2I6hm9fR9e+SEsM+yGHk6tIzGCFYOTwqYd2unUwtHvCeDOJn9Xr8rHNMPW7WgFxhrujBgav/OVUWSKDhnz7IL3V0hf/Gs+SQedW+luUjS1t5K4Dk/fuk/C3MfycFPhYmJNLmGzyUSV/mIOCRMuvF1vo5THYWjSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=OtIHZkAn; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="OtIHZkAn"
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:908f:0:640:1b72:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 3A59280D7C;
	Mon, 25 May 2026 23:23:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp) with ESMTPSA id sNeQ4deoZOs0-VDvPQkN3;
	Mon, 25 May 2026 23:23:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779740638;
	bh=TfbOwUXPQMDqyNDSM4WqzltmOY8e8E9wUTHNZDsYzc8=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=OtIHZkAntCejZu0KPjI18BD827cHpAVi+rX7Z4nzompuf8tAa7YH4lQyb9O20zAJc
	 BFNehOM350EraQtKlb/9MU/gbhDbA8dPd2+xr/KYPO4fEKtPBy9Qg0pMu7PpKLSNFK
	 JmFRQfksg9C9hN2hSWJCN0ZpF++lhBCSkFK2KG6o=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <cf625686-90f1-4643-b128-9bacb5e62138@sezginduran.net>
Date: Mon, 25 May 2026 23:23:54 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in rtw_cmd.c
Content-Language: tr
To: =?UTF-8?Q?Krzysztof_Wo=C5=9B?= <krzysztofina2022@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, khushalchitturi@gmail.com,
 architanant5@gmail.com, s9430939@naver.com, andriy.shevchenko@intel.com,
 kees@kernel.org
References: <20260525201001.14852-1-krzysztofina2022@gmail.com>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260525201001.14852-1-krzysztofina2022@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/25/26 11:10 PM, Krzysztof Woś wrote:
> Fix spdx comment style and indentation in rtw_cmd.c to resolve
> errors and warnings reported by checkpatch.pl.
> 
> Signed-off-by: Krzysztof Woś <krzysztofina2022@gmail.com>
> ---
>   drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25ed36..dac7a615d158 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>   		return -ENOMEM;
>   	}
>   
> -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> +	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
> +		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
>   
>   	pcmdpriv->cmd_issued_cnt = 0;
>   	pcmdpriv->cmd_done_cnt = 0;

Does not apply to staging-testing branch.

Regards,
Ahmet Sezgin Duran
