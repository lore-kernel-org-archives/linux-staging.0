Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564966;
	b=FSJTQJciyKezN2IuAsk7ORwEYkKTAgpyd2Vr6vi2k/VIxGvMl4xPkXXYsyKGqWnzK8Dx
	 9fLGHHARpuhGCB7qmBKf0tuD6ax2q6YM+87+wAWro/dCZzRBa0zfgtSagGLy7OkYtSbxN
	 9To8+kHOFJEDnj/EFzMKTKnZ4obZpHJmLgILTT06k5qUDive/q/6rx6BtRgI8qo4amXkk
	 PSKygJxSELoRT6p0znDlQ5DMDACuc4G9ZE88ZD5cqyM9raelEGGVJPnbuhwrMdn24yxZz
	 m8ETfeL5d5cS8Kc/AKL3iQlbuSisgAo8R5K/AioosMNiYGSQuvypkXKD+50LKcG4hbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D38HS46K1Anpqtgv366uGkYPf3VtgpYY67fcn9gWXQk=;
	b=lCg0+AZufNRes2EQuVsXDt8qAh8VW06iXgp1T+pFRptu5k/hUOv6GuAtn1dJO5uPA2sc
	 +Tq3YtRuqdKKqBJdFe37uUKeqLYD3W2DxEb/nwJePGwOYmwXFwzqtU9v9L4QJGpz+SNLp
	 ZaLJjtJxt30nzP8ffUrlzLwxkwkMJpQILot2gZHQvePvv4LTHLNkX5AyxSmYlPGAn222J
	 HtJmuXpxa7e3/WaPG3APddUGoq1gcc8Y52u/yLf+xJ/O6kaqmMnEOtPayp+DPvdaBEPDr
	 k7rlLpo55/f6muTls9XOtpNY89fNkkHwHcKZv2E8DVVpyNqWKbGGjrVCsa6B1WtJmOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFPVq59C;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB7606A337
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 10:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FB7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFPVq59C
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so216377241.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 02:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794564965; x=1795169765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D38HS46K1Anpqtgv366uGkYPf3VtgpYY67fcn9gWXQk=;
        b=tFPVq59C6McqIBPAKeD2DQjlPLnMaHqnTB6hnSwSHvFIMr/3D8jYjUKStjPGbnAsbQ
         xgBg4B40LNfdSsW3DaDGg2lL3FiJo9TTOVp9pkvD3NQUJuTg7vpB+Bd2WVZyy1QY4OLv
         LKu0Vv66phb9jZiBN77gb+X/8DGWaLakt4/5BHfJ4ZqapAxbe0ANRMfR1EHWDyA4vGpe
         QZ0WxQ0rEvzpmA4wyoPE6n95VaefqztXnDKNyIi0cZtCinnTJjajkAsQXEqbDSlYnCor
         LIe5nIOarP3zhVjGS08xyHGhogeeaX9H6jK3LtU/t0qI6+JLG6VdjWw4szlb1AbZbnPq
         UjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564965; x=1795169765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D38HS46K1Anpqtgv366uGkYPf3VtgpYY67fcn9gWXQk=;
        b=OeiMrJyvaj/6fnFGdz1xlK0cbwK18EMTjcyyXSusSpiZSNnLWxaYcByLbnaFWIBcy4
         BmaLLRRJEO0E+jCzbtfJ/02vGfqeWxGD2YU4JGvdCxZyNHBom8j38MwxxqBJ09bOdy3U
         6apoT5MMXgTZAKoLZlYvfUvBCet98xc+4zrk9IVu8LvZqqDoeSZs9P0yeMP7RmAeTl1G
         1IDIYs6AO2S6IfeFfKksYrVge28H/mfgv8yTTMPJiR6hASV0/y6/TqdabtE4ZdOoNPUu
         rpAFAeptyy3VXvAkC+hBpQ3/2PQK2de+JpFfccgR/v46UJyWQUdkrRCPcS7+C2yGhiMd
         9v+A==
X-Forwarded-Encrypted: i=1; AL+hErFjr/TZP9T3NIyXuWue2AoSRoFpAjcaC9+7Ej3it+MxCinZhKmMgybePpG6UvBQLmxiaFuvqeoj7SOuS7cE@lists.linux.dev
X-Gm-Message-State: APuU4Z9luJM8Uajf7cVZQvu9TMoj7+1oeNRxO0kZ91HMy/VIOht/oP7u
	EaTHrq4zYWh31sv1EPSGeVupfzIOQBTAbdxa+n3clKbfbKpBZbKCI2tW
X-Gm-Gg: AYBFou0hD6SI7m9LS2vdoUp0sCA1xxlchCusdTus8ot4neCXq8/kt/K1liEp1Opc8+z
	rbwDmKjY/WIvrceGdSVqzOmMKXFAfyTQto9HSyHmgpz9IJ0ORie4Ecrniax4UD2gT+fBOzeWELa
	YKoui9JLpRsfl4o8SlaYjlgz+aXIde2/tPXQWqEY6JyEP8IwdxVnyJM/tjEWnANl2yBjKc7OHI4
	Zt+yw1CER4sxxaKXUFdE1EzCHyFmt6WJDvi4wjM1oo9jTjiUL+Iegoc/g911KcBTox4+ZHU9v2m
	GJlPQe6E2CJI/d63k721XlQLXfTlKAQgYX+MQbUNMKruqDDygpl03GgOWMsGwgCQqapmttQGMpu
	4uh23OsXWBOVGESb9jyOK+V54XGwXAZpF3FSDk1Xq/Ep2D4RhY9zxMceJPWQi7AAulpGSBobtzD
	aTjM4C0QOk7oxlIRaeMP7A+8gHlWj76Y8UQPiIk4kLEXO57dJFZQTjpJQb4XuaGbmXW7r/0jycY
	4oo6T8KDy+NJgeW0oM8imfmE4OcUS4+L93M65bp6tj30hBe10mkX9xsnoU7ZgHWkAGBYzaZ+MnW
	CrIH0rtVKw==
X-Received: by 2002:a05:6123:49:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ee34afcfa8mr472567e0c.22.1794564965007;
        Fri, 13 Nov 2026 02:16:05 -0800 (PST)
Received: from fedora ([2a09:bac5:565c:aa::11:1e5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e67eeesm940971e0c.10.2026.11.13.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:16:03 -0800 (PST)
From: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: fix asymmetric output buffer pool accounting
Date: Fri, 13 Nov 2026 04:15:54 -0600
Message-ID: <20261113101554.68060-1-aleszlucero@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113091847.117705-1-singhpriyanshu9838@gmail.com>
References: <20261113091847.117705-1-singhpriyanshu9838@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 09:18:47AM +0000, Priyanshu Singh wrote:
> In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
> from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
> the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
> (err_tx:) and in cvm_oct_remove(),cvm_oct_mem_empty_fpa() is called with
> 128 instead of 1024 as the expected buffer count.

Hi Priyanshu,

A couple of quick comments:

Was this found via static analysis or code inspection? Since this changes
runtime buffer accounting rather than just coding style, it would be helpful
to mention how it was verified (e.g., compile-tested only) in the commit
message. Also, there is a missing space after the comma in
cvm_oct_remove(),cvm_oct_mem_empty_fpa().

Best regards,
Alejandro Lucero
