Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BF32749DC
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383257; cv=none; b=RdvRVErFvirtruPN+p0c4B9EhlT1AhiZ0yG3eWNXZ5/+byyx2sqqvaGabg8WUHt+/O4VdNPRF2S4p49SLFY1HwKG4YE7lQGgy+F89g07uNFSEX2+BZogWpyBp3JoIxTN2V9/mGD/EjY0uSq50RDtBPoHQoSf3ZZQx1eEhz1/Bnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383257; c=relaxed/simple;
	bh=LaLtrw2hiYTx2V5KhilSrdVHwS6HOu2ow4N5oqdXWXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HT0Si60AUGf+6xhG6xLFgbr3ImBFUNMlQEp8weG8JxfLKugKsyLSk2qEqHDNigLRd8YqwNTN7Zu/HWXibTGE6u0xIsphfJZKfUwMZEwPUBbDJsWNjLkTayiAMfgJT10tHGaJ7wFF0uR70Tdtb26OgAXzi8Yipi6dzwNONQOSZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHOq67Gv; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHOq67Gv"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69de16f5e80so1178502eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383256; x=1782988056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WKFN+bw8sY7v3WiWOtoFku5fUwcwrZGxnyX6mydsFI=;
        b=lHOq67GvSyCez6JpdUWemzUDjcnaox7ZduN0er/gfY0LNfYvCTCQ3h/oeSPDx9YDB9
         TwWGHCOlVlzJsMVyTDX3JR948UmxZmhsNmyrFxGrRW8G9dcI2cIcuaOC1cSn16asYia2
         L88/cmADtVIyUoXLP4Amkfyt04HaRANkNLH03qQ+4oEBojT2KNKN2MSAsppUlzv6spv8
         6dPZGRQtprzxPe0zpyX35LbR+NDiEcKkX/r9ZPAL6ZqyiTRNBbO8dlgrc7Syw5K9rcJp
         stFke8Wy0BUruBYRzyy/jB5mP0scxoMRenHY6+rAQvnqleNVtFZk+MJ8ToUfKsTSRVbk
         665Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383256; x=1782988056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WKFN+bw8sY7v3WiWOtoFku5fUwcwrZGxnyX6mydsFI=;
        b=Do2U/1YpJoRbc5QFfwg/gIhRBMUgHvyU+noLWzror4mfdpvnkeSGYA2MUJLMUmSvsx
         a51sfD3v8RpsJ3vwCT+Y10tZP/63EqwFuH0ryczuxbBBxjL6akzjBPwqhVvVZXrJAp1G
         ET+egUg2Xrxu6YYWl1/v3Ofrsc4WlCbB6/C46lq74BH9qQ19LJmyl6CC5stQioMQ0BH9
         seWcaHNuTSjZxykKUH9C10mVoYy6f0S7MOS1KIriHXMs7cwYRsfgzVOD3OWV8DfQdwQQ
         /HIHBs2fbjwnRj0YTlV2NIv5zTQSiuqVfPy9tQLDb4oLPSb5Gs6LQnZWDyxGEk1f8Kgo
         a9rA==
X-Forwarded-Encrypted: i=1; AFNElJ8ruCWoYdejPy6Z0ZnVztsqVdaz4U+jW0VLmLzQ2wN4sLIHkZchUf9IX7+yBAli/WmocMnbqFNym6QYuwYt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9gqRxvWSHIdFKKZospsHM4IZeq/bGZENhh9nr3VPFZDbF0iqZ
	CUX6pjjxkKRLQUCPxpHibZjRF5gb7da/wfa9V9RQqHSOP6DNvz2+1IMD
X-Gm-Gg: AfdE7clOFW+83NfLzYNpOcYG1EdBhl+Gs1sIWGuWkqReOrDQxUSvWPBnYKxCfXCzcI9
	wtdNOzlbmUuBr5Y+VZqbxQNQszzKIp0EZxXYmgPPpppadomTOacpm+iAjMPAQxevmkcNRKozlO3
	B/J+kYnMCaHiLL4ot6hLfBZZ98wIWp8JKGO25oiKTJnvn4Rcc8vmkzY9pPBodDgzrViuoLNGLqi
	9LRn8RUeL86oY0T3v6jagaLOV7+2q5KODXm0fZVPvEIFRG6+TNwbQrpsnc/A9hOGNriMNh9+KhU
	+wyMqpQVi0Diwgh7Raufse6KLE37dYYyhWva3p4qtntyRXG0tOgQCI6IDGgeigOCNCCWQLehQ4K
	k21Zmn9sP9qrEdSGzaScgXQLbW3r3cQtznEYMG9RKib1o0gB2MUopoGbVTOccs3xT/mAHjURfzm
	hsJD7n
X-Received: by 2002:a4a:e917:0:b0:69d:4f94:cf2a with SMTP id 006d021491bc7-6a135266f27mr1216037eaf.56.1782383255823;
        Thu, 25 Jun 2026 03:27:35 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0ea102694sm10136790eaf.13.2026.06.25.03.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:27:34 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:27:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines in sysfs_emit
 calls
Message-ID: <aj0CjyGElhXxS3eK@stanley.mountain>
References: <20260625091416.230920-1-suryasaimadhu369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625091416.230920-1-suryasaimadhu369@gmail.com>

On Thu, Jun 25, 2026 at 05:14:16PM +0800, suryasaimadhu wrote:
> Add missing terminating newlines to sysfs_emit format strings
> in audio_manager_module.c as required by sysfs ABI.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---

This changes the user space API so it's a bit risky.  Only make this
sort of change for new code.

regards,
dan carpenter

