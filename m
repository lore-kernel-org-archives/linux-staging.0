Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211000;
	b=YrtQXQAQldD+6dYvTOe4b003fJRwcqMdJRyanl2mgvplFB7jVw92wgyrwT5iyZg2gddC
	 UgN7FDBPeleuyAQ/6Wn1wIfOTrmtXM8oMPvPblqbqW2PMPij1FaMStQsy/Oz3Q1KlSGhp
	 9XH239ibcjuqApQdbXZs73hIzTGnP6tlF2yEStiLc6iOgc7lx7Kl5M/v+aU5IRCXvY041
	 q+tqp6FcDe8LzaL5czpxdlGNyrpJf71Vlvg6b6lNuBqYTEKYPaX5qmBSceHZhG/9Ppdv2
	 gu5rqCdYVslOq3T+s2PqFLFUccEhKbKsGcSXO9v1XrOGKizp0fv0OMfbdYnZdW+G4Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7HtWqT9F1u6rqdoIAv+Z0YVgKm4E4z20nYKHKjl2Zos=;
	b=3r3z6fvQrz6GJG9KgR/OIQ51nioS9dVKL02PIF0VcswxhyHzCc//67LkcEY9+O9uB/7e
	 2odjeufLls4byQk4cO0G0RNkRj6/38hpStPK3LhtFIrJ4sOrrFQoYcD5/bqez9T3RELFs
	 kuUbEV7Hz4U4nRmdvjpWLmPkCjLaaAlCJA+k+KcXuiFKIDENM0lGkX1b+9F7bzomlczSY
	 qW4N9uznC7oXAfwCR1RVORx3O9j0Tq57OqsDtxJ0QmbRHqumkVAsKGw866eGaquS+FK55
	 vctbHSzSUMLHZ07Zi2qZQ5MFhw3S9SkNkisTW0oTsGo2GwGm5L/ZRvMteckIOZH/urA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEi7y6xq;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7D6606A321
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 07:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D7D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEi7y6xq
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so406992f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 23:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210998; x=1794815798; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HtWqT9F1u6rqdoIAv+Z0YVgKm4E4z20nYKHKjl2Zos=;
        b=QEi7y6xqK0iO+xDLasPxCxKNRBl87SB/dDbqzvZWwetnAZenVEykEfqgNZDJw7xEXE
         Nwu5OrRb2wnYhmzpgdj+2jcKe7yXYmFnAzZibrN2eI2oC8WPmIhnJ9H+ioV73K9LJjna
         7XUmDrzfIJN9MUSrNChwxvQBajv31ldKOL1Rkb8AEp2vGyO10xDcSfEyv4Kkeaf5LpNd
         Y/Pqt2kziFKQd+glUATG9+0eTWBtvpIrW0BLfmGySieMDe+f7MrpT2mJXehMMU+emn1A
         y/f4BScdo0CYQOVpoFLv2VD7zgrVAbXK8J0zXuN+5JS1MRlXccf9dHSgc7v0NtUwCWQl
         ORWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210998; x=1794815798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HtWqT9F1u6rqdoIAv+Z0YVgKm4E4z20nYKHKjl2Zos=;
        b=LmZCAQiAi0hlyKa8Fy18cg+xSa3US7uqtDU4XaIKwyitzAGU4lRVz7Me5ypyP4CqEV
         txlm9euuyCRajq4WsvcjZANVuK2P5/LzxfWuOUZp42loqtBI2L2x7NP4OryGjzvr6Ov/
         nT1A5iP+eXJC+E7PFIz17GPPReb47yLRerVRRQ56NBeSmpDdjCvAKEFFEUluUbpuTyoH
         lxd/M9lMkgTXczhIGE1erf7Os3PQ/vDMP8QgeVqCLA0MyvFqM+97+vE1tsgdxGutly6b
         pcP979SHVfl38YHLlE1ZY0ucevpxAJYRyKJkMYmO6ZRTOQDcZ1/jmt+LsjzwUfstqKlj
         A9xg==
X-Forwarded-Encrypted: i=1; AL+hErGHcuda7BaTB8FysRAZ4UwqtOimvj7ewQQL+I3w7WXy0Ps569MmFAPaPF7JWbQ100IG7R4k73sn6Eh70kSs@lists.linux.dev
X-Gm-Message-State: APuU4Z8/mg3PWDIQ8fRZCiLVUb9hsVvWz5jIwBFwXpd8Z/m+Xv+YUmhJ
	uhVA65QkpF/FW4XmsgHFHMafhT7uqUlGQiyjGRgLzvGiggyNp2m1DDIO
X-Gm-Gg: AYBFou2Y79VWJ1AJrEdcqvKSSqwfeLE4dEAn4sbvoKEZyybTY9CYBcwbzCwZM3N4pai
	cpu7Q105XqUfleP1mdrSNpQlK1JtkcdGd5VfeGJmMs+BxoKg9fHF9aYVpTI34ezl2XQC+wx+xK9
	uXXYPKE8b2AiUu9Li3a0FEFdYcQPaCEr9NkHiZfNXZaH6WhYiHlPs8bZYILYvij4FKZ7GFn3MO7
	v7C8xM1K2/Wod9HOnj7syIP+mGSSMhGfMowWJZqjFHd5PyyX48iKJQqgaT9JD489CoR/1G57EpW
	CL98R+8s0ie0SqBRwThpfE2qyDaGJBMPKtDLgOVFfpjb6in8L9ep8bMhOLsYYMEqYsGXlQecfWd
	JhVCWLEBCicVXrJoucYv3RdTdkm8AsmSFlzZBrD8Gp6fB23PRzni+GPMj11MowF9tQqDDlB3t6w
	47IDD+HbX3Tva0v6NxzoMAYgx6iwkT5OqtpJZPILVenPCvUXQ5xSwrUZs+HwpC+JA7dL4yBETu+
	4JN5gnmKG16k6Xx+9FIRJfN9vtKHPPmnvgZAMJh3qo5bmTiJiBPaAROIlx7oisMBroX8u6tcejK
	axIyOqV8izolw1ZPuwAyxer8qP6z1VeL+satRdx0M+kPrc5s3VHzTPPki7kDI7OTafpRJ+fj6sX
	DiYjnJkjMoiqQl/FlrK+zFQLe7If0m8RvTg0e9jZGNvl3c8wfClXLwoplUim2JOsNuA==
X-Received: by 2002:a05:6000:2511:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-494248ee013mr12152572f8f.21.1794210998445;
        Sun, 08 Nov 2026 23:56:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959755d494sm9252436f8f.41.2026.11.08.23.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:56:37 -0800 (PST)
Date: Mon, 9 Nov 2026 10:56:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: outreachy@lists.linux.dev, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
	johan@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add newline to
 sysfs output
Message-ID: <avF8sf_Auo0z-_93@stanley.mountain>
References: <20261109075242.62681-1-patelshivani2283@gmail.com>
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
In-Reply-To: <20261109075242.62681-1-patelshivani2283@gmail.com>

On Mon, Nov 09, 2026 at 01:22:42PM +0530, Shivani Patel wrote:
> The sysfs_emit() calls in the show functions for audio manager module
> attributes were missing terminating newlines. Add them to conform to
> the kernel coding style requirement that sysfs output ends with a
> newline character.
> 
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
> ---

No.  See the archives (lore.kernel.org) for why.

regards,
dan carpenter

