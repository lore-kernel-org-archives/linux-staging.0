Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2872
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 18:26:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id u1so7481644wmm.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mzFaXUU/x0+sUupGX2omqXEd8e4JzxswlubxRenky6w=;
        b=ScYlXF5tHV8j2XrA2jNLLzo8Rab8MRZldCrvA9HegVr5y92+/z3K5kNNonQHZE5CIp
         xfj9mMkzV+/tJiheHAPX6B6JjDct4b3lvUjknyYrimNkzEBnjq+mSSi8oEYGCBSSbuwm
         k8ZeSxQ9iZoLcNg3jP/GPiL5Pw15HHo+JRsMP445xt8EKfrOn1sqYV/3sguXbnAUkloW
         EmFiU1A9WTZdSvFT0ml0jKd/4IbM9Z3JzlLTzkvJeSotXrj7bZFXHN+HEajHKFxfHwrV
         YKq6nAavtsoSEUCSSuN8Lu12fF2EbNSrrNDsNQ7pvHIGuEKoSCFc9rxMAw4spomShvDe
         SxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mzFaXUU/x0+sUupGX2omqXEd8e4JzxswlubxRenky6w=;
        b=rRkXi/F5eURqUmyEU/7N+qx4NHP6ArAgW8CBRJpgHr8YF9Fm3Msx9NxjCN4IMOTFZ3
         BjpTQwGgavVTML0lx9lN5lF7cNjeFkIF73khcQlcDNMe6WrtfNbFWoHmF4lwx+pLKJUl
         bA2ZNua+iiuv++7TZfPvTUbTxmKpVbHc/C5UHR3i4Fb5GQQ+dLZZvYHBmxKLRYeUxofd
         h+YOkXP4hFVaL35Q6Ay0uolNxmRmF1fpN8BfHCQC0LESmA0+iZnUxCl63H0anTNPnMgj
         EU0tangYKVty5iqdA7Z/1wOA05r3LlbxVSz/F4p3L6j70qXsZK10kJUuztPUj+QsKcrM
         McBw==
X-Gm-Message-State: AOAM531A2g6LQSFmnbJqXelpHxvX2AUWWdDke347KLbgVW7ELZj5irgb
	n9ucVH7GlZo3/+Fp3rshilI=
X-Google-Smtp-Source: ABdhPJxQFjf8JQn/5VnVYjev/ZHIaQJ2q8FdQ5/sVuFvBUdt/Mlfal5NlbRoF/1ca5UJOvsJVfvWRA==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr3991907wma.87.1628879185892;
        Fri, 13 Aug 2021 11:26:25 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2571? ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id p14sm2267405wro.3.2021.08.13.11.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 11:26:25 -0700 (PDT)
Subject: Re: [PATCH 1/4] staging: r8188eu: remove 5GHz code from
 Hal_GetChnlGroup88E()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210813073109.25609-1-straube.linux@gmail.com>
 <20210813073109.25609-2-straube.linux@gmail.com>
 <7543688.ql1GSxUkq4@localhost.localdomain>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <945d66b4-122c-33e2-659d-b7028de1bfcc@gmail.com>
Date: Fri, 13 Aug 2021 20:25:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7543688.ql1GSxUkq4@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/13/21 6:27 PM, Fabio M. De Francesco wrote:
> On Friday, August 13, 2021 9:31:06 AM CEST Michael Straube wrote:
>> Remove 5GHz code from Hal_GetChnlGroup88E().
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 62 +++++--------------
>>   1 file changed, 14 insertions(+), 48 deletions(-)
> 
> I missed those lines in my "Remove 5GHz band related code" series.
> Nice work, so...
> 
> Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Thanks,
> 
> Fabio
> 
> 

Thanks for your review and ack Fabio. :)

Michael
