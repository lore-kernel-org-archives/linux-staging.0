Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433122A4C9
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010444; cv=none; b=gGhQ4wY0OUH+jCB8UrLrWW9b+bzFn/2+Zn4GKhtpGszcU9uHUeZ8hYsz14A0cJHpxlr/fOTJ3jYxoar3ozZfIWfK3knG2H7J+tHpLEszObMEvTuWNF7KL9JerONIaB0llI8LbtwbNlxFbgYf0Fb49LolsrZuxoxN6eJymojCNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010444; c=relaxed/simple;
	bh=cHMIUDK3l74NZLLEqV2LIUIplXGhecJNcFy3KgsXMhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZcV3YMslntjO5GyUnzwFQaaKEI7BdS1p3HauevCOyVfpuex47l+gbtYqCJ2gsUcGzejMDWVqusRqILChhsiJ7Cf66KmyIw0VFX/k0HNlmA8aunV+jbPuN9n8ZV9ClErvjLkO4tr/G+IkixnI1+Pm6T2Udip2oTSd1tHxwztv2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6zpRicI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6zpRicI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so28885295e9.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Apr 2025 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744010441; x=1744615241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8AQPY5eAZttYfbBPqcFbME0mxQEUbb1b9Jm7VX+7QX4=;
        b=c6zpRicIrb5fcgKagP0CFMvTfFawu48qoClYL9Q0e2BjzkRjwrs0i4CZ1OOS5g9aRH
         EPkckV+XoUGXGDen12JyGDnI13575SVynmqaC7oQSLLGRKqJeZAFoGPYpURn4EQ2Hd4I
         MAwZc8wCmyBLmjg+KLY17dKIODctt1tTNotI+93pEwY1AYrSyVQ4Axqgh1gX7/FmeAdi
         tMo3uAuqBN7204xLHdAR2xWr5gsM+E/OGTie3G3/Ul0yVoBkPsI49zGoB5STB5og98U7
         pcEMjeTMtiGe9xQJkaCU7fRVOzhljKynDk+p5gmBQC2Sq/wUzSyHhN/CrnEmBERCDvYe
         w5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010441; x=1744615241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AQPY5eAZttYfbBPqcFbME0mxQEUbb1b9Jm7VX+7QX4=;
        b=nsTQISdo66DPJWlyLEgSwAX5BM5FcjgNlnIyq/wu5WCm/c423GZR+MHs1q3pkEwnbw
         ArhYtn9GSLa0RpHLeksG1lH1q1wzXCMOL1CrqMPKokSrf9UsVX6FIkhAzXKFyj0CUrup
         U3kHkUqvXTiun92paVCiPRKSsxGbnwRRl2KIwY/wDdsPUnB6UzQG1VNyrNqCX6FMlqre
         TG5ycJrh8MBnmfH+FPWUALMcfe8cHxGVoGKBa3U9mq+20TGnDxfyTSo4eFxBAnv4zda5
         yxmWE/QN5LKFY8JffhOvbTFELmveXKQ9F6/vKICPZqMjda1Ix+QD4HCI3BoZS1KodfCG
         BTGg==
X-Forwarded-Encrypted: i=1; AJvYcCWk0MGmvD1L321H4u1l9noe725chb/hEgbnBtkhXpGPXQbmPa2f+tm8SoBeCbc4rBF632ApG8Ww0hP2UxrV@lists.linux.dev
X-Gm-Message-State: AOJu0YxNCjYXQpqIbgvPTiJtKT/fWCwdFdZv5JwUepmQHCFMPB0HlrFK
	qnb+wEp1DfaEoFxL/0mnHLvXDLhQupYiQKlnOzTjJXIO+TW0QDDt4yWnUzn8yII=
X-Gm-Gg: ASbGncu3jhxA8+zeVQMblyQYowlSG4LEbVllYPwCRRbmMtCGC6mR9xGqNjp19rNezse
	i+M8/u2epjcKCs3u5sDgXD9SySY7CRj5fl71C3AQTRod3EumypeN7AltMSiHZ3lcMjWbOPnSUNW
	4IqYMJe+Su2yiWDY0EbeJoMw+C4CtVTGkpwTvrZR8MIgYfZhHgjvbqQ9ddoLvOfI6PIXVIAZE7M
	07lpl+LFbmYY6kRUJShcQK0l7EkaVE6/61P73Au+FFxVBKaHZcyJTrVfSkBfy64yq+F2seRTXdn
	mRlX5PJUT5WrxR8J0gDB8n2v6mxRF15sNO4kBXq0GgSXV59Xog==
X-Google-Smtp-Source: AGHT+IFlFea8q60vJbXkh0XwiaPvmeolbvPuYxUASQOR+ImsTm/0fCsRTxAtHed3qXOlMSPOZqPAwg==
X-Received: by 2002:a05:6000:4310:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39cba94dabdmr9345131f8f.25.1744010440777;
        Mon, 07 Apr 2025 00:20:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301b8161sm11374805f8f.50.2025.04.07.00.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:20:40 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:20:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, andy@kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <0d62aab3-bd51-4739-88a4-9419cca7159a@stanley.mountain>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/NxGilPLPy7KSQ3@ubuntu>

On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
> 
> Using a modulo operation with `4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the sequence
> number cycles though a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power of 2 value while
> the AND(&) works solely for power of 2 values.
> 
> The use of `4096u` also guarantees that the modulo operation is performed
> with unsigned arithmetic, preventing potential issues with signed types.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Changes in v3:
> 	- Added more description to the commit message
> 	- Removed blank line in tag block.
> 	-  Added more patch recipients.
> Changes in v2:
> 	- Changed the commit message to a more descriptive message which
> 	makes it clear why the patch does the change.
> 	- Changed the subject title to include `4096u` to show that an unsigned
> 	module is used.
> Changes in v1:
> 	- Added more patch recipients.
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 297c93d65315..f534bf2448c3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (psta) {
>  				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;

You forgot to change the & to %.

regards,
dan carpenter

