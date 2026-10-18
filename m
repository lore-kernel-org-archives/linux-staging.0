Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395A4B923B
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333078; cv=none; b=Cvv86uObpZ2+1fEE2F7xdD8biIPhwFBoHEaZVXyHl3ffuRyb/nVmkXK4MUDlXIPirMpDz2ONuN0Nc23Dcf1obR1Z6QBBDOL73EKKpBJ93nH+bJKomFQSPtcPHVfC9ZYPQjHtebHkHYrkpsgWeX50xHGT0LddV1wITzWsNYDpOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333078; c=relaxed/simple;
	bh=sMAGYXfL6F+KPL2Dc1+aS/NnJ49VuStS3WCXoMwzeQw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LGjKEP8cvlVi/Ug0cspn/KgJeyiyOwx0DV9TBQvAphy182BpRuw4NXT951pGwoYXhD2VMDOcYcE/Fbz1peilIYFKAi7qvTMGgROg6kgqOMRooG6/qiSmwKHW/txBgFYOlsRpgJIh4A5Y/WaakeEJAVu7jEHbdVhlVZTxRtz/uwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C21bJfyj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C21bJfyj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so2297485e9.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333074; x=1792937874; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N5MgBRSHIYkyWj1heAuhLcTUma/UABuoBxMG8V8kVpc=;
        b=C21bJfyj/w0+ssx5yDeDvBcpRd00k7XNLwFUwz364UoIJh65GS/NkZ/+hTPdnQnr2h
         l5k1kPVnbKYdh/xDze2sdF0t9BbRnYdXXKOiqzD5Ip97PTS6mqYYigGngfDHQNDD+Qi8
         vTAEQYt2t3vmbOsEyb8RCHnXDE46pYSpvsFFzwQfJObVmhneRW6v90uZi5in0nk2YpCh
         V3lekkzdgiLR+8er5U/hRikl73/BDph7/8fnKYZ91P3Mbb6r0kJP3S9MJQ7dDe0ffP9p
         Qxiav92w67Ype8+ix8wiYslwtvF/msVNkb9OyqM3XOkLUH9aIsEYfqxf+pUKW+GujUQ0
         Cu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333074; x=1792937874;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5MgBRSHIYkyWj1heAuhLcTUma/UABuoBxMG8V8kVpc=;
        b=EMgLdsoLR5mQt9r60rkz3ko43shWm0NoLDUdgqiKuREhaju/SodWuacbmeTLk7lScc
         HtPPFCRt82B1Kqn0Bts3JxQuVm1cnG2ht7Feq4QufCPkRrVwL+3pltQuNH9KcyNW4ZZd
         ss8uFA8UrTExNnZBAm+rP6haxxT8kBqyedXgAuq+Xi/jxIIMVOqAb6LUtZY9WEQU4nE4
         M4N9BclSUFuBBe9f9M+009iYlLbhB9P2Lh0nmv71uvFHP6FdyLsMJuU/1kx6o12cfqCQ
         XfRdwQVaZelF2V3SI1YnsyIGww3z4n9pWIEjbUgGS7PHayrH58kIJp8HwQfwdTLCf9Re
         tFSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxQqPMN5Pgsxx/601VVNXwD1yPaX2dDnC07OiB3eiyWUCFh0i9Ow1ancQSE+eWT3J1hDlGQpABY4g08KIh@lists.linux.dev
X-Gm-Message-State: AFq9FYIpURe8WdirGfZJEX/6PXV8nXnCyuwQTuEdnRCrAcJ6yq/E3tVc
	SgOMXAWX8UYxiJQkLEkxrmoJmFguYnrX5ZRNACEOUhvQwnG3JJ6YkPKIKj4uAOfGQDfjP9AT
X-Gm-Gg: AYBFou2ZXlGTAGuO3mZ2EPq6poL3PkuFq434buH5pilAFRYOk2y/NuMhPkG+svmrj6U
	4+ym0Qpp7dw/ZEZ0Qjx+b74IL9yxFtPx3K7QaxPbbUR+xdMBehOU0+EG4vKPWQ3AdwDN0hAvhfh
	8QxyZom477GChXVgzHWiYZMB104EbCcRj2mpPPhXrSp4qFPU2PLf1xKBMTr5BRuiYuYlYoZpL4o
	Cq7tq8lXijiABgVvW7h83TadlK8Ak2LmMb0jrcKm5fVAWDyD61bLGL86dlTDjrnO0ytptnEfe8Y
	Wrk4DN2dVVq50xjHmhJBrX13FjR/x7+Gd9j1DiWO/584nwU3whlcQGSlQmZBlC2coH8KhFa4DF9
	2+jbSut+0ODTCfIjL7EELiXo+TyreSNcD9wtMqJ/WtZzstL4Lr4pyPEbWL53vhLVA4UViCOe+Zn
	STFWq65RSR9LjO9P6OKXjDgak8paB/IO21yA1qMS3SujvUvX6boaNKRp+RRHb9aJIQ/d8jUob6g
	w==
X-Received: by 2002:a05:600c:3b1c:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a1d75f9857mr104356965e9.13.1792333074484;
        Sun, 18 Oct 2026 07:17:54 -0700 (PDT)
Received: from [192.168.0.50] ([102.91.104.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm112503505e9.5.2026.10.18.07.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:17:54 -0700 (PDT)
Message-ID: <8a960200525367f0fadca6b83ca57273e469f225.camel@gmail.com>
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match
 open parenthesis
From: Comfort Oyewole <coyewole7@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Date: Sun, 18 Oct 2026 15:16:20 +0100
In-Reply-To: <2026101838-factoid-filling-ce0d@gregkh>
References: <atTIKehBxn93Lcix@ubuntu>
	 <2026101838-factoid-filling-ce0d@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
match open parenthesis
Date: 10/18/2026 02:30:05 PM

On Sun, Oct 18, 2026 at 02:22:49PM +0100, Comfort Oyewole wrote:
> Fix the alignment issue in order to adhere to kernel coding style
>=20
> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
> ---
>  drivers/comedi/comedi_fops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This is not a staging driver, why is staging in the subject line and the
cc list?
Sorry, I made a mistake while working on my first patch. I just realised th=
e staging drivers are located under drivers/staging dir.
Is there anything I can do to correct this?

thanks,

greg k-h
