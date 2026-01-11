Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1D352F99
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161069; cv=none; b=G/OaH/brbSYOe033bZDwtt6XKqyvy6Jsv0UqMtTqb8w1rDeazs2qQD7Al0D7QCb6HhwTQLv1mCVsr6yeXMcIGaOyZpAH3nrVEbLawzEZeI6LR4C3hwJD4+ro487fxNPQYOD6RUvB50XaouvIATYIcEKAKtgzsKxDsFinRJRVY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161069; c=relaxed/simple;
	bh=76yxRtZvGFU55xsNBTw1GUfwE7XmvAmO7p7IQzUMX0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Felow4eZ8RHI1rZ1lOBB4tpMIsuVi2g5rRxq2/y2tfPruEr1G7mCnd7xyS0mJc//fSuj8sA87xm06iCZILrpRUl+LgKRQvV54vzM1WNnYHA62l9so/upW6zBh3gHtAlhhvpn2gmYlg+D5hoPw0yFRzwa22uVVLxs/uiHfrgMm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxzZIrCh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxzZIrCh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a2ea96930cso38159835ad.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768161067; x=1768765867; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRLXkFTiZd9a9Tg70dQ7iXKOuDpg8c1t7/NoM418xOw=;
        b=HxzZIrCh1eanInd+1NJit2nyov+oLArJkSz/ogzTMnLrOWOxeFtASQa79YlubHcwzx
         9OO6X2Ql3XhXjJak9nW/qlbweqNME2vzfpOPCzVxMOT/tDspcis8Pv5ei9xG1THwEI0O
         ED77OqtAHndJfY/P7UK78WIaKmDEmsIKkpGdyetvNmKDmz6mkWfXf8owC6n2PyGnLWYs
         5FLe3WZp9kjNsssOBe47MKOC2s0OgOElQOEZvAA1ZTA55dT36AhlLoZWMeSrMUNPomBD
         fwq31lwAANRcxfwa41P6RMapGyJteAxDFh2ynzYqjjveBDTn4qqyZd4Zj1QShQ8xH8K4
         qphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161067; x=1768765867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRLXkFTiZd9a9Tg70dQ7iXKOuDpg8c1t7/NoM418xOw=;
        b=Ns+dGy9QYzONN2wXqPQu2TJrFKnk98htQ0BsYmb/+6MZhJGKN/N/6zUdoIPymhVxD6
         C5OCZY0GSyMwUAz6csy1k3/WKeaTTzQLbtSjbuyxi8y8FmTxoF2eZZQYSA+A11zmn6ER
         Kl5U/aQ9U5Uk+eY+XeYJzs9WPgRbJDzdAmGIr645HwiSSxeKFyf1b4wR7HCoRszXbyBc
         C6yL1M7XTQegLcj7JsZyP/j8BollTYwlCqkmli8ZyofusRLAenBfwUgkx91WEarwZ4iG
         YWaeWcqxQPX2XqfD4t1vl2/GEiTQBmrcR7l/VYd1jzjhTx7F0FAxAOHTESx2wVS8qSQH
         93tw==
X-Forwarded-Encrypted: i=1; AJvYcCUr7gWi9gtsbwQelmFbhvO0Zk+Pd0V9GNk2ie9GH01MilfX5XF0LRwgjwox6qpBSat0DsjM9V8h9xNk1aJA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx60LJhsONJVFpisVYlHIVnpVp3SvBwYjs4fXOeUkO5ppYafEv4
	nz08BdwRuTjlzGclO68NG2Da0450pHzwTYmb77kBIHnqQNNdDNdqU/AZ
X-Gm-Gg: AY/fxX7h0d+KZnsyby0hoLCtdL3Qt3yltbfSHldYL1j7t5K1BDYkHecaesE0+z0G6ke
	KiCP3bMIyW5TPwaQWIHRds7ykkZ45ms+8pgkC1yM4NI0WeF5EAoqdEyf7dTbLI3QJrBnsYj0uCY
	NPm9758nvBGlwVGh4TZSLTOjFzuYewbp57ltFyRTH7jcQXEn87V+TJdEfIpB+xwzn80+Sr35vt9
	SzR+oqYUxsxtrjYDiBnEih1UnT/bTMJLSZxnsvKBz4EADl8/Nu6sy7zk+qMCgLuvsrjTDb/3qou
	eDOuj7uV03Z6/nxd+8XJ1piXEsviSvZ3/zdDb90me3gJO8nntERwogKFeVRZ+jwrQMEJzhR+J5o
	ctEXjiP55EZYRDtCEtVeoouHmJb/Syl2PNAsAQTociuYlLps4dmOUiRsSVWtgnsFt+nJOpzTYJS
	aNj9lbB5+jaUmu6ntHF0GUPv7V+YkXxgh0P3+TXdWeQKQGQ7emnPOIGejMaZcm
X-Google-Smtp-Source: AGHT+IE6MC5cdfKFrapIzQPAQHoSLTs/H9+tHC4hZDCvPVWe/VgmNXYnGJFwo73wIBWsCgtbF09Mjw==
X-Received: by 2002:a17:902:e88f:b0:2a0:a793:3357 with SMTP id d9443c01a7336-2a3ee4fecdcmr148105215ad.43.1768161066959;
        Sun, 11 Jan 2026 11:51:06 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:a2d6:d17d:ed6b:f017? ([2601:1c0:5780:9200:a2d6:d17d:ed6b:f017])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152979465ad.86.2026.01.11.11.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:51:06 -0800 (PST)
Message-ID: <75cb40e4-bf33-46eb-875f-f6100f657801@gmail.com>
Date: Sun, 11 Jan 2026 11:51:05 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-2-chintanlike@gmail.com>
 <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/11/26 10:50, Helge Deller wrote:
> On 1/7/26 05:42, Chintan Patel wrote:
>> Add dev_of_fbinfo() to return the framebuffer struct device when
>> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>>
>> This allows fbdev drivers to use sysfs interfaces via runtime checks
>> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
>> remaining fully buildable.
>>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>>   include/linux/fb.h | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> 
> Whole v4 series applied to fbdev git tree.
> 
Appreciate Helge and everyone who reviewed it! This was my first kernel 
series and it was good learning experience for me.
