Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA8620
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 20:31:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso6549994wmb.5
        for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEht+Hed26jyN2iktDH0mX7R8M68D/uz7j0TTK9tqVc=;
        b=pSrTvIWYfURgZVScr8B8ehmEe7G7HX7VqfvNNfP4UGUJEKZp53Cq1Ui1apU3xDkGLq
         0VItiOfb5JpdchEGhYK0FIGZMpxndFgrp6rTlcU8PV1hnLFGV8isOiwm5Jf5qw2Dr80b
         PLXepJH9tdU1GIdvziNyBe34WQgtR3YG8zNMPthpLtO7BEYwszr0eU9CpLb8q4HMEQH3
         o+G2w8UgcsLnqyi2erzK2NtInIjpC5Gs3WomWxmv8YBIDLkbKC/2//ISsbU6xvWX1JxU
         QIQspEwuhniPjNJvJbEVhv8X10l7t/j9QiU/0Jg3ULfun3nBezwaOEXyreCoPrnfRO0s
         NSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEht+Hed26jyN2iktDH0mX7R8M68D/uz7j0TTK9tqVc=;
        b=CcBJdXiLGsNp1Hnb5zvuud9URHeaPP4E9z4YMUrDim/WCJPKeYflA9aP2i/cY8ODI7
         Egqq9tN9RPf04GDQzaqBcsNIw7R2DMLh6Y8WaFrhC9vU0nl+b7hLYxFzPJWz5+AJOqzG
         OlrnlVMJnkEMyOiC1gtC+CgZuUZKgxhkuK+BqYVJRJHRXpvBB0rikxal6ayovAXIVTdA
         DowH1SBm8peCfcZgjBto7DP9hSsgyTSumQ/zm5mVifyYdkj0bKpiSYj+SVwQ7buFRkeJ
         85OeNXauhbXBqLAAxYYCYjCbx9Va5+fyAEsYSEPJ1d13T0B+GUTZMGz3v03jol9zBwJi
         bBHw==
X-Gm-Message-State: ACrzQf3JbbAMdzl+nlZzDj1hC07hI0tSv7nhwzAjBEpmB3EkGw7VEypd
	cH9jHlkmN13fcM0NwxGxYPEuSoL0XFw=
X-Google-Smtp-Source: AMsMyM4JPDi93GvH3YBL86OxrRZIMAHjB30flKU18k+eV5/g4gNGpwDK1JnjCyvkRgnu3qOU+NUJhw==
X-Received: by 2002:a05:600c:1c16:b0:3c6:bb05:702c with SMTP id j22-20020a05600c1c1600b003c6bb05702cmr14184549wms.203.1665865864023;
        Sat, 15 Oct 2022 13:31:04 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b003b47e75b401sm10350318wms.37.2022.10.15.13.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 13:31:03 -0700 (PDT)
Message-ID: <6dfa32b5-ffef-dce3-fb27-5c91779c01d0@gmail.com>
Date: Sat, 15 Oct 2022 22:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/9] staging: r8188eu: clean up the OnDeAuth function
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221015152440.232281-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221015152440.232281-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/22 17:24, Martin Kaiser wrote:
> This series cleans up the OnDeAuth function and tries to replace
> driver-specific parsing code with helpers from ieee80211.h.
> 
> Martin Kaiser (9):
>    staging: r8188eu: replace one GetAddr3Ptr call
>    staging: r8188eu: get reason code from mgmt struct
>    staging: r8188eu: clarify the bBusyTraffic assignment
>    staging: r8188eu: use sa instead of Addr2
>    staging: r8188eu: get bssid from mgmt struct
>    staging: r8188eu: exit for deauth from unknown station
>    staging: r8188eu: remove unnecessary return
>    staging: r8188eu: summarize two flags checks
>    staging: r8188eu: ignore_received_deauth is a boolean
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 45 ++++++++++-----------
>   1 file changed, 21 insertions(+), 24 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
