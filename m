Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D2D6D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 20:12:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i18so12061366wrm.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uSk5LLkjyneeHdTYSr/KpbjFbr3l55wAk/Hm2oDaLtU=;
        b=n0Skk+TvZuKP5ODn1L/FhPkppv1VHaSNBzevhhwhjRj3FYDlWKWNszRL7ZD5mWQgZ1
         eGj00y/mGidx6f/3Aw6Bpea1n/3g6a7l6r3kLz+zMb16qWS+0jJcf+TsBF9GzJ+NH4+B
         hn8aHlwQykOUdbmCyOzi8JsvKnviYM7bwPbc0oC7+vezeepiZdLhpc266s7dEKq8ODkG
         UnJt6Hjk9SH0pub/dN9DhHrW368zxCgc9dFvx/qLWg+yNggz7rEXa7qtqFhp/Lvo3c9Z
         uZ+WURJO4fRq/GdsOd0p61vqWTir0LMl6HM7dZgJBHVbonbEqeexexq7JpF6XiBJqKYG
         3DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uSk5LLkjyneeHdTYSr/KpbjFbr3l55wAk/Hm2oDaLtU=;
        b=c8LtJKq335Z5szGDKQM7npnhjdlrMRq4sZ0WVp1f4/vpUjG2/l4FeBYWYG0I0bT6IJ
         CAdxrXETck7VL2PL4nu1GNnjMz3+vIy7wqZrqSy1WQP4vbrLckalR9uX2yg2Uy6ZNRda
         eve2XY/k52rk6e8MOVwOQfTQB2s3RFoIMn/rKLYjxmz6yJKQ+WBbQExYgsToT8n6/BaZ
         PdOrAmrrsSbu1SzUL4/UR5uXH/bIMWN2dxCc/Kn1jveLevKTeyYmmG7hMgp1+Iv1QQoL
         iPonyYoyioTQqJ478Vn3CvHzH7v0iEnmWZdRJmMun60QNp855JALYzWA0dP8LO3GpX1J
         Oy1g==
X-Gm-Message-State: AOAM531L96kVIjw74Y08gE4faVPcAtp2Nw/8yekAHZk2gKvZOqD7kydw
	ezEI5T7EGmmd284Gd+uaH54=
X-Google-Smtp-Source: ABdhPJx2MUM6OBF8YPKKL0KwYkb7KuBloUMnLifli+D0EVyv12tNjBMtk3FMsGXypKGOQUy8IXGSqQ==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr36594981wra.398.1617739954848;
        Tue, 06 Apr 2021 13:12:34 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ef5c:3f2a:a646:d6ec? ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id k7sm24620902wrd.24.2021.04.06.13.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 13:12:34 -0700 (PDT)
Subject: Re: [Outreachy kernel] [RESEND PATCH] staging: emxx_udc: Ending line
 with argument
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org
References: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>
 <20210406195621.GU2531743@casper.infradead.org>
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <07ae6975-d4a0-dfec-8030-7ddbd90eedd5@gmail.com>
Date: Tue, 6 Apr 2021 21:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210406195621.GU2531743@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Em 06/04/21 20:56, Matthew Wilcox escreveu:
> On Tue, Apr 06, 2021 at 08:34:09PM +0100, Beatriz Martins de Carvalho wrote:
>> Cleans up check of "Lines should not end with a '('"
>> with argument present in next line in file emxx_udc.c
> I appreciate that you've removed the checkpatch warning, but this is
> still harder to read than the original used to be.
Thank you for your review.
>> -				_nbu2ss_writel(
>> -					&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
>> -					p_buf_32->dw);
>> +				_nbu2ss_writel(&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
>> +					       p_buf_32->dw);
>> -		length = _nbu2ss_readl(
>> -			&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
>> +		length = _nbu2ss_readl(&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
>> -			regdata = _nbu2ss_readl(
>> -				&preg->EP_REGS[ep->epnum - 1].EP_STATUS);
>> +			regdata = _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_STATUS);
> The real problem with this driver is that their abstraction layer is
> wrong.  For example:
>
>          /* Interrupt Status */
>          status = _nbu2ss_readl(&udc->p_regs->EP_REGS[num].EP_STATUS);
>
>          /* Interrupt Clear */
>          _nbu2ss_writel(&udc->p_regs->EP_REGS[num].EP_STATUS, ~status);
>
> If instead this were:
>
> 	status = nbu2ss_read_ep_status(udc, num);
> 	nbu2ss_write_ep_status(udc, num, ~status);
>
> that would be a lot shorter and clearer.  Cleanups along these lines
> would be a lot more useful, and would fix the 80 column warning.

I can see what you mean and makes sense. Thank you.

Beatriz Martins de Carvalho

