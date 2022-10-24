Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0A4680;
	Mon, 24 Oct 2022 18:09:42 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id a67so32909047edf.12;
        Mon, 24 Oct 2022 11:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahDO7+rUj1KXOd/Qkfsy2Fp1z/mH76ebAnI74jzaPs4=;
        b=LnldIeh4COUB4K6NTLWMbN9T1BKIZhqJMCVV1Vr0XxNk35yxYSXurE22kT5qZJtSyV
         odbacRNIZXrLZFoFOLaICe8RzYYkMGtGsHRVchDvCCGb1Eg0LlK+wdK+jq48+fgYbUPG
         PN9277CKeKzt1NQKYZE3YYVgvAkO13SQrGOhDib+F/6r8DCGdkkwVrjugKnGfGMOKwGu
         tHedAd31ldjmSVIy0DdN+8MXjdjU0WbgfQnPyQZVJIHL81Yg77HitkSvMluVydeKZDfH
         8qGI6cQlGhbx+vSDMtxm05V1W7iRHr7S0V1Gj/WizMZVSLDVbwG3WbIy27gLreeUmtuy
         X2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahDO7+rUj1KXOd/Qkfsy2Fp1z/mH76ebAnI74jzaPs4=;
        b=bhz46EV/JkDwKTEBdTCnqo1CZ2DzMi3kuZxQbeg8Qoe3GyX5AZ0WxAEzPTewURIPGv
         qaWe0q0PphGHGPnooXbpX0drySYwTXLLAV+eaosFtyIkLPeJW470pXzcQS1+FZoOlFeH
         di0Nbiz5B24zpxET04ZExoqtsc+dp0kARx/sgiImjBaZa5ZkWJgVBxbHRy+XLtg4sbe4
         sWLioYAsUsEcKxK7jDH//wvjLyjw0aj9Q2p+V3Zk0pX2IIfsVi7GgenPjaC6SSoLvAws
         3w6I28StFP2+g2+7c9NnZI3r1xd5aKkJ+bMPSZK1Ci7BXjK8zfwKcp8nnrVVbdN2lj62
         Vimw==
X-Gm-Message-State: ACrzQf0Y8L7nUFM7D/ZzVdmAJISjlUJNt60xhGihqGXHarDP2U1545vw
	uYcJQmHY3M6GESZjXh4Q2jKOolqa7+Y=
X-Google-Smtp-Source: AMsMyM7Mvxlj6NJz6pm21NqKYDWEZwgw+iQrvIy7iAf3DzniCXJ30NWJaERW7GbIg1ATHY77DsCWoQ==
X-Received: by 2002:a05:6402:298b:b0:44f:20a:2db2 with SMTP id eq11-20020a056402298b00b0044f020a2db2mr32005255edb.138.1666634980611;
        Mon, 24 Oct 2022 11:09:40 -0700 (PDT)
Received: from [192.168.1.104] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id q21-20020a17090676d500b007a6c25819f1sm199683ejn.145.2022.10.24.11.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 11:09:40 -0700 (PDT)
Message-ID: <64d0f316-3e72-877d-0f6b-3db1d67877ac@gmail.com>
Date: Mon, 24 Oct 2022 20:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/6] staging: vt6655: a series of checkpatch fixes on
 the file: rxtx.c
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1666605225.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1666605225.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/22 12:01, Tanjuate Brunostar wrote:
> The fixes are similar, mostly long lines splitting. I had to make
> serveral patches to ease the work of inspectors
> 
> v2: fixed a compilation error found by the kernel test robot and
> recompiled the code
> 
> v3: tends out the error persisted in the second version. this version is
> a correction of that
> 
> v4: did some corrections as recommended by Greg KH
> 
> Tanjuate Brunostar (6):
>    staging: vt6655: fix lines ending in a '('
>    staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
>    staging: vt6655: refactor long lines of code in s_uFillDataHead
>    staging: vt6655: refactor long lines of code in s_vGenerateTxParamete
>    staging: vt6655: refactor long lines of code in the rest of the file
>    staging: vt6655: refactor code to avoid a line ending in '('
> 
>   drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
>   1 file changed, 324 insertions(+), 218 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
