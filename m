Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0550241E7
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367138; cv=none; b=mvxrRNwW8EXtV6xf5XRbhJQpg6DjUl/4KW2w1A0ff/q05Rv0OjC7NhJIlLLx4TfEKVElg5cnHccdr0qVJJqlI6dLL1krVIIvsqnhO5b6Tlr9y5N9+R5Dhq9OhR7a/U1JYdlBczE5kyZNG6luVkqE4/w3GR+CYTLk/FRKHPb7GNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367138; c=relaxed/simple;
	bh=E0SuaYLtA/aSqZNydYlvLRqJN9jwV8q94PQoYT6e/xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTvXPxqgFcbhfKZ6O/QjObLglWgqgDki0iV/zD7M4Hw3KB2oGURP4nVyT278DTEhEJLywRBK+SmzW5w2Q45bCrbRhjRvah+kDmvW5JqnNjcKIZiXN6WT6k1ijoYaZAIgT6QQihIXQ1vL3orp/5RkbSG/eqGObJ9ONDyQtgbNZ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXK8k/5M; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXK8k/5M"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a0d75431cbso801213a12.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722367135; x=1722971935; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQldITgIDp59ry7jMJ7TFvd9xpVz+h4DzhwweO4nKZ0=;
        b=RXK8k/5MxAgj+ip05kOirFLJLYTSqpt1ygFV1Lu14bz5iunuuiS+xWChCZdO4u35re
         jWhEAeabL6j1hjQAziaMT94gbWZjRAzx/0/NBv5QXdpAXX5byX8uSW0TaC7z/ZKJxYjv
         AADg73EDOhDWyAOVkoiF/Iw4jzQm29+rNVa9yghPB1H8+mmOJ9xwADqy0M/gv6eN5ui6
         ZNuIWhzZgSdskh6/ABMgMdHvkEpCn0SoYKrfzugMEQj4Q2PgTSW6pgOjzODusl6AC8F9
         clnYReHovbV0ctBRpEijbFpLOk/wuiO3HBs3PbNs6AEcBkUCSGe29VXZCe0wmPyj9X2F
         iEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722367135; x=1722971935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQldITgIDp59ry7jMJ7TFvd9xpVz+h4DzhwweO4nKZ0=;
        b=tBH+ycoa62N6dCrWfDh0NSoMWBb7yloNdBmU3u22mMLo7U656peNWqkc4KLe60+u5+
         C7csufP/PMXs3j15vAJ2UzVy/aDxD+6PAN/5nEE82fS2zJ7JAyxdqUpY4aJGM5QuEib0
         nVrhkK0ZdUJTBrqmMXlBI2PPiqPGopPI8fd73Ce1HXrwrPp2uu285u5ThBZHnq+6D/Pd
         VM1lvDBLCuOZ93qlzUefjWjCHcVs+bWzzm7UO4+DK08fEB6W49N5vSTdD6lj4aDvdrzU
         UxUnGWvvxKymno9OsB6NySx9Vb8BIso2gXb++GmwBXoMK5DZKb7nU3APFW5VgviEML4O
         3lLw==
X-Forwarded-Encrypted: i=1; AJvYcCWg77TRKGSuInkXjsIDsThIlqwoEO/EXXc8us7SDdo0+GMPqgmouyK2McS81bW5QeZIa1XdHdaTGliX2pCO15I3Fn4eCjaggOWm1SA8Xg==
X-Gm-Message-State: AOJu0YxVadBKSLyxVYSVkUcNFUzXfvQPDID8IA2DneJ194Lv5ItAn3eD
	0Z9k34STU5DQtgdBmKRq4vWmOZ9QE8sxlHYaQqeDEyiaNktVyfPpyvEvhw==
X-Google-Smtp-Source: AGHT+IGWgNNtW+prLDC9JVRkdYMVBxEJ39r2H8P+9d6yv3mlDy7GAVWQHt1oIrodLGcQdxNH8Of3aw==
X-Received: by 2002:a05:6402:358b:b0:5a1:a82:1a38 with SMTP id 4fb4d7f45d1cf-5ac2a9a4948mr8033194a12.2.1722367134603;
        Tue, 30 Jul 2024 12:18:54 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8552:f0f5:c00a:214:55c4? (p200300c78f2a8552f0f5c00a021455c4.dip0.t-ipconnect.de. [2003:c7:8f2a:8552:f0f5:c00a:214:55c4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6339bcb3sm7565407a12.5.2024.07.30.12.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 12:18:54 -0700 (PDT)
Message-ID: <800efa55-1765-48ea-8648-f9a6739342b6@gmail.com>
Date: Tue, 30 Jul 2024 21:18:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: rtw_mlme_ext: replace spaces by tabs
To: =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: helen.koike@collabora.com, ~lkcamp/patches@lists.sr.ht
References: <20240730080531.991195-1-santiagorr@riseup.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240730080531.991195-1-santiagorr@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/24 10:05, Santiago Ruano Rincón wrote:
> Fix checkpatch error "ERROR: code indent should use tabs where possible"
> in include/rtw_mlme_ext.h:388.
> 
> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
> 
> ---
> I am (mostly) a newcommer. Could you please tell me if there is anything
> wrong with this patch? Thank you!
> 
> checkpatch reports a warning in line 387:
> "WARNING: line length of 135 exceeds 100 columns"
> Should I fix the warning in the same patch, or should I send a second
> patch to fix it?
> ---
> ---
>   drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> index 5b8574f5a..720aeeb00 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
> @@ -384,8 +384,8 @@ struct mlme_ext_priv {
>   	unsigned char default_supported_mcs_set[16];
>   
>   	struct ss_res		sitesurvey_res;
> -	struct mlme_ext_info mlmext_info;/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
> -                                                     /* for ap mode, network includes ap's cap_info */
> +	struct mlme_ext_info mlmext_info;	/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
> +						/* for ap mode, network includes ap's cap_info */
>   	struct timer_list		survey_timer;
>   	struct timer_list		link_timer;
>   	struct timer_list		sa_query_timer;


Hi Santiago,

it could be two patches or one. You are only allowed to do one thing at 
a time. So it is also a little depending on your description. The way 
you describe this it is more like two patches.
If your description would be like:

Insert line break to comment, that exceeds 100 columns, to improve 
readability.

It would be OK to correct the indent as well.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

In case of questions feel free to contact me directly.

Thanks for your support.

Bye Philipp






