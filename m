Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB205395
	for <linux-staging@lists.linux.dev>; Fri, 21 Jul 2023 04:57:58 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1b078b34df5so1182025fac.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Jul 2023 21:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689915478; x=1690520278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AOBpOFQg7H8OmzeSZEq7C/fef9nFDQns99xX1xv55pY=;
        b=gaslqA27pde+cmPIFUN2hwFTdXfob3qXha5KVBiAF+KxT431LSPV8eKDCiOTnUlT+N
         6WKBmgKA1MwskieP/J31ZlIQVoHB7mO3LgCIvdYVtKtXQiWrMTRnFlrQLV8jBQqogY31
         ilz1IjFHBsVme28z1ctrOdawiuouGjGDdL9z+6ToydEQS487YsvORM1CXJBv+BPGb7Tb
         H3z7K2IseEm4BkEsD4TNC+/AoHEA41W5z0bfpIg/Zby3ETNnFzAdstkIx762NzJCnpQ4
         10GeIb4F6jqUNtugWDQdGVy8SvS+HhTmOI+9GqgS4EerxSUjong9tl7V7cdMN3rg1ClF
         dAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689915478; x=1690520278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOBpOFQg7H8OmzeSZEq7C/fef9nFDQns99xX1xv55pY=;
        b=aX/Dj+SNlLvz7e3cw2//SN2RskhSNohYTVQfqfDKX2t0oxNHVFIHhOpuzQ+TGjeyC2
         JWP91ayh2bWpo98Rqkje27U/d+GHnGe4SHEL1cEopAMcTdZKGI4ccXmWAYK/uUOOwQ1z
         CgFJM7kipKC/D6303ZiZSOELi1NFeme444bnjSQgaxscOKZ0C1EAirvChQoWef8wZx2G
         aGbjHkush/8XIZY3mIP0KAQEaFO9n/DIRScKv969AvQ0CCFNikZIavKNX3LwkyzHhr3+
         ruJ1JqBLkBnGBv48qSyzuHfnV84kKlCqioODSeQ6FMv9hYIcd9xCcDC0ZL23q5JOzJGE
         aNKA==
X-Gm-Message-State: ABy/qLbdfhIuMYa8aZx/GqHTjV49cLjSztW63yHphlAjO46OLYVn0JTG
	cwCiuStfHmf+BSA0f09oJZ8=
X-Google-Smtp-Source: APBJJlFNUy5GtZES0EZJuyzMuRJyJBYXWs8yhrwUjL1SajpSM1AV+nrN4o2ri93pS0YcOv2ln1ASSQ==
X-Received: by 2002:a05:6870:d61e:b0:1b0:db2:189e with SMTP id a30-20020a056870d61e00b001b00db2189emr1059989oaq.17.1689915477756;
        Thu, 20 Jul 2023 21:57:57 -0700 (PDT)
Received: from [192.168.1.119] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id d42-20020a056870d2aa00b001b390c6e00bsm1196563oae.56.2023.07.20.21.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 21:57:57 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <7931bb57-10d1-61cd-4149-bb133e843a15@lwfinger.net>
Date: Thu, 20 Jul 2023 23:57:56 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: rtl8712: Remove redundant braces in if
 statements
To: Sergey Rozhnov <rozhnov.sergey.89@gmail.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZLnoBYlsTiLixTah@terra>
Content-Language: en-US
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <ZLnoBYlsTiLixTah@terra>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/23 21:05, Sergey Rozhnov wrote:
> Extract masked value to improve readability, apply fix suggested by checkpatch.
> ---
>   drivers/staging/rtl8712/ieee80211.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
> index 7d8f1a29d18a..fe53453ab9a7 100644
> --- a/drivers/staging/rtl8712/ieee80211.c
> +++ b/drivers/staging/rtl8712/ieee80211.c
> @@ -63,8 +63,9 @@ uint r8712_is_cckrates_included(u8 *rate)
>   	u32 i = 0;
>   
>   	while (rate[i] != 0) {
> -		if ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
> -		    (((rate[i]) & 0x7f) == 11) || (((rate[i]) & 0x7f) == 22))
> +		u8 val = rate[i] & 0x7f;
> +
> +		if (val == 2 || val == 4 || val == 11 || val == 22)
>   			return true;
>   		i++;
>   	}

The value of such a patch is marginal. The compiler will optimize it and only 
calculate the value of rate[i] & 0x7f once, and keep it in a register, which is 
likely what happens with your change as val will never be used again. Checkpatch 
is only suggestive and can be ignored.

You have no signed-off-by tag. As such, this patch could never be applied as it 
has no one vouching that they are the author. Please read and follow the 
instructions for submitting patches.

Larry

