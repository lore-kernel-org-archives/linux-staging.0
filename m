Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F9366569
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063893; cv=none; b=R2iXREP1h+bvdMO8ToE//dDegZM4XF7lfe7iO0QR3jznv1R6zvwCgm0R2txkuxVUxhEisvkKenXnTn4Bt7QuYZ7D5HL3GDnBwSpFSIZIO6NXpsH7tbhwp5Mu3GJA8Id6d3ueqYZZArMJqnwLSvG6IEa+8JY+TD2Zz/etc5g2Dak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063893; c=relaxed/simple;
	bh=6DPXTQznbeRTX7f0ifOTeZ3YoaZSkHdQlEP01PRpIFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=US90s7NHal3uTyXmSDmadvnfEJKKGCA1P/zeGwzbpjZm2T21HLvHU/xiSIZjQrKpTQhokzZzy4fGFdtDaMxzL47pL7fKUEGvBS35tv3vgzXlUJhzDSYF2fBAChEP2je/PI2dKps1/RhWIEdoGealUfU73K0JtpjAO/uL7BcA0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB8KDn/h; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB8KDn/h"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso663553f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063890; x=1776668690; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRBxi9VXhNJNAcKSM1KuAwC9XmMF3xEafmK85DMI9C0=;
        b=GB8KDn/hCec+6jUDS2tOE9fwLB0vqAsQnyObwSNkvwO0RfQ4z2wZ8IKkD3G4TxKAWN
         fSAo9aLho84Ad0+k3gf7qqVg/j5j31QtWt5KKNjI1KyWceMilVjtqwSvd2j7DHsoIrRE
         17xWMQb/Nv0sAJ5ZOYrkg1lHoGdjNBEYCBYm/ZbjmaEgHJ3uDdJ0mQ0JP+3Be9nBg8Ff
         qcUFoPKNTUSlmCGuHdW+8vdfM+MQ/WYfqe3PrX7yxSYt3R8d519IuIphzIBsAVQeD8rU
         AhVwsRzDxZgeSpbCsCu6+ItLU9LqIXusQgeNX/BruOQY5Pue9BwrQcKmQKYGfkKx2C86
         0Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063890; x=1776668690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRBxi9VXhNJNAcKSM1KuAwC9XmMF3xEafmK85DMI9C0=;
        b=Iag+GmgFBFIYO2EezGXtcuxnX2pAiRusrb3faiIictleTNAzWSMHoX0sLYDKp5aBDJ
         hhxGwtD48EYrqWnC0ix5CjlwBI3152hoqHM8DXaALMARm9dOrSjiXYimDOxNk3iaho8R
         9UQmegZcWbxJMpT0CsA1psISH97EvRW1/U/6OqszysAkk6gTD54sHjYaPBjYL45lCdQc
         uHW6B8DEWbeCxgdRYCH79kEbhwBWdOAbuo1xPQmYFwKToGktdx/hVWsx7nPJiMDfS/9Z
         OX/5o/nF0yi0CJPWTdCg7fPaGM+HtfoL0ZX1rbX37rw8ES1S4qPp8Rt+29m8QBw7X3Z7
         MyAQ==
X-Forwarded-Encrypted: i=1; AFNElJ89XqOTtZxz/DQSdKyUKiyVBnUrW+MT3XXuUntnmOErE96HdeBX/faKsWpXz6nAqoV+R+Iv5+LK2A6SP/h/@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyo0r4uvtVWqqdFWSaV7f9jLGwdAL31HtWLDONXSzNylnXGpgG
	W/uzjgGtAhOpaEwF7OVKQZypr1CF/G2uC+v/maJIGeO2YvX89oKEpu0F
X-Gm-Gg: AeBDiev9zmmekf8yeiAlNcO30+LH02rGISQkL2HsFqoy6O5ZOqGoliVWnAMknPxR2Gw
	7UGvQs3ucpj3DDSVbr8yOAT6l9Q79E30gm00MFkZSDLXolN8Oap+/3oL1nElYqAt2tS/l20lDw7
	/bNyEXK7+LXJZJoPmYMB3BLAjBGkgYvhL8By11rRqHmGTTJU0Dn9wkU8CY/f1r+Rg4sXJW9J+GC
	GVzuYtQQTo4782TYHjPxqyYFYNyrOi5v71WLwL6FeKxlOLsfL/92nueMWwx5cKTutTtDJp2om85
	kx5Vi+y/8tCjg4FwgiPaI/KQKvzFTxdCncdIEj0rIl9fXHhffvi2u5T+daitKa/IR89ArqxbpER
	PdvvLzFDPnW6sykwEylhq/OvRtHqAaUSV1jkYqsL9t50ZTD+Mm6zybRtZqOn3KhdmA2j4BiGz+V
	ZKN9ZTnsjFclkw2E0mEnE=
X-Received: by 2002:a05:6000:400a:b0:43c:f4df:9245 with SMTP id ffacd0b85a97d-43d642cbb8bmr18191781f8f.47.1776063889770;
        Mon, 13 Apr 2026 00:04:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7794cce5sm7509912f8f.9.2026.04.13.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:04:49 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:04:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: audio: extract topology size retrieval into a
 helper
Message-ID: <adyVjoDaJoWqd-OV@stanley.mountain>
References: <20260411182055.24413-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411182055.24413-1-dennylin0707@gmail.com>

On Sat, Apr 11, 2026 at 06:20:55PM +0000, Hungyu Lin wrote:
> The topology retrieval code currently mixes the size query with
> allocation and data fetch in a single function.
> 
> Extract the size query into a helper to make the control flow clearer.
> 
> No functional change.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/greybus/audio_gb.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

I don't see how this is a cleanup at all...

If you were the maintainer of the code, then you could do whatever
you want, but this is your first kernel patch.

regards,
dan carpenter

