Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FA2E88BD
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 02:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824850; cv=none; b=c+fCmXUIheXGRclWdSO7dhy0ud+Vb9ON0uU13/HYOV7L1b9fj6x0tN7VDaGr4NyAWqsyhHJpNtvkBO/9PYpw2TnbyTV16L0DV2D6I1PMzuKwBtbJ8Sx4seFczvFefoXVZsOmLB3jSbKH9Kq7B8oEiujaLUPhaSA6MsaHkhHq0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824850; c=relaxed/simple;
	bh=b41jh44FkQ9SdV/6TWtbfAYPJGPtAdi5HYjIQm6bbBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=l6oIPdL6lSYeIrbt1jKEtNRclDR5OnBNYYWdMWlL+7Ti5Fihue8N+9bkKNmPjzIwVTTIeMPObOQaOepljm1FFtarCeAu6Xxd4/MzaIGGF9Nph7GCD5tL61AE7mR8ie4Y1Wiu5fk1IhvKSP9Nje+CQDToug9vwuhOvTDrbQyr8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh6pDnOI; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh6pDnOI"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6493937c342so2678108d50.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824849; x=1770429649; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b41jh44FkQ9SdV/6TWtbfAYPJGPtAdi5HYjIQm6bbBc=;
        b=nh6pDnOIHi1oeRxnFVyZel1j7XR2xI6tLi/zGqP1MjQ/m9VjpPZ/Tlq9G6DXnCU4N4
         MS2Whu6d4rEJnkq6H42C/iioWzY7f3yVYVOpTygD5WW9bsvr9PEkmbFtxYMndjKLf9b5
         kXx+6pIVB2557z7jDmy/NSPRxXY/kWmyLhoOVcyj6Mtt85kGfiRmoRdkCAcIjD31rawz
         12treFblhyaqmFhyP015y9RHUoIjug0CFltaIByHMEFhK5zVhPa29LdPwlCy4Hv0VNpL
         5TQWromLrLarUAsLvCeHSxShSGXAX/HMtfKR2o7ON19q+NZgytKhxhJaw2JyJ/wOwDoj
         dxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824849; x=1770429649;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b41jh44FkQ9SdV/6TWtbfAYPJGPtAdi5HYjIQm6bbBc=;
        b=SFMnsDVdfUAMbij20Jb9SYdVSCWpKId2I6bGEOPK1PCIMbKFqWrKTNgDnP6wzGvyus
         MOKVEBHel3l4hf3gwsBAoDYwSgyLRU7maOcBCF0UsModQwcCRVWCg8B2/IxAUpLhSQqj
         UDtbrIlP3pvLYzL1SIv24b4CnIcwjUH3hRaMjwx2vBNZCY/9m9uWMMmIlnSEmo9CqAqk
         RTCTsSL70kgZH5Zhh52rYh1uuTSARtZSiDqTSS7W0M7YCjm9jHxr7XeSAPj5pwqmfU74
         Sjhx2ooRElzjK5xkVPX+Q++S5QAc53juhum/gIwqYjUnXMnt6VcZUeLPv9Vluz7/MiLY
         nZpQ==
X-Gm-Message-State: AOJu0YwtcJV2Fu9rUR/idBznrsC9UzQmmgfgRWscSTMODeBqsNOGR/qV
	mjALyrN448xQu7zf+hwjUKRdOPXwZZVGEGWUfQQX9IMEJWER4HJqKdpr
X-Gm-Gg: AZuq6aITrTFo2Q0G7rFFT2+EfaKEcl7Gkyo2koz5wNxlGJp0TkGWNkfqGRKWvxh8F3g
	ouYuOoO3m+ix7GptKl7uW9y+tURD0iB29u/svEVUyZV1/Kwe/GlbTneEpwolVPnzUWqjTg6AeHC
	YhnNSPIEJzWoU1shfisWfyZoXk6rhl+x8l7lnRMXjV2vT5nnTIwPN8QV1XN5BH5ZGXfzxpd05Hl
	xx7Jvdmc3HSbqE8krlNKDkOSclMKWVRZGKcWlTWW377AihsKS1a/73PCgFEmeFr6Qm4cSgGtZ3M
	g2WUBQf5VdhjW9j7hbYZH/5aXsfenT7BrlcvOn/uoAPewY6/+kJmgRnLzlY+WO6buYdOmJDKIxg
	8BTnNtl2/6b2TVbl6EyknT9oiI26jOqG3JCIij0GyjSGas2AvYM0BGL7SUsa89R6zgzCK7M5u3e
	ONjoxA66jls0z9z79ghmiSAdCRv2HB1f4=
X-Received: by 2002:a05:690e:2510:10b0:649:4bc0:b82a with SMTP id 956f58d0204a3-649a84fc18fmr3230768d50.78.1769824848696;
        Fri, 30 Jan 2026 18:00:48 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64996077a1asm4367292d50.8.2026.01.30.18.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 18:00:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 20:00:34 -0600
Message-Id: <DG2EJKK9QHNU.3FZW11GYOOOZ4@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Fu Zang" <t1468150755@163.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Fu
 Zang" <t1468150755@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
 for small delays
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260130130803.42858-1-t1468150755@163.com>
In-Reply-To: <20260130130803.42858-1-t1468150755@163.com>

On Fri Jan 30, 2026 at 7:08 AM CST, Fu Zang wrote:
> From: Fu Zang <t1468150755@gmail.com>
>
> The msleep() function is not recommended for delays shorter than 20ms
> as it may sleep considerably longer than requested.
>
> This patch replaces msleep(10) with usleep_range(10000, 11000) to
> provide more precise delay control while allowing the timer subsystem
> to coalesce wakeups.
>
> Found by checkpatch.pl.
>
> Signed-off-by: Fu Zang <t1468150755@gmail.com>

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
