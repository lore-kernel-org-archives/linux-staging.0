Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680629A1
	for <linux-staging@lists.linux.dev>; Sun, 27 Nov 2022 14:45:28 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r26so10217372edc.10
        for <linux-staging@lists.linux.dev>; Sun, 27 Nov 2022 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVJk3qEaUc/rcmLQxIcSGjFuecC7PxvDe1/aZEEm9h8=;
        b=O+dKfA018cBRltgdnZ0kfHMokyhqUvAHSz8GMsGY5FjFA+ODkR20n4Jvbq8sDuCQtp
         0B0wDKaFGzDyFf2n+td41rYD/qKqHpHattAto4+tpoxvKiwhN5wWxM4wnpS6TRbkBoF9
         GujqQuEQPJouLcFU0MfD88Q8y2SmO3jn9RrBk2kIu3elDsmNizIpXuZrw3QtZipHJEA1
         qRRodPuHGj4pw5rkrizjHZfmg+yM51JLPYBTpCYo8WCFAUT42/wYS9UpJVIlyHkP7j+n
         +Mu7GtZFr+mGjdOI1UPJfpumEOjW30TgCla15W5Fi7fnsH9P9wI6j0SXzvnVWmqT5vex
         Pkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVJk3qEaUc/rcmLQxIcSGjFuecC7PxvDe1/aZEEm9h8=;
        b=WkD1DiPlhnB2rfzGwvUCLc94pEx0QBBg8ejyzLJSOtRdQbPUHG1BasH1wQbMNhVFe0
         R3sgs9w1h3zrJ80caS8bgCENylyrQQs6ZJEm+fHP4fJYZWLgEEhb6zyWYowEiICvdt/e
         rMmtzCJvr0lIlTHDgbiq3QIwVYybe7EuJKB+7Mm2nYAjwW/snA2O0OvKAHw/1hiSVNp/
         zWCOb3A3TsRmLICBg5lU1khBQQp/3ZQC7o0mVsJKIaXZbVQC/ayOg83bb48qcCbItVBm
         CNoHLz1ElaXJnLGnU0YrmNGhdZi6hZwVakFzl1ePeWUC0+KZRPgiyZNqXhKMfhRI+Gna
         dO9w==
X-Gm-Message-State: ANoB5pl/A6e4r6ysiOlJow5EO5N9Mflpm0UdhTEv4fpFY54Z3mq7py47
	RAm2yW4BZAOgOJtLck8h62b+s1B+TMc=
X-Google-Smtp-Source: AA0mqf6FVtSclvEAKJPMgfwKWB/HZcfp+eM2wYuj5fNx25DLgLUQhOICc11h7SQO7DmeijQOj8Z87g==
X-Received: by 2002:a05:6402:1c04:b0:462:6ace:c522 with SMTP id ck4-20020a0564021c0400b004626acec522mr42735926edb.91.1669560326886;
        Sun, 27 Nov 2022 06:45:26 -0800 (PST)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id a9-20020a170906190900b007bf988ce9f7sm441861eje.38.2022.11.27.06.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 06:45:26 -0800 (PST)
Message-ID: <64393639-cd1d-ec74-01e4-67f0b208d725@gmail.com>
Date: Sun, 27 Nov 2022 15:45:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/10] staging: r8188eu: clean up OnBeacon
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221126160129.178697-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221126160129.178697-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/22 17:01, Martin Kaiser wrote:
> This series cleans up the OnBeacon function. It tries to replace
> driver-sepcific message parsing with ieee80211 helper functions.
> 
> Please apply this after the "another round of cleanups" series.
> 
> Martin Kaiser (10):
>    staging: r8188eu: replace one GetAddr3Ptr call
>    staging: r8188eu: read timestamp from ieee80211_mgmt
>    staging: r8188eu: replace GetAddr2Ptr calls
>    staging: r8188eu: pass only ies to process_p2p_ps_ie
>    staging: r8188eu: use ie buffer in update_beacon_info
>    staging: r8188eu: simplify update_sta_support_rate params
>    staging: r8188eu: exit if beacon is not from our bss
>    staging: r8188eu: stop beacon processing if kmalloc fails
>    staging: r8188eu: simplify error handling for missing station
>    staging: r8188eu: remove a variable
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 130 ++++++++----------
>   drivers/staging/r8188eu/core/rtw_p2p.c        |  11 +-
>   drivers/staging/r8188eu/core/rtw_wlan_util.c  |   9 +-
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |   3 +-
>   4 files changed, 66 insertions(+), 87 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
