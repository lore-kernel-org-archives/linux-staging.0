Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E837A
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 21:40:07 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id tl27so18991156ejc.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Aug 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=hKNdrIhTcuWS4UXrsTgEmuPZ20G7qPaHjL6r2nx+HBA=;
        b=PpcVbFj6MyLtCX/UPh2e3IhwiaUKUJxB3QPlOMIGJNbI9IB1apQB949Pd+5mPwCXTD
         PzGxTwhAjHseV+Id0a0zbGHAcE+n/pCvCLJJBNToDs8/EyP0jTs7Am34u5Yz0u9ok9pJ
         wa73ngwdh1PR6fWkk3n/1wGefyW3LczhkDawGzubflTo9/nY5oyJoZn0iO0kREbGfH8H
         er3ogi9OO6eEmWM2sZ3sm/0kn53PEWWxIoca6BmlsnLgt9j3zKXDRVQPymkGYSgqG5Jz
         dRetYXxDyU+9l29Ch8BYNHiFWmpjkXmlF/Zw7Pr7HozhIqzuUjTi3BxQPuqGh3EPNO94
         f4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=hKNdrIhTcuWS4UXrsTgEmuPZ20G7qPaHjL6r2nx+HBA=;
        b=PNJ5cMkqqT4v6mj0eNI8pXj4QiKcbziTxv6jpK2k7JjzaAC77XTnJik4STRhI9c9y7
         BZVLTST43bMzJ1Cj7bpiIaCOopNiOGnYCHVxBZnDSOgKen8oVzdLk68TbeiZQQhygG7B
         BnqQiCz4RBK+2e2t/4N+EiWeGMAKAT5w9KC82Lcz3QWRfCYeW4wgRWOS5sCC7qWKu9o6
         3qBQktr8y1BeDiRlZ7rJopPk20fr6XQci9ii+5e9oVz3HFrDiFbTM4Ld+pgk2pnGmQrj
         IDqoB7Wp4X0xtVPbJxIbPSkXirmQ3/OpaO4wxbJClbQJxQTocFUgTMnAIMMTgYlznUge
         1Adw==
X-Gm-Message-State: ACgBeo3ipaBXdgWuuyuuJz5fq+e2oe/i8M5BmvmjDoDeoXaso8iQea9y
	HV/0asV5XHdQflTuR0YK96w=
X-Google-Smtp-Source: AA6agR5H59p1aGVsrVoSn97J02rC05KduGyE1qXbdzlwrd+6g0jhQuq9r4s7MWCJIsa1D0w6Jmg6Wg==
X-Received: by 2002:a17:907:2723:b0:731:3310:4186 with SMTP id d3-20020a170907272300b0073133104186mr8266082ejl.100.1659994805741;
        Mon, 08 Aug 2022 14:40:05 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906644f00b007307c4c8a5dsm314049ejn.58.2022.08.08.14.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 14:40:05 -0700 (PDT)
Message-ID: <56261cf8-dba2-40da-6612-bddceb402fba@gmail.com>
Date: Mon, 8 Aug 2022 23:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] staging: r8188eu: clean up _InitQueueReservedPage
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220808201405.68966-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220808201405.68966-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/22 22:14, Martin Kaiser wrote:
> Simplify the _InitQueueReservedPage function. Remove unused code.
> 
> This series depends on the "simplify endpoint configuration" series.
> 
> Martin Kaiser (5):
>    staging: r8188eu: remove a temporary variable
>    staging: r8188eu: make numNQ a u8
>    staging: r8188eu: change all num...Q variables to u8
>    staging: r8188eu: remove two unused defines
>    staging: r8188eu: the high prio queue is always selected
> 
>   drivers/staging/r8188eu/hal/usb_halinit.c     | 33 +++++++------------
>   .../staging/r8188eu/include/rtl8188e_hal.h    |  3 +-
>   .../staging/r8188eu/include/rtl8188e_spec.h   | 12 ++-----
>   3 files changed, 16 insertions(+), 32 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
