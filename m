Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C8D6FB0
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 18:37:44 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y69so18682014ede.5
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 11:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRWPlmQ7t2SG2rZ/LIltIDscqHAV1ve2Tx8Rm6hLXZ0=;
        b=jJQqBwQZBWQhqSsaFer/LOszbVIEVhE1M5i4oAE83JaPqEn3bioGQGHltG/ChGAgsb
         qZhhAALLWkhdaa2WcRddHOFt73aBj5Oa22KQlFBIyEkFwmLFi587w0dGmxGuhi7gMuc6
         DJGzphrIp+OLJERoOjmrFr94RCVCyZL/+4o+X0TJQ06GVOVPjcUsnoqx/qfph9GMsecX
         GhsbFcbTTQSesAltG+GPLnZpX8KZ1it8ULNLk4gpo/SjxkeOHAUG/tVwof9Z72nt5Pgn
         duN4wsoyqUackBqyyEIMW495Tlidq/em5QjO6yF+7j5LiU29yG8l96wOrTFgDFBUtoMR
         4RAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRWPlmQ7t2SG2rZ/LIltIDscqHAV1ve2Tx8Rm6hLXZ0=;
        b=3m+ArRbF59838xjCX69dwos9ncxjdJvh2KiVMEU5OXOJeDx++SyiOORu7QeMjbzz1r
         iL/mXKMLvX8JIjI6DBzV2WdbXzl8FxSXETs/zrqJcIwawlFW7JB8LipCau/tBZt1UUB2
         yaVvPO5ELYEee+JpseM4fmojISZp8za1q1dl7Er1pzL+dTQT1zMiCno6vXWMU+pj8n5i
         tbyVAfgV6QbWvzeiIPw+SQflAMnxD3WN4qmDgOV1XCFg4np5NyYw/ZwQfy11GwDM6PZG
         rV434MQkzNth2CYb/2dGpX0FOoemI7QksK3CYCbp3W0o4KRYnzNNrWpgqJb/Ay7J5QfF
         uKWQ==
X-Gm-Message-State: ACrzQf0mNnJpXiItfpk5pF0S3LDWb3xaV8PF4i9bJ4Q3ExL8K2ijS0dB
	ge2Dkxz5lse6G1X/8wkVdzg=
X-Google-Smtp-Source: AMsMyM4BwlrDQDV2BQXJwrC6zfLTydo7ifTWu5D/ffFJHsm4BEuCe4yjEYBJPzjO2+SgLzAfQe0TDA==
X-Received: by 2002:a05:6402:ca:b0:45c:dbdd:8143 with SMTP id i10-20020a05640200ca00b0045cdbdd8143mr37296379edu.213.1666723062357;
        Tue, 25 Oct 2022 11:37:42 -0700 (PDT)
Received: from [192.168.1.103] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906960e00b00780ab5a9116sm1794952ejx.211.2022.10.25.11.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 11:37:41 -0700 (PDT)
Message-ID: <e72ff575-4ed3-77ca-fa76-27a0e084b1d7@gmail.com>
Date: Tue, 25 Oct 2022 20:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] staging: rtl8712: clean up dynamic memory
 management
Content-Language: en-US
To: Nam Cao <namcaov@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1666688642.git.namcaov@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1666688642.git.namcaov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/22 11:12, Nam Cao wrote:
> This driver is fine if memory allocation never fails. However it does not
> handle allocation failure well. This can either lead to memory leak, or
> unallocated buffers being used.
> 
> v2: Add a missing if statement, as noticed by Dan Carpenter
> 
> Nam Cao (4):
>    Revert "staging: r8712u: Tracking kmemleak false positives."
>    staging: rtl8712: check for alloc fail in _r8712_init_recv_priv()
>    staging: rtl8712: check for return value of _r8712_init_xmit_priv()
>    staging: rtl8712: fix potential memory leak
> 
>   drivers/staging/rtl8712/os_intfs.c     | 27 +++++++++++++++++++++-----
>   drivers/staging/rtl8712/recv_osdep.h   |  8 ++++----
>   drivers/staging/rtl8712/rtl8712_recv.c |  7 ++++---
>   drivers/staging/rtl8712/rtl871x_recv.c | 16 ++++++++-------
>   4 files changed, 39 insertions(+), 19 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
