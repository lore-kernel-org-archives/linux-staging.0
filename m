Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696CA3C198D
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072892; cv=none; b=ocr6bJHBQzAVdL2q7gLoceGvk2BJB9t9dkvtdJIWwgcJD2OCacdw1T7iCAzNQBuNjHtimVER1TT19ZmIeA6wUIztRk/vQRVRCOYiLLUygEVHpTnzEjxOmRadM0K16BMou31xnGYC6AMb0VPIVm4zNFco75WWBWBUq1HFj2VRttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072892; c=relaxed/simple;
	bh=9LraJ5Ht3p9wtyRM/q/Y4auvM+543p7mKdm61Ee/tqo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=e0ciV/Ri72XTzN2DaVYow5e60eMLAb4npmdtuIy1RpuOTf9LhnkIiKIO3CJ6mztn4jO26Av6qDedblqUS8NMZzNzgXuwugmC1rGR966Fhp1ixIlrKDPrrFvZu0kYBeakLcBJZLjppzcK5A8O6BcBl4xr91oSPqH9VDT/RrwVStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzxJMhEn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzxJMhEn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so99699665e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773072888; x=1773677688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LraJ5Ht3p9wtyRM/q/Y4auvM+543p7mKdm61Ee/tqo=;
        b=hzxJMhEn9fmN3TpUFAXbyjazwWqiJXEAgLBKKeO11tumnTvOtnobIBOmirouoCUa/A
         xrQDky8efzS//bb2Z10/nAlVso26G85FYsaeHZbgItIwUEPEnC2rqH1161dF+VqE+F4r
         bA9bVxeaiWgNx/YM3e4naYIO8IohYD0uPG7Yq5r5uzGyim+ZudHAOrVL9bNaPwR14Ia7
         yt0S74q8YkizuHYB1CZr+t+Ph3vqoW95ArjHHxIIajgrO9i2Cn+sPojGbUbSvcRQjYqK
         P0pGL+kDNUC1n+gxOWL9aRJgK/dcjJBa/75SCnP+D5l7QjwNElF+bIbeito+UUoFbYuY
         69WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773072888; x=1773677688;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9LraJ5Ht3p9wtyRM/q/Y4auvM+543p7mKdm61Ee/tqo=;
        b=dYar58onWwxqbNA00k8bDDeEhGzWPxOl5V8khFVpJi6HVh8LUWCH99TdmXib+FjR0J
         YJSHggJTl/EqRTxHjgCVQ0YFOF6vQQ8GG3dsXwx8EopRkB+CoB6LDg849jb9WE0G8XSQ
         5nxazlT8Wbqp4+jVM5FHmEVC4r7EJp4yTRqIHbR1pzaGCT/GBK3nE/9tg1q/cNzk+k2W
         5pZjiPP0VnXPPyuUPe1wZwUP9l10RNMyJ7C/MzVBwicC4cyhoQBdvfvh8WE4zzTY7niU
         WRagnn29wLoBZ6gDCBj/15pbKdc+t+Vq4fYbxsN4NIg2DKHaZbdvQmC79ENTJzphdGYJ
         /tnQ==
X-Gm-Message-State: AOJu0YyNOGqfvpyVXMHympjKeC2I5vKabrNk+qwZGXdcG5i8y3xwQuXe
	dWF3LKEPHSViQX1vo4eudsvrpRf2Q5fh70PGksdN1gxqyHIvwVMwXc+ZQYG3g7fbsGRjSA==
X-Gm-Gg: ATEYQzy0OWV8OZsXZVNXJA+HSsEt4DAParIfSMrAP374XFep2mtMCw1DSPN2dmOSVEp
	o0Lf8RZv2aur+SNl9t375Z8MSwqqbNTwJEx1wgNfyeyFOVBCbsK7ATvt6sAEyMJ6ZYlWBcCNrvj
	WxIbGx7toDn7N+eYoVgn84xmvrVnwaDRmBYh2IoXilQm5A8n6k0g9NMRSIlqkfi6mtYO4MQ3p1Z
	R+8mAbX0djgBGGVAXa95NmiFTheT3rGyA+6cpCx+vEbOHbmARw5tBJfrWrXe1Lvp5xiHJoBQrsH
	mx8c/Ge3N+RaKpjY4u+6fm9L6MCBThwnlj19CXpvtseCjSCbtVpY5y2TrCZW9WjgnrTWoeki1V5
	p9QHKD4R4i01iU75XtQhcij36S0xsDc7knDG6VHKUj5JoV08qqDnhzaV2pJRz19DYz8JNwnQK3y
	xAVVqxlfXnCWk1b4jK
X-Received: by 2002:a05:600c:3f05:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-4853f723386mr38574475e9.15.1773072887490;
        Mon, 09 Mar 2026 09:14:47 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm2753885e9.10.2026.03.09.09.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:14:47 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:14:47 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com>
In-Reply-To: <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>
References: <20260301005019.2510157-1-objecting@objecting.org> <2026030908-destitute-rely-9997@gregkh> <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com>

9 Mar 2026 16:12:17 Josh Law <hlcj1234567@gmail.com>:

> 9 Mar 2026 16:09:27 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>
>> On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
>>> Signed-off-by: Josh Law <objecting@objecting.org>
>>
>> No changelog and your From: line does not match your signed-off-by:
>> line, as others have pointed out :(
>>
>> thanks,
>>
>> greg k-h
>
> I think I made V2s.

Oh and also I made 10 V2 patches, come on.. atleast ONE is useful for you
