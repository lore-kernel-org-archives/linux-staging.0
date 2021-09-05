Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CAF3FC0
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 21:40:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d6so6199154wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EI/tQ0853DgmlZpgUH6Sb8Mf92xDUUOdSCeoB3y9z5k=;
        b=XqQnR5svqFEfr69eWiEFC9YZH7l61Qz+vrz1V1/rLRWUbJHt1nppEErih7/Ct8P4DD
         ncVamoWfi4yVxVFM7yoiWHyp5c5fjc/mdGWmjvFcprreKSKhqSOFXWJccBeMJLQsol4r
         SP27LCoos1KmpINQTHqrvwHfGrc9KaFuRdhFMHmHhleEdZdjBwU8VtM9r0068hiavn7y
         x0pM7Xp1paK5Zs+AbUNHhieubdThc2wpLntFWDLlVRhdv4Jyf7UiODnuTlpSiEvsMAiJ
         Ve1N7hXnUI5cijwu9/PLLtIBH8ZwCSMLLnc/2I7M+YBj9wPToFTmXz0IZgGKZCVax0IC
         PsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EI/tQ0853DgmlZpgUH6Sb8Mf92xDUUOdSCeoB3y9z5k=;
        b=f/9UBJotkLeP/d11e0THdPaizdsG7dZJHIJ8SdlOnlAGIgfSoXHxHzFsO3ElDoe28/
         9qh3qOewassbOXWxpoHPNE2dEyEasbw2pkNph4uASGBQMRP1ZWjjbppG87QH50bpECdC
         zixnceBK3ToIrISJFvefxV11bIg44OWH82re+h4/54zMQiRSdK8cdQRfVLCc37a7y2i/
         QiPusTE7gAEowGcuJJCr94N8oO6bjEUKwJm92Xx2yZyineE3+uDuy+6ihzMxR6CmhLvN
         E26KNPjw3T8QXiluIAr4C404TRPZ4hchILHu6xjM4tU7R5TlYab4bQbMt1ezgmaojtNU
         jhXQ==
X-Gm-Message-State: AOAM532wUuOfX5I+F+59tTcor33N8rn6Wf4UjSQ5mtU4osjR329Rk9GS
	Z8MDTCUbsX9QdGFf9YK+muM=
X-Google-Smtp-Source: ABdhPJxhzS7wcIoJV53OmR17rs/Sqs/epck5DWXDarSnkVXm8JvPqvAcOuQLKqLv2ELrPkgSzr/MWw==
X-Received: by 2002:adf:e788:: with SMTP id n8mr9755988wrm.214.1630878038888;
        Sun, 05 Sep 2021 14:40:38 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::8fe1? ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with UTF8SMTPSA id l21sm5390410wmh.31.2021.09.05.14.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 14:40:38 -0700 (PDT)
Message-ID: <94b3634f-f531-d4f1-2809-dc4de5b9b876@gmail.com>
Date: Sun, 5 Sep 2021 23:40:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: fix type mismacth
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210905205216.24831-1-paskripkin@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210905205216.24831-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pavel,

On 9/5/21 22:52, Pavel Skripkin wrote:
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index fee4208dacba..afe6c7fa594d 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1162,7 +1162,7 @@ u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr)
>   		goto exit;
>   	}
>   
> -	psetassocsta_rsp = kzalloc(sizeof(struct set_assocsta_rsp), GFP_ATOMIC);
> +	psetassocsta_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_ATOMIC);

this should be

psetassocsta_rsp = kzalloc(sizeof(*psetassocsta_rsp), GFP_ATOMIC);


This way you get always the correct size, no matter what's the type of
psetassocsta_rsp. Checkpatch suggests this too. ;)

Best regards,
Michael
