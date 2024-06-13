Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC52F34
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 19:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718305529; cv=none; b=uAuyFyrO4ImKQHam9T2Cd58Gx8h3GwOce9X+PBkGT93/CJ1yjRL6HBPGmGeYIgLRATH84FvoL6a5LMfb/iKVjbJb72g/3/zTZiVkLNxvuXFyLhSlnOH+oSeZkgxyJP7vykCptqrluY+6248TZtR7aX8SlGt4779MbAIKV5PPcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718305529; c=relaxed/simple;
	bh=fUn8fj2+aOx1qt24UXCgWzuYqLTzLzRTdcyQBNixoKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E/QsRllaAsgf748qzvOCfgAd6SCUmdTt/2lHsegs2ughERgibeR8eFh2SS+XXENYGq8HmLk2EqDAKQqAPPz8SSA/6YoSzqYh/MJ7vltEIhV9JYqSBdRy2W71kBy2IWf83N/PAu26Ij16kVt3EAQFH8UWKJa70p3IQ/jjA1A6sug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtS8VG7A; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtS8VG7A"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ca721395eso30954e87.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718305526; x=1718910326; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IyJ8+sKrBscC136/+WcAKqMMnfDSQvhb/s79SNUCQw=;
        b=dtS8VG7AqrJgyQ5FlE7QwsPLZoHF1Wj0SFt9PdxEeleTJEY2mqKK72JCCRLEb3xHRr
         49JLovzP9OxCN7DUo1YZUmyXxglc38FOl6R1sVl+Jk00YpZBNOrhUFgEqo2zgqfNSXeC
         Nxh93PQ3LLc3jprmIrfoRNXn72RpEiapmsg+1KWPGjZgdv0KQH8vbVz4Btm1swPEBIKQ
         dVJuSs0WM9jc6LQbaZUtFSsZMh1zpaxXj2vRHXsO1iD4MZIkSXqOPtsYXX8D6RxwQwfI
         FBZ6uZzHLU+cbPiJIxemYSPRpGjkBieYyBvchUQLq6JAxzfFY5aB/f2Y10INJWh1p0T9
         7LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718305526; x=1718910326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IyJ8+sKrBscC136/+WcAKqMMnfDSQvhb/s79SNUCQw=;
        b=YuxXxIsDPJdqNfi6WOCAfNbSfze+cIsWIFUFpBHoVLEjQeuccC+QpPhsICD1GP0gwt
         7r3aTo7KdNCbzUGAEwtSF6YUn0ZZ0bNeewXhELuAFrxASEBc8cVWaEqMViecNgvKvhEt
         nJnY+4s8JqK+ZzwBqvs+114NqjVpCCQTEzGfVnZA+Eu7p6SJYPjtc2QzRjuzJIA6BeXG
         xO21jQnM6fHohkZjqKE4rXrUvRC1vMplmnOL202HYADPQTUYycOe4fFIyeK3QQqrWrbJ
         1MD7xa17Ad9hLU4g/FibfgSgLohUPVHRq0lkhvWj3FES3UFrO7Exu+SNBZ42kj+QuxLP
         dQUg==
X-Forwarded-Encrypted: i=1; AJvYcCV3J+9L5tG0z9Tfuu0cKrtAYw0C/GjvP8K1DE8wUrjtln8hLe4r3JVteWkgIdfcgkvfpIChufuwqtIfIy56ECh00nydnSW7XSB0p+3yvw==
X-Gm-Message-State: AOJu0Yxc5PWucqDQF39HZ7QlBR3ik8AyHYKBBQqMzkAZWcazHqZl9vTI
	cvLpHPVfDqjSKYpI1knG04sIut1Oy+Ddxq6O7GK6AjsF+/4aaxvpTAjlYg==
X-Google-Smtp-Source: AGHT+IFJssBhPmQQSAePWwpx5PwYFKiBgNSfksm9N1SHI2GdSKJ2rjRpFkyU3G6RIyrOjtZm8PA7WQ==
X-Received: by 2002:a17:906:134b:b0:a6f:5815:f5e2 with SMTP id a640c23a62f3a-a6f60dcb41emr41895766b.4.1718305505006;
        Thu, 13 Jun 2024 12:05:05 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecdd63sm99012766b.124.2024.06.13.12.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 12:05:04 -0700 (PDT)
Message-ID: <ee01dbd2-fe83-46cf-9ceb-279a06ce9aad@gmail.com>
Date: Thu, 13 Jun 2024 21:05:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] staging: rtl8192e: Cleanup multiple issues
To: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1718291024.git.engel.teddy@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/24 17:16, Teddy Engel wrote:
> Remove some unused constants, macros, and structs.
> Capitalize a constant.
> 
> No specific patch order required.
> 
> Teddy Engel (6):
>    staging: rtl8192e: Remove unused constant IC_VersionCut_E
>    staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
>    staging: rtl8192e: Remove unused constant WA_IOT_TH_VAL
>    staging: rtl8192e: Capitalize constant RegC38_TH
>    staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
>    staging: rtl8192e: Remove unnecessary pre-declaration of struct
>      net_device
> 
>   drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 8 --------
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.h    | 1 -
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 6 +-----
>   drivers/staging/rtl8192e/rtl8192e/rtl_pci.h    | 1 -
>   5 files changed, 3 insertions(+), 17 deletions(-)
> 


Hi Teddy,

please combine patch 1 and 3 (Remove unused constant ...) . You can 
change more than one item in a patch. But it has to be of the same kind.

Thanks for your support.

Bye Philipp
