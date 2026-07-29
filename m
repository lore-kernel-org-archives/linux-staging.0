Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42A2D73A1
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317540; cv=none; b=fQtZFFf3zd2EQsMZ839RPmKI+MgzLEUxJGy/JR69GfY+Vqy1Y09iNZD5WBrw7EySQuQG6ikDfEQXU9txnbn6ovLIt4db6NPjGTvZTAlfHzx791CP3m8hpcnn2Vct/jcSnCFJ6jXH5OVkTDEeOqWf3O+0e2Hg8QZvtOQU01EDUCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317540; c=relaxed/simple;
	bh=q2xL6VeriZNLV9irWaDD59G0rqrKzpO12Zt4CjzhmwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+ClH4kRGk8pQ/yJ4d6D5D0w4nKQFF1n9yCvFW1rM2LtJsO6WQqlGnPXKnmAQ3OG2+36jVElvRz/nvxwaWj8UHyOvS8d7NEu7E3TVh5SKjnL1eoQ6tSgHAaFMYJGTnKhsQb/2boFDr5WbkYd7qyXaPuXFrItj7kZbeYqe9/X6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcsppCq+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcsppCq+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so11260845ad.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 02:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317539; x=1785922339; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNbmK5xtco0EON8/+ck6zecxuuqfThAYdAc5mLKxywE=;
        b=PcsppCq+OH4MCE0KtAKf8Wh3EP0JsNXyelQRffdrv4TBJfq1380gugTrNj/MOs0O81
         QxFL+cV8EDlhHF+7zU9lLWO5IbsrfV2oYVXKnvFJ4pvwXGxUCd3BUJufd+I5CHto79sc
         iNbBccBlZGCsUGyqx+YJV5or9tM7OGvnOalVsuXnQpDYOx+eDYzhqGzoF8G5W2n2UST1
         N/5NwEYKSi2Vgpzm+jwI0LLsHgZmf8V7EcB5Zdlq+2nr0y3YM1Uv3ZLuqtTn2V534WMN
         uJQ6DcmL9tAlYH+WkZ+0mE4KX1+O7cTl7EAFF47z/JRpIIwFmGs+mJzPYlBN4jlqVDLb
         qBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317539; x=1785922339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNbmK5xtco0EON8/+ck6zecxuuqfThAYdAc5mLKxywE=;
        b=IFXZ9yDnrGAmxTR7whoKcicdYMbjMrlluJdB8YkMnHrKT1ayTKHjUNySPW5mfGa5hE
         5xEEKxAQTOLEBPk8KwlZmNcpNVZuHDWP1hc6mzHN6GFhnD6Z/cvzNW10ol+9DG/ZEyU3
         cANxmqWaf88SlRS2Akyg9WgEVVO4gfoSM5TQvBjnxkioLkyHLr85loMhndKIiZK3RoOw
         x8f+0UqnsINX7B2zT8M6Rq/NYQR9lsNLSx08cuv33d0BFi0ebJ0wEecy61dparebWBu/
         gg6PRDiyfpQL+F3zKk25MhB8VG2H0fsyyZwR6izhYyFuniceNQsiitEPAbTcAiKq6YIW
         4u4w==
X-Forwarded-Encrypted: i=1; AHgh+RplUqLbDKzcwMIPxCjkYu7J4UVPWlTbQqf+sBDIPwt4qFr1P8dMyQEt/CYtQi+LE/Bulv/Q9WL0xKhM/ldL@lists.linux.dev
X-Gm-Message-State: AOJu0YzzwIb65Wmuf3bzr1zPqslQH5tRYJD4e/k1KxlbbFfrk7thIHO2
	esluoj2mZi6tP6b1LHN0ytCxDD/gD7VvanmGkkS4lcihg8c8NsGqvLeCR5bOLg8lD/4=
X-Gm-Gg: AR+sD10aw4VmvxuRfhSakHAaPsP+lLDkgNyZOTHeebKeSdEq88LlWQ7k8jKK0sLNAHN
	LQLqnBcsv75e5lUz1cNcW1e5Npq7zw+j4q9Or+9Su7GCGL0RXn02SnRkXtDPlUIODgmbEq7y8CF
	Kx+XHcdrl+64C8U1HkIU/AYcyALLp/lHw025MNqTPOnRKdM8j13ytOq+mTeZHmnBlzZ6Bwju/15
	3nZhQL8/DQyQo82HH0R1AqaxkeZ4Lvoz1PGha1C6LXa1K7azmVD8if73SHAumgR8fX+RtQt1zKj
	IzzIR710ujN7f3lmCd3HG7XwrsR3IEuTK0O+58KYk7jWW8iy9BZ2HDxkWUE4J8ELnjbqExzVn9v
	v3v8UVljCC1wk+YWpnvR8QASZC0bea5Ip6d4WacCYYK6MqA5dIGwr0GnoVRojEmEm9pviEqnbEx
	5NE26DqxokEACYKxAN1QroBVbHzXZbs+LuS9mdYYtQLhvklDfpInjb55o=
X-Received: by 2002:a17:902:d2c4:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d015d3deddmr66929405ad.19.1785317538787;
        Wed, 29 Jul 2026 02:32:18 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d024b114a5sm6878055ad.21.2026.07.29.02.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:32:17 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:32:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: align arguments to match open
 parenthesis
Message-ID: <amnInKDjDXQ-bMsd@stanley.mountain>
References: <20260728174018.1600-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728174018.1600-1-work.ashmitkumar@gmail.com>

On Tue, Jul 28, 2026 at 05:40:18PM +0000, Ashmit Kumar wrote:
> Align the arguments of wait_event_interruptible() to match the opening parenthesis to conform to the Linux kernel coding style.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea..ed09be2fed4 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);

Search for this function name on lore.  The original format is okay.

regards,
dan carpenter

