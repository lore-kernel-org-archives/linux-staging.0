Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107F1C20
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 06:02:05 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id o22so7877667edc.10
        for <linux-staging@lists.linux.dev>; Sat, 06 Aug 2022 23:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Gokc9LKWBZOdQKNpS5Em8+LXEGZMlphu0Qca2UPW+6g=;
        b=KS83bs0uJMS0Jd+OTiJ+DjO8PzMhL1EJ4+salp9t06ImJPRrX9dLLiBCsEf4EJnz8P
         WfCCVK7WDSqRyPYImOMFRVwu8v07haUcJ8F005OqKBph01Hlg3SgdpooKBsgxbjABF0B
         18DQHEM9gvLXJ7HbVFK7q+P/08Of1dxybmqj+gbyZZ38GYMZBMguFlMkY4n4b3iE5vUf
         m/Vihiqpe3i2B/qzUuQ9iGTsWIj4dI92Vb+IsI32NSvVJpJckb5IKqwufXx0TRuI58mK
         N77TjlnqauxfbonZTAxwPmlxGZ4DSogjVgaJYNn0WYpErJSpUVq5EcT5LQsFg6ajRxjv
         5zoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Gokc9LKWBZOdQKNpS5Em8+LXEGZMlphu0Qca2UPW+6g=;
        b=fvBtiO8pd8klsqVfRQ4PVVx1IKM+oUECZE7P7L9LLA7CH17XsX95IXsapwbxIIunSz
         +Z7CSsN+ZOxhKGVU4KMejkoSN5fCO/OHA4G2BDfJquj4BjP+KsIJhqWX6Bb7OyIlvs1A
         vKuxypUCGbY9K5nN0f0ymaBtCGTRm3Z+NXJLO9btF4C+UMYIBPqgyyOxBHA6HJwvAlPa
         rdxP3e9bmScJBwD/pAMEmEqMvvzmJBcastXjacLjIBEbf8YCxoInQwFWmJQMawT338Uk
         YQD/OMBGANm2T0ETuTIrKhuBxwC4qzmJ316GTw6bDJ/sCKzNsFnA8xmt8M3R9NeTB627
         uk8Q==
X-Gm-Message-State: ACgBeo3/XkuPFB+ZR/EBEX4KhQg1Hw0z9t/QDo9ZbBzyySJPjS2KTssi
	Hah32Yw3mOXsSgo0JnMsN0A=
X-Google-Smtp-Source: AA6agR7gxtRs250Xgl8CRcN3fo0u5+vNMreF/iDjRXwltZFLMVOO5mRDdQuQoVoJL5J13Q5l5SROWQ==
X-Received: by 2002:a05:6402:11c8:b0:440:6513:be2c with SMTP id j8-20020a05640211c800b004406513be2cmr4405670edw.45.1659852124086;
        Sat, 06 Aug 2022 23:02:04 -0700 (PDT)
Received: from [192.168.1.103] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063db200b00726c0e63b94sm3457071ejh.27.2022.08.06.23.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 23:02:03 -0700 (PDT)
Message-ID: <2f7a15aa-c4bf-38e4-aca4-d3fa20a800e1@gmail.com>
Date: Sun, 7 Aug 2022 08:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/13] staging: r8188eu: simplify endpoint configuration
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220806195540.777390-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220806195540.777390-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/22 21:55, Martin Kaiser wrote:
> This series contains cleanups for rtl8188eu_interface_configure and the
> functions that it calls. I tried to fix the error handling and to
> summarize small functions and common code.
> 
> Martin Kaiser (13):
>    staging: r8188eu: Hal_MappingOutPipe should return an int
>    staging: r8188eu: process HalUsbSetQueuePipeMapping8188EUsb's return
>      value
>    staging: r8188eu: merge two small functions
>    staging: r8188eu: move endpoint init functions to usb_halinit.c
>    staging: r8188eu: summarize endpoint-related settings
>    staging: r8188eu: remove OutEpNumber
>    staging: r8188eu: remove comments about endpoint mapping
>    staging: r8188eu: summarize common Queue2Pipe settings
>    staging: r8188eu: simplify three_out_pipe
>    staging: r8188eu: simplify two_out_pipe
>    staging: r8188eu: remove _InitNormalChipOneOutEpPriority
>    staging: r8188eu: we always use HQ and NQ for two endpoints
>    staging: r8188eu: simplify _InitNormalChipTwoOutEpPriority
> 
>   drivers/staging/r8188eu/hal/hal_com.c         | 110 -------------
>   drivers/staging/r8188eu/hal/usb_halinit.c     | 152 ++++++++----------
>   drivers/staging/r8188eu/include/hal_com.h     |   2 -
>   drivers/staging/r8188eu/include/hal_intf.h    |   2 +-
>   .../staging/r8188eu/include/rtl8188e_hal.h    |   1 -
>   drivers/staging/r8188eu/os_dep/usb_intf.c     |   4 +-
>   6 files changed, 75 insertions(+), 196 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
