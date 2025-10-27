Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD12DF706
	for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551535; cv=none; b=QeeGaJ7xZJvyKnZxW4BqGfwKHm/iK7kvxRLVlOK96DTzfWIGmVUbRUbTrSjCTXAeTHtdQfixXMUUUMEkV1LfI/ZUSjJeLCminIQouNWHGjzoC0ykRUB3HXCx/bwB2t3Bkh9sdlOm/hncq6jlg7nlVetz0KSw6V8SQqU3U/4YkNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551535; c=relaxed/simple;
	bh=xARuhyPIRke3rhckohYdHv5cD9XQNF2eI+BizsNELX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfRz2lKP0xWXBCUxnSgm4Ac5Uc1NT4jIygVfXJWS8721gafFqTXMyb2qt8b0sm7b0Aig10LcJtDksGKBypv8xY384CwswpGHpovmbugMj+x8RbLmOYEVUsdn0YWWutF39rTzftjVvzWBt04FBUw61dGk16TshqUp+roXzGBjz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3rusViL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3rusViL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4298a028de6so2587181f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 00:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761551532; x=1762156332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGOKd31PYRnntFCFErcUyPDzIrnZkmh3gA+2JnhMC+g=;
        b=b3rusViLC97dXicLamD3PctgXSXQBz7RRPDCsDqotB6VmQcEcmt5oTQxZs0mxHgSg2
         zROAroiMv2GViARecrHtrPa+G/KkZGq81eeWZGVdwiD/MMnMtR8SZaqV1Hv4G9uM3C1q
         PkR6M3rcxElkMaDn50I4d/JmQg0Fou5x/eXNCjNPMTozlkaraKm2zPakS6w3RmrXNtHN
         SD0AytbHUtKSIQm8HDHFgD0eWPrJQl/3Dlb9RwmB5zi0/3dHpIp1rKeTJ39gxny6ByqK
         mrHyJ1nR6AlcQ1AXwnbjWWq/iiiYfXMPNTIAOeHsYOL1U3jrA98bKJ3LOnJV7EF7QXgf
         guFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761551532; x=1762156332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGOKd31PYRnntFCFErcUyPDzIrnZkmh3gA+2JnhMC+g=;
        b=Ue9LFdrAffws16FEztLJGTzryJXZu6JN+8TnLJTczJLlcJH/9ua29QPlMZvSduVsMW
         8Epi6s6gv8ZZ8WmuMyrEBH72WOwpmM1fdtCRQSjiaMNwpOX9aYuyBrh+cJtPSVnYHSUl
         38Oc+pEXNigE+30FpSpSKd0g8L4i9VAkD0585xDXpTVboU/JIFuN6I9+1iMZn+vWo++c
         eo6McORVP/XZXPIOwJ65f79U6mfAGmNCjXWYeINd+fwWdeaMPWbnrS1mCM1amyyGpdry
         MJ+5Vm+lJf5BBAVPgbrp64hMSoBp6+TlghnfyYFZamD8OQwT3WdgtOm6kEG/5RnAW1vg
         gWwg==
X-Gm-Message-State: AOJu0YyTlzC3TbxKwtEYvZ5gM8Q6homLwnwHnedv5V5/GmPdP2FdgfQQ
	ZGxQDPYqfmas2SzDMxTW+eOBnMDijwNxEoCFD8k7d5iUbVPTawcDDLerKyT+kz84/TY=
X-Gm-Gg: ASbGnctiJ1ipNlB31zYNTYBy1c7PYPFjZ1WvwZhHNGq+5OwwOYox9dhBUSShMbjQtjP
	j7AqUhoV30hAapRCclfa1NkXLe7tSB+GWwr4nvLJMk/mYa3FYjCZGsKxckJkEx6865GcGJW7bj+
	0ICuO30guXSUj+whIoHHE1/MFqoCfwYp9RemG+8l7ziotRqwPnbGuGzY6nGpbGVdpe+ChPP8uM8
	SAF8MzqBNgh4N1hmMzYgh5WNGZtPpHn4FuJMVujbu2WVJ+zbuahbbImK/E4GodOtcLCmZ3mENWy
	yp0hwuSLZTXfk98bHIPUxxf6BWoIOqN8ozgRETRMVqjHu5+fbW5+3c1s22WO3x168xTUS2qTy5o
	YqvE5/HoWngXykaZH2yJcluvVKsqyg5F620yjD2iMz6gyivKGfE0pvMoOO+DndXerMY04JAgggj
	fnqhYjXw==
X-Google-Smtp-Source: AGHT+IHj//a28j27eulcomMDykn15hI8xgFauJac/knqe/kX+h/1vrrLcOFsQsWxOJgUoXQY3GqbDA==
X-Received: by 2002:a05:6000:2512:b0:428:56c5:b305 with SMTP id ffacd0b85a97d-4298f50e774mr8798468f8f.6.1761551532171;
        Mon, 27 Oct 2025 00:52:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952cbb20sm12670944f8f.18.2025.10.27.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:52:11 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:52:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace rtw_sprintf with scnprintf
Message-ID: <aP8kqDbRu7s_gHPn@stanley.mountain>
References: <20251025193658.175399-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025193658.175399-1-rafiqul713@gmail.com>

On Sat, Oct 25, 2025 at 09:36:58PM +0200, rafiqul713 wrote:
> Signed-off-by: rafiqul713 <rafiqul713@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index 8b1634f4091e..019792d0595a 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -119,6 +119,6 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
>  /*
>   * Write formatted output to sized buffer
>   */
> -#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
> +#define rtw_sprintf(buf, size, fmt, ...) scnprintf(buf, size, fmt, ##__VA_ARGS__)

Just delete rtw_sprintf() and fix the callers to use scnprintf() instead.

regards,
dan carpenter

