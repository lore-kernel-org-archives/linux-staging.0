Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1666FA4
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 18:17:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id t25so9287775ejb.8
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 11:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiQ/FKVprfl/2j6yZVqBybauBhLs5z930z+sCk9K3nM=;
        b=LyzJdfBL3yMDCxf4Qm0esMjRa21JjpNLc4v9SM6AJF+64S0ORaeKR5qTB/MDl+njxI
         96a4HjyvMqBivfDIc+RS49ViPavuFAwTYBCTevrlS5cy9ZXirBRSXGthluuJUe1Ut2q3
         J11itIc6Blxie8j5wFFFpivd7qd4cMXdPfpPeBe7FxMKiPI0k1DVeRZL2Ds9TKlYLRw4
         SIyrE/On7pOntxu3tCHFLPTbVhHM5cDBHSUzBBNjwoFFHEZSJFJmaJzkOSb4GImwypyT
         GZJO3lTPCc2t8pVyShvq+TZYeQS0uKBT5CGh/uOiuHdGHdEluoJmHtQxPVYOd0VG950W
         Yaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiQ/FKVprfl/2j6yZVqBybauBhLs5z930z+sCk9K3nM=;
        b=v/iow3B9zYX3VnFGPPGoHZLHNRZ9kZsZl/+1n5nHZacujfgEexAG9fvW/jovEQE6y9
         AIkeDRWg1hhkiUtMqJ09nniFpJCpCOmKpeD0MElB34/iKASkaeMNSaKfiGoPlybVZPss
         GsnM3G77vF9afQ/q8b6qtMINIVuX1b3RvozXAza3c/gBhj7z3N9SqcxKmnwuFz+UQiKo
         ZXdgO5+gWG3wlY0TJrdnDIcZDjghaVQBHgUkPW5VJ+wt4ZHQ6b6xGX6EPjK2h87GqCsg
         ysnWpjKisl7r91j5M6luCnryzkFgVHxfd1ec6Wbp3LlQsii9/gCPIIDviboI+LTLlibw
         eXng==
X-Gm-Message-State: ACrzQf0NLZNGyh0KQDopQARGMgYiLKFQz6vhjg1MBAnzz+eDc+IUbRWG
	hpdZ//zQE0qzBs0DGuBRuTFdA0c05JA=
X-Google-Smtp-Source: AMsMyM5NbyC+Op50jHKNtYvL+5ipB36yuW0xS2E6j5aONwfU9fzrWIBTsu3w8xNHOJ6SAud6KYzeYw==
X-Received: by 2002:a17:906:6a18:b0:78d:7228:7a52 with SMTP id qw24-20020a1709066a1800b0078d72287a52mr33141434ejc.363.1666721828058;
        Tue, 25 Oct 2022 11:17:08 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id gk19-20020a17090790d300b0078b1ff41f05sm1775924ejb.43.2022.10.25.11.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 11:17:07 -0700 (PDT)
Message-ID: <4a8bbc23-9d17-c6e0-5da4-a799cf7d332d@gmail.com>
Date: Tue, 25 Oct 2022 20:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/4] staging: r8188eu: cleaning up unused variables
Content-Language: en-US
To: Kang Minchul <tegongkang@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221025170621.271903-1-tegongkang@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221025170621.271903-1-tegongkang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/22 19:06, Kang Minchul wrote:
> This patch series cleans up unused variables in r8188eu
> causing coccicheck warnings.
> 
> Difference between this patch and previous patch is that this patch series
> include making function rtw_sta_flush in r8188eu/core/rtw_ap.c
> into void function.
> 
> Kang Minchul (4):
>    staging: r8188eu: remove unnecessary variable in ioctl_linux
>    staging: r8188eu: remove unnecessary vaiable in rtw_recv
>    staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
>    staging: r8188eu: make rtw_sta_flush to void
> 
>   drivers/staging/r8188eu/core/rtw_ap.c        | 7 ++-----
>   drivers/staging/r8188eu/core/rtw_recv.c      | 3 +--
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
>   drivers/staging/r8188eu/include/rtw_ap.h     | 2 +-
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
>   5 files changed, 6 insertions(+), 13 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
