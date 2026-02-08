Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31B1C6B4
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770518026; cv=none; b=lUgp/OuBmC9aK+4rQ2o1JEL5SqJPBW1HvuY48zMf+rmaRVVpLnBleVsvQQXz2K4zYHFm4ZNK5qan0bsCpyc6VgI+f0j8wow83vTGXfdICSEsOQfYxjSXdlXHP9BwKKHMvXN4u4t7I+WXzK4daDaa5ioxLoWn+ANgqHBG58Q1EPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770518026; c=relaxed/simple;
	bh=gqP6mR3MRqOJWf5RN+8fPJ7+RDCZ2ZpAdHqDGQRiVcc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZKMv5lDBbmoYwM/hvuv0yf29BU3h1Vsrk6fllNE4n+dC9B6Ja+87OxIldYQRUIDkosJw1PBJ79qLKRVaPyLWh/oCvvPqnxkISFPq+rHC1+pP2nvKJiq/unnswZq5F26TzyI1MLfosULb96p6F36cOv7C3c4oSZmBwVnTE53jSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ir+UOZat; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ir+UOZat"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7961e04355cso17902177b3.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770518025; x=1771122825; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqP6mR3MRqOJWf5RN+8fPJ7+RDCZ2ZpAdHqDGQRiVcc=;
        b=Ir+UOZatFR0f9eckf/pP5rbdIjxMHc65ixIiVQ9suriN8xrBYNoUp6T77YHPcNq68c
         xh8TmfEKHyJe1RxTSfe8VbCi0VWfi4rumSKi/vByRMKf35jbmo01bOBrR16S2TMt1oDj
         DJhRtrf3M0P/K6JoqxowOh2eroA+Uxe8wBGOZ4rlD0qK3TenhTk9QMA7Ov/XGvzREvrd
         Paj6JrBv49wpbRxnxk+OfYG9oAc0SbH/jiGgj0qkQL7L7vII4df8Vpn8bu1UW0hIYqYS
         U8D7NhkE1m82jqmTc0ou17/7RL08lGIYnoDd7dgoSCWomEaiRCfe73ooNVqDB0RhnogL
         fcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770518025; x=1771122825;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqP6mR3MRqOJWf5RN+8fPJ7+RDCZ2ZpAdHqDGQRiVcc=;
        b=eTGEnLQoBFQruajgvHd2nvzKHnkGi+mJyewjk+k6FYhjavAlWJvlPUd5zFR0ZAEPTM
         b+QbQtSApA+2VEh/HAMfEBbRNcpvl13gVoJz6kN+K663fGOG1C5UVo/aWVZKlMk+v6/U
         tCLINMyTZB5noWYjlY1KeGKOOnAIpo1wzaFWZsnqWFwJbp2RERdc1Yo4DVD/iCy1vU4P
         PmBIBsTmI7KxdWAf23pjNxBPPnPgH8wkmdjg604zdzO5h7zm9RH/yYYQOA0cupgXmAqt
         C6kH/qoruZi+8MvRwQWn3m5p5Q1vXxdfh2Ivx2EKCzGg25zUxpVzwxa6pYJ5GSnJ6Cks
         Yk+g==
X-Gm-Message-State: AOJu0YwlZ1adFy/YsRRT0gvvh3SrUhjY+zUT9cdlk13Iy/OkgW7bHlXL
	ErAzS58bsGfnhitPMwn7Mj2xAvyc0JnBfZimCwJL1pOOsdbrKSbGVxqi
X-Gm-Gg: AZuq6aJ5AIMkhf38KbMtKZX4k84ks4YWrtZ6k1sdp5UTPTTdPXghZXl7ONrw80ykuYc
	zVTt2Y8Aq87/MrO+crp9mQYDCCXRoBzQIBPc3Nh797uR6lcbEMC0nfedroKt7ev/PSwc8ksBirf
	NuM1Ai+Ec9ojnEUPv1mFOLFe5oD1AAvW3kSmIENRxVndqcjq5V4JkoXL/R/sHVrmGWT+pJ3rHEo
	swYuBk7VUVFD43dK9Ze3SU6wqOkXpiJIrWYQcRvzfyUj1hlh41zPhMVfo7dkSgM7xBkqAQxBfvt
	LyRTJlb4KgWlcMjAaouqJAu1dl4VYWqqEzH01bzl5nG9DckBynx3TnY0Le+mHf88tkXWgYmxx1/
	VeYJ1XSmiZD98WG3ej1kNN9lbJaXoYt/hGUAlDP9qA5i1P0HDfZe9C9zsuZgwh08FvmJiGXalBM
	jWc2pPPQ+EHVFgYcm+tNylUZpjY2gf2jcYuv0rVIxM2clQ/urPvQTcJMHji+VbqdVOC8FnZ9LF2
	ASDj7Xg6t8C7ogT8Om7gy6ebP4OBxaWJkri4jf+YaTjYDw=
X-Received: by 2002:a05:690c:388:b0:794:c63f:c590 with SMTP id 00721157ae682-7952aaa8582mr66989217b3.23.1770518025588;
        Sat, 07 Feb 2026 18:33:45 -0800 (PST)
Received: from localhost ([170.199.240.145])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a0693f3sm58737277b3.19.2026.02.07.18.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 18:33:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 20:33:44 -0600
Message-Id: <DG989BZMHHLC.1FV459E6BHGLE@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: vme_user: reorder NULL check after kzalloc in
 fake_crcsr_init
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Artem Lytkin" <iprintercanon@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260207215502.1961-1-iprintercanon@gmail.com>
In-Reply-To: <20260207215502.1961-1-iprintercanon@gmail.com>

On Sat Feb 7, 2026 at 3:55 PM CST, Artem Lytkin wrote:
> Move the NULL check for bridge->crcsr_kernel before its use in
> fake_ptr_to_pci(). While fake_ptr_to_pci() is a simple cast that
> handles NULL safely, using a value before validating it is a bad
> pattern that static analyzers flag and could become a real issue
> if fake_ptr_to_pci() changes in the future.
>
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>

LGTM.

Next time, in your subject line, it's standard practice to end function
names with () to make it clear you're talking about a function.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
