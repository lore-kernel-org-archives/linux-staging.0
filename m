Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D5D33FD
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 10:39:54 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id n12so22853602eja.11
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYqTXO3cxaJyUvj4QsU8V2dteTiq/1Q+Qyd/LuGBD/Q=;
        b=g+g0bR9Pob12K1+TXDVYIb0y8WqOuxq46Ri2bEkdYn6sti7ZWfMvr81jHAj/v1Wn/y
         vJbw3nPFsVmru1/DgeHVkkNPFjrcqbPULYnPjEAzvj/MunLr1oMTPOV38ZvEQPG93fsn
         XbgfCHvNw2bpJCf0KkM62CH5laynSZ2qs8akGqwkIUWRAwoRdvQ2wrozlsnIq4uZIOB7
         8XAo4xr5Lh9IdUr1xlOFJavLVG6kWbWQsaav6sRR5FFgrj6xcXaqK0VIdnsQHzbLsiQ4
         pCl62vbanVntTL7Tar6fQLjl/MaFC0Cz8WG3+jl8mvE8jxtIM+u4h/m5ACiSurvvlT6u
         gYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYqTXO3cxaJyUvj4QsU8V2dteTiq/1Q+Qyd/LuGBD/Q=;
        b=4gc4dumtoj3PRKzqq+4BAg8yv2OThKfS8kduVcnNqPdDlw8mcNmjt6WM2tzqSDyIRx
         rMT1g0/f+7s97lfVUc9Uxy/nIGI9S4h7O6M6Ltp7y8qtJYSSICGx/W1/xZdV1pkIkUW1
         ZbJdqH1ugToxSMMbsY86HtZzqVdIwXirVcZmQ2E8J6KFUSo+5x7Ynekrrjc+mcxU8zHJ
         dpXEqAG/Jmhpd1wNPYtwAe1XdwpKNEY/AKKSIsTv2FeTi+NCXsTB4rwcWLaesnVqvfZA
         22qXLIku33o6Yn3k3FgY1W4m8Z07aCbf2NFBAQbmVzTICsbKZvVLgaq9tTOYmLhLq+Nk
         zACg==
X-Gm-Message-State: ACrzQf2t3yqZ9KVY8RSA7WP24EEKZqD5+VsTh+VU0GQ5Soh4Cxkzbk6D
	wbjwqWzO5xm2MHRuKdAGcWc=
X-Google-Smtp-Source: AMsMyM5xPiy5dGPlv3OzudlM6a1HixLr4tzn4Pizdou/xnRCgAyHntBsVi+PlhThG2O0x1gBuFrkGg==
X-Received: by 2002:a17:907:7da5:b0:78e:2c3b:55a2 with SMTP id oz37-20020a1709077da500b0078e2c3b55a2mr7521387ejc.96.1667126393164;
        Sun, 30 Oct 2022 03:39:53 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id g14-20020a170906538e00b007262a5e2204sm1706272ejo.153.2022.10.30.03.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 03:39:52 -0700 (PDT)
Message-ID: <cfe7c682-53b9-f30c-c423-8a6c551ac966@gmail.com>
Date: Sun, 30 Oct 2022 11:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: remove the last get_da calls
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221029171011.1572091-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221029171011.1572091-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/22 19:10, Martin Kaiser wrote:
> Replace the remaining two get_da calls with ieee80211_get_DA and
> remove get_da.
> 
> Martin Kaiser (2):
>    staging: r8188eu: replace get_da with ieee80211_get_DA
>    staging: r8188eu: remove get_da
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  3 ++-
>   drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  3 ++-
>   drivers/staging/r8188eu/include/wifi.h        | 22 -------------------
>   3 files changed, 4 insertions(+), 24 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
