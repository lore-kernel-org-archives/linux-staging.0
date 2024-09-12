Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E915D1
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171315; cv=none; b=W7ATZHr1gTksCmyL21MjIisrQeBk6uOn18uShkIm8r8an/zyQk+SGjSjEvy5qGisa9msnq9hQ4HzVHNdqZV89/UiqOHzG6J+CbWU9vXfqfAgRR7SP8HeyNGpeVNFM5zb1vXbGYOz/Ghz9UwofH21yDgLJ2VWmO66E2wB4qsGFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171315; c=relaxed/simple;
	bh=Ey2P+BxTqsyXNaWPXh5IJdJm4Mnu9yH8zF90c2nP8SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKq/oaXoZs2UqUJi5jgqKA9dp7PT/7OZ4jovTHtAXCwHpNEbIQer8u0TWRe0OwGhgstHSAhE72dQVlefHu+tlY7T5UbX6Glt5w5/uafzF+kjFxNxJjV5hxkAeEvCjKA2aezB0mUJBSfv8zZEr+R2R0oRYnY3u7N30XpKXw+HS3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeNqtXSl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeNqtXSl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c3d2f9f896so203825a12.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726171312; x=1726776112; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAf/DfuxZvgtYHDE/S0MWY4m5gBjmAwHzwNyNROY3Ik=;
        b=ZeNqtXSlUgUxW/Roih4IJgFTietdmtgKYukrEd45O74x03lWBRvJQLdEA50P60HGOe
         4nGNwvqGXBBAKVZxbJnsl43IWCDcrCUGK1tJD7EJeapWBtYA1r+FQHidAGUEIUWi6jXc
         HclE/UnyGKBdOFQyoKsIXYt8CXYS9385y1RSfIg/8K5fSWndV8wUJfTLag5xOLE2W8Pf
         hy1/tbRr4luMw1pv+T+/tC0kP765QtdauelT7FbaVGVuqGS4C6cWyxhDMAzjDblvyyQl
         LcWcMVK4X7Vyw1FgQ1jkzatM9pK2YHoXDxr2YM3RQiwaC4u9VRtj1adCQ+e9wmZWJlIz
         HY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726171312; x=1726776112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAf/DfuxZvgtYHDE/S0MWY4m5gBjmAwHzwNyNROY3Ik=;
        b=UiaKt4Us2jl+J+hNYrnO/iwTr7WmDZ2zU6/YhVgqK34FfuYpgIivEjj1HSuoqXW5Px
         PH24ds1tWhYKonLlHowEXnUK7tEN/SJkq1klTvVaVlnmTdFiJMwG935HfjndsFI7y0N+
         UBshUbjxhLnxfBYiSbfVhdz3csV3hLqb4y+orG3km78KwroQst8vvfaYuD1c0ptdQEfD
         RORc/3jkV2tSt0PUjPtlHeHoEzrSmC0mejKxbACqiRaPe2WKK5UC3al/tkf4/yikkBUg
         JuELKIvXM3KUc01El6lDZunUwt5zwbWhVt9W7yHOQ9GP2ib90Fdh1VZ93PGtgfadYMXT
         Z12g==
X-Forwarded-Encrypted: i=1; AJvYcCWGGhFPIsirR1C/dfnnUG2zcBo93wH9ZEF3/v8VgdxI8OKeASRxXqML1YSWQEGgALo3ByJ8BR+TAE0+eqWU@lists.linux.dev
X-Gm-Message-State: AOJu0YxzO+HwpLTVkJwVjLTQ78dqCVbHpa4aaD+5U5JYzN5CIBotASXl
	/c7ZLqnD9hWHAndzk3ggvizC5W3qLb/PJfZmmxo7NL79YSUMYr4mFLfSKMI9
X-Google-Smtp-Source: AGHT+IHTiNZeTK4Zp3JYzocD8ZX2cdqwHwAHdVlMn32NxqMq0mvcFow9h610BLE4NIGxBizZrMNMiA==
X-Received: by 2002:a05:6402:2114:b0:5c3:cc6d:19cb with SMTP id 4fb4d7f45d1cf-5c41e1ac9bcmr327377a12.24.1726171312318;
        Thu, 12 Sep 2024 13:01:52 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8557:476b:8cfa:99ee:514e? (p200300c78f2a8557476b8cfa99ee514e.dip0.t-ipconnect.de. [2003:c7:8f2a:8557:476b:8cfa:99ee:514e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5212asm6913821a12.57.2024.09.12.13.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 13:01:51 -0700 (PDT)
Message-ID: <974c3e9a-c0f6-493a-a865-4f01f41c4087@gmail.com>
Date: Thu, 12 Sep 2024 22:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] staging: rtl8723bs: Fix coding style
 incosistencies in rtw_security.h
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, guilherme@puida.xyz,
 linux-kernel@vger.kernel.org
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 06:04, Sayyad Abid wrote:
> This patch series improves code readability by addressing coding style
> issues in `rtw_security.h`. These changes aim to enhance the
> maintainability and clarity of the codebase by ensuring compliance with
> the Linux kernel's coding standards.
> 
> The coding style violations were identified using
> `scripts/checkpatch.pl` on `rtw_security.h`.
> 
> ### Changes in v2:
> - Split the original patch into a series of 8 smaller patches, each
>    addressing a distinct coding style issue as suggested by Greg's bot.
> - Fixed indentation issues, placement of braces, and removal of spaces
>    before tabs.
> - Improved commit messages with detailed explanations for each change.
> 
> For reference, here is the `v1` submission:
> https://lore.kernel.org/all/20240911133549.2664372-1-sayyad.abid16@gmail.com/
> 
> 
> Sayyad Abid (8):
>    staging: rtl8723bs: include: Fix open brace position in rtw_security.h
>    staging: rtl8723bs: include: Fix indent for switch case in
>      rtw_security.h
>    staging: rtl8723bs: include: Fix indent for switch block in
>      rtw_security.h
>    staging: rtl8723bs: include: Fix use of tabs for indent in
>      rtw_security.h
>    staging: rtl8723bs: include: Fix indent for struct _byte_ in
>      rtw_security.h
>    staging: rtl8723bs: include: Fix indent for else block struct in
>      rtw_security.h
>    staging: rtl8723bs: include: Fix trailing */ position in
>      rtw_security.h
>    staging: rtl8723bs: include: Remove spaces before tabs in
>      rtw_security.h
> 
>   .../staging/rtl8723bs/include/rtw_security.h  | 124 +++++++++---------
>   1 file changed, 62 insertions(+), 62 deletions(-)
> 
> --
> 2.39.2
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
