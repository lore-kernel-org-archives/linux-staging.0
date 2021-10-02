Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B03FDE
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 15:38:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b136-20020a1c808e000000b0030d60716239so121126wmd.4
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N1Aj2OywXyCVGc5VDMRLgqzC/RqrKIKrJwr01hz70jc=;
        b=LIwOO/8oWlry6PTKkW5wAdU92GqbhhbTwgMbHrk/qWtIlWVCjW3qKQDPG7sQkCJkRd
         FVzLlEtBM+Odabu0WHFiOJJC4S3p32k7z2w9uPJ0ijxjRYmWZyND8PG95sWehpnjZSCJ
         ZKqidXLFgKNjkBiYMpU+KRWH+x3SXQdJv9uoMIdFS4fK8TE8lncHkwJejEpq8bnukelw
         AUK1i6fAwPlxeQ0/8Ukaxea7RkW1YALXado4U55oMNiFmQY6bjSw/DRuV/gjk6Zi5Gba
         ty7O7+4+BsZDPGH3aGoGLK92ht/Ec//RD223T5BI+qaIkOy5fZ862QgFc8B7DQpH+9M8
         rJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N1Aj2OywXyCVGc5VDMRLgqzC/RqrKIKrJwr01hz70jc=;
        b=GKK/DlxiIGvegEEFsBK/upWTuj7ldGelG5o9WV3Z3RbDeaFZYH41HPOjRdG5qxRv22
         vHBWnyzZdo7AdX5q0UO9DSSAGpxbksoUXZIO4ZwZkyLmCPLAFa3Tcwi9nKKfjVyNgPdA
         tjVEtCBGDRRwRodGapKtubsAV+0nq3DzkR3X4Wa5Q+Sw3weszf3IwIAbnVsd7nIOGBUl
         gJrmxGIgNh5ZUWzdRTM5zKc3bI8Dbwuz5KlaY88Grlxbq7Dl+yXLEcfQ6EpEAaLO08LO
         sWVh0WcDG/52W6nxFIfi3VRTWotkClYW83O87Msd8X7vY3S9zirBFuxK6LjB+fKJQWWb
         mrzQ==
X-Gm-Message-State: AOAM531B1p1Mm/iGZVm20uZ+9RQ6M66/hJUNHYmMxwUoql+nknmKj1kr
	o72Ng9Lu58KkedphCkQaF6U=
X-Google-Smtp-Source: ABdhPJz+2ZTuQKZwiRnzGr1fWSdkcOAh1MpGBxpj/UNMTIpngjic660VZAqVdn3NUifKHk+YJp63gA==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id o19mr10135726wmq.134.1633189114500;
        Sat, 02 Oct 2021 08:38:34 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::5d0b? ([2a02:8108:96c0:3b88::5d0b])
        by smtp.gmail.com with ESMTPSA id j11sm4897347wru.11.2021.10.02.08.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 08:38:34 -0700 (PDT)
Message-ID: <59ac1835-2afd-cd7a-d073-5c5d2bb02805@gmail.com>
Date: Sat, 2 Oct 2021 17:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] staging: r8188eu: core: remove unused variable pAdapter
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YVh3MP/JrUwkKr3Y@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YVh3MP/JrUwkKr3Y@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for you patch Saurav, just some minor style issue.

On 10/2/21 17:13, Saurav Girepunje wrote:
> Remove unused variable pAdapter in Efuse_Read1ByteFromFakeContent.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_efuse.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
> index 801887f497cf..d33a5b3b4088 100644
> --- a/drivers/staging/r8188eu/core/rtw_efuse.c
> +++ b/drivers/staging/r8188eu/core/rtw_efuse.c
> @@ -28,8 +28,7 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
>   #define REG_EFUSE_CTRL		0x0030
>   #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
> 
> -static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
> -					   u16 Offset,
> +static bool Efuse_Read1ByteFromFakeContent(u16 Offset,
>   					   u8 *Value)

There is no need for a line break here.                 ^

Other than that looks good to me.

Thanks,
Michael
