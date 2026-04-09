Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A99332EAC
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775764714; cv=pass; b=kyue5GHtoDVZYByU8TRQRCRkOJHdotXXJ9ITRjArVkurvA8NCgp+/DjDuxQldn7KqvWlLAmRWez0WoB7vITO53QHwuy9TMWSO4FYhcS3AB1zLXIpZwgQLB4HRrpVmJ+qQ9Ln8J52b+vM2LPfz7bkLcL2zjBbjnNkNOTJuxdCCDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775764714; c=relaxed/simple;
	bh=mMEfegMUrZlzMQIanpKaU9/P116N7bUNeCI61KMB8lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu7RmF9fnFm97MZVP8jtO8+BHsFsZsEvZRcBpEXxixW2jgFyYTjhK5ZVWdFq+b84JkbtxY0n4rjKoORG7/lPMmN5m4GS3Z0k1GcgrQYALtcP0RF/b/NCrmys2JoARE1Iz230Eg4ze/Lb1teH6CgAGnraXiautmtN/s81Qa8u4OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cehfg7XQ; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cehfg7XQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so8316515e9.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 12:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775764712; cv=none;
        d=google.com; s=arc-20240605;
        b=HlIHFFMOGGv50gERj7lYi7GbuNrTjPYTkILUVebCzHpdia1YYTbvMJc5Nh5iTNSUN/
         5Y6FBnxPdgPQFe0GZwXrpUtHJ42ghtgOlaThCGX5Ky9NAwh/EsyJoPlHXggzIp3KF2JM
         mA7Z/6WFvjji+GFNQUW72VKf89u9EI/Ygg+YLtFCjDGOiVRQ3JIMhcBzaHc9IuKrVZIN
         zbtItDiAeTCgyQN9+UgPGOkBjewuIELih5NTzbGrNkXUOJevJ4FUVkBpMGvN0OCoW96m
         hRvw/VgPFk9xEUOW4ElhPzSJGks1kMWpMDcOmA/VIR+BKGs9BvTClSafuNDKf1940gPf
         PAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5ZfNNSumJcUJcRXJ7KHcamfeklPULshzDqG5rSail8c=;
        fh=EFcpbVm89WznTGKbEijGMEqNwXbLnDhAfP/SlOu4fOM=;
        b=NBUvNOtbhkITJkzWke1uFs4cWL1p06QW4WmAdKJ0jMoLZvfGcspuI0zuUP0TDd3/n6
         ZhvG2IJa00NqRnl6j8SG0lu+4NyqCRUHYzcj8ascS5Z8g5sR4uxzU7x5HSxnRMW+3ZSD
         eCZ5BNxlzfGWhfTUhTdhE9LELq5VwW939UqGnRV4qsXRCZwKSAMA9WdNSy2hxUZFV2Zz
         0AI+9f0AWbSvkir+Xs1Tx4Hf+Vk8CTunCPu1q2VbEKr69oWCsqM/K6b1c1WtB+Wgt2nv
         6o4EgCXeGgm0J31/98EVp/vO44D9Y3qIBFMLHLmPSYFqPwWXKm/qVQaAiNB5HO+qr3u+
         Z9wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775764712; x=1776369512; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZfNNSumJcUJcRXJ7KHcamfeklPULshzDqG5rSail8c=;
        b=Cehfg7XQ1XuE0I7jTfwIPADRPjhx8sY2eO4ucS4SABQ3jcj3D8cF4MBtuvBWsFKPtH
         Zwo9JgOQW5KHYEmJDMS01kPhA+489MtRDOdeLGQuV2FJ8rMnTlj2NofzHKxtP+yYvSfg
         x4PUW+/nLlztUcWP30W6/vIvyepfOZO9ylTHISaT/7TLFbW+EstOwaaqTMThDqyxTSKv
         iQtSxMdNE3cQxJ6x5aN6EaJEe0xDqoTYYwhFaibf7Faro/5iifkbysLlLTQwEQ030wsO
         rhm9zFZHyHEfB6E+0LHkicYKjL7HyhB2xOkojz5j2G1CG3W8rQlrBsYbWkyl3ofPniaG
         zeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775764712; x=1776369512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZfNNSumJcUJcRXJ7KHcamfeklPULshzDqG5rSail8c=;
        b=quI0B7lLrnLTioY7Vm9vjZwGs4cXH1nKXvuZUPzfUmRHuzSxiAvmDgGHafh/VKKvmI
         4MZWBKehXsv1OeY88N1GJWI3GX2kmpH+6L1LAylypViZbWhMgh9s0B4CsQmyS4wXzP56
         2zRgAKcBK+PAtFnkd/BV1mOocRJqGvQnnAbZXQfw78cnBgiNrym4KppZSnPIWmnmcBE2
         xxiBjq5HCSWsbGbyrTfGNDrXgOocSSMheMLlD2s0p2dVqLkaZKbmHQX5619KKl4C7RJu
         yGsyxS1zedLQ0l4bfOihI3p/W9RQTvXFN0Mi8um+hWm1YZf9fOCbHlndkiJcJ6It1Jy5
         mKqg==
X-Forwarded-Encrypted: i=1; AJvYcCXX7hWIV3/6QyyHiH3MXh1nxPh5+QrSI6wXXbz9Wdpoj8e+TEaNq65fHxzYA2++HBkPpNtEQS3I3ZPm+8hR@lists.linux.dev
X-Gm-Message-State: AOJu0YxyH1oBRsYm1AHOSSl7KOMxFd1e0lSOLTzNnkyaRLezRFpTGMF6
	hCoRbKd4+4U4NTBySsAL0e4yeMUiJ6W+5mmRDj6z+9cbJU+cQGMT2Okl1pxuA7+fzWSVJATXUX3
	FqFcp12yJDmoZlkL4jAxvQ+Flqx89DWo=
X-Gm-Gg: AeBDietZvOL8J9VHjhskcc8298AIJNJKhu8aRONtSJ8+NeE7HNufflOQNKWCU/5qy6m
	rMaGFSGcg1fpBzfqrxPpzlPRWtyCNN5IPO86qgv9cVfj8vyLz2VbntAcZklh71vUT3+uhWpPCj+
	HPQp32QdovsJzJ4tREyqLWd81Ql5t7c3hXiQNIDSp2/lKhi39GutTRJo0PbOz8rGLuLmQyvEv5C
	i/Md7Y+QYZLcCAXr4BKQZor7n4xo5RK6+y4s+AxSi1Ibsm/hnX31VTyD2FJQtU8j72FDmZ7nepW
	w5t8aKmve7gf0sIYoWluH2H11OFaFVhkbShx2qFP/WRH11XcGyJPw0cmUwHCjtQSFwantBCrHx+
	Bzbd7/dU5uqe0IK7dLl/E8xrlVT5EUQ+djRY=
X-Received: by 2002:a05:600c:4451:b0:487:1fbf:e0a1 with SMTP id
 5b1f17b1804b1-488d68057e8mr2321355e9.4.1775764711692; Thu, 09 Apr 2026
 12:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409131823.1289-1-joshua.crofts1@gmail.com> <20260409182755.499a419c@pumpkin>
In-Reply-To: <20260409182755.499a419c@pumpkin>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 9 Apr 2026 21:58:20 +0200
X-Gm-Features: AQROBzDZ48Zj14TBxP7h6GTA7eaCDP02hump18XQXQ6s2JgG21j5v_0OT1ufOPU
Message-ID: <CALoEA-yVCyyiA1gUCj4Z0JcLscpSSssPCPXnUPOciWJOHj3VUg@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency: ad983x: replace do_div() with div64_ul().
To: David Laight <david.laight.linux@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	greghk@linuxfoundation.org, dlechner@baylibre.com, nono.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Apr 2026 at 19:27, David Laight <david.laight.linux@gmail.com> wrote:
> Except here you have clock frequencies.
> Either they fit in 32bits or they don't.
> So the value shouldn't be 'unsigned long', but either u32 or u64.

The clk struct in linux/clk.h explicitly uses an unsigned long to represent
the clock value, which is used in this driver. Using an unsigned long
ensures platform independent usage without type mismatching.

> You need to check the domain of the values, coccinelle is just looking
> at the types.
> Even with mclk being 'unsigned long' the code is fine provided the
> frequency is below 4.2GHz.

I agree that we're not dealing with potential truncation problems, however
changing to div64_ul aligns the types with the clk API and scrubs a perfectly
valid cocci error.

-- 
Kind regards

CJD
