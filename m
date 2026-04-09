Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40FB2248A3
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775771175; cv=none; b=Ki+wBif4e+r1CMMx2qRe0SlYW+6BEPYj8og0NQ/yH1P/UWThreBzryJFhL/V7OMc8myAAx01jRtZC4ZuMuJp+LwO23ySR0zsPD3Q3WLsZoUguQVNlvbEEOEbCRMuEU/lChuetRRYVybvk+uBtl6BKwG/7jLLJlYW6TcFkNd1hpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775771175; c=relaxed/simple;
	bh=aa0Kv53GKsOZPdXhCjjoUJZEwKI82rcoBJpFvZGdXYg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrQ/KZtOQlp6erFfvO6x9YH+bkmoszvZR65FXYUwaghxb29x93cs9ZURMGlScm0EfMYlUAJ66dTLARQgWNgeySQRaHR3rFRr3ZpAWf2uoD6hzU9wePwaMYHlqiiqCEyaR9vxKOc3JV0RG0IrXNZb7qQVoS12BDdhvQBx8Bku3C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrL7wV3I; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrL7wV3I"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so9534555e9.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775771172; x=1776375972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKZ97EUNpti69PwZiOZxOsJQ3NBK/kMV901OOo+brBM=;
        b=lrL7wV3Ie5JLxqteoJePcfl9cl8t8GSGE3xhsuUQYqmedDALkRQi2Wp30y0+Getp/4
         0heuNdiHE+SSigHVFPNSB9muAzxm1ZdLjDkYRcbaqazxHPUqwdUusi3YmevgxiIJ4jIY
         gdLPr7qO9tPd8rIEJk8Jl80NQpGiG4uYO+5lt8Y53THVhPBdz6vDygm9iJ5WTqaLgYJ6
         dU3iaASMEXr/PVZmJkfE2nc1kvdkfKc1XyzFH+/DZMREG1Uk0D+BknICyUt/3tQZDc1l
         lxlIWrrjfvbs6+MLBCVSYSS2eyKolD4hb2rOPjxR3EtyBbaQEVBRcgmEwM9cbpOVZ53t
         S/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775771172; x=1776375972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zKZ97EUNpti69PwZiOZxOsJQ3NBK/kMV901OOo+brBM=;
        b=jC946tgkPZVFlNDJBSTxHEpbWepH9VQiApz12ilosPTSOV6AZ7FxljAvYrt7SrCzWh
         hx28RqyXAfhjT/4UCtWOykpm6+oMfAnFYa8vyM/elJ0YRVM7zA1Pvvlo7b7UpAL+M3PE
         9hFBSGjq1kaGnGdVBwSlioMrNIyCauAFn+0Cg5lCIWNA6Ma0rJphxYvr9+o8A9YLoehX
         W0dL/1y6U9yL4hIRPJojzp702bWrmx8w3CovgmofuoUlMkKFe7s0WZ4OB2dzlc7QPHoq
         GBQnlmmF+5Q7PkZHnR9x1Z7P7HZQZhJpAGuR8WUEZpoqxzZev/BoSeFJQJ0HTdGDX04M
         CQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmoZy/Ix5B5ZSND9ShEONAGAC6srkZFOYhvZkFEUwM2AvtNhPbZAlB20k3Uh805Dr2B7oFwUnv1j3QltEo@lists.linux.dev
X-Gm-Message-State: AOJu0YzO/I9QEf0pXwlpq3PdiFn68OS9qi6ho6ICSbyJEMlYiSB/fXy8
	oo+y0GQdtGn4F2pIWZKI5fJzt+ZMVzzxk6l2bD66e1Xqn3cj1q57s4WK
X-Gm-Gg: AeBDietmFnINHUQ5ztxZ7wR875OEeZX7M50PBU4m7UYYX4Qtt7gbSU4+agYFF4CPNDL
	QwNIc0mgDX+V10xOQVmXzZQYWoPARSoKExFEbbnBmww30lKT1kIFU2tI8VbmuAw/9u1O9Kva3oX
	MEDHC1XEB/ep1CEP/It0IB/vVmBmvRwqoG+9sDcY2aUrD7k1Wv5TZukRzs8OuwzA64gelV84Dz0
	2prk+YYOYviuOpDKyAF+ODntxkv3HJEHKVukjHFVcq3qebQwEq+Exvjk0q2KBoMNpbKqrXGAO8W
	Kc9QVhJqTXiZQ4xiNCowlWcuf+IKhFGDKMSnkwcRiW1Ptgc3njDTV6GAIcJXAF/PNpENm8aoGqY
	a4kdx1RPjyXov2X3C5M8vZS1JjaghqVgde11BufL8lb7DMvT0f18Kx1iwJejRRE5m/vxBlUfPs2
	AmHP8ntNJN2BNUlny50yrYxHi/xP2Ce1PbewtHOIceZzMCb9Cg6FfcXQY+G96oTtpo3MWR40P82
	bw=
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr3406955e9.26.1775771171966;
        Thu, 09 Apr 2026 14:46:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3cbb2sm22726265e9.13.2026.04.09.14.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:46:11 -0700 (PDT)
Date: Thu, 9 Apr 2026 22:46:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 greghk@linuxfoundation.org, dlechner@baylibre.com, nono.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] iio: frequency: ad983x: replace do_div() with
 div64_ul().
Message-ID: <20260409224609.3e36a208@pumpkin>
In-Reply-To: <CALoEA-yVCyyiA1gUCj4Z0JcLscpSSssPCPXnUPOciWJOHj3VUg@mail.gmail.com>
References: <20260409131823.1289-1-joshua.crofts1@gmail.com>
	<20260409182755.499a419c@pumpkin>
	<CALoEA-yVCyyiA1gUCj4Z0JcLscpSSssPCPXnUPOciWJOHj3VUg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Apr 2026 21:58:20 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Thu, 9 Apr 2026 at 19:27, David Laight <david.laight.linux@gmail.com> wrote:
> > Except here you have clock frequencies.
> > Either they fit in 32bits or they don't.
> > So the value shouldn't be 'unsigned long', but either u32 or u64.  
> 
> The clk struct in linux/clk.h explicitly uses an unsigned long to represent
> the clock value, which is used in this driver. Using an unsigned long
> ensures platform independent usage without type mismatching.

Not really.
I've NFI why the the clock API using 'unsigned long'.
It almost certainly predates 64bit and any real idea that a clock might
exceed 4.2GHz.
It might even come from someone who wrote 16bit windows code and wanted
to ensure it was actually 32bit.

For 'platform portability' clocks are limited to 32bits so the 32bit
divide is fine.
If the clock could exceed 4.2G then you'd have to use u64 throughout. 

> 
> > You need to check the domain of the values, coccinelle is just looking
> > at the types.
> > Even with mclk being 'unsigned long' the code is fine provided the
> > frequency is below 4.2GHz.  
> 
> I agree that we're not dealing with potential truncation problems, however
> changing to div64_ul aligns the types with the clk API and scrubs a perfectly
> valid cocci error.

cocci only does type checking, it doesn't know the domain of the values.
So in this case it is almost certainly a false positive.

	David


