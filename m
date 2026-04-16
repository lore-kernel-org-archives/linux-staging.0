Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F38F39184B
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 21:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776373876; cv=none; b=a3qGA3L+uZY+EOEIGylzKgYyyrp4s1JNs8D4vO6T03RR55/KjJAeDrBrT40nm6HFLywBBkrXbUlF3MwQL7sCHk7XcSi8X5WmrsBGkurdTeok0TGAaM8GHy3+W77nghdY5JFORWxoBupTKZQ8P0ZytQfe2NVH2xA9+0HrNMz+XcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776373876; c=relaxed/simple;
	bh=vM2pTl3oQ07zH2q7xfU4RWedwvGF2eYv3t6c6cn3grI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnC5DVlyjFr1QQqwM3VCprvnCqtXcPYXxVWeMkwpPfkqDLVYqSwhTEvZzh6QGi3qjxMa0YlGZYnnXO1v0AfChOdIVF+loV7Ue9Se2k2dodqYBztXgoxLrVnD7EjUfzQbm51MhL3TA/zGE5hhC2gvpcDOyTIOB/a6lC/4JZTcedw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTT4GOOo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTT4GOOo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4888375f735so84640265e9.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 14:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776373871; x=1776978671; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wVY+JkCF1HjvxGCLIBbX5MkwJ+xH0imUdXD/TgdOXrQ=;
        b=KTT4GOOoGmBRRunxG+DKFVpVeEq1w9L9WXalJXQd1Hw/Or9ph4VNKTrEwejB2SKDd+
         7NjpOfZjn69YMnoV39EF9pR579TwcIVbiW4GwjLw/3rggk+ZaelxqpszZvJwQka6C/x+
         gm1OTWYFxWOyVelymgOn/LQ5R5RAhub+QcjYgjaQ8kul/974ex2Q2fdTqZ0v27h/mJjz
         bCzTf4dcDy+FBlC+IjZwFYqqIO5LS7NmH44ORVUXq31r6Fbtni46BKZ0tKuJQpSW4KIv
         bZWi2nsh4ZFGvbHTN7IXKh0noBIIFzOh0uJW6Rkxtwkcb4rPIBTzRhfVwKHQbNHhQnVI
         f40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373871; x=1776978671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVY+JkCF1HjvxGCLIBbX5MkwJ+xH0imUdXD/TgdOXrQ=;
        b=F43oe/7HsBVw997Masq9oKAHgwySacIENWw9pytfwY8DZzc5rc9LL/oenMY+wdegku
         WTQbLA7K2DXc4HSliqxoxzVq3JgD5H724dxBMyORvFcLloHJlvm6YGRANJAQRzP9Ns3g
         /M+DW0eccFHB6UtkPmFTtit/9Z4/BLAJFxBOQfaw5RexPUe5gavjIUlCk1s6+FAp+bT4
         u8IxHJco6gg2HzmMa+xMXH4l9OlJI5btKKjTKjftKavWP6N2A+MNAXTfxWpR8IRcrXPe
         bzqDP2vTCu/GU3tMsKfQvPxwWr/iSe6rCnnZR9eOFM9VuG1xNIwd1WY9YSmPcsPtLnlZ
         jGoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DRmCfO3Esq3QsxZGRhC76qq+HdCPfbg9Qx/XbSXndVuGPUVMQmXUrZVoNgkhaZ8suev4+mVm8EE+QNmZO@lists.linux.dev
X-Gm-Message-State: AOJu0YzMxFnZ8c/Xdrh5ZZTMOifdfCTnTngKjZFhFVxikEQR4OVDUe8i
	KAbHgtcvE2kER5CP27ylne0+ekzHLhOfg9nGdj9DOIaAeadD98K/rCVR
X-Gm-Gg: AeBDieuMzWKUkArgKYCvjxWENQK402WJbS2dyhpIipLYYwFW9cHQM5Q0Q9MSfXVY2Q7
	fycnqWL/LkzMCfzGdeKm6KduILjICNDPApiaJj6EBQG9cNAmcSurAVmYDPWyUIOgoCyrx0NdGuR
	cW0mG+cDfU5kPYMNnSEiuCdqa28TOE1SXEeCDCFiaKIPfU9Dhq+Y+glDlivkt+f4L3JRD5xLDDv
	1g0D6641fnexARJ4ejl/kevMPFU4qz5dhMjKBg4smjDQKEkhBHA15U+PtPuYZAFayr2dfPauLUD
	cjZQ5kYxvBFQ+iv/aGKxy73g/0/1zIrz86TkqKrVUx4NCuHP/VUt3xRBLIYcSzd1kViicp7Pt3L
	kvm4TgyI5fpnCeKiJMlKxZRRL6/kz7M6O7k7OHCvFqD9xXYWBy64VWj52RxJQkdT8SMgaUN+K+D
	MZ57e2/aYGilDPcKib1FOjoD8QXv/dXQ==
X-Received: by 2002:a05:6000:1788:b0:43d:1c39:593c with SMTP id ffacd0b85a97d-43fe3dfbcb8mr144860f8f.30.1776373871208;
        Thu, 16 Apr 2026 14:11:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35bf1esm17407209f8f.16.2026.04.16.14.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:11:10 -0700 (PDT)
Date: Fri, 17 Apr 2026 00:11:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	starpt.official@gmail.com, straube.linux@gmail.com,
	sameekshasankpal@gmail.com, arthur.stupa@gmail.com,
	luka.gejak@linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix stainfo check in
 rtw_aes_decrypt
Message-ID: <aeFQahNYAUin1p3I@stanley.mountain>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com>
 <20260416195338.324428-1-mpikhotskyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416195338.324428-1-mpikhotskyi@gmail.com>

On Thu, Apr 16, 2026 at 11:53:37PM +0400, Maksym Pikhotskyi wrote:
> The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
> Invert the guard, so it returns _FAIL on invalid pointer.
> 
> Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo check")
> Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
> ---

Ugh.  Crap.  Thanks.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

