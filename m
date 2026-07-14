Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6BA364049
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012825; cv=none; b=eMkyVw0SAg0+z3CZ8oJzxGslxsuS+Mgkl6FIcJpX78/AV17z6v4sQ6S5FkJL/Udy/QO3LU63PqBUBSILflL6/ha2k9RZ5s/Kr41M1WvIHUE8iGAL5QMpUITwxQ4u0Wq5ps3sUS9syHFd76XiC8x/SvgF3kaEjRuNUFrAISyPWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012825; c=relaxed/simple;
	bh=/KzGKOlZ3bvNcEj7sYeqDf47jh7JWb8fyxkKwOKfcd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm324WRSQR/YjNl9rGUA0WSepF/WTQ0gsraWrYl3DYZ/7oRCWao+4udMxHuiKtrgz5aPK1NcdtueWz9kDSgSuH5+hgmZXZCQATJTGuUMeabyaIQh7PcWG4Pa6UvHhYU6GpebDA0s9eHtusSpTgcUeXLU1gqrf9gCeQkblyfm7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Whdvpfbw; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Whdvpfbw"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4896ae35be9so1585224b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012823; x=1784617623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TuyYrGZ1DyNEfIN58XUvMb0/+UabFx7P6cZQIsqhIhU=;
        b=WhdvpfbwoCM9VBj++V+QTTRZE0Ec8IrEB1sdX0wvO+/xmyd3e1DMt4ZisxEwJrnHvT
         7S7COtMfP/RulZvy99gcqK7xfjgVLheTmBLv6PPzmruh1SuRKEWcsDsSjm7aF7NCzCJO
         +4CwoXwW6mNiIJPexNIUXUd/jdAG4SKA8pLWLk3J17Kft0gIOz6GYedgZAb5tGEmqtQU
         nYfbq5+FWzrg7SO0OJIulsHbtxPtBt6UDQYFC8GnWs52yekXlo0DzwtBCI155SVjzc6t
         iZ7FJEhEyn378TgjItm6HLvtNmFBbUUhI99ZiT6QBaBBzmQCrfmaDZl3VlQFU9gMbHY3
         KdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012823; x=1784617623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuyYrGZ1DyNEfIN58XUvMb0/+UabFx7P6cZQIsqhIhU=;
        b=aPHfV9MuNZgKfQoZa5EWgD3ohrKsbBzCi2vYGxpyFfqDpyE93Uk4Vorq4lvnQwothM
         XgD/VJfAt+I+XfbkPW4YrUqqBnDjqeE+aweXfcMvG/SP5kXjhJ3RFmlkBEBXpYGTNJEn
         x8V/pt7Ka+CYJxLBsfY8+YALjJg5BO9xFlZ8FfHUn+uVWJ40+aakwJrBdiSQmJgKj0k+
         GsPy7fYxOGgwjitxXlLrLx4c3fceW9ZMUN9bTW2g9/2L5YCPdsmSDHA3IrdyUyQxqgPL
         FjhvOMOfWv/nSVQoABVcOXzfewBOVf6lwhftqYHubz8MhCRvnOezSL54da8IoxFxiFrP
         5/mg==
X-Forwarded-Encrypted: i=1; AFNElJ86ADllGQJ7nSdaoR1qNzMNZt/xxgYxBkCgxjiAobelLFfaUmagSxGkjB9A+uyDtphLLb/6NTgJ9s4Y63yX@lists.linux.dev
X-Gm-Message-State: AOJu0YzQyNHUPbv0f9XNiba49uz7PXw2oOIecKidA5sbKQrCvBGyIPnz
	+iK5e27Na5N/PHH1YbJ1p7VCCOioXrvgiJn3aN9IXnFmdGoSe3p6666x
X-Gm-Gg: AfdE7clopz/SZss7PU82XfXtaBbS+n2fjGlL46+ej2SwsHReHzJfjeKCu+97WRABTIG
	KIv701D+RzPcOJsN/nlYSRhnXWnGQIATtzzjx4e5kHt6rPoPOWJo/cnMSYOoylya5PIQ7HqxFfm
	Svi2NRxjfPHvsN3j/P+t9JoOQ2EPqHNYkghCX7/r3FybDwdNa87oB1Q/iZTZ3Uk3ANCpGbkyCk+
	Y1g44WZBHMNmgNSUq/ymxzhDw+OENfP3039bSJTCplG3Dv67KeaYKxaNGAo5ejZIYOzv6oM7c2S
	ljCKJQXyJL+iXiL0fWXPf7m+Dm+JQBlhRNXXuk9sk4ftMcLMo3AGPGTswskMYHA+09SxbJ9kQNp
	Gv+SKWs/pXIBb4hXIh42et6NzjDmhkzKLp4AGpyR4wyUrR+r5r75IK1eG+1gt6pmsziV360Cd3Q
	mAJAta
X-Received: by 2002:a05:6808:319b:b0:4a4:25b4:a0be with SMTP id 5614622812f47-4a42abc0379mr7380084b6e.2.1784012823154;
        Tue, 14 Jul 2026 00:07:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1ad5a77e3sm13498322b6e.6.2026.07.14.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:07:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:06:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alXgD1Vr1zAiVf4B@stanley.mountain>
References: <20260713171644.691-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713171644.691-1-alfievarghese22@gmail.com>

On Mon, Jul 13, 2026 at 10:46:44PM +0530, Alfie Varghese wrote:
> vdec_probe() maps any devm_clk_get() failure to -EPROBE_DEFER. This is
> incorrect because devm_clk_get() can fail with other error codes like
> -ENOMEM or -ENOENT (clock not registered). Hardcoding -EPROBE_DEFER
> masks these real errors, causing the driver core to retry probing
> indefinitely instead of failing early.

It will not keep retrying "indefinitely".  -EPROBE_DEFER handling
is smarter than that.  Fix the misleading commit message and add
a Fixes tag.

regards,
dan carpenter

