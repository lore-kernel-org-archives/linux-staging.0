Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630641;
	b=xlipOUGbutlvaS6a6yfoQT2W5VcFaFWWYzlLWwpuBsPTemimUWLV/oUIXUIEyJ2L9QCY
	 OurT3WAEwpbINtMOvv4ESHn1W5/tYFhvTFnSLqYmD6VIxxU+NrGnZSZF12hAOqv/AySiM
	 ObDxLyf7gAt66y2L+3lDip3K1Iw1gfuFkNMGcPivyN7yBRHePc6xgghSWcEffbmV7p2on
	 2IOmQetrMrUMFpQ4Xzfvv3AQ83kAStr0tIUcQhNlw9X5XhtBr96wYKijXi96vN/YRTze1
	 pdrhAxQ/ueCDA1opZyXJZ4MRBau+283J4nZ9PrBfEEvfgLXiflTpR4EU6nyfCuU/sXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/Q8B5R3zHYdiDHrLqIglqhgWhN3VLwZyGC1yGSnzz5Q=;
	b=KSfPgDIhudIbRaWGwMEixBpd6BR+wkDDsb4cUHlSLWPhwQFqRn3yEn+BkTCbKvu9yizP
	 iePO1T5DP4jVdJgCRz7JSdtg2XIaBUda6qCiKFEhN1Czs2n3BH+QoLeruRugiaJuiZpSL
	 DQPtH/7GmNVmno9Zw9rU20GGf9kNDi99H1Zi1wTuTKay4rbNhvLOB9GuAIbGPVXvJt6G6
	 dujqRA4cQkC5pagPRD87d1JZoLK6UXcyR5zMW7iZ2LyJXRXulRgkmFjTHlrBt7CtiWq5P
	 P+Bzr8BK8mcXoPVwRM2eXDKXwgRs/PvR2MX1gaJAa/q5Vi5OjvwI9oFbGos1iy/J1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z1uZNuNE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824E6070257
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 14:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C824E6070257
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z1uZNuNE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e10a70540so1730780f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630639; x=1794235439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Q8B5R3zHYdiDHrLqIglqhgWhN3VLwZyGC1yGSnzz5Q=;
        b=z1uZNuNEGViE6ksPB1ImOBfgO6WcLp3BR6hHQibRbDaU3xU4bJR/C4tkVCrRPFVYWf
         QY3WObFCLOvag6WXA0/RcrZJ7kFw3j8d2evPZPUnW/0O0S9IlpYfr1p4gMQlkmHyyELI
         AloPy5YX7I9GQCcm88UYGDz0T75pF86yYVtkx2gLPVneBZg2zzTyH3NtScQcTpzqE1ih
         1r3Y0f9ObYdnuRGFp0lSjaRakpgjaXyuNRrPpB+XbKe+E++RiIhCRyKdUoXoGr/q7aEq
         dFhET6HJvLDNG/f6u5uNjg3PcdWp+aTDgp6wa5FWGy2WVzyTNTrEUW/lD/kE6467Ubas
         SAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630639; x=1794235439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Q8B5R3zHYdiDHrLqIglqhgWhN3VLwZyGC1yGSnzz5Q=;
        b=KAfyr1ZbYfQlYCDW3tY2mlGMlPLXgrJFE4RnUcY6yrNWKh0HUV+dtbjVal0Rctk71r
         vSwaO/sKxHBnd5TDEWqNgbO9SqJ9eU9tFHUmzM203gb+9laR5lH5dh6QWhTf5HrDGcZv
         /A+yK2NkHN3hZQvYlw+t+5dVBZBXIvnhyvQ9mUhENp5P+PVD2fW8dgH4qqSaywPiI4iV
         khHwTgEELRoIQCAZj3mIkSgM4l6Xot5EcLndJY2/5MtAPbTzKq8MI7KAdm6t243+Y4sS
         lVq42ls6Vj07dQeThJVbAdg16KeNUI/YZfAgWh8wDXlurhDoU7M+OmtpY/MM+b2uY0Bi
         JobA==
X-Forwarded-Encrypted: i=1; AKwUvBxgER4wRf5WWQ028lbk86C4h67uOzlEe6GctXfcVrYJhZP6f2vSKqDf7xO/PRAIcwngIeO0+rJpqruydCdR@lists.linux.dev
X-Gm-Message-State: AFq9FYJlavXpQ8I/2fB2ZkRtzfB9yVJPX6iPGjQ34FZThcLx3YGnWhW0
	31RrivOogwjKZnOBLnstfOLWjMwt/fEBtoZxNINioZ7Yx5UPtHO/3x7d
X-Gm-Gg: AYBFou2KLBwCPEf21xcZwv4ID45N9H02ozrC49H4AD9qVF2mDy6OIu6titp4Hhkp0DE
	8CNPMC0aTSWVuscBR23QrNC+JmBbaowbVNImVkyKoqIAwpBg/0y++qZkAnjGTws6KJi1wWsPEYz
	Uw9po1cGGRWvg/0MHXXs5/B9fGen9tii9jJF516zcwFRvf/xtsq/Ow8kOkBrmhA+QoBgewMAZvP
	N/KXZhTjjNWn9fwZ942PISovs5Mxq6l3I1yxmXHzmhMMYqsmsqN/LBwv9QkBxDaD5nsrTsh4r9f
	CXzm8beQ5JgT5kJ8FArgHZ54ZOb+5j5spixA9TS08y0tmO8ixPiDQ1BeMaLwvVCvdaq7OqZSTdn
	hPbrvlpZHC8qWjGowaxKkiGuFUof6EKedKxp00WmsT1RW6UUPY/IG8c8oRadYJQmD4iYNRj85Zm
	5DdSPl38+t3oHmmzLXCgO9Gvq03QRZ/pSljjDjrt874bs8/lPcTkrQ3OLZJlWqMUldaP/QnnLHH
	8sRMZujtkP9l9dxDi/50vUqYb8ZTmMkgUjiDEHa82GEXqMtGax3pOAdRlF6yQHeo5qTLFW1CZxC
	NX5fVPD6VQhHy0+JRH4yLDfO2IA8B+q0yeMKtxgOo8w0avkg302z/rGQCCwRl1arwrf2ZqWmnum
	TM/9I35EcHNvy0sbBKbxSgSIDUIDXoeQ+XBoACukEoA3hBwHsPbxsge4+qHblqv313w==
X-Received: by 2002:a05:600c:4e02:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ac1228b10amr249125665e9.0.1793630639118;
        Mon, 02 Nov 2026 06:43:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm22633147f8f.4.2026.11.02.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:43:58 -0800 (PST)
Date: Mon, 2 Nov 2026 17:43:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware
 sample
Message-ID: <auihq9nm86d6D3MW@stanley.mountain>
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>

On Mon, Nov 02, 2026 at 07:44:09PM +0530, Kurmapu Sai Devansh Prasad wrote:
> >From 9114eb9d60f2c4a52f05e3a33b0d6b8ca4856cac Mon Sep 17 00:00:00 2001
> From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
> Date: Mon, 2 Nov 2026 19:11:09 +0530
> Subject: [PATCH] staging: greybus: fix string termination in firmware sample
> 
> The firmware_tag string copied via strncpy() is not guaranteed to be
> NUL-terminated if the source string is exactly the size of the destination
> buffer. This can lead to a buffer over-read.
> 
>  Since alternatives like strscpy_pad cannot be used in user space
> sample code, we can make it  safer by limiting the copy size to
> MAX_SIZE - 1 and explicitly assigning the last byte to be a NUL
> terminator. This ensures the string is always
> safely terminated before being passed to the ioctl.

In user space, using strncpy() is fine.

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> 
> This is my very first patch to the Linux kernel! I've been learning the
> process and would deeply appreciate any feedback from the maintainers.

Put this sort of unrelated conversational stuff under the --- cut off

> 
> Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
> ---
  ^^^
here.  So that it doesn't get saved into the kernel git log.

The patch is pretty badly corrupted and doesn't apply.  Read the first
two paragraph of Documentation/process/email-clients.rst

regards,
dan carpenter

