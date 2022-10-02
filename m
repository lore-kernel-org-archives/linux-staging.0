Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F82560
	for <linux-staging@lists.linux.dev>; Sun,  2 Oct 2022 08:59:18 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id m3so10960915eda.12
        for <linux-staging@lists.linux.dev>; Sun, 02 Oct 2022 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uVu0SvdloXokDRTN006ycde9T0CVjOI7b8JYiukwlsM=;
        b=NVVzoCvK7tW4W0iqLO3s7uc8Mf/czS+Ipe8F1aqxk7jXXcJ7SBRt/OGU9xfhrtRCXv
         aPB6epmYJielpX9Bi+h2wDYL/UlQnJQJisiWRC89iw9A/3Fq3MY1WnOI+SvbUISKc+a3
         hUm4UP49xEIhUAyAQ1FXggui9a84o/kvu0stGiytHGym7gRO9dNEWh3tH3OTb3k1diBf
         +cLyK+kdEbrqnD9gAnx9cLUE1rw8AYyA50X/C0f1SW42A4LIwe72M0+59nxk4fRB87vp
         OxVogXxpNq/74CqBYalixwhBW/8SWqmXXk/SGbYGwlMKw8t43ce7D95jy+Uv//DWUbPW
         w8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uVu0SvdloXokDRTN006ycde9T0CVjOI7b8JYiukwlsM=;
        b=uQRPsJEqGGxgGzN+vfxSwwZoYMZHsSnsP8td78H0dB2cp/BmYNGA2/7F59UueCa/L6
         T/a7AMWYg9yboFStSkOm6lt+MTdkpXhRFJBBcD7wxAikCvMDuHqEg2FPPLf1oXwLXJjc
         phxsozZGv3G4DrpCtpPmSavc0VayFCAie1df68JIezzE23/FYIdr9IDRoyfI1P34cOuS
         8bjKqkBpcTsaq/TRFV9IXpKYt7gsaJ2FALClRXq22AlP00ORq69dQHxuk43sAFC+FvUC
         1olQVNOguPo1YSLDTJ4V0hLLRI5vVP9xsNdfwxcknPoQ/GkE2T387PflWwU12X7K9xVW
         mlHw==
X-Gm-Message-State: ACrzQf046f+Yh/KuskjGi5lHHvS3qaDwyGT6fqy1FnTY4wL01hF3odqT
	foYGGLASmND8jCp1REOG8Y4=
X-Google-Smtp-Source: AMsMyM6Q725JSWV2qqiSDrNxPMcuR7pPZkXxQTyg4CVtFlRiHibRyt/1R6KkgtmR0QnmIzMEp0704w==
X-Received: by 2002:a50:9991:0:b0:458:a612:bf5a with SMTP id m17-20020a509991000000b00458a612bf5amr6286995edb.22.1664701156414;
        Sun, 02 Oct 2022 01:59:16 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a95:e9c7:da34:4bcf:58e7? (p200300c78f3e6a95e9c7da344bcf58e7.dip0.t-ipconnect.de. [2003:c7:8f3e:6a95:e9c7:da34:4bcf:58e7])
        by smtp.gmail.com with ESMTPSA id c24-20020aa7c758000000b00443d657d8a4sm4926486eds.61.2022.10.02.01.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 01:59:16 -0700 (PDT)
Message-ID: <3d4a383b-8029-90e3-867b-c91a19345263@gmail.com>
Date: Sun, 2 Oct 2022 10:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] staging: r8188eu: some cleanups
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221002074827.8566-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221002074827.8566-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/22 09:48, Michael Straube wrote:
> The first patch of this series merges leftover macros in odm_types.h
> into appropriate other headers and removes odm_types.h.
> 
> The other patches convert some functions away from returning _FAIL /
> _SUCCESS.
> 
> Note: Converting _rtw_init_xmit_priv() and _rtw_init_recv_priv() away
> from _FAIL / _SUCCESS is a bit more complicated. I am going to do that
> in follow up patches.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (5):
>    staging: r8188eu: merge odm_types.h into other headers
>    staging: r8188eu: convert rtw_init_evt_priv() to common error logic
>    staging: r8188eu: convert rtw_init_cmd_priv() to common error logic
>    staging: r8188eu: convert rtw_init_mlme_priv() to common error logic
>    staging: r8188eu: convert _rtw_init_sta_priv() to common error logic
> 
>   drivers/staging/r8188eu/core/rtw_cmd.c         | 16 +++++++---------
>   drivers/staging/r8188eu/core/rtw_mlme.c        | 12 ++++--------
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c     |  6 +++---
>   drivers/staging/r8188eu/include/odm.h          |  3 ++-
>   drivers/staging/r8188eu/include/odm_RTL8188E.h |  7 +++++++
>   drivers/staging/r8188eu/include/odm_types.h    | 16 ----------------
>   drivers/staging/r8188eu/include/rtl8188e_hal.h |  1 -
>   drivers/staging/r8188eu/include/rtw_cmd.h      |  4 ++--
>   drivers/staging/r8188eu/include/sta_info.h     |  2 +-
>   drivers/staging/r8188eu/os_dep/os_intfs.c      |  8 ++++----
>   10 files changed, 30 insertions(+), 45 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/include/odm_types.h
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
