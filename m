Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167E6F2FD
	for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037996; cv=none; b=AMLLyiUpCWGh7hVbG/el5uFHRrmLtSYEeiOBL11JDautLa+v5ysPpKDavHVzfEKbbxyes9XQqIy5xitH2+TNTJT/ASVND3iP+cEnWllKjaEdSky7Z+MQXjU5a8m6G4w4CFO9K2dA4X+q/SXlaMexp+NR9Tkr5EbbC2CbSe3CuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037996; c=relaxed/simple;
	bh=Y6o6Nvhk4MbbquwR3LkuwUeh4kcXCCAG6hiXOu9TYG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+FlXxVV8F2b8VPH3U9it0xM54yg4XkYMBcdw/EVIPl4q03LpQyjN118+rwPmSRh2n6QfhiWNdMEMmE3rPxjiGq+laA+tQ+BGn08gWT44IJWRLxfdY6jZeC477plxBFa7mYOIzeDqt7I3MAMFIiXrcpHXjZzL9yukGc92w+UXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahvOlSpM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahvOlSpM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37a33e55d01so2734553f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 13:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727037993; x=1727642793; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qylzz3Fel6izYnniiK3d6HMSKBRm/fSHsAY/NJaK+aQ=;
        b=ahvOlSpMQKeA31CyAFEHd4hToPhWSbQ8f5gV/u1rZyHXhvbNR1o4bCRBIrCw4+HgrK
         DbpkXH8htK8YADy1Fa0sLinSZVdp7WhaUyG6PmNmYtb0/SO2F1soDgMvJXfalctGi3b1
         EjHuBwGKvDCjIIHkHQIafinM0Fz1UyaBiE57ImacN8D1qaAorTI4mFYtTPlr8RnftrZZ
         jUuUQqXFX/GLNb4nSFmNQyR4Gv7KFdXqiKdGMqmA6WY0QDYzQnP63GjTac26uU1HFEhL
         QfqMthaN4eKk+j6uUFpYMwHZ2tbkW+PVGve0QozY00u/siKmcyyKKHslYF5es+Kxi1NT
         LM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727037993; x=1727642793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qylzz3Fel6izYnniiK3d6HMSKBRm/fSHsAY/NJaK+aQ=;
        b=ff8PUgVZlCikkyhnMdizObRMPsy8pguN3ztF/r/BiyBh83yR4GXvNaW49nXTJXNb0A
         5XSkADUkRUlFUb0F71QjbLljULShPhROVkUq4/G3PDsuZHOklrGopWyEE+dG6VIBiPxH
         8ezmOmVawqQYp5+hKppO0lqKdTHf12Wbi6C4lyqkTXk1XEeO29uW1MHEO7046eVy+C//
         yN759D0Ja8+Z6m/6xcm2gq/cRNPPG6jWaWT2Bj58/eCYOmGAVflYy8ppqYtNOby1hh11
         QTLJdPeixXqXsQai/Msv3ixqDq2J7ZnD7tsHXI1s227o6puCNTqeHa776QylwI9OcWgG
         2bmA==
X-Forwarded-Encrypted: i=1; AJvYcCVxvNmB+5g0NTbbYYFCdcYCGSLJuKqSA9heUiX9E3a45ZwId1Fa7o8sl8yrQPGq4+cJfwx1hOPhT1L5cAgz@lists.linux.dev
X-Gm-Message-State: AOJu0YzPk4cdKQ+4bKwC1uLw7GV7hnzxAW9UoXVTt0ka4AJ11rOceopO
	Zg0whiW1UX0LUJf+e4b9Zh1A58Uwmg1U9syr7Wb9API4cKRTYgMb
X-Google-Smtp-Source: AGHT+IFV/qufi5eb2P54dV2Z7QOxKzi5EVqRb7g+f6+3RUKkrEe6nXiEjZ8fwqTAfUHF0E6TZ3cctA==
X-Received: by 2002:a05:6000:1fa4:b0:374:cd32:f84e with SMTP id ffacd0b85a97d-37a43160b5amr6020141f8f.29.1727037993176;
        Sun, 22 Sep 2024 13:46:33 -0700 (PDT)
Received: from [10.188.212.131] (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c5c78sm109226595e9.42.2024.09.22.13.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 13:46:32 -0700 (PDT)
Message-ID: <525a7e43-d8d8-4973-8e3a-ac6b53785d6d@gmail.com>
Date: Sun, 22 Sep 2024 22:46:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8712: use kmalloc_array
To: Tudor Gheorghiu <tudor.reda@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Linux Driver Project Developer List
 <driverdev-devel@linuxdriverproject.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <ZvBy2lB_ok_OCmVI@redaops>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZvBy2lB_ok_OCmVI@redaops>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/24 9:41 PM, Tudor Gheorghiu wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> WARNING: Prefer kmalloc_array over kmalloc with multiply
> +       pxmitpriv->pxmitbuf = kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf), GFP_ATOMIC);
> 
> Signed-off-by: Tudor Gheorghiu <tudor.reda@gmail.com>
> ---
> v2: Update patch description
> ---
>   drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> index 408616e9afcf..a0f29fab3dce 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -117,7 +117,7 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
>   	/*init xmit_buf*/
>   	_init_queue(&pxmitpriv->free_xmitbuf_queue);
>   	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
> -	pxmitpriv->pxmitbuf = kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf), GFP_ATOMIC);
> +	pxmitpriv->pxmitbuf = kmalloc_array(NR_XMITBUFF, sizeof(struct xmit_buf), GFP_ATOMIC);
>   	if (!pxmitpriv->pxmitbuf)
>   		goto clean_up_frame_buf;
>   	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

