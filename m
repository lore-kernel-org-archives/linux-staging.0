Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657492C11D7
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951387; cv=pass; b=dq+D6BLI7muwXfMh6Cd40g4CxGgrr+I03D67+qehLFWzGk8+Ubq7YQFaymm2dbIh5Aeq4/30zMDgA/NS6aHgMqdT3xUoQNkU9ETcG/4y16EOyaygNywZD+Eo7WhcX6LI7eBiABOg9auK/t0SOliqn9KUHmVG8jsG7kHPFe5I3JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951387; c=relaxed/simple;
	bh=F/cep53Ywkv6YQpg2IYGnHWs7tOX/EjkwJiVvWu7UnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV/oRMRbIqGPHmigMn/HbWVnO0VCvCFBy+zsxv0clUfjBqhiNDCLHvgnswmSvyQQZdQDVbLTzj+XBqJ5Pv5s9LuBF1CjcVZJq8SfWhKSU0zE3Xrc9GQtiFj2MdaDVer5hH+2m0Mm6O9odPc4XFfzyKtt4x8JOfJk//QcMeyicg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQxyXk/b; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQxyXk/b"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c7963df6f17so4437697a12.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 06:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776951386; cv=none;
        d=google.com; s=arc-20240605;
        b=W3aIUL+0RflY4dd6KPvgwMNVXyLvRaBEkld7XGuhp333z59Ce+/ZMA1f28rAsI/6PD
         EgGxl04o8RYeBY/9fRoNV+THtdPkf8Qis0/leDav9+nQ9/NQqC+4C8HshzhzueFsDcx+
         9yCU97oli8K4bhI0jvzDNXJxEBqORPPxMwXeExPubIbCozsR5WkGrdZhYbsyzQO0+Kdm
         wz5Kw1rzGQyxHuJCEYp53p7ER6Ib6y9zPv5iA2rLwFcLa4vABBGgzRWoZioSLzV8IbRp
         vBrVVmvOKwPhGpqW6eMPbrkNmmbtJa3bOd9yLnVGAcuhuxc4zjqwC6dTm0bUdAWrKaRb
         zmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VhuOOby+gqJo2HpDu1be6m2G5DzT3bivgrqq1vW5a5g=;
        fh=iw1TgfA2fcGNgnJ7KBjQtRTDMXvRnrEAo4K6hx7jiIc=;
        b=UOHUBZYLZuaWjPBAvIqu70V5PkHFDTMTmaKwRMP0ZRvGUreb9/++ck+jXB6daeh3u9
         FQEDiEO9We4oro6AdaRqC4Sux5lO1+0c4lj9qBweVFWQLlTVLT7yCISRcuX1ZGxjeOF8
         pxtzYQxtqURWB+6WQnWolAL/URiiKlOtc/vqwHo/Tpyu/YhrmVStKX8tX8+MlnWqbMgj
         +qhA38VlfRxkzJTZW78t00giU4VVA6UVOnflpDUH4+/sJ6S/OLDq3/6IJ4aToFH8dgsJ
         50bqPxOquHipz+UzL/RPlmW1pGaZoP16pg/TGjfIFPekBg69SR7FyURZEtnP+FGbTDkh
         rzqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776951386; x=1777556186; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VhuOOby+gqJo2HpDu1be6m2G5DzT3bivgrqq1vW5a5g=;
        b=OQxyXk/b9j7xTq8dv8PO3qegcsvrdk2xlSX6WJu2DjgfBtgH5Vv4u5/nvIbgOHoHaq
         IFeuHAzxC1LPNkFEwGqiP8zAp3QtzoDCG8aalcTCy9hrBOnOPSLzLe4AgSD6FLPGjWmp
         fiLCdZcyNN02XCw5CfYnwymJLQesI/57feh6JmJsn2buN5ZFQ102pUnd1JDMcL7CK/fA
         9bzb5JoqOvUbVbxlu1XlQ73m+9cMqHtffVkVYJyH7248Bd9yUtsI+IKQRGt8OO4yIQsr
         DFC5wKKObGx67MhZcr0qDef1ziuFuBERQHHQpN+rcgrvM/gzdObwL5czdFNEgm29/WJ4
         Ho6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951386; x=1777556186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhuOOby+gqJo2HpDu1be6m2G5DzT3bivgrqq1vW5a5g=;
        b=BQ18FJRnKO0CsfSyPuq/ZXenPPizR9C8WGVtHr4/Fchz/3/4MKI1aLwVaUm6jktxxv
         7TmztUCWIuGpGzlPJbuXQou4m13k1rFS7/UJtCuBu8vUHQf4H1+MxN5UyZLrdoKyMy/U
         9mq/2fO1eLrRbJef3Z7AzW5dY2SyR9uhqhp5iFpShPEIFkttKIj16SdrRZa8Vh2BajQ+
         sOXulAwLmD/qig2JtRXawUwfYnWJTveQiIvEtiuYFF/f3shvzQdlJ2OZVcMhCJ5YaVhr
         lmo84f3BEu/u2/Z35nt8JbvVF4QUtu+YgtiSjSrz8wOjmUXABlxQtV3YP3OY9OUdo9Oq
         KDAw==
X-Forwarded-Encrypted: i=1; AFNElJ8/VQFfCZm7Vn94tyc2tI3l55EgWO4qvwDmc6QstsdG0CnRRsZ9M3Eujvo+uflCGKMF1ZrjQjKEl+1T1q0E@lists.linux.dev
X-Gm-Message-State: AOJu0YyzK132TAyMoY0f3JU31FZPAbeNZFKLKdUSwC3SDtprTRzewJp1
	zAA+u9AfkbHc5jDhAkvEuuPux7kb/vQWDrwm0HFnhbjqBqKIU/DQj80IHVmQu3Uf2/4eUH2NTB9
	thFpAdYJp5eQKOQwz2Ehu7UWG+ZauIk5DuI7HV2Vk3A==
X-Gm-Gg: AeBDieu2gDBOKY6VlZokFMIFTHwo8r6KAgpcDinus5gcqIO+k7YgGF9q3p/Xw3VQHY1
	v99RmJaFACFsEdtdc9+jpSbnrzlXb3ngmrIl9yTqe/SjMBGNFNXzwcksLEz+BxEAV0zBHp3iWun
	4yuvTdAXmdhRvFUoztZqo86RHZOXDTjNsE+g2pvjxl5r2qMaOnJtDAjMLtanbs1SFQZcUaSJm89
	hMpkI4HutC3PHWIYIuXeoN4DkE7uJ8qEaGfTz3LfCsT9xUzzRlmrcRCRWRcKkssU2GWOBhusoV+
	243x+nGL5l31KA==
X-Received: by 2002:a05:6a20:728c:b0:39b:e789:7d20 with SMTP id
 adf61e73a8af0-3a08d8d9d5bmr32380807637.44.1776951385500; Thu, 23 Apr 2026
 06:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260219171310.118170-1-aha310510@gmail.com> <2026042355-blighted-chewing-5e50@gregkh>
In-Reply-To: <2026042355-blighted-chewing-5e50@gregkh>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 23 Apr 2026 22:36:13 +0900
X-Gm-Features: AQROBzAosyDO_yslNQKDZhWDhMLXCShJ7vPs7duQruIbTcEGDHRZq9mj7spWcms
Message-ID: <CAO9qdTE0NhB58hqK8_1=69bD7uG_vF-FfpQXGR8dqcuWV4H2Mw@mail.gmail.com>
Subject: Re: [PATCH 5.10.y 00/15] timers: Provide timer_shutdown[_sync]()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, tglx@linutronix.de, Julia.Lawall@inria.fr, 
	akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, 
	peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, 
	viresh.kumar@linaro.org, zouyipeng@huawei.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Feb 20, 2026 at 02:12:55AM +0900, Jeongjun Park wrote:
> > The "timers: Provide timer_shutdown[_sync]()" patch series implemented a
> > useful feature that addresses various bugs caused by attempts to rearm
> > shutdown timers.
> >
> > https://lore.kernel.org/all/20221123201306.823305113@linutronix.de/
> >
> > However, this patch series was not fully backported to versions prior to
> > 6.2, requiring separate patches for older kernels if these bugs were
> > encountered.
> >
> > The biggest problem with this is that even if these bugs were discovered
> > and patched in the upstream kernel, if the maintainer or author didn't
> > create a separate backport patch for versions prior to 6.2, the bugs would
> > remain untouched in older kernels.
> >
> > Therefore, to reduce the hassle of having to write a separate patch, we
> > should backport the remaining unbackported commits from the
> > "timers: Provide timer_shutdown[_sync]()" patch series to versions prior
> > to 6.2.
> >
> > ---
> >  Documentation/RCU/Design/Requirements/Requirements.rst      |   2 +-
> >  Documentation/core-api/local_ops.rst                        |   2 +-
> >  Documentation/kernel-hacking/locking.rst                    |  17 ++---
> >  Documentation/timers/hrtimers.rst                           |   2 +-
> >  Documentation/translations/it_IT/kernel-hacking/locking.rst |  14 ++---
> >  arch/arm/mach-spear/time.c                                  |   8 +--
> >  drivers/bluetooth/hci_qca.c                                 |  10 ++-
> >  drivers/char/tpm/tpm-dev-common.c                           |   4 +-
> >  drivers/clocksource/arm_arch_timer.c                        |  12 ++--
> >  drivers/clocksource/timer-sp804.c                           |   6 +-
> >  drivers/staging/wlan-ng/hfa384x_usb.c                       |   4 +-
> >  drivers/staging/wlan-ng/prism2usb.c                         |   6 +-
> >  include/linux/timer.h                                       |  17 ++++-
> >  kernel/time/timer.c                                         | 316 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------
> >  net/sunrpc/xprt.c                                           |   2 +-
> >  15 files changed, 322 insertions(+), 100 deletions(-)
> >
>
> Ugh, I got the following build error for this series:
> ../drivers/misc/sgi-xp/xpc_partition.c: In function 'xpc_partition_disengaged':
> ../drivers/misc/sgi-xp/xpc_partition.c:294:25: error: implicit declaration of function 'del_singleshot_timer_sync' [-Werror=implicit-function-declaration]
>   294 |                         del_singleshot_timer_sync(&part->disengage_timer);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>

Oh dear. This issue occurred because commit 997754f114ef ("misc/sgi-xp:
Replace in_interrupt() usage") was merged into version 5.11-rc1 and was
therefore not backported to 5.10.y.

Since this is a simple fix that only requires adding this commit to this
patch series, I will quickly write and send you the v2 patch.

https://lore.kernel.org/all/20201119103151.ppo45mj53ulbxjx4@linutronix.de/

>
> Don't know what happened, but I'll go and drop them all now.
>
> Do you _REALLY_ need these in the 5.10.y kernel?  Who is going to use
> them?
>

You might think it is unnecessary, but I have seen bug patches related to
timer_shutdown[_sync]() being backported after I backported it, and I
believe it is well worth backporting if this feature allows various
bug-fixing patches to be backported smoothly.

> thanks,
>
> greg k-h

Regards,
Jeongjun Park
