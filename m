Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04972
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 08:42:22 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so2444647wmh.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qucvdp5Gyww15sMosC3nYP8B70DNCNLtvx4YiBDHnTg=;
        b=tvxGmn2Cm9RpNqy9ty1Lfo4RxBHbj1e3B3A+aOVoegb0lHpGBBo7WRAPJgaLFSD5Kd
         fmksHpldW28Kl7bRBtfoanmMINzOi8wVRfzu2TnQTpdw/JpaxDpekPwlbIOFatviuC8s
         OjTGOtzPEF1GjqAv1iYMa/9e7giTuCbbfxNXOFRoCQ+2tGDOrAFOsMkbT8ovVXt6WMuy
         ZXbiyDpGPvndkW9oKYHdI80KbeJUeTnSQSGkuULhv4xQAoERD3Hv8hdKKtiMIvgS6FPx
         CmrgIN0aSPd/AsMAYRZ3hJ3VicuCuYlqNF7bNCnCW6SRODx7Lrr7Jhaq0Pc2mNrekbei
         PgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qucvdp5Gyww15sMosC3nYP8B70DNCNLtvx4YiBDHnTg=;
        b=N2ssP3F+uJxz+FpiyRfklaCwHTKqB7VA/CDE86wSUDytnmvmpwovsNrResWK5lHGiX
         tHbdDu0hFRAmSmQUXkpin2NiWlbWAayDeRPaanLkQm/Wxc9kRP0e0vnofvpwhdh2nW5J
         2TAQ1I6wxAGcbCtrf3ZU7HXhBCre1CKmUH2TwZ2gidrPHB9wp3dwIfgtbWNzlj3ZuZ2I
         afcR9vMwNEv4cvdGfmP7Tr26p265li80Ok4eeTBHRLRUjQ5buomijsup0FB3z+VRIaLA
         KfoWTei+ZSVlVozLkKiuYfDlHeKPFWusTE2eO0Iu+MHUKDbAiLa13hK3kJ2WmCszjpRW
         cldw==
X-Gm-Message-State: AOAM531FRJXA50c+QehpXJcQJK7cZ2KNo7EYhP4um2g8/YghWfmBHEnv
	kq63qRTD108faMVg/EvfpD4z5D5EhVk=
X-Google-Smtp-Source: ABdhPJx65d+HnQI7DSBGIWmbqq6fqsZ+3uUqb2H8wgHO7lQHGe93ndzFg5vYs6i+8LtdTtm667a+eg==
X-Received: by 2002:a05:600c:414f:: with SMTP id h15mr7553831wmm.66.1629535341275;
        Sat, 21 Aug 2021 01:42:21 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2744? ([2a02:8108:96c0:3b88::2744])
        by smtp.gmail.com with ESMTPSA id d8sm8219600wrx.12.2021.08.21.01.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 01:42:20 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: Fix a resource leak in
 update_bcn_wps_ie
To: Xiangyang Zhang <xyz.sun.ok@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210821081824.14745-1-xyz.sun.ok@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <f10217f8-d93d-1a9c-9746-6788cc1b8026@gmail.com>
Date: Sat, 21 Aug 2021 10:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821081824.14745-1-xyz.sun.ok@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 10:18 AM, Xiangyang Zhang wrote:
> The "pbackup_remainder_ie" variable is not freed when "pwps_ie_src" is null
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Xiangyang Zhang <xyz.sun.ok@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_ap.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
> index 1127e9a52458..2ce982390c7b 100644
> --- a/drivers/staging/r8188eu/core/rtw_ap.c
> +++ b/drivers/staging/r8188eu/core/rtw_ap.c
> @@ -1300,7 +1300,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
>   
>   	pwps_ie_src = pmlmepriv->wps_beacon_ie;
>   	if (!pwps_ie_src)
> -		return;
> +		goto exit;
>   
>   	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
>   	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
> @@ -1314,6 +1314,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
>   		pnetwork->IELength = wps_offset + (wps_ielen + 2) + remainder_ielen;
>   	}
>   
> +exit:
>   	kfree(pbackup_remainder_ie);
>   }
>   
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>


Thanks,

Michael
