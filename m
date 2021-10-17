Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7632C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 12:00:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e3so35450407wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 05:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DCYEqb1k49K3imC4oVzyozxFv8GwGv/4wZN3QkeC/aQ=;
        b=QUdiOZ3XvYh028+yHdid/bcKSiTvGrrv+Jm9rHxgaGiHEpAocg2fZvYvnqHGacBSkN
         G441PhRV06MbBkIQvQn01qxWaWL0Gzxsty7Boz0MkFflbT1AHj0CtIAUb/hhAgJSJBHg
         1Re8Jyv7IkuZNVl8zNsl0J7x4tgdiKXBYUR0Nz2j0SopECqXWXBH2jNlnyppFrFuUMB7
         VQI0gvJSaLp3o9YwvTjjb/q0M86C2ZR1nuidDUisLmOF8vMpuGUCQ4QtE069o0OxNEJu
         8buM0/RJZyEOrVa7dIAbP04bALnc6xRLDyUYTHmx7Y8FVgBS97+BFepWpsnam2fN7Ypr
         noOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DCYEqb1k49K3imC4oVzyozxFv8GwGv/4wZN3QkeC/aQ=;
        b=XCJuFBJIq9J6nkvXpHYWTRL+tHWJPydpJSxcDyyMjp2UiboOtmI2z0wGFMRdv7UmmU
         S1g1/VWNWqjyqPyTwr9x8MeZ7Nnjh+VYEyrjckvieKngDLksn3ynXoQExo0E1tvr/h6F
         xMWpZyWurpjkfKQaG7Sz4QQybCF7CkLvq27Yf+W3hnuKxDQrJkEGf84NylNR0LQmGAR6
         BbkLpSrZ+upufQu+KgJQ6faMoscZp+DmEhO+ShZG5oMgpQP2kA9EmpGjyRGXSp6DnlJ5
         N69hLSv261Nq7zqhaagJASoc0efbgd+VpYOQxImetbwxvKb8c5x4Dd9jPr+H2KpyV5Lr
         8CUQ==
X-Gm-Message-State: AOAM530L568wys5oh+gWea2JEckNuNhbgEX4NnWcWVNLlpn6ByERynre
	SV+BggMwqjBnPJk8kRTvYlI=
X-Google-Smtp-Source: ABdhPJwBq7o9ILnHKu0aj4XpjCulBCrGLlcyOXP9feDonAPpRRg9N0T1eNJ/BYAIqvbJTkQRfNzeYg==
X-Received: by 2002:adf:c00a:: with SMTP id z10mr27618558wre.315.1634472033580;
        Sun, 17 Oct 2021 05:00:33 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id k13sm15603173wmj.41.2021.10.17.05.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 05:00:33 -0700 (PDT)
Message-ID: <5318cdca-6200-c966-0f87-74e0e79d27ee@gmail.com>
Date: Sun, 17 Oct 2021 14:00:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/2] staging: r8188eu: remove CONFIG_BT_COEXIST
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016172345.23114-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016172345.23114-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 19:23, Martin Kaiser wrote:
> Remove the remaining code for CONFIG_BT_COEXIST, which is not used for
> this driver.
> 
> This series should be applied on top of "staging: r8188eu: another round
> of removals".
> 
> Martin Kaiser (2):
>    staging: r8188eu: remove unused components in pwrctrl_priv
>    staging: r8188eu: remove BT_COEXIST settings from Makefile
> 
>   drivers/staging/r8188eu/Makefile              | 5 -----
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h | 4 ----
>   2 files changed, 9 deletions(-)
> 

For both patches.

Acked-by: Michael Straube <straube.linux@gmail.com>
