Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C283A7F44
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072689; cv=none; b=Z/nAs1ZMm++aSwei3O+jXYu22LJzj/DH1nzG51EsKQnu0w/D123v/EU2AqogcRkq+lYDU3F/2erIch7kP0QHVT6z6G1FWIgCYylg3RbKICKVFlqwMEQ/Awx3l24/vBotwYiYy1iqZ3+GWUXZ5WaJiHqBQpeXM7CE9H2sgzyyEbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072689; c=relaxed/simple;
	bh=8myljXKa+bFkx/DlI80oMq+mPA1Dd1UPHTkVXCfmU5U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QL7GpKzr8/fCbzSEpwbraRVAmMa3I0L1ojVSgZCjgKAb7YZXdqW3vN835Ozq6WeiIoD8WWmh0eDL0/dTW8AIk8FIu5x1VFFRr6JA1qdZ25Zz2jsLjlpBF3pPwl2JzusJEpP2go3+aUt6vtCCTqRwIJNqIrBkkcSG3zrI1T6gk98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2PMEcAR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2PMEcAR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso19417935e9.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773072686; x=1773677486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8myljXKa+bFkx/DlI80oMq+mPA1Dd1UPHTkVXCfmU5U=;
        b=d2PMEcAR7i+k8jcc/VG30KL4CUsfV84ATMX1Y6szRREjXq4Wc5ACBmn+JXTb05l0va
         cZmH/mOdhyBu0xblDt59BVcwDyXMmpGfnfalFR64aecVRIEMmntiu6TtcXLCL12fFqm8
         x2os18Q3pRARycSc2yXSOJ+dKg7NXDfI8qtvtF5DcvqPnnplfRf+yb9/HyR2ue/uttlz
         pqNalBZCeIzDfGfzOS6WvT3vYSNhe0kON+bRVVWESS3U04pM5phVZyBsY3U6jkzZzKNj
         nA+rxxplfrMli2bj8liDLXPouT97DqDxFOUgfd8tP97Bnjygldwb1a5wTQCU0GVBEbEX
         BhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773072686; x=1773677486;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8myljXKa+bFkx/DlI80oMq+mPA1Dd1UPHTkVXCfmU5U=;
        b=J5j6cITvKgGjRWawSGlSRDhEZy1+KQuBU8QkolijNnyrBISW4alV4pF6aLjweAVePM
         lgO4cAfn74cq+oHGz5+PaaW1DUEMR22HsUPs6PuCMShucks6wd2YRgi5OaQR2jTK7UB8
         UK+5IxiJT+r8Orey6LvsUQ8S/XsKvt/vSc53NChnBvlEPyfHNagd3vvGb/aHGYFBQkmJ
         3kvbcwIRy+JutuwYKcIKNqbht1tR4xsnG6nYZv+THGu6mrxY19uFZTLTXHsRke38FE0F
         IJ7W8RV3VBI3Kli9p4h41gxJQilqORicL/LDMQoXIePXOtSQINNJ2yCirn6aWpDhuIK7
         k2Uw==
X-Gm-Message-State: AOJu0Ywai1a2bqcHTamqz5nW1emxHY8v1IdIURJw39dfsdX/bJY38oMa
	aFGOpbdQHlNaWVDGLMtff44v8lQlFg+BZNTOYAq9CyPPc8vNtKHwnHUSggaj9jdiYvymFQ==
X-Gm-Gg: ATEYQzxmXpSkCFgh0WPSal9/U314o0tcqyZ+Xx6thd1RUn+jQwHxVI2V8BHudPyYAqy
	hw62XSy5nAECnNPM3W/iA2qkLol1CdkkramDsfo32FZBnnLiywTXr9r5veznHX/r1fKuwH5jXPU
	BMhjrWBd5tp3ObgyLTCeBWdPQHZXQSIi7yCkbP07iawLgGHJstJRuT2tFxFig/W1b8iPABrK3bW
	TaLpa/LQfYBj11V1xMJL4lOQdXXFN2IA9gwEq68BTC4FGqJOgAC+BkCwivE4r3aEUBTuMkpdelr
	7cp6JNLcLEY/FR6RTQsq7+ZlV+kkji4z3mp7gGfE7J0X10hh0GDuBD1JgZuj8pV7ii+QAh84mFz
	F+HgLSHXs+omSYAIbgca3QVz3ywT6tHJdSCLgtjCHORDqYGHrTVL5wxWzK7DoIxEopbBBufI07M
	OYEIpZ9QSsZcGj0t4EenIymKIUR9U=
X-Received: by 2002:a05:600c:3ba1:b0:485:41a6:cecf with SMTP id 5b1f17b1804b1-48541a6cf24mr1868905e9.15.1773072686250;
        Mon, 09 Mar 2026 09:11:26 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm2183745e9.10.2026.03.09.09.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:11:26 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:11:25 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <07e2ae8e-e6e9-4def-9eb2-2c48ce6669b8@gmail.com>
In-Reply-To: <2026030914-task-stunned-21e0@gregkh>
References: <20260301005836.2513391-1-objecting@objecting.org> <2026030914-task-stunned-21e0@gregkh>
Subject: Re: [PATCH] staging: axis-fifo: minimize lock duration in write
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <07e2ae8e-e6e9-4def-9eb2-2c48ce6669b8@gmail.com>

9 Mar 2026 16:07:50 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

> On Sun, Mar 01, 2026 at 12:58:36AM +0000, Josh Law wrote:
>> Memory allocation and copy from user space with vmemdup_user() is relati=
vely slow and can sleep. Move it outside the lock to minimize the time the =
mutex is held, reducing contention for concurrent accesses.
>
> Something happened with your line wrapping :(
>
> And are you sure that your change works?=C2=A0 What is wrong with grabbin=
g
> the lock this way?
>
> thanks,
>
> greg k-h

The issue with grabbing the lock before vmemdup_user() is that the allocati=
on and user-space copy can take a significant amount of time and can sleep.

Also, it's just to be more efficient haha, and yes I'm sure this change wor=
ks, I own the hardware, and it operates better...


V/R




Josh law
