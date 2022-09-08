Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009D5CA6
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 19:16:04 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id go34so5295499ejc.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7y4nA/2xDJfYJjiHsXSxtBDwG/RdKjtD4H9Y9Yc85To=;
        b=ROVDvcV8KoG3A8gHUPY2sbQ3J7kUQZuBjHxyYOQSw1bAo21d6kcAwvHEGnqPL6QkvA
         0qtbyzXILuLqS7DCVEfoSf8SjMlOZIEmUbZtYYx0b7GAgTBLJaTCvItK1fLrk/u7PgNv
         365IXBsKUZ+RbeZmUmQIHZ9U+YjgpoSbF1xATMp6fRt5nV45foSX1BrErKYnXagzm/Mg
         HztGHOf6Vm0UzRftaIXbiXNDUGjJA8AKOYqp5F5SHbQj3F0IRi/6RuEwksHl3uRaQOh8
         WUjPv8D0caa2EfQBxL0CBFIZfUp0xBw0fTTU7tfALC5RAt3DLbZ9ZmI8rvHV4qK6PT54
         tE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7y4nA/2xDJfYJjiHsXSxtBDwG/RdKjtD4H9Y9Yc85To=;
        b=Zaef48LJ2EuXUxC2Ep/gPAEnUlULZli9OiSapzcF0gV07MIEzkBhOobi9JlJYZO0IK
         g+ywJ1snmtBNbAoW4aDNJ/ivKE94iijzUEcnVV9KHptTS54utFDAfQGut8Ff7/Wjpq7E
         5ZvWmVCPZPTHJndvAmhVXvb3mvEwiPnvqnzojl7hheYW4kVgfUndvMZuKY+5FxWOabov
         gkMqXTZtCtVtHDUbQHjOW5mjhk7QuxZOJwoHX4jYVQXNRkNWqf0c/YWR7ZJSV0yLUibX
         q1bVuUSu2Gi2lTxpm4L3fQnNltTAa43oVJpYOOT8SAPva3knbw812wRUJDMmz8ZdrbwR
         fkgw==
X-Gm-Message-State: ACgBeo0YTw+OrzVcIB4W9kH2X0e7Au8BeJyJudj98t1pyUwV6SrFpUWG
	fnlQlnYWcZJEcP0S4CjJPdM=
X-Google-Smtp-Source: AA6agR5QbmgYt8K41NBlaandsZsChJr17wPPa+yvgNg+6Ys4YHmMEElz/E3BFOHgD8LqRcB9vpnc5w==
X-Received: by 2002:a17:907:7242:b0:741:7cd6:57d5 with SMTP id ds2-20020a170907724200b007417cd657d5mr7065929ejc.419.1662664563275;
        Thu, 08 Sep 2022 12:16:03 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id b10-20020a056402138a00b0044e81203bebsm8583651edv.31.2022.09.08.12.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 12:16:02 -0700 (PDT)
Message-ID: <7df98003-1d55-8993-bcd5-064ac01c9afd@gmail.com>
Date: Thu, 8 Sep 2022 21:16:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] staging: r8188eu: some simple cleanups
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220908130915.8406-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220908130915.8406-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/22 15:09, Michael Straube wrote:
> This series contains some simple cleanups in different areas of the
> driver.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (4):
>    staging: r8188eu: remove unused parameters from
>      _BeaconFunctionEnable()
>    staging: r8188eu: remove unused parameter from UpdateBrateTbl()
>    staging: r8188eu: make two functions static
>    staging: r8188eu: remove unnecessary return labels.
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 42 ++++++++++++++++++-
>   drivers/staging/r8188eu/core/rtw_wlan_util.c  | 40 ------------------
>   drivers/staging/r8188eu/hal/usb_halinit.c     |  5 +--
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 -
>   .../staging/r8188eu/os_dep/osdep_service.c    | 10 ++---
>   5 files changed, 47 insertions(+), 52 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
