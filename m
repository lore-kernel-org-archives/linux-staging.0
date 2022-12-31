Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0BB2564
	for <linux-staging@lists.linux.dev>; Sat, 31 Dec 2022 09:47:48 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z11so17587846ede.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Dec 2022 01:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plEdaQxR9/jUxUlAIgvL39mp2hZz/cwgZyXALQHHQ4Q=;
        b=McFa2D7g/fz/V8mvgrBMrQQt0pMv0nbHvzqhdcZmeOSAVtkunCDk5uWB7+tKAC9M1r
         Wu6p7A7/91AUV4HGWIfcpsF2egBeieXLe8spBNywCmNhYDKVL+AYv/dsQ6FvC87AY6Qb
         m41vUB8PGtLSdzcqoG/qSD3Z/mH4nyf+6+fHC6QTyDeKjGI+qYsMNQroUm/KROpgelBx
         8fLBxwSCY7/hSP5mFsN6p+fJqKrOCLw7+5FBd4Fy4DpCF0SuIIZFAuFM0iTSmQW7biCT
         xZDevV/dT+N65UWNlUjszNzdK5jg6wKB6t474i+tLkrO4l70QAhbXJEDPNMSz2HhO82z
         G4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plEdaQxR9/jUxUlAIgvL39mp2hZz/cwgZyXALQHHQ4Q=;
        b=ircDeczVp07w9IzRTWxTiXxxL9hO5pG4oJeraFMfzm7+So3MGvSfFiAm32pwAqbUI5
         0AF4g4Ap4hJDenlP5WGdiSlUdeZgGNg0aL8Pn08+cn9GiqyE3uOo7tfqq2WzxfeSo55y
         +o9rJankyqfEzS2IV2vizNldF4Zi3ukonIY23j+oxkC/kggJiB4L6JXGD1mISjeoA1e3
         ZUkY1z9ThyKOD63LdtBr7pjJHkNdAjtgaBkYEFxhEXn/IG1sOOrc0iF4Ek7Zi+55wQqz
         jOpjJG/VLCHKMky6zOtWZ6M148TiCvxrn/qbBIF9aTrbunVZj+FwImojLnk56KW8sOQ0
         VwEQ==
X-Gm-Message-State: AFqh2kqX2qUew9+1r/zduFzJxopl4NDk5RtB16wnrHuY7K0WAPuUJBZd
	+UzH5vFoLNE1NPF0Cru7FMQ=
X-Google-Smtp-Source: AMrXdXvfNJ1lzNauSvA/MLbOCVr94kRClNUX0OvfkORekBYxaPyzqq5k6Jo2KOHWzo5SGFC67lVc6g==
X-Received: by 2002:a50:85c6:0:b0:46f:e329:8dac with SMTP id q6-20020a5085c6000000b0046fe3298dacmr6950762edh.0.1672480066834;
        Sat, 31 Dec 2022 01:47:46 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id s22-20020aa7cb16000000b00457b5ba968csm10212949edt.27.2022.12.31.01.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 01:47:46 -0800 (PST)
Message-ID: <472dc3a0-d6a8-a084-620a-e63c99182f64@gmail.com>
Date: Sat, 31 Dec 2022 10:47:44 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] staging: r8188eu: merge public action functions
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221230175326.90617-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221230175326.90617-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/22 18:53, Martin Kaiser wrote:
> Merge the small helper functions that handle public action frames.
> 
> Martin Kaiser (4):
>    staging: r8188eu: merge on_action_public_vendor into its caller
>    staging: r8188eu: merge on_action_public_default into its only caller
>    staging: r8188eu: remove intermediate pframe pointer
>    staging: r8188eu: remove intermediate token variable
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 31 +++++----------------
>   1 file changed, 7 insertions(+), 24 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
