Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D917F7
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 06:14:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so12341354wmb.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Feb 2023 22:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdFVGAx1covm2q2sRMPvEr8/Gomqfu0eE2NFLMvbVis=;
        b=qUHUp5lTo+vD5C+L09RH8OsMPhfhUpQD9HzSkAojyBHPMIONf4RRqfV1vlbMKHN+ww
         3xxq0gaSGbVukaICmqgE+JWF+981MTQnYw2tgWXnURPg/yAS/jQnIdAhDHnaCrIK2/i/
         SPlHaxjHOofEXZu0exov2nsH220rNcSL1GzKBohjgouqZG3ZRROq73ouMzwmUoyGK0kA
         ObiZdzE3yx3BnYmAC/RJFAkCsXf8O1oSh7uW5HecectHdMHPAxcHKO5oG4/dRLw6sJqY
         i9j9QwwM6ML2iaFfZZdEAqJqoQTPzOHMtpMO6Nh8P7vjYCkW/1GH64UzF1ph/TGT4nE8
         Jrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdFVGAx1covm2q2sRMPvEr8/Gomqfu0eE2NFLMvbVis=;
        b=w7ZMsLsVigdKWXzGWzbh8ciAIGbEBB8GE0lzVL0+zxCLPK+PahiuSU7vsbRWHxJoz+
         1h9PuGiejIgAkbjZAOK3hXiJOQGT6+xdUCeGW9t/1YZzjGCjpk67gB2fdwUti4z802ED
         AaoCTR1X/ciNQxvaYh62FoFfhnPhTk9PwETew3HNJJOWB3nJngUq7/ZkB+IppiUWaE98
         GbadDcuReSS8KHs9cvrfZ9cQ+m3UQ9GJB8mD02GNgo9O49qPgu+Z4RzR7V3BnSbDQ1wL
         0QjMqxY4CbuQadVdHG2FqE76dt2LpJs+DzsLYSvD/Shz9gK3HekFVOsqb/GUZJ0xlYq0
         apdA==
X-Gm-Message-State: AO0yUKUJco0zDUBibPpnrixKuxEJnZ3a7p7q+P2/z7cR9brT+byeilAb
	qRvVtfJbhO0HYnVutO/Oo0s=
X-Google-Smtp-Source: AK7set8ZM5RnRn+Xzs5gncopr+Ozvp526xs+XyfaFoMo9FhvENwHlCOcNQCRNL54I82Mqi9GWGxhgQ==
X-Received: by 2002:a05:600c:5127:b0:3dc:5b88:e706 with SMTP id o39-20020a05600c512700b003dc5b88e706mr2432237wms.1.1675750454410;
        Mon, 06 Feb 2023 22:14:14 -0800 (PST)
Received: from [192.168.1.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id o35-20020a05600c512300b003cffd3c3d6csm13821014wms.12.2023.02.06.22.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 22:14:13 -0800 (PST)
Message-ID: <684a1fca-9697-fbea-58ad-34d5860e3af2@gmail.com>
Date: Tue, 7 Feb 2023 07:14:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/3] simplify suspend/resume functions
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230206210124.150142-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230206210124.150142-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/23 22:01, Martin Kaiser wrote:
> Here's some simple cleanups for suspend + resume.
> 
> Martin Kaiser (3):
>    staging: r8188eu: make ips_enter static
>    staging: r8188eu: make ips_leave static
>    staging: r8188eu: remove change_rfpwrstate
> 
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 23 ++++++++-----------
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h |  3 ---
>   2 files changed, 10 insertions(+), 16 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
