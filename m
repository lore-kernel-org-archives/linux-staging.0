Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3663A545A
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675253; cv=none; b=YVCYjqcIivR3cl/1PUdA1qCNH9xGfI3iCZFh/BB7RK1Bg/zEgcBadZe4tEJEDzyNDOr5e07vMwfrINPOBvoPPKs4fVknNQVe9O3UJgOBexZajp0vSUOr7wZTW8I8uR21pmNaOlVABxvnxMCmE/xz0RMHJt5KogUBu1Bc65H14pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675253; c=relaxed/simple;
	bh=vnAQT9RE+vH5WujAQtXJhjlhKyLBsaJKnKkhLJ+BiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrlQCf8r6ltf3ho9i4dCN57CrbUzleN98MoWqCebXj5s073loyWrJoKJuROmuItjWIBDHI1F9p4nicuyhKcenft1+naVWDpitl388xutoInvE+nV5GiFrphm7jEPJGQoiaaHPjqEdbuRKvLGqISApwaP8s83JtbK5UUPlijSYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWIId3a0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWIId3a0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a126b79512so4049499e87.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773675247; x=1774280047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fc/Jm5bqQFiVZvJG+lB6MLj64d5j4WudtHzzE+s4ZA=;
        b=WWIId3a0RQKZ0WxyCwMNpe0tlSYcb5sKUZw7wEYP+48XZfCENeFTUg5F2sFRMzIXVz
         wmpoFOvIMVHzDSbnUZB0J4yAjH2OpAnMcap5QWgPLdQPbvPZjMlGKq5OdHQRQpKvMMLO
         gUoySXPyIy7Jm5Io8NmghKb/aHLcf2NkilkWHsR8hlF62oaznnoAdp9eHlU8G/dppNPA
         CboFW9JkdPxUa7gK99rpdk/66x9Y6xGnIrlR+MVj0lHJ8XSJos90fvHxZxJ0GieCGi61
         pGck/2ei8AGWjJX7p7bgaqPNSbXLy9jq49VMggtKgbbJ1lv11JwWm9XEb7Zq1G2OaDYi
         A0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675247; x=1774280047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fc/Jm5bqQFiVZvJG+lB6MLj64d5j4WudtHzzE+s4ZA=;
        b=C20D+IZZd+m5UKkCcwuPCTaScdTf6G1IK3TxaH+1jm2+xSAXIKBiP3PIZEgwl41fha
         C/X822E+I0UyobrBLxwKxAVDUmq68yiW6VsRbqB/1M8g9QRbgdDnpQE8NzJ9Hgs2rXQB
         0H3mK0rxxQBdXs0aVBp2zF8FZ0pY6EIMA0RbWjExM6gVIaVir/HWV6LFHM+cLmQKaqAk
         T+HXAZjReniRL4x4UBCs5CaupViIxz0/HkDyiA1odiyh70nxKBPOGHJ0mUvWb8XgmelB
         YQJnl1wwpmJDU0mEV11bzWcNHZBeldpcUJll9dYp24vBIEdnikIIHYZLfY7JbwbZqB3q
         6JiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Vv0wgpV7fBCIkOvFPuGZ3Lr9y5PWLmzWpQ3xBQqWCjiVkjPNnLBjBbt7r2aXgVB0LgJp1dDJrDvDyKPk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Sqms4J5QsWsDWm2gQO7donHR8lwyrgjyud2UmSPoQO0HI+tS
	nRJ7aWdgKLfCwkDjh4Jp71WowhnZMNL46Hq1gDDlDa5BHPXfLwqyd+TpjdEyzmVIUDI=
X-Gm-Gg: ATEYQzy8D2kcIugYamU6AbxIpedZHRUCKDF7LBF/rmAPD0c2KR1MyIMQxnE1wQA2LOv
	shsso0xcaImV4CklDW2MviGn7a3Cr8LRWFqhWmz0MNmQSdlpYY2ybCu09pWJ8Ttlua6JWubn/gy
	wt9en5XX2IvqQcLz+v87ocsz4FcQr2uZXqrJXwkmdFyLloArmn7qYqeSe9PCACVKe5bi8Wg7R20
	+521GDA/kLds/93EeS1JjVXRB+r8PdcCVlLhly5R6Otsowp1L4p2oM5QahfwUoMrGuHFvL7d+Qd
	usauY8EDdhX+VYiPU7VcZXxFKfYpXaQEyhSVvaboPKPeNSWVA8kBSXaz81vNsDp3RBuA+mLXNt3
	9y90lKPRaZFyO1zIBQmRc+Mt2TtBVlc2A6bXXGSAqklkTNYcVe+GGVfiVsPOp3MMFYk3ZV1oFIf
	Z6/hPUZ+cOcdkG9ol92uo6RHPrD8on
X-Received: by 2002:ac2:4428:0:b0:5a1:19fc:4755 with SMTP id 2adb3069b0e04-5a162b44e02mr3452856e87.44.1773675247207;
        Mon, 16 Mar 2026 08:34:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm3547139e87.18.2026.03.16.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:34:06 -0700 (PDT)
Date: Mon, 16 Mar 2026 18:34:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Message-ID: <abgi67iUDltHbfNM@stanley.mountain>
References: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316152340.238100-1-ss22.kern.dev@gmail.com>

On Mon, Mar 16, 2026 at 08:53:39PM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..f4709b2c4f41 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -958,8 +958,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
>  						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
>  						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
>  						ret = av7110_av_start_play(av7110, RP_AV);
> -						if (!ret)
> -							demux->playing = 1;
> +						demux->playing = (ret) ? true : false

This isn't an improvement.  Sorry.

regards,
dan carpenter

