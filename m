Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF436D510
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 12:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503105; cv=none; b=H+rGUOeKUdt0o+TJdkWe5UDwNBR++NhGK3GZOdMjEtfCG6Js4DJFDxhCu0HtCiCeeZ6X7M4MPfjIZQ8mbzu4ec9FlJ3XnHYyC/baJbMVhgDx9hMGVZE2GBq/AetJAD6YpHqt+acGee5aIWGTbXE7YPoxsAXE/aMecdmeck2dnsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503105; c=relaxed/simple;
	bh=+qZYh7WR+ScKTDa+5gXvi01wqyGsVDFVH86LVwo1Vi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmvzTgpyQ3LPNFeY0qkOzLZeI05b+SXj3mnSRj3zMIb36h4h+e86xsQaBNb3sAfEo6hX412sL/GgEsy/MBkGjHt90OUDWuoUoNQQO8BzgnR7180ui7zFqkiLXyANch6MnS2LdYZd/MEn9MO9+SVR4VjKGAMBJ5U4MnkBC0b2Knw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3EBfNTM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3EBfNTM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3664df32e91so2742145a91.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778503103; x=1779107903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=T3EBfNTMm22Ubru0h6XgcWAGGuyTKIrGLCvVE3ROzUhnzd95/c+y57eSLi2+0IiGXD
         pBv7Dc4pTrdUx9D2RBhT+vMfFry4leqv60VhRw23mTtbpAV/g6zrlwO78LJfpCjjnjY9
         xN5E7d6zLKyN6c7xlQPzoUmaflV9wdl3YXy9TDgdEW8lviF5y/DFUOntGBPbCM0TY42x
         mBGO0LANbuaGnHIYuo1DSjmnconqjlCVRD/99MFQgj1W1CFMTLymsZ+d5r40a8YxA9X8
         aPozXqTy8MipFRKCOXmE4joKbx2qe9nCRXfI7qZGMUKP0ph1E5hrq9kwN3F9zNKf9hmC
         0fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503103; x=1779107903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=aoH0lGU92jNAJE/6sQABf4gJ7n/7jt1eedT+GOIwj7BR0+QUdejiVQnnEMDhax0RJu
         BZ6U4N3IBmRtJfvPHYoD1mBLQCCxuclg33NbEKxiwCTz8rhR6WwURh0DmKm+df9PIjVq
         ka+ZbQY3LR+ywpYCo7y1FSqqjnZLXLqQoYla5kMROBnrZcM5Sp43oCW0av6NpURINMU2
         2PLKyKpbKhU61Fb9JF1sL1Cx1DI6GTh/74UqHcfQiL2eLC/X7HyToRwu4FRyHHDQhpPe
         o9C/frdF2KvpCflmmktR+sun0fObj8U7P6GOhiAo0VhxczUNZIWAifKY9S/YRVs/SoXc
         uwrA==
X-Forwarded-Encrypted: i=1; AFNElJ+omPS4jL2rILERKBI9ZJmbXFj6DdgnLDa2JTk+3vtH4MF9tTIUBz0wSHJYMigffHsHfA0ZShCRJFepuEgn@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/rVfwOmn0n2JUAe1BoX+09HUzG+vrl3yq4+ara2NQJDbV+Hcs
	Hh/993hGHnqxv4Ceu1MByRz34NW3AItGLLLumkDDbd5+8/iGev5u1EAxeuWSfYjOEr64Sizp
X-Gm-Gg: Acq92OGMW2seDYUYcxteN4HRbNB7JWFvVqJlklJYHnGHF/xxaiT93npQ2Yw4h+7Ke+2
	x0cHq9au0V8AuM3/uU3++gM02ib8Lz9aYXENK/KzgKIphgr9tRKMT4JO3YSoz0pWUOBeHngvTwa
	fizNtbI6FNUcfyTzsNDwvEx5hq/k4BEgZzjNM4IEw1BvJEdOwVz+udSKLlI+2j8ZdfiVKxSgQQ2
	98XRgTCKMn34WgloowF0qO77IM1yOtaKZXDqT/IMjIZYUG34SaM6eDzwVZVY8IIBZYoP/uxMw2b
	387L34Za+0LfFtqgbDNl4E0FZ9tysOl8Ox9VRxslOHRrfiHjRekdoaA1sIr/tFed+/teWOLXwIc
	dMIKmLJ71/FPftecTVG8RO/g++gDNhLprN0akP74f4Mukfm0hhVX5Z3ZgQ+fvZeuAkU6dTqb846
	4c9t8FElNnr2L8RPmQtJK9vEmsA5oUj4iuXfghyyrz8ZDiiZz93o+wOINcQrqg6ml8Fd8=
X-Received: by 2002:a17:90b:54cb:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-367d46cf57bmr9784714a91.12.1778503103344;
        Mon, 11 May 2026 05:38:23 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fa7asm9444037a91.10.2026.05.11.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:38:22 -0700 (PDT)
From: 0nsec <meatuni001@gmail.com>
X-Google-Original-From: 0nsec <0nsec@proton.me>
To: gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] greybus: authentication: validate CAP response payload size
Date: Mon, 11 May 2026 08:35:41 -0400
Message-ID: <20260511123541.21668-1-0nsec@proton.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051156-hamster-plating-7ae7@gregkh>
References: <2026051156-hamster-plating-7ae7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, May 11, 2026 at 03:53:00AM +0000, Greg KH wrote:
> Was this tested on any real greybus devices?

No, I do not have access to real Greybus hardware. The issue was
identified through code review of drivers/staging/greybus/authentication.c.

The vulnerable paths are:

1. payload_size is used in a subtraction without first verifying
   payload_size >= sizeof(*response), which can underflow on short
   responses.

2. The resulting size is passed directly to memcpy() into fixed-size
   UAPI buffers without validating against CAP_CERTIFICATE_MAX_SIZE
   or CAP_SIGNATURE_MAX_SIZE.

A malicious or compromised Greybus endpoint could therefore trigger
an out-of-bounds write through an oversized payload.

The fix adds the missing bounds checks before the memcpy() calls,
which matches common kernel validation patterns.

If testing on real hardware is required before merging, I am happy
to wait.

Thanks,
Muhammad Bilal
