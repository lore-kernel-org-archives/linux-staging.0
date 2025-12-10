Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49421254B
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 04:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765340804; cv=none; b=LHJ4fnWrziU9q8wQ17jKDEynMRJ6WU6KRHcTaXalltPZKHjkCVQ53mNlY+kuYe/cpphw38aXaaNfjordanYV5PhVAgwyN3R0Bjss3nB0zmV/UQSbNAoSVl/NeLLSa1mOpJSVq3UE8EnsEeZn8aAJKxHESeuq4k+V/yqZJNeBVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765340804; c=relaxed/simple;
	bh=sj+TFlLPqZ+s1w+yvXLn+DhvC+eXwCs89D5IuNhjqs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCpApeODq1Nnop24z4oGI/mBrhaFY3eVnw+r2+A27jhaD8W0Hq6AxaPa+zDlDCTrXB+u3rh1aXKrTKRFagCQyEInMerxQRzQOpnvEaO+S8jsRK9vQd4J0FXeaBcAwmGJUU6y4g6rcVacj4yuSJLCq0yHjq+nxRmOojpsdQzuFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuVTzgdd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuVTzgdd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343f52d15efso6089182a91.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Dec 2025 20:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765340803; x=1765945603; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tk/No+Mm3I+u10bIGMU4QecHhYZtSqoq4vJuDZr7ifY=;
        b=UuVTzgddKUxefl2DTP/GquwRAL0ILm6r34JNQmuw1LSPTyC2FqJwvJEMo5erj/Hoi1
         jSxcAFw0qxImYzL+D5cs7zhtYbC6m0bl5WJL++6DcDlPkjE95mGSPhczEiCmaNxCrf/5
         KZz/R4RickSRla0eLLzzsXuow1tgnO2C4VcSqkCMLlHZ/5I1rUiuwhhq6U6cEplGtSFq
         QZL19lMcPd21J2qmAxxUpknATLjW00Qk7Wt0+O126Kn+tdW/YPJjK3Mj3jqK/VhCiTxd
         jW26OWLhOS4R8W6xNGG5d7Q0xVcZt0Od7lJwA7GZ4xOw3VEvIIzI31cNz8PoXzu88wH0
         LE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765340803; x=1765945603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tk/No+Mm3I+u10bIGMU4QecHhYZtSqoq4vJuDZr7ifY=;
        b=QCCywA2JKnZQ9wVkZOc79kc5jNwmLNcztJ2QXL3WXC0mdENJ9nHQMTFi3FNwA4tCk6
         iVeWn/qtBzawCjRqwpYbAIp4wjnwPUFUSBh0EgQMmpjovmLR4LAQ58vsgRmwj+eh3xg2
         zFZjECjrydUsk/Ft4kFcr5zVT4PPiJim5n9qu2fdZ+tbz215KrP6D3gHYI+Y++tMz8ya
         hf0/lLCk0JDB8qgmMiROrWC9sQFxPZvaMUccBOLGyygL/kKbcw/ALnKPZKZLwsahx6XV
         mF5/nzT6pyZclMRT7MfNJtWu9ZYqV8uOz8/hP99iUpXNqy7ouQ7cYgkmDEW3lZufKPMc
         CpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDyFRYDy9Hlf/uND1MTaEDUB6eN5/8D4uYmVKXn/jA2opChZec9JdAu2M0uLSu/mGSLR507rC6eMmATkZT@lists.linux.dev
X-Gm-Message-State: AOJu0YxSnWq+ii3/7eFPhP9TDfnufWVydVDgfP9c1MwP4FNcwkmlclcT
	PcHKq/AAl8srxFXth8xnCKd1h/6qlz/tAqIoaHoctos2BJEsWYqLVp6z
X-Gm-Gg: AY/fxX5wCiq74nQFv/63pK55YPV2SeFBuDfoew4V3KYz2OIzNHIA+2MgMZcD0/BvGhL
	6sm8X9zUBd9GPFOMuz+dlsnhdvq2Do1CczLVxeCUi7CAJk7ghX2hxMJUu0hFZa1+qAlfOgrHzpo
	49qUDPRXN0ehxS3AOvc7nQdltAk6vyRBiMEIad3QMm1tcCh2AHW/e0jcvRGuPAqhZbldI+55kY2
	lkgJU4oxD3UgZ+s+KwZRqE9JpU/xZSP6bYNG4P8DZAAAmKr6uODcrZLR0eAft86hTDVNLlG3K9P
	JC/bSfz4M5K8mzM22/9p5+tBCSGAu5UjzC1u7AOHU+cfwAhUPtrbWsJwc9hEZav0Oj4kOuE3ICn
	pvfAaSAhdaXcgFs7UoockhHZIT6Tw2z4xgIlVo9gsKLvWTA/ChCIsdt/P7EJ+S/GWYgwErAisHr
	1bWhtug5cnMjgXdp2HHxE9TfJVjv7ukq94RfmFKvhDTCw4NPHuooFFDmkZ7zlD8bvclY0jf+4=
X-Google-Smtp-Source: AGHT+IEkCPOkyg0imXvpe+yjarzV/1sk/8YYfqF82dhTlKcX5BeBSLcY5y7rsJgrq/q2KnhrIhD0uw==
X-Received: by 2002:a17:90b:5252:b0:343:684c:f8ad with SMTP id 98e67ed59e1d1-34a72808b72mr1162287a91.4.1765340802654;
        Tue, 09 Dec 2025 20:26:42 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:b90d:2938:bd7a:289f? ([2601:1c0:5780:9200:b90d:2938:bd7a:289f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a70926cd8sm971106a91.12.2025.12.09.20.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 20:26:42 -0800 (PST)
Message-ID: <d71e2795-f918-482b-af0e-18376f8ca835@gmail.com>
Date: Tue, 9 Dec 2025 20:26:41 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
 <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
 <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/9/25 06:25, Andy Shevchenko wrote:
> On Tue, Dec 9, 2025 at 10:23 AM Helge Deller <deller@gmx.de> wrote:
>> On 12/9/25 08:27, Thomas Zimmermann wrote:
> 
> ...
> 
>> This whole series adds a whole lot of ifdef'ery, which I think is the
>> worst approach. It makes the code less readable and leads to two code
>> paths, which may trigger different build errors depending on the config.
>>
>> I'm sure it must be possible to do the same without adding more #ifdefs,
>> e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
>> simply returns NULL for the FB_DEVICE=n case.  Then, that value can be tested
>> like
>>          if (dev_of_fbinfo(fbinfo))
>>                  {...do-the-things...}
>> For the FB_DEVICE=n case this will then be optimized out by the compiler,
>> while you still have full compiler syntax checking.
>>
>> Thoughts?
> 
> I second you. I am also not a fan of ifdeffery when it can be avoided.
> 

Thank you for the review! Will do the change.
