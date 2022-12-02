Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2F7486
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 21:07:05 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id v8so8056556edi.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Dec 2022 13:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YG6hTh+FCQ7Vhwk2YTsAR9WCKbvsgjHffAXIAMSQQXE=;
        b=EtLQ7QEfMcaMrIovG7+WD5OQdw1nuVTeAzDFu6fA8T4BO3+NO0U/w9tEi/YfN3yV8U
         bCxOdh0EDxDEklKVaSEQ1jgpwTjfF7yaOxZIf1V0Ig7aDo82tETW85BTvYVQVajrALXC
         T+he4/ywG5KJ9TlT/ErITn+RAmKPYrxCX7+N1xGScGniFFc3KyqlpnqLXdRuBlbmuq5k
         2o1Kgp48zJzsc1lVST4vxbpDeaqy68tVWSwGQEJxNUbE+yWDJB6hvEGPqbuYgmJXJRA4
         B/iy8WTMbO4nkcQ3oVaZLeKGAhW2OPrZbvILCzCYbIko4S3HS8lCb1BTJ+vYnGismn9T
         dzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YG6hTh+FCQ7Vhwk2YTsAR9WCKbvsgjHffAXIAMSQQXE=;
        b=YuVqAY9v0fVjmnMlCgjG8IxLwSpTe3D+oulILaN85etip64B9mSq2GQmzemZ1RA+rV
         nkh8Yg6d0yctqpKp7pYyTInecFlhfa5CYsLbKDR8t0z8gRMbezbJGGYD4wygDunsd6n5
         wMqz6GXdLA4EEBTU/yaHr/jJe2UMUDbZcd4N5/O6JvRHHuOgrBs5BCscYWLk9uQ2Iv3Q
         B37qAN7ByWJCtGn1MCErMlLqSwyCAtRWTwRcJ+soU/VeGLRxfTjxC/3B/hsP4PCNMyry
         d3IToVidtGrmJ27l7hnqIMXycQQM8sUIwLfRSH5sy0jc5+O+sNRQUP2bW1REgsEs0AuJ
         96AA==
X-Gm-Message-State: ANoB5pmhWN5oe6ZQx4DX8P6YG7uJvfbFZbow0PfeB2qNyqDZzMv9KMgw
	f9hSBBaoEuRh3jATf3VkIjA=
X-Google-Smtp-Source: AA0mqf7gHXipCDI+yM+6VTNxlzvNYEM1zW5ANWd6eMsOVJB8sa6aUeSv9oaDvRXk59+AbWt4/20PXg==
X-Received: by 2002:a05:6402:1145:b0:46a:d5ee:d150 with SMTP id g5-20020a056402114500b0046ad5eed150mr30204609edw.312.1670015223913;
        Fri, 02 Dec 2022 13:07:03 -0800 (PST)
Received: from [192.168.1.101] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090676c200b00770812e2394sm3396499ejn.160.2022.12.02.13.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 13:07:03 -0800 (PST)
Message-ID: <4701500f-8184-0006-2d10-b8640e335a79@gmail.com>
Date: Fri, 2 Dec 2022 22:07:00 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] staging: r8188eu: issue_probereq_p2p
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221202092525.403887-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221202092525.403887-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/22 10:25, Martin Kaiser wrote:
> Clean up the issue_probereq_p2p function.
> 
> Martin Kaiser (2):
>    staging: r8188eu: merge two probereq_p2p functions
>    staging: r8188eu: remove unused da parameter
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 40 ++++++-------------
>   drivers/staging/r8188eu/core/rtw_p2p.c        |  8 ++--
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 +-
>   3 files changed, 18 insertions(+), 32 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
