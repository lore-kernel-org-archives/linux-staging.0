Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5EF3AEF5F
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281323; cv=pass; b=oUMiAdepRT3KLp8MPXwQrdb5JqslDX66AAqIvC+COO5t5xRAoUzpKIdmzaql3BVKgzvSiCsxcL9lQSVfyISJNmoNaDK1/FMrDJW/13QXknvVpa4eT66CH8SL4qmfJ9tpoj5UVKeMMr2HaETBu4HCiuxpQNqaCzo9pdJWSVmhBDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281323; c=relaxed/simple;
	bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNOROFxGUS4rCCOIZS91A6fqindA2fmy+i58nbgRrzBcr4GjYiojpMEisBZuFtJK6kwfklJYhlLjAjTp2Ik36K1zI8m6bjsuZZiz1nJxiqD3SepS7WngnCDiOvyEU4TVysZF4YdV04huBQ0C8MzwWLDu5q+2OVX7rJoWxZ9+hzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkllgOSt; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkllgOSt"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c112aaaf04so834549b6e.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 23:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789281321; cv=none;
        d=google.com; s=arc-20260327;
        b=TvrvzxxCVqsyklWKwZojfhDchUMuBlMXIjreAuM030zcsdGhUrK4V9J+7sDrrJH/9x
         K7BNAMF/PVwYVHzSJIEzaZOCe+5WQF1APHMW5shB8kx+STnpaaE8G3fmvudvjeZwASNl
         h9vBMIh+8E78VhWFNOgyb+tRMjZEqCy/AyAK4ThnCdMWM6nNzi2Q8qNjlvqmN+hV6RR2
         5rtxTtQgyyho7jddjcIAjiv86ffKidPx35coTHZMlPaKt3cksc4bX7N7ReCEUwOSiASd
         aKkhE4RehHlI6ekwwYbLG6a8k46AoPZI9I2SeIcxVJQFLfNcR/r3YO5P8h+QGg04fVWo
         gqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
        fh=mubBYaI78XRfyUOVFAhwDnIwM/7i9ZFeLc1Yw5qdMvo=;
        b=XZxIIyu9ED4lDepl/Iu5Ci0cvFtBvn0pFQ74eGeCSvnvCq2hvauQwzHB3Xirpwl/0G
         p8/2w2pIhZibi0tCQ6HtgWus/r2+W/SG43qj86YScS5UoVxVKfub2UEVm9HxvNZ3FiQB
         FwA9Tjga1qKO8F5wmupPBfD0ZMKZKryeSnST+eOOxUbOR5HAF2i8Rmrcs2QwcO5/jk0d
         IQwpwh1ev3cuoGuCvvfMuoB6LvJOzDoIBGL6aiWhPHtU2CQwT9dD2zCRqp9gZZdkerYy
         UJTcGlCWrLd6x4PQNOm3aJXIH16rTKCoerY1Kqqj4B5TU3+IBOzyPRcur3gE12Fndx75
         5mpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789281321; x=1789886121; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
        b=IkllgOStk3MSw0/+ayV/8I9UPWUNWI7+EBhSqUaMO9RHUiGokdQ74GzyDXTLEFQwTU
         C0SnVbtCy+rwwmT8aP+QklGZcweKVtj2gM1uJzUcYCN48xjXZ+MlCC2ZBb5ixCxBpZX4
         CVsnvU95AEftasWPEF1o0VjLKQywErEu3ciOfbQXNQFh2VWgiqs7Y/AZkIA3uaZgnSXk
         FGqx68ONriXd3Zj4xaBv5WnJAnNIQ/ePVR2ZGVXTxHgZvJa05soN6U+Emmuqarguuq0F
         fL/hXYQCkLMJcWQFDndCO/IpJwtXbSO4aJDRpDMvAcfOjK/1OJhaxLqkpixYqPX5mEH2
         5j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789281321; x=1789886121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
        b=Y+hirAq/vyoYgNriTKwyxO+xcLJ34Ma9RYGZGZSMWd+8SwVRWR/YTjGghiBECyk0jq
         Uk4gwO3uL8UArO5vMTGXMX2uUuoQfoCl0Dxv7o5PB0VztPynA9YwUpGj+9CXZZmKlsRe
         VE4+YyYGShvfYtInjDS9rzWpM7YKkSD6cGnHxxyBtXwpvcAiSbpanYcMznS8Wu2u99mm
         mH/03ZWEs19FnzkwS9xbEpYP/dupKHn9VxlUVggwaNE+7Fk58aiq9o1ZEuhkLlPd1pUq
         v2wVDhXZGP5Jw7lOkabOK2oapAGsAGN1EDaCzZ/C+6oa11hBn25ZoNnLuuMFxiq4TQlp
         +7aA==
X-Forwarded-Encrypted: i=1; AKwUvBztXgnhX3hsGzT20wMbmINEQC8GI4jynarcFsmPyDClNOrSA1NJHYUNZM4g8q9I0pbJ7saejV1zzZhV4mIJ@lists.linux.dev
X-Gm-Message-State: AFuF++nV6vM12AAjfvKbXUOeraKrldHnTy3lRiu+lKbV18ccgA/pWe3G
	1jx/ZIrDHCxB5uDH+C51ubJI6xVJfcRficGm61uQzR+/rEQmlTWaZZFCBZ8tVt8DxibayKehQMi
	jYZD1wILdRShuaDYej328s+rqnA+XCxY=
X-Gm-Gg: AYBFou12WxIu4xW2g8N5wDVg7abk6Oze3Tr+87J4ul0uWoOYTeUKxDt4LGeAk9rWb7V
	FeYRtQp7oWRqO1drxN/DKenlR6l6xQ8R0jgXI21b/PFgRfRcEBxVIeCjAnLpNG8Akmd+UsfMgeo
	lMQklt7n/D6I0VUcsb8FIMcgWO69Xe+7DJErKD/wiRWEf64B3JfcKvzS5/q6KAu+pjhqE+5o/fN
	P31zHVpkT+4k0g5VlsgGSVGPrEw/E4R+AfGt0xm7ZiuOpR7iIFOE/fPJS1Klw7RjB9gQ7kS5z1K
	rZnoPCPitwp89wAYzKBSpJrlCKOV4tPEaUs7nDhx8d8owtb+Dme4vXrWk6lv8imz
X-Received: by 2002:a05:6808:6905:b0:4a3:fb6c:9adf with SMTP id
 5614622812f47-4c31b6d0361mr15432882b6e.12.1789281321263; Sat, 12 Sep 2026
 23:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
 <20260912132517.55686-4-abdelnasserhussein11@gmail.com> <20260913035957.7eb0dd2b@jic23-hlaptop>
In-Reply-To: <20260913035957.7eb0dd2b@jic23-hlaptop>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 13 Sep 2026 09:35:09 +0300
X-Gm-Features: AcwNN1Xi4im8pLXxHZZUbsbRPvsDuBfyr0AO2io4vttPAiQIYAfumvbhkH4AsOw
Message-ID: <CANpqX3YXXO=-=DZgbc1NG2jsSyQwnpYwHzvDrEV6zHK7Y6iz0g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] staging: iio: adc: ad7816: Use DMA-safe buffer for
 SPI read
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thank you so much for taking the time to review my patch and for your
detailed explanation. I truly appreciate it.

Your explanation makes perfect sense. I now understand that the real
issue is cacheline sharing, and why adding a dedicated buffer to the
struct is an overkill for a simple 2-byte read. I also looked into
spi_write_then_read() and saw how it safely handles the transfer by
allocating a bounce buffer under the hood.

I will drop the custom buffer and use spi_write_then_read() as you
guided me in the upcoming v7.

Thank you again for your patience and invaluable mentorship. It really
means a lot to me.

Best regards,
Abdelnasser
