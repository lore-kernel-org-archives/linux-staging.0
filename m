Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2EF35DA47
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560518; cv=pass; b=AoolDxk74neqKyHETE9ZdvRwI/GCEg3p2tVqROK62aF9zVptcnbWhEoBFrtJuqX0Vgbb0qfDGNGqLG7AQwnj+eHzpq3MB0QE4AYRfpDnNDq62MwYJ9n3/vHlzz2mCBgYFd7PRnz81SOZHhkOT2vS7CXVkPE4UjkuahPvZd3kccM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560518; c=relaxed/simple;
	bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGLaTQ+KXT58jKE4F7uy38Mkw9qM/ndWK0Zs1sG/HvlKf+HNMNnv+9XSsgeGbFkB5KMiO3m72ZORwt0P1E8ahsj23/AI5FJVO86cbcUPQLFX9EbsKoPwhRcaENkhQCu4Q8TW3HnQkWnXXNmGN9HggK0X176doGh9sWdwbiNvL1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQBfRc6A; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQBfRc6A"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so7027761cf.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 05:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789560510; cv=none;
        d=google.com; s=arc-20260327;
        b=gwHV5/gOvbk8uf6+cvE5UIYdgyy7OgMigHlD1rNdSyPBwnL7Q59Q2QHSxRIcLLIF+d
         iApyClLydI4ORWfiQJHiRf8earGseRedf7txH4HZY+zicrPK5srZjdWp6YGrlZ6LMa+/
         N/ufpuYojgK/7kdpYnLbTukCbrzVikTJGiW0FBv/6tHMpHTFfozegqIHht6CV6HGUUVD
         wEEXeuXVr4YmG55o6WMk/MENRC2MGWPmQS9WiZKbeuHDP1SB7A5I27q0v3KyBKX+nscl
         55sTBldRdtgGXWzf6E0cqIH4xQJe7Ik2C5I0/xQ6oZwIKdtF/2na+Ww0xbVD3v5vase3
         60nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
        fh=QahxEYg3zgxNYK0eHXrkHEt0KkpCy1K+3UdtgKLNLu4=;
        b=nWuZIWAQAx+u7Oo1fR3ldDpGDkkEqwMXJbNZDuSdzrGL9KcTeFfOC7+CQwGVk85dHE
         it+AgL1V6nGF5n3Ppm/i1nxfJOf5mrGcBaR/InA/Zqwi4PB61LGQ8TSe7xI4dx1PHax3
         uXam1u/UA5bgz3Er55sMH2hoWBSwFLr2ZHK4ej9ZUiFp1EjlSX5H6y8lSJfKViI8W3zh
         5HhdDVA0JunexQnDOJP/04SAndVSX1Rag+/s0hLTfXGn5DsmKQgsV8tEHG+9i2UVbDYU
         GJJgDM1Y4i618MQe46sW6MSO6mGNY+iYbeHygsZwLAXDMjvrlXRi5SCNMFR5xVn6Ye7p
         fZWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560510; x=1790165310; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
        b=JQBfRc6AhXBzFWnviwTLFWSzJQHj7fZ1Tlk8hd+WLM8Iqve2kKG+QDtHFskuolGY+k
         84RV+j3iZgOWbiIO3F9yd/bpkOAtXq/xPAdLEPBqtTIdlLJk+2BuBXncKE+re83QVpEq
         eSIsc5iN7gZstfdJj7OWjHMCagb1XETzksjGWlA/+pzz5HLzS7PmVsXtNiwLku2DUhZA
         kAUdG7z2n2l76lDbyeWRx1IsCrNaEPX5rnkweFSEKthgWOKsbuSsJHRL04KmpNKCGAU/
         y5XanD7IgJyhplJqEZm8tExwhjheDGU7BqlfB5LD/Ii6VS4Q4TDER/S6gY9PXPWW8fjc
         dVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560510; x=1790165310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
        b=xvK2FFT3fNagtAvyQDEWcFOXP/g+VrLO5KP2rM7igJJbMBXDH6fsxM9UcWMADx7pCY
         Fped/cqN/+wFtzULYKdf/xSg1ain/a46BvmyWdzfEV9T1NcYHG1hUtF+V48+Eeq9YerO
         ryQti7UvXRJtg7AtaU6yoAnZg4IlihMdZVy3yyr0gUVwEqbYjOSjmAbaCx0f9E9amidu
         6hOEjcwGNg/xqDSvUGBPg3kclUwiG9UOlTH6GHqCvq6himXN0GCeUmyjxOK8tMPfAXHo
         Yz2awFp0KwJrr2Bhy+b3vLRNib9k2ABc2wMe8cUTGKFrgWsOmmIGhb0p55r0nnEXd8iR
         V4cg==
X-Forwarded-Encrypted: i=1; AKwUvByQ8HfwnQRBg0vlCGGDc4HRJeS+vr/86yap0CncJokM5hOjbVqWtnXRNXFaLqc2JsHBbebwVVfwTxbytxIq@lists.linux.dev
X-Gm-Message-State: AFuF++ltbw9R80E4AV301Kdy829SQ5TLOiq+Vz5nKgkbX8ZM8QaIX70T
	l22v0uZxRIqyg+W/1OssN5yGwsBjY+UlwPJQGc6gH35TENvkmpKcKwoKEqFCLaKajZ1EwVN6vj9
	vxyb8QlA3VeowyvoYmL3PK1lri4g9wKw=
X-Gm-Gg: AYBFou1BWxr+wRa/wndrpTZI8GtDkdfiZcUzBv18t4IvfHA71BqozH7+4EQB+bYkI9g
	duf1ftzDii8poytXw7Af5N8gnbdecJWVYzU5m963Kwa3DSIemSY8Lw0Uw2WEVyAg3QKiosush5o
	0zWj8UdJ0LI6+aPyOK4GnFnzeg195bF27AQ8DTwwAuQf9xNbEA6ZeDhma0kDfuGkxeJrteev14t
	SljAd5Kg+y/KS+j4bRKhVu47Lg7AaNsVNf0N4JEm63DYBPsDzOtozGnOi7j2FaDrcLix+u8oOPd
	8miqiY6QuvVJP8h+VjMGiSISfWykp9n/yWI96YMfRlFYrI4mnSRHJkBq
X-Received: by 2002:a05:622a:1b19:b0:530:5ed1:561a with SMTP id
 d75a77b69052e-5327eee82f6mr43123021cf.43.1789560505709; Wed, 16 Sep 2026
 05:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916093928.52057-1-palaomer100@gmail.com> <87ecet5xos.fsf@yellow.woof>
 <aqp4GA1q6cLKivZo@ashevche-desk.local>
In-Reply-To: <aqp4GA1q6cLKivZo@ashevche-desk.local>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Wed, 16 Sep 2026 15:08:06 +0300
X-Gm-Features: AcwNN1WOW2WDT240y0ILa-CLMyO9YvF4o43EaQSFbhxhDmsrCMG7d8RZROqqgSQ
Message-ID: <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with usleep_range
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nam Cao <namcao@linutronix.de>, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2026 at 12:39:28PM +0300, Andy Shevchenko wrote:
Replace udelay() calls with usleep_range()to avoid busy-waiting and
allow thescheduler to sleep during delays.
First of all, too condensed commit message. We have as twice room on each line.

Hi Andy,

Thank you for the feedback and review. I note the line-length
formatting (~72 characters per line)
for my future commit messages.Second, do you understand the difference on what
code is doing before and after your change?
I understand that udelay() provides deterministic, busy-wait timing required for
hardware register initialization, whereas usleep_range() introduces scheduler
overhead and non-deterministic delays.
Out of technical curiosity regarding the driver IC: theoretically, if we knew
the exact window between the hardware lock/stabilization
time (min) and the internal state-machine timeout (max) from the datasheet,
would a range like usleep_range(min, max) be acceptable,
or does scheduler wake-up latency make it too risky for
timing-critical init sequences without hardware validation?
I will drop this patch series.

Best regards,
Omer
