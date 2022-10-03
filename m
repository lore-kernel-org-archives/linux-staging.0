Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A7417E9
	for <linux-staging@lists.linux.dev>; Mon,  3 Oct 2022 17:04:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bj12so23502897ejb.13
        for <linux-staging@lists.linux.dev>; Mon, 03 Oct 2022 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NvKGaoGjC6Yu6xtiRFq6MbTzbAxFa+B5R7nWn1UhP4k=;
        b=SQU8tzb+i5qz7F1TG0PxtutgODUrjACUsQTOKj0yU8Xz3zic2W56zMbDbxBECt5xV5
         pVXGgK/fgvSUKnHO2uw2HSS37vXyf8e2V5vefsXAa7qW4pwt77jajZJTMcuivylSj7eU
         8adQux7n3+rBSsWnUArxOguTyNtizQaEpTarw4gBhjzQcULgTY60Mu+Tw5gtMcqN+MBz
         dH3AmIsrTigaMIZDMD7gFnJ3N6k55tXWV8ZnJghoV3Vj1dVgZq7m5oYMx/9zP5bphdI1
         XceLE7qmYGgAetuP7jB0KqMv73T3AHV2cvRwDGKXqAO1wLy3zy7fvpXbDBqmLfcofh7J
         vdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NvKGaoGjC6Yu6xtiRFq6MbTzbAxFa+B5R7nWn1UhP4k=;
        b=rFRx829KCUWVdk9epCTCtcbhTgb1aHF5O3g/zPNo5EMio/jkPXF0duThLfJbFQ4ofB
         EHpS5fy7Q1mvMPp+8CPwSeHRRYdpjguWntBF/jPD2KmCevwPV/B5agN2uuRylzur92dh
         705dp91u2FVi1HX6PXcloq0+Xa9NtDrTM8shmaf+NPB8luZpmWbYMXGJ0QqSyrxJJeOY
         O8spkBEVT4Smk7f4xXss+Rrv0NNw/9MneAZkgSIhEW/xA8EKrzhLrDQe3AWcosw28HLy
         cObJIW3bCvJMoYdRiR2YvNVzwq3RBBb/tTMmgQMnudDMVSegPspXUeWfF3Trxxt+Rtqe
         hELQ==
X-Gm-Message-State: ACrzQf3HNVqOKm/OCJsxPhiR3VmfykK76CWsnmuJiluZka9bBk0CPMpX
	wx4668aNbR8ZN8lKwWR69KQ=
X-Google-Smtp-Source: AMsMyM7bIjzC4j42DUSy5Hnr9Z0KHd/yZHbTdOJ7Gka3C0Rc82nkNCuntjqiy+KMPAr9DfzGhez1mA==
X-Received: by 2002:a17:907:2c74:b0:77d:5624:6301 with SMTP id ib20-20020a1709072c7400b0077d56246301mr15197633ejc.133.1664816690626;
        Mon, 03 Oct 2022 10:04:50 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id kx2-20020a170907774200b00781b589a1afsm5684402ejc.159.2022.10.03.10.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 10:04:49 -0700 (PDT)
Message-ID: <45b797ad-7dc0-cf9c-ef7c-59d8420c9e34@gmail.com>
Date: Mon, 3 Oct 2022 19:04:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: convert two functions to void
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221002143544.7974-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221002143544.7974-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/22 16:35, Michael Straube wrote:
> This series converts two functions return type from u8 to void as
> part of getting rid of _FAIL / _SUCCESS.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (2):
>    staging: r8188eu: convert rtw_reset_drv_sw() to void
>    staging: r8188eu: convert rtw_free_drv_sw() to void
> 
>   drivers/staging/r8188eu/include/osdep_intf.h | 4 ++--
>   drivers/staging/r8188eu/os_dep/os_intfs.c    | 8 ++------
>   2 files changed, 4 insertions(+), 8 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
