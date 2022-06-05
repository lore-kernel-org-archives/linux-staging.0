Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EC1FA4
	for <linux-staging@lists.linux.dev>; Sun,  5 Jun 2022 16:03:47 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q1so13421282ljb.5
        for <linux-staging@lists.linux.dev>; Sun, 05 Jun 2022 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8j4Ucv+Lybc/XuEfT3hO1ywcwWTOvwSEkCH8CD9yV8c=;
        b=mYTiV40uBqdpYeGZKsKyrRnVb0WWonjejPdNzEu6MR8BMJWPVFBqMRVrE0r5NCAazP
         0OHic3xL/LGD94CxLTag35+jET0evL6Fk/nhDSzT8oMxizbV4r4Dr7Zi1GM6TeJpW6tM
         1VsjfxBG8Hws27jN8l+pxzBxxjdYsIjM7azlm8uyRwmNdh6Puh50p3P+GD/t0D/NDHSv
         1l9O5gt8jWQGMu1T5mUkte0cVzLlLdYKERRTPwuRTktqEZ+wjNGDzp6zk/7lifYm4hby
         hXaRMps4kgfZ1aAWYYzkDSKVucEa7S9ieTufAoU1A1CB7gTXpYVYhPaQ9YqZWzQZ6Ykq
         QUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8j4Ucv+Lybc/XuEfT3hO1ywcwWTOvwSEkCH8CD9yV8c=;
        b=K7qw0ZWMXRwCq1nQF7UnTvRZAg/9eLhmWOow50C0EhP21a+zWI/n4XwxrKbxrQyMhf
         Fel5fWEvpw3EW/7UyaZrFDLfGxZHaiC3QP1Z6c1qYp2qVr3OElBlUH85rv1bsXzTovYf
         sLPt+WTeH1ZvGSrbGUh9RYURZTZu/QxgcEu82wPHNup/gjoq//HPuwCn4j9pq03Ld7EM
         wz7F+uVzvbJNT4oSPUEvaJCijj10CMdzyYf/9HSqSWv9aso+VgYVY8Jp2xEqODN6+H2m
         9H2yLjJXq/C5hVAdn/gdtAaaJN5+HMrJlLqRhcrpC+FXZMf7VKDr5j6o8q/Gyq/9513/
         sqcg==
X-Gm-Message-State: AOAM532IRrFbKQD67zOYmFP5cjy0/fgUQ6GZcxEmZzmNFkaE9lu+1Op5
	3qprolEKjXGF2W/BrYjPt/8=
X-Google-Smtp-Source: ABdhPJyEW/KXIsbUdrVk+gnZ+9xPYcq6cr0Kd2Wb+8uyCr5FmlHp3AKxiBHntAVGiTVx6XtMCISsMA==
X-Received: by 2002:a2e:700c:0:b0:255:7dab:aad with SMTP id l12-20020a2e700c000000b002557dab0aadmr7277712ljc.492.1654445025834;
        Sun, 05 Jun 2022 09:03:45 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id x4-20020ac25dc4000000b0047255d210fcsm2529796lfq.43.2022.06.05.09.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:03:45 -0700 (PDT)
Message-ID: <e1f68045-a9ab-5fc8-17eb-9cc4543ef55f@gmail.com>
Date: Sun, 5 Jun 2022 19:03:44 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/11] staging: r8188eu: continue the cleanup of
 issue_action_BA
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220602193726.280922-1-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220602193726.280922-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 6/2/22 22:37, Martin Kaiser wrote:
> Simplify the code to send the addba response and the delba message. Use
> ieee80211 helpers if possible.
> 
> This series should be applied after the "start cleaning up
> issue_action_BA" series.
> 
> Martin Kaiser (11):
>    staging: r8188eu: use mgmt to set resp dialog token
>    staging: r8188eu: use mgmt to set the addba resp status
>    staging: r8188eu: use mgmt to set the addba resp timeout
>    staging: r8188eu: use ieee80211 to set addba resp capabilities
>    staging: r8188eu: calculate the addba response length
>    staging: r8188eu: use mgmt to set the delba reason code
>    staging: r8188eu: use mgmt to set delba params
>    staging: r8188eu: clarify the contents of the delba params
>    staging: r8188eu: calculate the delba length
>    staging: r8188eu: remove the pframe variable
>    staging: r8188eu: use u8, u16 in issue_action_BA prototype
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 51 +++++++------------
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 +-
>   2 files changed, 18 insertions(+), 36 deletions(-)
> 

Looks fine, thanks!

Tested-by: Pavel Skripkin <paskripkin@gmail.com>




With regards,
Pavel Skripkin
