Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE8E192D75
	for <linux-staging@lists.linux.dev>; Sat, 16 Nov 2024 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731743978; cv=none; b=g0IrPlidI/01NIK/tctMirbBLxrneMc9Rp+XVAUOaesxB/XCal/WvFcrUnyyBBZYnK4V1zcm7PGytzQZf93qUuj078psGemk29vfnqW4hAbO+xhQT5Vhs3WdCEpCsWqe583N+3cM5BWlIC2A4MOVN1sZOnOrc+vRVO8NE7dUSgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731743978; c=relaxed/simple;
	bh=syAVCylnhi0AytBImEtkvzButQ9wsAguk45yhcS0NNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOY2qm1QETPYvAKMBQMflfnqB9jYikZUevX4wttMEF688Y2Yo0fJS52u05OSaDMYAcN4Ixe1QxUY4W0OszD3WW+dI2aJwNW7ZhxhH6CmtL5wYqK1nLNpc//Nttams3CjgVMhTQhaPl+ghRI88H1E+voTU9OOHdICWxw9KlKMGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iSVYVP8a; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSVYVP8a"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315eac969aso14377195e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Nov 2024 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731743973; x=1732348773; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
        b=iSVYVP8aNNm6sPqyh2H4r1j8DSIC/VDwn+MWhI/tNCTa+EYGKsN+UB+dXjgtg/3Guj
         p2ZHJK0fOf3VsWSJWFICAFcrk4AKh1958pzNhqFfKfTcxaQN+H9CkxAFxbq/oY3kewFt
         YxJtd2pT/E6BQEemItKuu9QwXxctD5pcBzA5Y3s83YEI15RYnGtt1lXXCRDqRi+QjWhW
         BYQ44QrBWnhueSS+hh9bUClaFh5+CMzO0LtPmWRC8c7imWCUCRZRZOhTIhtXUL8T9r2h
         mYPqzIOJn2hRYG9xKYOVaPiBIbd1HsC4nPb4xLasubWJwJH0yM04Jn11ry6nUtXDaGhe
         7fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731743973; x=1732348773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
        b=Ddx5PEc+jL4LiT5MML1AY4jJ8HD6qkBBAUKPwtihGRZiJM1a5GgiAv0YVUMBncyvzl
         pxJt4SHNsVHjw5PB2Txnl4OkRH8LI2QBTUpsaVS6N3LltIXYbaQ0vKSEeR+Yj/Eb2XhM
         JA1h+CxFbkFUt7lXGm1EX7HgvlZDEHcqPfaufszbL2upnzSmVWCz9JO8ckbeC+rtaIg1
         DHbMjdE3oxfYHPAIgS9iZSSoHziYMpOkUtmgGP6ZJ8ZO5ZE8zOV3khHGNPnKsbDtoVho
         5qwwUSRd6qyLXT8dZ8KZP/8EQ2wu1gfkezw4khMq0P5GmfQr+//MSywGtlUeCY2GF4To
         v96Q==
X-Forwarded-Encrypted: i=1; AJvYcCUggsPoB0xJChzzk67sk6symEw9PdzQ39YneH/Kjc1r7ModeMcBr7q7jkSPS/DCvFmgckS3dS29ra9uwOvc@lists.linux.dev
X-Gm-Message-State: AOJu0YxbM8sQ8uzg+DmRshPYTkGsCauux4HnDYgjaK4UQIqhP4PIMIDM
	riZCBi1eAnHQ2sq5+OwsRCTW9PUL9eXdVwDT/shVhI4LZC+f2AlR3O8BuOBb9+g=
X-Google-Smtp-Source: AGHT+IHwPca/r8TengkDOJBkzNMy5+IC+M/DjfY5vaIp0XwfqGKX+JdkORZRtZVKPaDZkydKQ4+r2A==
X-Received: by 2002:a05:600c:19cb:b0:431:559d:4103 with SMTP id 5b1f17b1804b1-432defe3203mr49400585e9.7.1731743973417;
        Fri, 15 Nov 2024 23:59:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab806e1sm81445685e9.20.2024.11.15.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 23:59:32 -0800 (PST)
Date: Sat, 16 Nov 2024 10:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Louis Peens <louis.peens@corigine.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
	oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 19/22] livepatch: Convert timeouts to secs_to_jiffies()
Message-ID: <896c656f-6d8c-4337-8464-7557c43a80ab@stanley.mountain>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-19-19aadc34941b@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-19-19aadc34941b@linux.microsoft.com>

On Fri, Nov 15, 2024 at 09:22:49PM +0000, Easwar Hariharan wrote:
> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>  {
>  	pr_info("%s\n", __func__);
>  	schedule_delayed_work(&work,
> -		msecs_to_jiffies(1000 * 0));
> +		secs_to_jiffies(0));

Better to just call schedule_delayed_work(&work, 0);

>  	return 0;
>  }

regards,
dan carpenter
