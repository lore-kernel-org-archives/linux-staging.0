Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483703C3F67
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472823; cv=none; b=dh2YwqUmSLOBK4UNV6z2IlnbaHlbcGpo5lm6uwzWyeONhzKaSFeocdwFjRkWPOoNKmKVcNUMBrZnOGwebYgBQD2JsjsI3nlvCyNi41WV9V5i05heolpMRB/oA3uRwuU1x5pFn53GDuLiAzClEo3Fwr4arNjWH/q/0llvi18hVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472823; c=relaxed/simple;
	bh=ac6tZgLnUNvpCiT3oBM1Q0XjYFyZen8Qw7kHMHY2Vkk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=avyxMgLddE8RyKEHNjN0rQxy+SbKphghJxuILlTiMvSObACChXckOQco6qTK9JzxhZGdHYSLlPYnETEeAsF/KZ71fjTKej5BKcYTDIjh0cLr8YeiBdyUC79qSn2Kk/RFPOeu4YdJHsHfA8R7mFGHUewVWal0Eqz77+PVaauKdMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT8sVF0j; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT8sVF0j"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so1428655e9.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789472819; x=1790077619; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XWLYzPKn9Z277Ee1TDtRp8i78DpmLDVKS5xGRIF3oZM=;
        b=lT8sVF0j6T2u7d+KvyU3a0MnutMfa+sGLEKz02kP9QztBcvuoFGsyQ4E0X3d6LFS0P
         Y1Dih2aPiBOCcaygJwepyezMSG4OVbSILFnDasxc3qCJm1BjLJACRP83OOya8u4WioE8
         DpZheumurUndvfG6EsV0ru1t6RulkmvPQ+ykcLa0f/Evj0QKAzEtzNsj0nT6Yq/UqtPs
         muXzmGUdMRPRPHIur5rwP+Dj0v8T6Vk24hTGUBJUuGWcm+/iScfgBpZGplzJh+nuAaWj
         7+Gb8hEO+k4MZL10v38h175gxPZzgW9KVUI/hewFl56TMlrv12DhCxUQvky1psdBiTIQ
         CQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472819; x=1790077619;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWLYzPKn9Z277Ee1TDtRp8i78DpmLDVKS5xGRIF3oZM=;
        b=N4Ko8bfNLNBd82WXvc463tjtX3x6lp90zGQL5t7sKXrfdxDzhET/rQEEouUBVvSRAD
         HWH+pdlPx8ch36VeW+1Ega2iMmiW3JXMIbJzjPZuP1ldwdeXik7qH15XjL98MhwamDVO
         9eeYNyk4xLMpj6lkPZgcSMMNpyz3SBCMwhULkdSyRILHZ8JmF00bmOJHvDxqJDgCT25x
         fqoP1fNawlFvcrKxwAu9V1kUwrTLoIdpCfdX5GVcpDYOKDp2eLSn6LPi7w9KuVheV86q
         dWnrDN3SFE7lPchanTyGJ3dmF5Vbim4LIvUXaGRpcHxZJyffGjA/iEEff9Z6O9Ecq9FU
         vLxg==
X-Forwarded-Encrypted: i=1; AKwUvBydEJkyRIRdfVgb8VEPLqbHYBJrTH5XqRQNhT1xGa2JpSTojwOtM2vIPFiyRvRvJxt0HCegISWs/q2joQL9@lists.linux.dev
X-Gm-Message-State: AFuF++kubBEwLJtVdFMjnqDmCJ/VQdTc684WVjfwAAtHuA6Ri4upA5Xl
	9qkYnltlTGyG84Bfiqh//k8jZgV19pGWR0wI5j1n7N4gPLAnCQgaLaa7
X-Gm-Gg: AYBFou3CZmmZgjJbH9VYxiwbEv+TtR4DL/l8q8yDvkuCkOOQrIGXbYlx5Fcg6sUYAOJ
	54JLAu/yJ75aWVsAGYJ+nZ21OdCnm6Eiii6Hmv/O/MLkRpeCrLM79f2LTJ1I29Y3J4i3eabUq3b
	pVIV4gWw/cPjboWRrI81C0yvp5vvAYUOCiKE3L2YixDm19MqJeJFOWu9S91JlncUduAAkAbB73v
	9KTj0PYn1BLGK9mZwlrrunDEvzrchUK6SoNBDVw+3vRSUewfyrl9VZeKMolzgks7HCizCyL2eor
	90f33wqbvnCRHCFUfqGvgB7mUX/vokHg1a75SwV0Lssn/Lis2m/u1R7IhRDv9EarYUEGnnuaCX9
	/WGthA8dh6TGop3ZGTUCQZptZhhVMgtws9VP/zpNQuIoYJ2xwd/Tcv2TiRUyUhRHe49x7EoEwfb
	bC+iTols6hr6eTMLqiWLdblXyGtMhlvoN+F8oXjX/tWiN8VCLG+KdQmuqlk97WepHWSf/9FBzM6
	kOs3QVXS0WthiLN/wC8Gfr46jHRdMlvQpK1qJ0RolrviXome8f3vf0v3juwCdFg7TEvC0Wl2E7f
	PyBpZZA/LCu4ndFNJ9jrrdfgp4jjccc5BRTozPZ/I2dumndkpozhlo5iwAKYKKQNxkK9z+QXx2L
	QavYHJd7hAXu0klwOH9kM/mpNylsTMog6kPt2+o6OL0tk/KDxVWQeUtmrd3/cmpA+tMbHqyDYiA
	qEfItYh1fmzgGGfOs=
X-Received: by 2002:a05:600c:1d0e:b0:49d:1a02:4797 with SMTP id 5b1f17b1804b1-49e8227fda2mr11731415e9.17.1789472819082;
        Tue, 15 Sep 2026 04:46:59 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef8a7b1sm53841325e9.12.2026.09.15.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:46:58 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:46:57 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Maxwell Doose" <maxwell@maxwelld.cc>
Cc: "Abdelnasser Hussein" <abdelnasserhussein11@gmail.com>,
 <jic23@kernel.org>, <gregkh@linuxfoundation.org>, <nuno.sa@analog.com>,
 <Michael.Hennerich@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <linux@analog.com>, <linux-iio@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI
 operations
Message-ID: <20260915134657.000016e8@gmail.com>
In-Reply-To: <DLFV0K85626F.2MUXL6JKFNF5H@maxwelld.cc>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
	<20260915075939.18180-3-abdelnasserhussein11@gmail.com>
	<DLFV0K85626F.2MUXL6JKFNF5H@maxwelld.cc>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 06:39:34 -0500
"Maxwell Doose" <maxwell@maxwelld.cc> wrote:

> On Tue Sep 15, 2026 at 2:59 AM CDT
> Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:
> 
> > The ad7816_spi_read() and ad7816_spi_write() functions perform a
> > sequence of GPIO state changes followed by an SPI transfer. If multiple
> > operations occur simultaneously, the GPIO state could be changed by one
> > thread while another is in the middle of a transfer, leading to a race
> > condition.
> >
> > Introduce a mutex to serialize the operations, ensuring that the GPIO
> > toggling and the SPI transfer are treated as a single atomic operation.
> > The mutex is placed right after the pointers in the device state
> > structure to avoid padding holes.
> >
> > Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> > ---
> >  drivers/staging/iio/adc/ad7816.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)  
> ...
> > @@ -47,6 +49,7 @@ struct ad7816_chip_info {
> >  	struct gpio_desc *rdwr_pin;
> >  	struct gpio_desc *convert_pin;
> >  	struct gpio_desc *busy_pin;
> > +	struct mutex lock; /* protect device state during SPI transfers */  
> 
> I'm a little on the fence about the comment but if it satisfies
> checkpatch then thats one less patch later.

It's perfectly fine to comment like this, especially since this seems to
be the style the driver uses.

-- 
Kind regards,
Joshua Crofts
