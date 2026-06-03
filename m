Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809D344025
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456847; cv=pass; b=aXBBUPL/PCmJGfYGYY1oyy/3iTi12gYwb2FuxqxomzLylRgqSNhLlnMvXvXUgc9IsWO4URFAZnMjZt42HtxSSgUM8u+7AtC/nDFt7lnmKPB/ptSaRorcGr0GPR6wfi7wDlmTwmMr+z92jX5QdphHaQPnWelXZIuH9rO2TtzAo/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456847; c=relaxed/simple;
	bh=1HQZCNyr96mskZ1PHLWyTIOXLd09sL67PDp7hgXJ4BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYW9aMHBSnU7VkkGPQXiwzj070c83jOMmLq0m9wNCHy2oVgJkJVzDT8xpwuNqKt0EsodPVRfzubfZHKjZLkVyyZaCN80/DeW7JPYjqCxG4i4VSSmPgheBy/ldsKgTVSnCA2PGZPsPHauJp3onqt4oVjgn0fwEJgTWip85mTy2zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPQ/3Jw5; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPQ/3Jw5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1398524a91.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 20:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780456846; cv=none;
        d=google.com; s=arc-20240605;
        b=HIAtfGGZboe7AAMycKb9i2VUKMBxf4ldtM7aK8fhkm7mdrVNdbdzLb8bzuLhnzuF6x
         Gv7Tkla7sKfccQzLBbAVfr7gV4ATZ+TNHPWoP8ijRKrWUGiVk7GBC1nU4VO9+OE6BErL
         uUf/3CBGZ03ooesKIYe3A+mvqJXndaYZmVc/nIInmjNyoeJ1BvVNLLg0VnBUXjhXxQOR
         PxLXHybcLNeqemi68tcWzEJtEY4kyVs0pU3tU77BdlsIdmRPPsgZBs93QmZrgY2m/0J6
         WNzIsrZkrOwCmJFgR5lGgSzhxAcY7lDn+P8fiFF1aYrgOauLqF/9UoxQeE9xsH5wPEwj
         28vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1HQZCNyr96mskZ1PHLWyTIOXLd09sL67PDp7hgXJ4BE=;
        fh=ZpKy+ZQ/fjsBcnTuzjLu4dC2NIianyhFOVYiqt4gzqo=;
        b=FvSSNt7xZJZjWlOf1yFJSic9yFEG5Ldnduo1K6MJQ2GkQmJWMyaiWzwz9jhCFJO0QG
         Wdmns8CaEM6fwjnS48fzu3Wm8PjNMqlhX5ZNvKHUy/tr8IGHYs9cVPQiZT4VAU78ZJgq
         UQEjG5zEorswyFtYVIVxIVbZxaCAqMXEPGByzJ3FPx+9lI2MHUxYwGIQv1G0UUoZvBb6
         H30LqYfOvv+6apVsE+5hSCi/LUgoiflKwROigz84buHDX8wchzHLtx1FCrHbiPfP8zNb
         wZ6AubAm6Rdi8HS4fvqTsjpOQ13c5bIH6XAEJb9r0ngt6lEAXLp5w7h3szSHYZBUSlkN
         +ebA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456846; x=1781061646; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HQZCNyr96mskZ1PHLWyTIOXLd09sL67PDp7hgXJ4BE=;
        b=lPQ/3Jw5unxSzKnxswnZrvcNZm1sklma8Oyk91pBYdYOaAYjmlOZcTYq3YdRwCWGDH
         sOrnPzndEl+VTi0ZVPcOgNOeCnbM++Tu/it4uEv0UZA3Dq/q+fILkQ5wCDk3DYL9jTWa
         yo3uvKYKmY4w4tfl68qa2SPR/WQFqR0k/rVkwQ4f6g9+Dz49ulTXg9OOih39PYXLIZMv
         hMMouHeMGpe1MPHkAOFyDquAolQRB4kSfKV50qHKCozgWv2YW0Ss0wGzX7yPqxQdVysm
         /Yfga3su4WsVOhJqtlhFIeHRMpP+450alk2bcKwZCE4GqGVUkQhlZ6qLUuh7y+j/dln3
         cI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456846; x=1781061646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HQZCNyr96mskZ1PHLWyTIOXLd09sL67PDp7hgXJ4BE=;
        b=eRcj7MorlJ5rD8oe1IwqHy6onTH9/PObNH1QkF0tctKbhRCc+L5aM3pArNnQDVntxT
         kdKuZFcJR8vaZ0xYSC0+MkPlofcpKy9NE+sG/yaVyZ00rPJjnjazoAsSH6/qfl/tQByL
         taVMCQ5yKjVcjtGsPtxS6JU/zgcGcv+dwLOQzTEVchI40vIQw+bs6VtwuiOb5eIjgZBS
         s5KjSZIRqteVa4G8dl292isPy2fdLh8FAXHFeNa7NEjxEQbMqKkqw1cGMvGxvPpqTfdo
         NoaqGvaiY5EgHXFSGUHYpVU/L+gX+IVJqFYYudLUyDu1ZH9iSXjQRvWh6yvzr6VVKHN8
         tDyw==
X-Forwarded-Encrypted: i=1; AFNElJ+qqotZdav9kqUbKee4yADdhS1O+UdHq9N+PW/4UjL3gx4nEHMXJn4Zb3rL7UoSoTZc1H/I9mH1O+/hswh6@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu3Vtt0cxWVYCiPXCKjsqYZB7YIGrJ35/j3jaeuDpKNvIPoJ4+
	rP7J5zQJMgqZ/DbwFSAMrrXm2ji/xwMkC+nBfqyJ8pZmPLiiKvu9wUZLGoYgyoiIFpsOd+LkvYt
	9DN2QUDJVhBNaFb7iFosTcee4w2WXKxY=
X-Gm-Gg: Acq92OE81Qj2uo/HYe8uTwvGpg2rvhvJP9zICBut4gAWApgbbdShqqVmob94bGI/Aco
	8bF0nTqTuMS0B+c1NSQefTQGJY+pLM/OElG/X06CFuxapBoe4mv+yDNRHEyHF8XXAgPD+rKqrzE
	4Y+x0wt0QxRkJXQzLwyuHyYFIkHHbh31OgDT8AJ+y4CTIWtfYmTZ3HNjBvApqlkwZhRPo85hxdg
	H4R6OTl/ritHNe5h2C7KDguepf4lkGzpiWVPQJR/Ld+nxJcBFGYBZ6m3vs4v+Z4bMutzLW0bWv/
	UKReIMQX+/S/iFETRcY=
X-Received: by 2002:a17:90b:4f85:b0:36d:f28b:72e0 with SMTP id
 98e67ed59e1d1-36e30f0eb4cmr1579152a91.12.1780456845749; Tue, 02 Jun 2026
 20:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602103208.15799-1-dogestad24@gmail.com> <ah7AYukZ5uzW1NVU@stanley.mountain>
 <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>
 <ah7Wn3-meqmDLk_d@stanley.mountain> <9372087b-82d6-43a2-bda2-02ba481fbf8c@gmail.com>
 <CAD03fjZdaFPAy3qr8zM-Nn8wNdRG7Sz6i5+6tNLHx1sbd551Tg@mail.gmail.com>
In-Reply-To: <CAD03fjZdaFPAy3qr8zM-Nn8wNdRG7Sz6i5+6tNLHx1sbd551Tg@mail.gmail.com>
From: Grewstad <dogestad24@gmail.com>
Date: Wed, 3 Jun 2026 08:50:32 +0530
X-Gm-Features: AVHnY4JEDV655RZOklrLzIaDxZRB-uzpNv-0Qlljurl9ipvKUG64BjMc1L96Dt4
Message-ID: <CAD03fjb2WJM++ymkdqWs8CTEatevJB8iYNjsqDYe81y27iDfXg@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Jacob Feder <jacobsfeder@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Follow-up:
Worst-case scenario, a large group of people is using the driver,
they will complain and we can always bring it back,

Thanks,
Arihan Bhor

On Wed, Jun 3, 2026 at 8:48=E2=80=AFAM Grewstad <dogestad24@gmail.com> wrot=
e:
>
> On Wed, Jun 3, 2026 at 2:56=E2=80=AFAM Ovidiu Panait
> <ovidiu.panait.oss@gmail.com> wrote:
>
> > I was using this driver to play around with an FPGA board I have (Arty
> > Z7-20), so not for commercial purposes. This IP provides a convenient
> > way to move data to/from a custom IP in the FPGA. I am using it mostly
> > for testing.
>
> Are you still using it?
>
> > I think there are no in-tree users mainly because the IP it talks to
> > lives in the FPGA fabric, and drivers for custom FPGA IP blocks
> > generally don't get upstreamed.
> >
> > However, there is the problem of what subsystem this belongs to. It was
> > suggested to be turned into a DMA controller to get it moved out of sta=
ging:
> > https://lore.kernel.org/all/20260227-unboxed-customary-7ce6eda1858c@spu=
d/
>
> This is the main reason i suggested its deletion. it is very difficult to=
 group
> it into any particular subsystem because at a low level it is just a
> 'dumb buffer'. If we do not know its end users and which software uses it=
,
> it will probably be very difficult to move it out of staging.
>
> > Here are people using it and running into issues in Jan 2025.
> > https://adaptivesupport.amd.com/s/question/0D54U00008zRBdISAW/vitis-is-=
not-creating-a-driver-entry-for-axififomm-43?language=3Dzh_CN
> > Someone provides a work around:
> > https://adaptivesupport.amd.com/s/question/0D54U00008sLBuMSAW/how-to-us=
e-the-axi-stream-fifo-drivers-xllfifoh-xllfifogc-etc-in-the-project?languag=
e=3Den_US
> > Then Ovidiu Panait fixed the bug in Sep by adding the correct
> > compatible.
>
> There are obviously some users, but in my honest opinion too few,
> too minor and too unverified to justify its maintenance in the kernel,
> especially because we have no feedback loop for the development of the
> driver.
>
> >I =E2=80=99ve gotten a few emails over the years from people using it, a=
nd there is also development happening in parallel on the original github r=
epo:
> > https://github.com/jacobfeder/axisfifo
>
> This project has basically ground to a halt now, three commits in 2025 an=
d
> basically dead for a year now.
>
> Thanks,
> Arihan Bhor
>
>
> > But I am not sure that this fits as a DMA controller, as it has no DMA
> > capabilities. The CPU moves every word individually to and from a regis=
ter.
> >
> > My understanding is that the real Xilinx dmaengine IP is
> > drivers/dma/xilinx/xilinx_dma.c and this IP is just a simpler, register
> > based alternative to move data between the CPU and the FPGA fabric.
