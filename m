Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F672
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 15:52:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id y132so2135474wmc.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q2NxKj9XsOje8Q6zNEUbuoFayLJ20hHyWL0fAt8sMJU=;
        b=Qh+NQNmAcfBOWuxB3Pn82d8ejOQIbMwzFJWuhSOABRoeq27XjvCSXo1UFD64EOa1Yv
         Eu7eCyUrbWq+0t9TqSqncNBJoSzMah3ZNef/pitdDZn9QFiAoP4oolVmitSrHg+KPU+m
         xZqAD3lXOhSimHig7kDJk6RUmdCqRxve6dvkj7OB+oPieipwKKjM1yHdi+T4gWDBLMpp
         i6X7xH92/blCpFypV/rDcjNOmP8Dn89/fdSSfYKV80atBWHIVHIPQsJOLPhd/c1dKJC6
         a7/5T1SyRG5XbgsX1rNozoMtf0OWYbe1srmn8zcR1TV54xUQzPlxIBV7pz9u7x9X9xks
         7sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q2NxKj9XsOje8Q6zNEUbuoFayLJ20hHyWL0fAt8sMJU=;
        b=Bw7HoKQyUgH/sdYoCzSWzcQVf2nd1L6uCbuQChI1n1ESetR5iI0mnBw2kAau1axUKE
         eXMpDoQFgQW5FqA17l6l9WmepA4vq39UrWCil2d7qEerhzlmnqgPzopWTtK+FfmOZfoQ
         m+5WOszu29GPMYCXCldL5Zd2H/s63vtxrK/V7ng3faa4gGU3eYjntyjNi09j/9gvtpy9
         rphzWQzBT6aruj5xee2ytlOEIgv/3N1zvkYgeQF2nDjkH20/VYkY4bbW38WG+aNqAtJS
         /5lUWrsGIaEGpr9e4kW1EcPAQvrab1hD5KjQsUIqD6iWXULe1gA7SDMRYE40HcRpkhdt
         KI6A==
X-Gm-Message-State: AOAM533PiAaYi/X2i3rtKquWpKyXmxMuAnxzUKKmN5WO+uV9V9jEyU7Z
	LFlu8EwbfGu5zcYEHI4GeRU=
X-Google-Smtp-Source: ABdhPJy/XGG+tmdIKXbx/8neDMGxDPTU67R4IK8lls44LWz2umk+cir8dSMzziddtwPcWu7pzwcArA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr4282393wmr.168.1631116358346;
        Wed, 08 Sep 2021 08:52:38 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::dc38? ([2a02:8108:96c0:3b88::dc38])
        by smtp.gmail.com with ESMTPSA id g3sm2643531wrh.94.2021.09.08.08.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 08:52:37 -0700 (PDT)
Message-ID: <cfdf62cb-336c-5822-39ce-0ebc09f64ef8@gmail.com>
Date: Wed, 8 Sep 2021 17:52:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 0/3] three simple cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210908085747.32254-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210908085747.32254-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/21 10:57, Martin Kaiser wrote:
> Remove unused definitions and a pointless loop.
> 
> Martin Kaiser (3):
>    staging: r8188eu: remove unused function prototype
>    staging: r8188eu: remove unused define
>    staging: r8188eu: this endless loop is executed only once
> 
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  | 34 ++++++++-----------
>   drivers/staging/r8188eu/include/rtw_io.h      |  2 --
>   .../staging/r8188eu/os_dep/osdep_service.c    |  2 --
>   3 files changed, 15 insertions(+), 23 deletions(-)
> 

Builds and looks good to me.

For all 3 patches

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael

