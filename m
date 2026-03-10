Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C574C14
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 00:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773103081; cv=none; b=UaIDyfog5pBSKUuTT4cQ7OowEWMET6ZnhbGZc9IIEQj3Ceq66zuNvjcTqVMIQDFeizQAVuXYZ5CAV81ufyXmhyteCfRmCCgUqdZmXjOFa6UJiRYPcvLzTn9B18qavFklEaYnLH4sqms+i6V9qMvInXPOk+g5kNHqB5OpKrY/WSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773103081; c=relaxed/simple;
	bh=cQ7C7xR/oTqQuHfKvQmU9Dr4tGIQ5xcVZIJaCE/YqUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fg/9fF3C3PAgEGauJJ+kuBwSYcA66ID3ZFW7/+j7PA4TiMloryelHMW/1Yt131Rb1TgZ63aIn/euNXhQgxKAVmAj/nUdBF/j5lNT2ssPcgPFg/o+/7FDn9A5Y4ZoRALtvc26JZiA57Qo1KIK3r3ZhPBj+Lxrj3+6ovVEpWgGhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h55OYcsz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h55OYcsz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3598e7155bbso5922810a91.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 17:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773103080; x=1773707880; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yghsqY3j8q79uPJiL50UbFZENxsGGcqMGJ5FahWGxu4=;
        b=h55OYcszJnB6dWXSm7U8SKODBPRU1WsKVBSxMOxZms8+pT2rrPtcmG7D58Rjddug6q
         Fz4tu/pGW651nI2UB/JbqJBibaB8dS6rVbx4zvAwwWIQJadDzmM0QJXpNeuNQ5Ty1Rul
         vJVdkDgy8B5tzs5zH3nHCbwdyv05BwREgEhfKVHUi9Z0whZFuI8PsdPqPaXkoCKasnKZ
         s3can1JjePp1bZ6Q6K9AR3TRMknH6lCq8Vi4213Tq+cW0EWZ4H2X/LDKbI+LakK9ZtIV
         6Xk5nl3LmJAMOiMAJza66syOwwYvuxN8U5KVtKq6U69odgeojqw2fhXVwz3nIGPqJQni
         vvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773103080; x=1773707880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yghsqY3j8q79uPJiL50UbFZENxsGGcqMGJ5FahWGxu4=;
        b=paGda2owgif8VOjm/rt4nrpiMq3VXgM5xzRXaV6blmMDoY8ZBfT6299ju71YDUrMGR
         6A+ES8jVDOqMSW2zFjox+qdbFNMQJxJ0+7YGKG69uQBaN8j/a6xIsUGXMIGpECfsPFrN
         FiFkpc+6VuyK+ZvJ39vt/PnMW4SinYWraFGX9ChCZtluIB/rwlYXY4n2bLJ5fQbjF5It
         ZJ8ofPh/hg0S9i+zaUK7AuLTeOGoDTLQ8kNiqOunyDsx0x7MFiPhOMgtgKE7lFky3ms4
         HOZWzMSGIXCWq5B4cvoKa1HRWJevnJUAZxxY9mtREX1S/eA2vrg6qOnivjADzqUiCOdA
         OmEw==
X-Gm-Message-State: AOJu0Yxfz0NsGqZ3uOxMuVIFm4G8vE/Jv435ccg7T09ZwjKfHJ+GbY8W
	esm0PBGGPLaCiD8ltvWQ9kLcLX9bZ+/JFJpYqgXiuUDq6ZzVoNtTGIVH
X-Gm-Gg: ATEYQzyqHw/LkoUy0Ukkg0YL0HO0NRnd2rKgwuwg8ppBsUkVt1X5eSaTklfy08syxQ9
	lurjTzUbaPNCFf1VtW1R6BVSt7dFTYhtpAUjm71b96farKBusCrB2hSXAM3XQI9D2ZZaH79fx+j
	4hRHhh9PB7mwRZ4t15e3xisCFXMTd82P9S6frPy23NDTmapo1mL8U04C1L0A85C4uVpqgH+HAg4
	9jn0GLZSdsKLmdnXPB1BpK+XNod1fBrG3Kz+SrRL5XRxQA9Oy6xIpxMAZmZkAB/GBdRUpS0HnkE
	uPsqfjT9qnUrkQN2hv6R6wdM2Vr4tBN6x8/W+oOFKx1RVJmcXMDL7hUmavrfa7RD0QGcQpcub2S
	7O7caSY+mjIPn+xIy+JNpbrx2jaNXqBjs/GzMWkI54qI7rAWYRLgLP67Soz+LOtBMVW+ED4jCNw
	s074FftExB8zrlUO8VnUiixIq6shzjobZLYVEJD4IG5C/WU+1GOElsj77NFoLrYYU2uETsVgwzl
	wqrA6ZRlCFZ39ZJy0o0rjkomqx+Kw==
X-Received: by 2002:a17:90b:4d09:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-359be320805mr12051151a91.29.1773103080031;
        Mon, 09 Mar 2026 17:38:00 -0700 (PDT)
Received: from [192.168.1.109] (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f7993sm906784a91.5.2026.03.09.17.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:37:59 -0700 (PDT)
Message-ID: <d4ebcfd7-d362-40c0-9c17-629fac6ef628@gmail.com>
Date: Mon, 9 Mar 2026 17:37:59 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: octeon: replace BUG() with WARN_ON_ONCE() in
 cvn_oct_xmit()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305005316.49848-1-marusik.adamenko@gmail.com>
 <2026030949-banner-rematch-db18@gregkh>
Content-Language: en-US
From: Mark Adamenko <marusik.adamenko@gmail.com>
In-Reply-To: <2026030949-banner-rematch-db18@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> If this is impossible to ever hit, then nothing changed here, right?  So
> why is this even needed?

You're right. Would removing the default case entirely be preferred?
