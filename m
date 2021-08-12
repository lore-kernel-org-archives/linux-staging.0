Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02167173
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 02:09:51 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so5861985otu.5
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2rv1y9a7DhD+DMkiQAx6yZezSPg61dYWI9nQMqm1HZc=;
        b=j9JKJVubaBOhWbda8FuodukmkVb2vghsIRtX3BWAp5rW+Wq7Ku04d4BScY1C6+BNyd
         wqxx5XaiCgJpP8ch6eqLHuo5QQCFiJi8qDVoCrP0+c8fFmWMJhFl1CefgXeyjdWT9hrO
         c5lX2p7DK28ukujvsKhHy36SM1iAIaGcaTxkeQPcOKjj0e7QRgtOGBfoXDsACHV3E4Xy
         44baU1r8s8/4DQQ0pTVUcNa+kSWniCkZMvgb8mg1IkwMogEzuWY9dlTCze8YS4hvhKHk
         Tt2PDTm5KD3HOOTJrkzVAnFyZniKTFONnn6qpN8AHKQQPQrgtEw3H23LQ+z+ieatw18r
         LHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2rv1y9a7DhD+DMkiQAx6yZezSPg61dYWI9nQMqm1HZc=;
        b=GMKQsiwdqXsaQwKt2UZlkLAtJqa/oMR2x6lpYuCk+IHNUAzqEBvBXbHEhzHZ9yYnaa
         WGOKWnbhCHvOvvgy1wW918Uth9sMnto7rtG3yx8oicWWvNuFeLMPa1TKx+9YlI0f+J8V
         1XcqNFnVnLSI4IYcN/AYjrToXyHDeNd9a/5rxmwYDyhrgH02bNWSWI6egC8x7kOvqJff
         TaxpDWZqCA5BPMejJbsS/7a/pXCzz+qkqZs9T+UNrKkcI7UgACFlmtS2MnsVtslWzS53
         KXWMtj3Z0NXYrppII8NeX41Qdp9Y3Y7ysuIIhD0FYGsUvRRlvjR5Yvfgw4bqbiH40g3o
         3UpQ==
X-Gm-Message-State: AOAM531K+SHv/EiWv4IlduH+daDAx3VG8G4Ri7MkIaSFqm+WQiPIYRJ8
	Deg3BYoyjhgWAA7yUASLQuU=
X-Google-Smtp-Source: ABdhPJwUALF+W7L7C6ueR4w1GwhLGzF6TNSKLyt8t6UjRqY7m1Mh7un2f/JNR5c611A77eeJZALlDw==
X-Received: by 2002:a9d:2208:: with SMTP id o8mr1579421ota.78.1628734191272;
        Wed, 11 Aug 2021 19:09:51 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id i20sm242688oou.29.2021.08.11.19.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 19:09:50 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH 1/3] staging: r8188eu: Remove all 5GHz network types
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210812002519.23678-1-fmdefrancesco@gmail.com>
 <20210812002519.23678-2-fmdefrancesco@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <13cdcd41-20f6-3b8e-0515-5066b1fdb49c@lwfinger.net>
Date: Wed, 11 Aug 2021 21:09:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210812002519.23678-2-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/11/21 7:25 PM, Fabio M. De Francesco wrote:
> Remove all 5Ghz network types. r8188eu works on
> 802.11bgn standards and on 2.4Ghz band.
> 
> Signed-off-by: Fabio M. De Francesco<fmdefrancesco@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_ap.c         | 13 ++---------
>   drivers/staging/r8188eu/core/rtw_ieee80211.c  | 19 +++------------
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c  |  2 +-
>   drivers/staging/r8188eu/core/rtw_mlme.c       | 10 --------
>   drivers/staging/r8188eu/core/rtw_p2p.c        |  2 +-
>   drivers/staging/r8188eu/core/rtw_wlan_util.c  | 15 ++----------
>   drivers/staging/r8188eu/hal/odm.c             |  1 -
>   drivers/staging/r8188eu/include/ieee80211.h   | 23 ++-----------------
>   drivers/staging/r8188eu/include/wifi.h        |  2 +-
>   drivers/staging/r8188eu/include/wlan_bssdef.h |  2 +-
>   10 files changed, 13 insertions(+), 76 deletions(-)

Fabio,

This patch is fine, but it does conflict with my series fixing the smatch 
warnings. Whichever set Greg takes first will apply cleanly, but the second will 
fail. This problem is due to many people working at the same time.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

