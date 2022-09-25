Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE774422
	for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 21:05:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id lc7so10488105ejb.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 14:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=a4qcMZXDxN4eP7v1btEoZe17jDw7PgjqyrZUAWz1Vwk=;
        b=g4zMkvgshqqI4hTH/sym59ZjJkU/SYj4qcZ0CzJWY0Rz0/6dgz5AzMWBISEev0Tj8h
         kkfSiKENjq53RXVM/oEtyJlnJ8df/k+PtZgg48d70xwXKVxGBNylY0XPQlHhvvysQruj
         9B46heVszRxkS6FXlzHMt95vF2Q+eJBQV06qtJDD9eiExMThJDqJ56mh2vghGOQeT6SU
         OrAje5rjvcSnMA1KFSiYNl6Ap1oc55+TYbXaQjjwiJ0pQ3gcWuhvgPxo9husNfXVMO6l
         Ihs5naWC3P3LF+DII+29CsJvWKF1EeSjUokM4VlkU3hThkHyPeXyVnfVD8Ykkkj/CytY
         hZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=a4qcMZXDxN4eP7v1btEoZe17jDw7PgjqyrZUAWz1Vwk=;
        b=YI0uQx43x4L+APQ6PaBIMqHAMfGWhvEgmMtmj3YfvLp9UoyEiQt99IZYfGB8NXUa+n
         zfK7VmNlAggFo/adQpy/3a6amy/ABbkgxbrNq60qwSr5meoAMmSTIEOdsd8gWr1YY8jS
         CVoQ30+XDbAHWCCPYId90kkj+QRCsQ5z1e273nOvBy3r9fJ8Vspz062zuJh8ucnlNb+1
         YUPnVR8xnp8dHmnw74nEg4tyveopAoc9QUYli/c0kIrkQur5HIvOU42pe8OxMCy3l5L2
         e8CRrl3LIC3F20od42k4afSfzl/5oWGMFo5nXw34NZOJa++c8ik4wq001c81pTCbvPBs
         daPA==
X-Gm-Message-State: ACrzQf1eXpeBBngEqJgxbJKA3F2+sqMmUFUTYK38vbI8HvKOm68imb8K
	L/RYROhFUnoeulIq6RLXwYs=
X-Google-Smtp-Source: AMsMyM5hcUZAHyDhsGV2je/Axq/RhxGNyeQ8VJ7u+8AUBu+qtiK3zVotYkCuQGIVLY9HH5cS4a3sgA==
X-Received: by 2002:a17:907:75f7:b0:77b:4579:2aee with SMTP id jz23-20020a17090775f700b0077b45792aeemr15386515ejc.529.1664139954591;
        Sun, 25 Sep 2022 14:05:54 -0700 (PDT)
Received: from [192.168.1.101] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b007813968e154sm6933846ejc.86.2022.09.25.14.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 14:05:54 -0700 (PDT)
Message-ID: <c6677024-0c7f-65c6-f7d0-5916840c9a4f@gmail.com>
Date: Sun, 25 Sep 2022 23:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: drop some stop/removed checks in
 the led layer
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220925140406.112991-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220925140406.112991-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/22 16:04, Martin Kaiser wrote:
> Here's two small patches that remove unnecessary checks of
> bSurpriseRemoved and bDriverStopped in the led layer.
> 
> Martin Kaiser (2):
>    staging: r8188eu: don't check bSurpriseRemoved in SwLedOff
>    staging: r8188eu: don't check for stop/removal in the blink worker
> 
>   drivers/staging/r8188eu/core/rtw_led.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 

Quick download test is working.
Observed LED is working fine

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
