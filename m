Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563018801C
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362555; cv=none; b=sHzRHWjq0Xy7ziREu6nowX8fUemV5QXlwKEjXKWvqVz9YSkJ4yrBybA0+rXVqx63+VKLRIPTf5e/dq0UbACAV1wWsFBc99b1OkTJQ9qNXbIpaG0i8QBt7s81c5sgz20JNEMyLJBwEJUvnyf65+C2TC3BK23jaIOguzQ5Jm1ytqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362555; c=relaxed/simple;
	bh=dGxHFcazl9CZ90JzERa3tmONCOwErs4hWGyTxMLGSew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBRnQ8FViINVSYaxPAICrQNZ/fS7+sAC+jgYMv/10G6jBy5+zl5ebBrj74Yb5aqcIyZl5uZwuDZ+AOnTnA1qoAZWIDurL3tBRhrnTk9uVWh5YY1v1K29G7KwmDmhKF3dc5S96bFOb3Qgx24PHg1SiLbQcm8Ry9XwMzR34AHA+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvuBZKxx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvuBZKxx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7abaa983bcso69271066b.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722362548; x=1722967348; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0BE6LG9AKH6KqSFQojwgZTXGggkIs90XPNvvVsB9SM=;
        b=BvuBZKxxdbRQMmiqdNvDP/q5/i8OOB48NFTsCa9+9Aq3dnwJt9jo4KGualr0UHwoPW
         x9skNCZbsU20HNV+POSque+O4f+dWMKrFiN3/7cCE6i61how27ldR49Or06dePGM46NR
         WXnvoooVwJGgrW8kI5l8nIjrbQphgzabHqR5gzLi1OaVDMtpX89csVH1F+wjr5NQ1zJv
         gfVHU9rp2wZW4uO/Xq8BT3CO/o7jSuHDyFQXDXqnG7jPh2L0qfteMnAFrsCBEs55+DJs
         xjS5MtrE7EZXFsXEaPdCqFHY1lhuI4O4T/yjTZOpEaJeCZNRySrDN8ymT19Tb/NoUwWp
         jMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722362548; x=1722967348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0BE6LG9AKH6KqSFQojwgZTXGggkIs90XPNvvVsB9SM=;
        b=sEnf5Vh59iOq6Tix88UwRIhnNadFUc+SAtJFxWbDK6eh+HHKkhqpUcsuPx09wYsqEI
         R3RNlT6F6xAcdBhpM9SR9wS8n1xtNu3/cJmJ39IKhiXLmeQgX7T7inDXY+VRrnxkBKnB
         WHlabSassxbwS2UgaUFKcZYtZ29lWaRAkf9K5oWyTPxc0xRg4Y4jLxiUvDs6Lh30NztY
         +v29hA34hraaH9UEPlGPNuEgV+2S8xUGjd5V6CdPiHC2ebE2r/EkcYPmmsOMXMZDmaYj
         K3OKxsARjss31QV1EdOYCE4Yap1jVqwwudhTyTs8i0d/DvrEGaeA9GXcXr6n87wxN+5z
         VsVw==
X-Forwarded-Encrypted: i=1; AJvYcCUDxPSJhAo+9q88OZ2Q9+1I84nZb6UICLeBq5VRDXMDbIxgVLFlECxK1+wZ8Ra07M9qBRStjLepAD3Lvou1j1H88jnsQxSTza2uj+bEOQ==
X-Gm-Message-State: AOJu0YwGWAoRt3Ta3PbZqvKPL7Tv0GjtSIy67ZtfP3+wvu47OX6FLCym
	5e/nwPgwSZpGZEHopT0no6V/53SGMeeW8Y4VoSjeboBMoV0txbBW
X-Google-Smtp-Source: AGHT+IHuRvMNTK9iD08DZUMuYiwH4P9y0lJbYNv2H4zQwp4YCAnwg7/jLFtubFZcEVnK4YXmud6lnw==
X-Received: by 2002:a17:906:6a1d:b0:a7a:a763:842a with SMTP id a640c23a62f3a-a7ac5a5b78emr797585166b.8.1722362548088;
        Tue, 30 Jul 2024 11:02:28 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8552:f0f5:c00a:214:55c4? (p200300c78f2a8552f0f5c00a021455c4.dip0.t-ipconnect.de. [2003:c7:8f2a:8552:f0f5:c00a:214:55c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad41027sm671648566b.122.2024.07.30.11.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 11:02:27 -0700 (PDT)
Message-ID: <d4eb021f-bb35-4f7b-8be8-319907bbff63@gmail.com>
Date: Tue, 30 Jul 2024 20:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: remove trailing whitespace
To: Felix Yan <felixonmars@archlinux.org>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
References: <20240730063746.176245-1-felixonmars@archlinux.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240730063746.176245-1-felixonmars@archlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/24 08:37, Felix Yan wrote:
> Fix the following checkpatch.pl error:
> 
> ERROR: trailing whitespace
> 
> Signed-off-by: Felix Yan <felixonmars@archlinux.org>
> ---
>   drivers/staging/rtl8712/rtl871x_cmd.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_cmd.h b/drivers/staging/rtl8712/rtl871x_cmd.h
> index 2613b3c2acfc..268844af57f0 100644
> --- a/drivers/staging/rtl8712/rtl871x_cmd.h
> +++ b/drivers/staging/rtl8712/rtl871x_cmd.h
> @@ -736,7 +736,7 @@ void r8712_getbbrfreg_cmdrsp_callback(struct _adapter *padapter, struct cmd_obj
>   void r8712_readtssi_cmdrsp_callback(struct _adapter *padapter, struct cmd_obj *pcmd);
>   void r8712_setstaKey_cmdrsp_callback(struct _adapter  *padapter, struct cmd_obj *pcmd);
>   void r8712_setassocsta_cmdrsp_callback(struct _adapter  *padapter, struct cmd_obj *pcmd);
> -void r8712_disconnectCtrlEx_cmd(struct _adapter *adapter, u32 enableDrvCtrl, u32 tryPktCnt,
> +void r8712_disconnectCtrlEx_cmd(struct _adapter *adapter, u32 enableDrvCtrl, u32 tryPktCnt,
>   				u32 tryPktInterval, u32 firstStageTO);
>   
>   struct _cmd_callback {

Hi Felix,

your patch was already accepted. May be you take the previous 
information as a hint for the next patch.

Bye Philipp
