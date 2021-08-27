Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC03FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 14:32:26 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id l2so6691929lfp.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=TpDa8LjJDudMGosGLLFPxyVB3LRE+KOYsc1mXbf0yDc=;
        b=Yci7sAAXI0ojhFMOAYDVEM/XETlGxJ7MeOKi2tNncV7YtSfyITU/b6k5NdPSEMx5eB
         mUkyICoFlH7pOGsXyoCAmupLRG8y1ZM/P4PKqY3SUoXsKSyIebNxp6P+wYDfGXdpBGMX
         mPXFydTGAHupgkiEitD9Z4AZlP3qvHUj/WdisDBDnuLmb+8fxXLr63skODHbFi7nNmmB
         GpWxVtiI9tencKW24DZUPYUiZSbYRvdrZJ5H2HA7+NoSUEW5XZocXKmifVKoctYpUfqC
         ai26DnA7q8LTeit952+GK3paykfLWY4y8rEQFsKkjw+Z//aSG1yvawHhmaAXzs0i+tgI
         nIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TpDa8LjJDudMGosGLLFPxyVB3LRE+KOYsc1mXbf0yDc=;
        b=QokAO+AaC2UxDfnUUiA2yE946su+ZUDuYrEXbGpDA6gd4sA/q36r7eZJPsAt9Vb1fj
         qVkLkROpGsWGz6zX96GOtslIj8kZxG1wQQCt59sAgdqKQ2ezS7mh3wX6RG5hzeWMWlmX
         pgnpdG3b/qlv8G+gTx6Qx0hhv3o+RPnY+UhL1kRiBj6+CoTrODKVjR8UnXnQM4t2PBp4
         02a4BxB5rU2dTkljpZFHSrIYuWbHanfOH+zJhbB02cO3dhFcoMVwErXy4jKFQnPLtNNm
         opg8ntaRxjmR5Pu1gOTh6121bF3uOLjBXufCLjTYF9SuZLOyrUtZvzLAs6+lcWoS7/6D
         wQUA==
X-Gm-Message-State: AOAM5318ixGJ1zxazsB7YSY/KzxOEb3ot9Fo3WA53P8EkvYCplSU14HG
	mq/RXVg8fVsX4nbdLSmewBA=
X-Google-Smtp-Source: ABdhPJyqOdkdoGzA+wSnlK9O6jKpMAls9Q7Sawrti6v8l0k/cz6l7p2mTpuO/iLt9WXpawtQkpkqZA==
X-Received: by 2002:a05:6512:23a2:: with SMTP id c34mr4367852lfv.19.1630074745040;
        Fri, 27 Aug 2021 07:32:25 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id s4sm610976lfd.53.2021.08.27.07.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 07:32:24 -0700 (PDT)
Subject: Re: [PATCH v3] staging: r8188eu: Remove _enter/_exit_critical_mutex()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210819221241.31987-1-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <03d5fd25-7694-18ee-9e2f-7b4057117197@gmail.com>
Date: Fri, 27 Aug 2021 17:32:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210819221241.31987-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/20/21 1:12 AM, Fabio M. De Francesco wrote:
> Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> unnecessary wrappers, respectively to mutex_lock_interruptible() and
> to mutex_unlock(). They also have an odd interface that takes an unused
> argument named pirqL of type unsigned long.
> The original code enters the critical section if the mutex API is
> interrupted while waiting to acquire the lock; therefore it could lead
> to a race condition. Use mutex_lock() because it is uninterruptible and
> so avoid that above-mentioned potential race condition.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Tested-by: Pavel Skripkin <paskripkin@gmail.com>
Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>

Thanks!


With regards,
Pavel Skripkin
