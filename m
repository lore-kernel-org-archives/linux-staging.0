Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270103911DD
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338970; cv=none; b=sSyg1NSfhvNtV+J5LfgashYmT++Bj0GrGwby27lZtBfiV4nrlXVAfJ0ZobK9dJPoXcKD2+n5msoTFpm9V/3SDpJ1f1lj/tFIgOdCkApGrF1Di8geZUJQtgVvIsETUywTWMoJtL+OPzfrrVSvZ0oYnqtFyhIDfQoumZ8FZPgwPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338970; c=relaxed/simple;
	bh=+kCuaqYvwXGbWkpGE6rk6i0yD5km7LI6frQMx6b77q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqlQXKaLH9y4GZxIvdreEn601TZDr6G9jNSiOjUorf3aQx7XQc0nun2Jv/XtS9OZoFNZacREcH97G0JRJVNvl7B+f59yzBUIDCRDS0zEuTPv74ldGBQVX8f4rxN928E6yvkDZfS3aI3td99v+b9+Zxkyx59wPvn+a93GgiMlRjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=downLOlq; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="downLOlq"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e9aff12fso22316166b.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338967; x=1792943767; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6X5sTX/gBkk9ZMFX7ZUc3TThgaRf0NfvoIWKdsJ73bI=;
        b=downLOlq6oqy+uTM7ogbjhvEULBlheSvwSGvcrxhlS2YiCyBx2Yk2WyWy+392jfxMd
         B1UvrWNjHt22cnBRKvCp1YAQkQZ1J3RvYUTOg3qIJW4XW1zfCTABXRqVwjtFN0YdeLqf
         SA+bM0ZDIJHI6IMaH+p+h/MDCmIoaYMtXNY41E4vrd3wztFGts8mASyUooES4Vly73If
         zeakp4JjC64ivDjA6jDCpEJLR3UzJrLDmtVFMJnqtf2vDDjKScyrhayvZ+hRKiRtbSUR
         /Wj3FlJcpedzKQDD6ezogbbET0DX1bJ3+TdQMZAmIW8JqAqR040zzxAI0wokhekCLskY
         X8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338967; x=1792943767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6X5sTX/gBkk9ZMFX7ZUc3TThgaRf0NfvoIWKdsJ73bI=;
        b=K5dVnQ5R3G6QNib5Y4nEA8kEciFcjf5XE0PDhqCT+Rg19KiMoPf1dXnnmxRbmjIVgx
         5xrjeng1VIple6WadfgBkERL2pg3eRefZhtsAB5aEMNymaSYwxWRQTejUHB5+h3ITImx
         pjAxaH60/dO6lgbARjiU/ty/TgqbfHDo2D8Ltsa1PqmdAo/S4i1wkrFG4sP065EGhhxa
         KUp5qkHZTklIGytsjBvpsoBSoe78sGKFFsOYTtySnhkPfVHosBMwfdyTg+sEgQuLiaex
         woXLm05aa4cjx6pO1L5pD8gfJEZ1Bca8/xI5+kxDIJG2BDgRBSQSMXdTNLW/owOMkd4q
         Y6xA==
X-Forwarded-Encrypted: i=1; AKwUvBwKLfCtWWRTSpLv7i129PyrHPDkxs4mmmqXipsMFPzcWTHCT5THhURzbe1oe5rSqQV5fcUdkE56zbajugrj@lists.linux.dev
X-Gm-Message-State: AFq9FYKVYrDqrgmUjHGXyf4NxtAnvZnRrX+UbiPLUT/oIIR8kp4BHbOB
	vI05ZCLBNvZR++G9uyXi9pNN6biWHcEbq1FTGY1coh27bna6eTFjpXbm
X-Gm-Gg: AYBFou2rwNybY9uAUsP5LFOztOChuUv/tHBoAe7FS3ezLe9ulBXJ/+9VooU+Nit5AHe
	ptB3A4lTRG2UfLOdbz5AFA1gOEyQezfnXerFDurav+XWGSSNw95/GTkgT86Zv42jDEXno6ChA7+
	oMcwcHZVY0tZjYJXUdxqaduouavQ+DX2AhYGse7/JzbuL+iuSmstUU/ytK1GBDmeG5pjwPjt5g+
	opJhSyz+ItsYnc9CngxHAlunSqglgwAmiUdGbzTagV44pRyj+adztfeYN91GnZSZgkSmmGdFQBJ
	jloLK51n75e/+uqq3Fae7YRHVjks1Zv9K73udKPFvk74ppBNYWt9cPrO5q2nPZJ5xCJcQ78c2r2
	+SzFYNlmY9hAwfE3X4P2+xCPHx8cdC88G3lq0pv4RDQiQlvs/CEqcO2Mx5GOrFacIMA0p9AesqV
	KiN9nF4VgUwOQFZogJ3iMpq7rcGfe1m3h9Iu3yuBKCuVdT6DSuZzKV2lGLZKs7i5czny6BmDPvP
	jpsPMtPl6AuDAUAw01Ci381BKZ20nvBSpwKIqNFURnFPkGvfuuSOwtpy2Kn+6VPGfd66L49h1wC
	RAeJqcABokVQT5BKDcy6+oLDdqXpxoocPQdmHNy2TPMkgfAoVM881Ol4Pz5LQCwoQLWri8ftwKx
	aoSCbZOYPGNraOo8XSTmRpAD9MD9hUXI3vhxSiLlM5Xz/lNebUmV94xNB+b2S2aXX
X-Received: by 2002:a17:907:7213:b0:c40:6ed9:b962 with SMTP id a640c23a62f3a-c419ea3724emr380357266b.26.1792338967352;
        Sun, 18 Oct 2026 08:56:07 -0700 (PDT)
Received: from systembl0wer (brn-rj-tbond05.sa.cz. [185.94.55.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm277769866b.78.2026.10.18.08.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:56:07 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:55:58 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Melih Emik <melihemik@noirlang.tr>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux@analog.com
Subject: Re: [PATCH] staging: iio: frequency: ad9832: use guard(mutex)
Message-ID: <20261018175558.71739ebc@systembl0wer>
In-Reply-To: <20261018102604.73380-1-melihemik@noirlang.tr>
References: <20261018102604.73380-1-melihemik@noirlang.tr>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 13:26:04 +0300
Melih Emik <melihemik@noirlang.tr> wrote:

> In ad9832_write(), manual mutex handling via mutex_lock() and
> mutex_unlock() necessitates error-exit trampolines (goto error_ret),
> intermediate variables, and deferred returns. This pattern is prone
> to unlock-omission bugs during refactoring and clutters the control
> flow.
> 
> Modernize the locking by using guard(mutex) from <linux/cleanup.h>.
> Scope-based resource management automatically releases the lock upon
> exiting the lexical scope, which enables immediate error propagation
> at call sites, removes the error_ret label, and simplifies the control
> flow across all switch cases.
> 
> Tested:
> - Compiled with W=1 on x86_64 with zero warnings.
> - Verified with lockdep and debug mutexes enabled
>   (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
> - Boot-tested full bzImage in QEMU with initcall_debug, confirming
>   successful driver initialization (ad9832_driver_init returned 0)
>   and zero lockdep warnings.
> - Disassembly inspected via objdump to ensure mutex_unlock on all
>   exit paths.
> - Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

The Tested: part goes under the ---, no need to preserve this info
in the git log.

-- 
Kind regards,
Joshua Crofts
