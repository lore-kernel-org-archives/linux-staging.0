Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C6320A
	for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 18:55:04 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id cu2so30317655ejb.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CMpQEYdybSyhAWte/2QTAoDCUR/mXObytaX6p/VZc6E=;
        b=lqPIYuzGgbqH/UbmKzHFXJjvvK357w2rVqakmMKTURzL7n5cBXsQ9J9XEqB4Pm/ygE
         sSz1lDUxPhCp6+GwU6rtSS5rtFfclUH7YHRdbr6d2CQMBAj4rZhT9tbd5KGmTiI9N0ES
         nhQ3BpOoWtnOgkaaWhpWa61C/LmGN/RvYGahuji3EdAjrstTMqM6G9mDQ31ANpeFryOD
         sJBtqfRlBBFVUiuQOOFfzGLDh6ekLYnSQmeLvFVj6D5O9WGHO9WjC5aWw8qfvuFO43A2
         8W05sjG361fKNBH6M9koFfQXhv5saZlzdgUf3yGeVbIxuPkJLfsYVP1Cax/Uc9joLveW
         16nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CMpQEYdybSyhAWte/2QTAoDCUR/mXObytaX6p/VZc6E=;
        b=hYUA+95KYJsIMqjlohKT9pyJnKKRzH3gj9cDy6sNlhY3asjCZF+UsZYK2hn7g3l1cs
         ZeT3+FhFoll/ampIvrlk9Y1a6HaeGxtHkDAcvPUiPFyp/Q7qOUlfQGk+KjcUN1aILqAw
         GxEy0o7/S9AgRnNTSnTUVP8fogbUAbX4g2ZdANYCPsgqY44bqcNl5Rls9yH64k1o2x/Y
         RmPyZ8MF6aPUJQuxZl6nyZyPQkYdmq5IK4reXa0zRWrDKAXRc0YXSZOB7E3RD+fcuo8k
         mm3uH5yoE1VWqxVvHdM2w1QV11gVmiRze1m37UQF/JkBOYi2v7IGqxfWmuhvzuRK0Ay8
         OxbA==
X-Gm-Message-State: ACgBeo36YH21rqRyIqElBEXABdcAG0j9XINU1bx/EPCmmKHOnA1QIn/L
	oDi39s07MKddYtTaCnke95k=
X-Google-Smtp-Source: AA6agR4eIHFs1O8X2CZ7Z71VdsNr8hWv15ibxCEcftc5dYd455VKKDLNPZQibIa5z7qja9vGOJ5jXg==
X-Received: by 2002:a17:907:2721:b0:741:56e5:6802 with SMTP id d1-20020a170907272100b0074156e56802mr13527094ejl.675.1661972102850;
        Wed, 31 Aug 2022 11:55:02 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id bq10-20020a170906d0ca00b00734b2169222sm7420328ejb.186.2022.08.31.11.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 11:55:02 -0700 (PDT)
Message-ID: <6e5dc597-19aa-aed2-c94a-29d13acc0f87@gmail.com>
Date: Wed, 31 Aug 2022 20:55:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: migrate os_dep/mlme_linux.c
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220831053639.8559-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220831053639.8559-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/22 07:36, Michael Straube wrote:
> This series moves the functions from os_dep/mlme_linux.c to
> core/rtw_mlme.c and removes os_dep/mlme_linux.c.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (2):
>    staging: r8188eu: make two functions static
>    staging: r8188eu: remove os_dep/mlme_linux.c
> 
>   drivers/staging/r8188eu/Makefile             |  1 -
>   drivers/staging/r8188eu/core/rtw_mlme.c      | 31 ++++++++++++++++
>   drivers/staging/r8188eu/include/mlme_osdep.h |  2 -
>   drivers/staging/r8188eu/include/rtw_mlme.h   |  2 -
>   drivers/staging/r8188eu/os_dep/mlme_linux.c  | 39 --------------------
>   5 files changed, 31 insertions(+), 44 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/os_dep/mlme_linux.c
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
