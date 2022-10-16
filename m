Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009022F28
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 18:45:08 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u10so15263876wrq.2
        for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 11:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hUvasE44hYvxTOWnqZWHCPPhE7X3bpjcc2vJnBfH9k=;
        b=GkIABXBkGaCcT8QxtzXzhV9grSN8SBpQawQoAT5Mdeo/+A/EniJe0JJdxaKF8dVx/r
         79aITc+u+mbuGJMR83E63bCgVhKnQTbhL1yw0RtZtuE2M7zzF8FLqJ7wHkhHytJzskvJ
         ZUPj67+ntIO42TcasDiN3EgZe3G+7GnKViS9dMo+0WKcIX2hueO0wakb4ozXJ2vkjUZx
         eKlC7MPvUBU7ZSuNVBihxYunjwEMxddgBa1g4OUrl9Fpk9eAEVHoeHs/WB/3ag17Nvrp
         zBX9TnjcTcWsPPNFnZu+UY0Moh/7+AHBdmufMfgP4mS6po/G7atqt3c/ukpfxcKDKfzp
         B1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hUvasE44hYvxTOWnqZWHCPPhE7X3bpjcc2vJnBfH9k=;
        b=dwxMpUDBvCfaHQtv93/Ks7+rQ4bmlObcTM9nitBNWAsawOEpBxk/dSesysljhNbvqt
         y7AUVzvm+u6Xl6IeRE+ocoAuF5lP5FGSfmbcom7WdKPnBQxBCF1QagLDxOTpf8y5rLzo
         cl+C+DBxbemg/Iyiq349V6TsBhMjH6upoepgG/bWHcPQDqEgzZeIQt4J1VTTZNibThN8
         E4jEM0o1fIKqz3jQB1gtL8cX/oE5p5VSwsgWsZz4e0rBti4oEPAe+/EwGolilluVFHMI
         TqaapnBiZTi9U/qwQwusvHpr/9olXN0uHic7WQKe3Jw3L+RCXdkL91WrqQr5N6+1twl/
         07Yw==
X-Gm-Message-State: ACrzQf3Vz4PQ8rzvKMXXQnNzasYha6rCTeGdKl5y6d6XJSJdIZb4SERf
	y77QYcdxSZTM8IYOIkRtdss=
X-Google-Smtp-Source: AMsMyM6pjjFkyK6gzqx0jvtbLOA6j8uP0x7RX2AKopsDGd5fFVz43GdMFJob65/DMMJQliJvpTgZyw==
X-Received: by 2002:a5d:4683:0:b0:22e:6be0:dfc6 with SMTP id u3-20020a5d4683000000b0022e6be0dfc6mr4311024wrq.573.1665945907145;
        Sun, 16 Oct 2022 11:45:07 -0700 (PDT)
Received: from [192.168.1.104] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c4ed100b003b4ac05a8a4sm17339177wmq.27.2022.10.16.11.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 11:45:06 -0700 (PDT)
Message-ID: <c0afd086-156e-7414-2082-a13f6a728f8f@gmail.com>
Date: Sun, 16 Oct 2022 20:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] staging: r8188eu: led layer fix and cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221015151115.232095-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221015151115.232095-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/22 17:11, Martin Kaiser wrote:
> Here's another series to clean up the led layer and fix a problem with
> leds during suspend/resume on some devices.
> 
> Martin Kaiser (10):
>    staging: r8188eu: fix led register settings
>    staging: r8188eu: handle rtw_write8 errors in SwLedOn
>    staging: r8188eu: fix status updates in SwLedOff
>    staging: r8188eu: SwLedOn needs no padapter parameter
>    staging: r8188eu: SwLedOff needs no padapter parameter
>    staging: r8188eu: remove two unused defines
>    staging: r8188eu: don't include rtw_led.h from rtw_cmd.h
>    staging: r8188eu: remove padapter from struct led_priv
>    staging: r8188eu: set two more state variables
>    staging: r8188eu: summarize tx/rx and scan blinking
> 
>   drivers/staging/r8188eu/core/rtw_led.c    | 62 +++++++----------------
>   drivers/staging/r8188eu/include/rtw_cmd.h |  5 --
>   drivers/staging/r8188eu/include/rtw_led.h |  2 -
>   3 files changed, 18 insertions(+), 51 deletions(-)
> 

Apply Patch:
"staging: r8188eu: remove bLedLinkBlinkInProgress"
before this series.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
