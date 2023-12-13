Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29D53E10
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTKtIPmV"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1c6dad2dd0so229098466b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702495367; x=1703100167; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkEUH41nE0miyMOhxtL4U6jrUAw9ffApP2YF4fuAh1E=;
        b=mTKtIPmV8qPcOVDImIGyQgV9WGuQeyGCWVYhmgkYWhGLtlZgN/C65fIr+0O46+kyjR
         pydnopIkeJlm9/vnuOb1lHR1ZTWVVpSakYW/B/sj5cVNu1A9ERFh8kuBhxArj6s2VGGx
         eCxXpyrHQFiaEJ7aJGhf5C79ZSsBm5IdhXph3VspQq2Pldq02payVXitejfbLWzO/+e+
         LfYjuGq5ri3sT+Ylqp+oTHxuiGBa1aeu5nW3mnKMV4OqYRweUKhcMSeozYHh20rquLyj
         GvJnpKH8WTt7r8uynVf7gaGclLjEz/jyYesKQ5BH5qgic/MR7UPz8TLaLii3g+7hQxfc
         yo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702495367; x=1703100167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkEUH41nE0miyMOhxtL4U6jrUAw9ffApP2YF4fuAh1E=;
        b=NphLjQ+Or51RjVWqg02UMs8nyIlgpFE5CeAXYPEOzQwLnkNzqJ7z69N6nylCjks8xK
         O4VysPdyqPa1GqR2KK8M73XquCSvt8G4N+UhAfEObRzMpGf3Mx9SHcJ6UnJlMBdFcsLl
         IOOzDL6f37JMvO95cgRrRHFSdgHApr4NLPGba4Ku0VbRePbH8GAbY+xHTWPsKXdjPrp2
         kr43DhYfiQHW2JSJyOIG8FyWYc4PW4waO/WneU7u5JWoKgTXyqwK1uXFlgRwNvjDJeLx
         Vp7Eg+ecIYrxPA2jJgPB8/ktipPRydo5atQiUp4d+JvcoomnpDZAahMUeYuMny/Uav84
         f8Tg==
X-Gm-Message-State: AOJu0YzLREVRIPKcxm0p0LE2fWCBBsURr3vHWR0ANSZIz7P//v3OIvQG
	fd8EdSKo9stozJgDzlFSyPGy/0QjDGc=
X-Google-Smtp-Source: AGHT+IE3ImK1TElUvL5+Q08Sy19tJXZdek724Pw4J1SWn/uFhRDdo64e3a6OmvNh/iqh6O2j37b6ag==
X-Received: by 2002:a17:907:1602:b0:a1e:75f2:a2f3 with SMTP id cw2-20020a170907160200b00a1e75f2a2f3mr9199485ejd.4.1702495366523;
        Wed, 13 Dec 2023 11:22:46 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id tr6-20020a170907c58600b00a1b7747e3c0sm8234459ejc.151.2023.12.13.11.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 11:22:46 -0800 (PST)
Message-ID: <66abc945-e539-4152-9044-2931934fb0fc@gmail.com>
Date: Wed, 13 Dec 2023 20:22:45 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] staging: rtl8192e: rename variable
 HTGetHighestMCSRate
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231213175459.5425-1-garyrookard@fastmail.org>
 <20231213175459.5425-2-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231213175459.5425-2-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/23 18:54, Gary Rookard wrote:
> oding style issue, checkpatch Avoid CamelCase,
> rename it. HTGetHighestMCSRate -> ht_get_highest_mcs_rate
> 
> Signed-off-by: Gary Rookard<garyrookard@fastmail.org>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>   drivers/staging/rtl8192e/rtllib_wx.c      | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 25097f1935a5..06542ac851fc 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -377,7 +377,7 @@ static u8 ht_pick_mcs_rate(struct rtllib_device *ieee, u8 *pOperateMCS)
>   	return true;
>   }
>   
> -u8 HTGetHighestMCSRate(struct rtllib_device *ieee, u8 *pMCSRateSet,
> +u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
>   		       u8 *pMCSFilter)
>   {
>   	u8		i, j;
> @@ -545,7 +545,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
>   		pMcsFilter = MCS_FILTER_1SS;
>   	else
>   		pMcsFilter = MCS_FILTER_ALL;


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ cat 
~/Downloads/20231213-\[PATCH\ 1* | git am
Applying: staging: rtl8192e: rename variable HTGetHighestMCSRate
error: patch failed: drivers/staging/rtl8192e/rtl819x_HTProc.c:545
error: drivers/staging/rtl8192e/rtl819x_HTProc.c: patch does not apply
Patch failed at 0001 staging: rtl8192e: rename variable HTGetHighestMCSRate
hint: Use 'git am --show-current-patch=diff' to see the failed patch

