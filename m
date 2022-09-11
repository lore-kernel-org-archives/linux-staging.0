Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F17F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 00:48:45 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id r17so12469026ejy.9
        for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 17:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9edV5rmSSmQGfryMF8ZLiaiKUCdN0PMDm3CEK4ihJ9s=;
        b=gywwlPiIG5LPRnzM47WAaJ9kupy1tv2SXfZzAgtHJHfBgv8tB0gi7/OKn+zEcUSSja
         aSaNfHiYiV7bhSz07/Qm4Jl/CCG/Tmmtd34XBMWPHS1xzXV3/NyvToXKTKfYl1S+KtyE
         FF4vmIKFrksSuyLuFZSLlOt+xQgNVGc4eG4KE0htAD0jYHjflOhfGsKfwDkL6QzGJTWe
         8BxifUWyPaOEs+Z01NUoM2lOuuX2naxPE+muUIxQypWe/A/cHrmQcuPRAg6Rmg7wmY7q
         O8rHgFdxqMWApmEgRGtkBrpgsRsdnzavUbz+9hcZ6zU3qPJKPuhozvNCIH3IQCSKWRB2
         mfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9edV5rmSSmQGfryMF8ZLiaiKUCdN0PMDm3CEK4ihJ9s=;
        b=Dgn+I/8O+9MGQw8DBujVsPejVkmphkHMKfXaDpJ32GhX5V5GB4ieDSQ0DHeaPSOcqr
         AgBal8TCP2CDs/sOkU/QzD8JpgaAYTv5AkXioUNcxaxSY+NfoWk6t3G9bfXKs6dAWrHY
         6OTpJY5WyfOvh93PyTWib9p4t74IC5C6hRPJy7XBUo7laHpzcdId+gPjwLNLtox+7n9g
         XgJHyk+y6eRtKcS4ln6233IFxRXuf1qYWXZn21nZn5MIFnl1kwItvkReAblEvg7naJYm
         Dmo87GRJ1gcf7HXJ5z7soJ5ITWqY9Y0XF/DXOtUdp5DoBuXYr9ZsoDfcXNnaM9iuaWau
         RvOQ==
X-Gm-Message-State: ACgBeo0VztIzcKy8ef4BQ3Isa+Gq8X/h3aBx93I82KSNQzfL/Mg8sPyy
	sEX0APHLGoZGlx00SJcf5R2p00sJ0Uw=
X-Google-Smtp-Source: AA6agR6yp4ZaDiCMbxkMg5jcgXlBBsyqAhSX/EAQ3Ry+Z4lx/0MCr1hiehIzOkmVcgqKohxiIPnr2Q==
X-Received: by 2002:a17:907:9495:b0:734:e049:3d15 with SMTP id dm21-20020a170907949500b00734e0493d15mr14857226ejc.187.1662857324079;
        Sat, 10 Sep 2022 17:48:44 -0700 (PDT)
Received: from [192.168.1.101] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id x17-20020a1709065ad100b0073d87068042sm2316664ejs.110.2022.09.10.17.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 17:48:43 -0700 (PDT)
Message-ID: <227276e2-1bad-a342-eea4-c3672e50d275@gmail.com>
Date: Sun, 11 Sep 2022 02:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] staging: r8188eu: remove empty rtw_*scan* macros
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220910180236.489808-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220910180236.489808-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/22 20:02, Martin Kaiser wrote:
> Remove four rtw_*scan* macros which are empty or constant.
> 
> Martin Kaiser (4):
>    staging: r8188eu: remove empty rtw_set_scan_deny macro
>    staging: r8188eu: remove rtw_set_scan_deny_timer_hdl
>    staging: r8188eu: remove rtw_clear_scan_deny
>    staging: r8188eu: rtw_is_scan_deny is always false
> 
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c | 5 -----
>   drivers/staging/r8188eu/core/rtw_mlme.c      | 5 -----
>   drivers/staging/r8188eu/core/rtw_xmit.c      | 3 ---
>   drivers/staging/r8188eu/include/rtw_mlme.h   | 4 ----
>   4 files changed, 17 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
