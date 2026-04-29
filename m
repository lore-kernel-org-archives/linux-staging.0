Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AF93FADF9
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466726; cv=none; b=eWzYHepITUknPEg1XJeqjmOEHW/Ic0nTwSB8AYInzEuATIa4HxwHb1fWy76bZk4is0B8fWwz8kOf+jRcVMvkPQLTx9FCGvPN0NYcwUshm4AzYpnCRH0o1c+QTGjj/pxMegPksiXGy1HZVYs/cGDpJVlsPqc7uAeyCMvvDv4tuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466726; c=relaxed/simple;
	bh=3kncHomSFV93pRVIuKcHHGoGJjLhVDX1Yv+ukkduUbE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SDCxHkggXvEhgAvDYn1lUL7frvY043nS7s/YEldfzzA3AE3Shg6s50Da9AcFku1w7kEvyohQrNSlsuSUiqHb2CDJfMDnAAaRZHqGzTE6JE7gPUokcpO/cfP5q9llML+e0rHPh8Da5vnhQQuDVdNCurNd15z3cqFZbdqAkWWHH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1o+fAyt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1o+fAyt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so152533985e9.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466722; x=1778071522; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JywTqc2jzlS8kLhkKielAStQs9LfcxdmjK9IqHTFcY=;
        b=d1o+fAytj//IDAVboI7do7JcE7rIL0RawiRJQW9MiyiV0TLoeAI4yEEIDlb6moBaA+
         I8yrlf03qYh2Q9eJWkG4jBM2YaI2t/hu1ZgCEMqjV8wm/n6JrVfuevqAQn3L/Ld6P4AG
         Q9YhVCMPJJQn4M5hSc7wPKr34uQLjbhl07aiQS/Dei8zxEqe6hwFyVgHSd6cPaNE9i4r
         o0QkUIIUPfcbkJ4uEt9mjVpusnupl7D9EpxPWiKad5uurB0YpTmAJIImy6phiDgvflUg
         lEmJq/s2Z8H7zfO9xVW57C4JzpsLwxFJTZfjVGWBzG2hQXKmVAnrZLg/Bg8KKyPG/tT5
         G/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466722; x=1778071522;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JywTqc2jzlS8kLhkKielAStQs9LfcxdmjK9IqHTFcY=;
        b=IjexK+N+LHb45Vpct4OfSryRxoY1Zoyj0LkmFeRC/mfW60vUMz3kLdKJo9r22jZSYi
         oiSl181MXso0B3dTHyyxXqAkxWfBcKnB6+RfiVHKJX6nPQLrtZK7uxJW8E/VJfSDozf6
         q40C9eXF9LulA5ssnxohP/qX1VOKTdiqGMz1w4onTAWKTszBlw8QRyn+PZUHbihyxWC0
         iFMfqbMaPzZAvZaY8WXMNPMAs/blAphv1tFXG7tkZ0hxHz6/J9R7URXwnoMYx60ZuXoS
         ekOQA/teZAkWSdqOvP2+jg89yH3IVNnT9m+6rQL+igPI77VqTCe/mEb7upEGSBVS6aeR
         f8gQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nh284rIV/67WsqidcKgEQcU4hbyuhh6jL0iTGK30btSp4wBC7gDdsIYx/1jw0rFsNCCzWuvuuTEyhG89q@lists.linux.dev
X-Gm-Message-State: AOJu0YypH78sYKJYSFi1tS8V6c7a/JHGkJdWGhR0hp0qNhgSn8xUl2EN
	A2d6FY+zY0HhIFyaHR4VoGOHdt5/Ppxq/UBoLhLGjPGUXkAUryupHiC+Ip5DQNWZ
X-Gm-Gg: AeBDiet41pHoTgYUS3GrF6mD2wagQwWqekp5qvu/vBzUE0Xw9eBNKa1aDS3VOss59ia
	xzJTewG3vjJ3shJXTY62T5y5/D0S3aaerktqX6wpMZPl1r0aqM+cb7MWyWspaawn4hHXBEG0AmB
	kpA8wIvhBXezkSWtARHDpFshQWIf400wFlVjjTGzBwoJiKu1wrHhzlfqMxOO0f0dVFlXq6Ybtj2
	nM++mvh4luf9lMNE3EBUpsZv7gkh7ACvsuYofo5cvFyu/XQ0WCDSPCpc+XKNv6uZcxbtvwURdHz
	5K04voKG9Wbf8KExFVjb6is8WNPrzphebfQR7FZoVASgmYcwc7kO+uFd9aOEbfWcbsetXjHNcJV
	O+45nc1YuJyvf7JbVJzSG7Rm/IsbUEtER41UMI094/zDY1tygbNjYXqr1VzVFQ8MbTQnHs12+Zr
	vkE/A+2Nndp+puVwFftVcehed3U+EPZHXOZZXSN0LKUJdLOpoRHUeI3mLuMCJiQT/hi2gOJ+ok
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48a77ad59bfmr101037255e9.2.1777466722407;
        Wed, 29 Apr 2026 05:45:22 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b421721fsm5286047f8f.15.2026.04.29.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] staging: rtl8723bs: fix potential speculative cpu oob
 read
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Probert <linus.probert@gmail.com>, error27@gmail.com, 
 kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2026042959-discourse-favorable-edc5@gregkh>
References: <20260429111016.1260295-1-linus.probert@gmail.com>
 <2026042959-discourse-favorable-edc5@gregkh>
Date: Wed, 29 Apr 2026 14:45:20 +0200
Message-Id: <177746672061.1273374.6835519289220492184.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=linus.probert@gmail.com; h=from:subject:message-id;
 bh=3kncHomSFV93pRVIuKcHHGoGJjLhVDX1Yv+ukkduUbE=;
 b=owGbwMvMwCV2OqdW0O/i2pmMp9WSGDI//k1oLFD5XsI0497/X7u3RPK9Plsw92DyvQDHr/7ZQ
 W+WlsTndZSyMIhxMciKKbLs74zkapy/srf2AsIcViaQIQxcnAIwEXERhn92F7I+fbxlsazwE9Oc
 Rw1/3j5Zv1NqepkPV7zU3QLpIy0VDP8r7HmuWNa0+39gaO+Rq30X7F3zKy7rOqPjFc8ly+5cfM0
 CAA==
X-Developer-Key: i=linus.probert@gmail.com; a=openpgp;
 fpr=CFFA060FD5CF9FCB9E3637DC640993AF63BF6854

On 2026-04-29 13:31:46+02:00, Greg Kroah-Hartman wrote:
> On Wed, Apr 29, 2026 at 01:10:16PM +0200, Linus Probert wrote:
> 
> > Fixes potential speculative cpu oob read in os_intfs.c by guarding the
> > index with array_index_nospec.
> > 
> > Fixes smatch warning:
> > warn: potential spectre issue 'rtw_1d_to_queue' [r]
> 
> Is this value controlled by a user?  Or is it just a normal operation
> that happens that is not controlled?  In other words, can a user
> manipulate this directly to be out of range?
> 
> thanks,
> 
> greg k-h

To my understanding, yes. Which is somewhat limited due to being rather
new to kernel code and not having access to this hardware. The priority
is extracted from ip header which can be user controlled.

However, looking closer at the execution before I see that in both cases
bounding is performed on the value as follows:

	dscp = ip_hdr(skb)->tos & 0xfc;
	prio = dscp >> 5;

So my change here adds no additional security. The smatch warning is a
false positive. It only warned on one of the cases. Most likely because
the bounding happened in a function call and it only sees the u32.

Some quick LLM research told me this (in my own words but have not
verified extensively):

The case where the bounding is performed in a function call could be
susceptible to *Spectre v4 (Speculative Store Bypass)*.
But the fix I applied here only applies to v1 so no additional security
on that front either.

This is probably best to NAK unless we just want to remove a false
positive smatch warning. But I personally don't agree with that.

Br,
Linus

