Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807ED1D131C
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726202928; cv=none; b=at7wSoOvw8d/K73q0vYY+l+kQW9n+8xdEcNIb8esu8Inryv0SErWCOSkM9W/KM6jFuR9O0macwxK3tsctQn3MDYEgkKBJEUVPjFkXFMKSou2jB3rGZ6teIqA9GW4VCDlGO+k5n60Fad1G0AO46+seZD3fILpXdPpG0GeJLN5vms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726202928; c=relaxed/simple;
	bh=1TrzoTN36R36PFSXnu7eQ7ZXmcCZ+6nQOzwQHtz//Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HVy7FPLX6eTx8GW6ZEYQr/bKxNKN8BgRmLGxfWYRUwtdGi/EnRN2k/9sm6jaab+QDV4Y8ALX72IdD4Cf48SG0PJEFFGwW2iHQQvWviEHQtZWZ3EKnxtZ/ZO+nFersRdB2mmercqrWp0ZGhGbdOT5EMLqJp4KuE2ZdqaK0d15YpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV0qFIKg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV0qFIKg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8a7903cb7dso26354366b.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726202925; x=1726807725; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpuQcXgpk1xhezAo+hH2U90iDaq/k3GcGxqXt7xutNs=;
        b=mV0qFIKgfVZMYs/TCy9XCwj+Ka0bXaBtsqLHtv5wl6x/zfxaFltDuHTqbpjwLNOVbI
         mbv1iD9H8b1xwUmpBfdNznoaD/ItI71sVvh4eFsiE9MYtL+CxAl5CzVc7U4+vL4SG5TX
         O+eZDaF2qjDrZvfYeB5A416lqWf5kd+EZEvTqancuYhqaJwYuHgALFCvnyFyVQHcmaSS
         5/io09KKwwH72Xy1D7HPmf+uOqzBC1tximP8+3gvf5wwJPCYTj8rk75A/gD7jXnMQKQy
         GhPi+TVT7LP1vWc5EJfiG/Hzmq7j+apxqFYJbsEaUGUG17QanuBAbm3b2lnnOC1wZFUQ
         f+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726202925; x=1726807725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpuQcXgpk1xhezAo+hH2U90iDaq/k3GcGxqXt7xutNs=;
        b=UWsIXcgA0PHniYQ7mCq3B3i8/8fhTHsdKVA+IdpCgCnzZIGSLcpE4jo/1cWKuy5ao7
         BUPv1X7pWJ/tJv8Yifnd82BZ+Kq14Q5DQAJwKHEjbhKRcVNd9gnFK+/EyNJO7ktHJUr7
         0R65hfOQ5AUbL48C5hxAMLnsFUMo/iqSQzvzN2wwt3x2/JYEWanSXtKNBNkzAMhtD3mr
         hcByNg5QT9AlF0r+N2iAt68Ii8giy6ZUHB3/p8BEjh16IwfTIHX5hOZvjhWnzBGRz/qi
         AQ+LdYXOt7vg9M15Onqm9Sk89WswZErRDy+0tS9s1kl6o8gB6G4zHGdMxEaUpnENohoj
         GC0w==
X-Forwarded-Encrypted: i=1; AJvYcCXNKUjOeGkCEHRBZqmEMWZMngyqQxrUMzpLni0PJeUh9zSuDNPAXOr97T0lXgmRLd5zHIUZmQCLUTSVbn16@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl0DDJDS+89Ti/V40mwm0TySTIZt6+sSCGVYZoHcezP+Y6Toq1
	jSlNFK4ZZK4UXzlTkIVF3O3DjE7AwvgDfqzdSUWI8qN2TJjyfqbNXqX1WA==
X-Google-Smtp-Source: AGHT+IEl6hw0zwPQo7MBf5MKSRy8+KHu8epjKOXf2iPRIfUBfDNVeWMygatec6sS8Ngl9HobnHVoJA==
X-Received: by 2002:a05:6402:278e:b0:5c3:d0f5:86f3 with SMTP id 4fb4d7f45d1cf-5c41dea6befmr1273719a12.3.1726202924592;
        Thu, 12 Sep 2024 21:48:44 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5214fsm7185340a12.54.2024.09.12.21.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 21:48:44 -0700 (PDT)
Message-ID: <9cdaad7f-4a6f-445e-b457-9dcf54c1bfbb@gmail.com>
Date: Fri, 13 Sep 2024 06:48:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] staging: fix warning of -Wunused-but-set-variable
 reported by clang
To: Ping-Ke Shih <pkshih@realtek.com>, linux-staging@lists.linux.dev
References: <20240913002815.5149-1-pkshih@realtek.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240913002815.5149-1-pkshih@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 02:28, Ping-Ke Shih wrote:
> The build of wireless-next pull-request using clang report warnings [1].
> Fix them accordingly.
> 
> [1] https://lore.kernel.org/linux-wireless/172609384625.1065358.6518424528532813444.git-patchwork-notify@kernel.org/T/#m405a10ad637bfc5f337127bab81336d8569e49cd
> 
> v2:
>   - rebase to top of staging tree to resolve conflict of patch 2/4.
>   - no logic change.
> 
> Ping-Ke Shih (4):
>    staging: rtl8712: remove unused drvinfo_sz from
>      update_recvframe_attrib
>    staging: rtl8723bs: remove unused efuseValue from efuse_OneByteWrite()
>    staging: rtl8723bs: remove unused cnt from recv_func()
>    staging: rtl8723bs: remove unused 'poll_cnt' from rtw_set_rpwm()
> 
>   drivers/staging/rtl8712/rtl8712_recv.c       | 4 ----
>   drivers/staging/rtl8723bs/core/rtw_efuse.c   | 9 ---------
>   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
>   drivers/staging/rtl8723bs/core/rtw_recv.c    | 5 +----
>   4 files changed, 1 insertion(+), 19 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
