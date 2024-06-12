Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98D84D0B
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718225873; cv=none; b=uMlHlw38cKylRC4T95jdVvjMw2D1rPa5NFbHksMQkQd0DCvHvKUFQcKULtS2BBglTAkpVB8hy/jkno8q9zhlqGhDNPu0JK5kZz6FxZDhi0HVNKmgrLqqhbwAob8QmQkrnT4s5KrA5drn2WshJ64bxThrTdPkY5FQx1WWT93fzz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718225873; c=relaxed/simple;
	bh=R6KRUoUZ9Sn5OH3wZeBm3taYSCMljLwNdxHxT8X/gLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pg4bf+BqyzfX5UwVmjgkTk6j3PzyPiNSYXhEXxrak8aQbq1oN/NmroAYN/DUECcI1ERpfsKph+CgpYr8bfZ6KUrqPoUns9Bk3iiLHO11n/nai2M5x6yu31JvEDW65QQtfnO3YcD/YuOhGD7WBHZS1mjTipNHfWZeU7HCqHbOg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0GrsdJG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0GrsdJG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1d407fc2so31985f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718225870; x=1718830670; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOsiW8OYUfyTW+up5+j2gle6/xMA5K2ljE518H1R1Kc=;
        b=V0GrsdJG3Ctv495Bxk7mUOGNBApw587BU2KNB9NDbPec0bfCzrA8OMQih4+cjGzLEP
         8dX3xHCAtX0+GXJyd8qkrygzANPXxrG7aooKStTSLXLHHBhKkrML2amysRo8PbAisNY3
         KmRm8hqftDur/I3pBhyMAdOwCJC3xGfZ0DmpwelGYAVX7s5xSLH73PbzxMXxxOJrtzRJ
         XCVZa+nYfTH4uuUJvhBiUbkdnscUznqGEQhuWo2QprsVOsW5afM/zRoQ7Q/PJ9AzRnm9
         fjE4bk5X2g92119uS/ckVxWjtH4dP1rklUsENfY2diUOE4XUBdY1hpHVRbU9lqWxstjR
         D5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718225870; x=1718830670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOsiW8OYUfyTW+up5+j2gle6/xMA5K2ljE518H1R1Kc=;
        b=UAX7PEZGzQvNVrLpn+LKhzMkg148AfNdKTiRsd+EXlOU37+PIZikIggDpnnPct4CvT
         KTFMcoSRlwErnjbFNStg4oQ9aGnSeA8Zq87rzoY9pEXsg0LXZfY+5E1nlAidAnpMJJee
         R4JgK8yMgI/eFmz/pe6DSimPMpKAHrBgnKmSuU8HA/BdxDJY1h75K2DWHpZHyfKFZoFv
         GtbKbJaaV2ZTGt0zJZYbt3NLt+RUu0L0Quu+aSfZimj5ynAebK4keuRoXpzZb+rKRa3d
         hbbkRBTHLmamjvScp0lxv65YlIEZrHIdeEr6nDExJRYpI3TAIYJUP4SzawwDNna4Pd+8
         oNpA==
X-Forwarded-Encrypted: i=1; AJvYcCUf2DJ60Yj3RAEAsJcKh7KZGD7MUbqX7NyTDZqDryc0OZWqLcaizwqJucE+vpXndRe7fKDxm2pv/01okD/Q2tvIfwKXKC7qg5F1QtzsBw==
X-Gm-Message-State: AOJu0YyK7BjoyaUGXv54Nnb2YhBHnaY9UreqYRQj+70Vz9/FZDm5GIxk
	jgEHc6ERfu7sBopIMGAkExuSpUZC0mvvAJJNzxhXfM9Ni9bH9RkpD54TTg==
X-Google-Smtp-Source: AGHT+IHaNx1hKLE9sUF1+YmsUUZ/Ldgz/P5eurnsRKHBXheW8FKCo81Fug4A133Nfa2IO1PoYcUwyA==
X-Received: by 2002:a5d:6c6f:0:b0:35f:306f:1580 with SMTP id ffacd0b85a97d-35fd4d89841mr2430226f8f.0.1718225848994;
        Wed, 12 Jun 2024 13:57:28 -0700 (PDT)
Received: from [192.168.0.104] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6ef83ac0c4sm687466866b.74.2024.06.12.13.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 13:57:28 -0700 (PDT)
Message-ID: <390c1aeb-69ad-4a0e-86ab-992e3757cbd3@gmail.com>
Date: Wed, 12 Jun 2024 22:57:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vt6656: Remove line from TODO
To: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240612140735.2423-1-engel.teddy@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240612140735.2423-1-engel.teddy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/24 16:07, Teddy Engel wrote:
> Remove checkpatch.pl line from TODO as no valid checkpatch
> recommendations still present.
> 
> Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
> ---
>   drivers/staging/vt6656/TODO | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6656/TODO b/drivers/staging/vt6656/TODO
> index e154b2f3b247..876cdccb6948 100644
> --- a/drivers/staging/vt6656/TODO
> +++ b/drivers/staging/vt6656/TODO
> @@ -11,7 +11,6 @@ TODO:
>   - switch to use LIB80211
>   - switch to use MAC80211
>   - use kernel coding style
> -- checkpatch.pl fixes
>   - sparse fixes
>   - integrate with drivers/net/wireless
>   

Hi Teddy,

to me this is a second version of a previous patch. Please issue a new 
version. Your next Patch with this content is V3 as this was a V2

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
