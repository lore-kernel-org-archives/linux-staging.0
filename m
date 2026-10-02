Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D8361953
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961822; cv=pass; b=uT+GuVtH287AR/tmGkF3Xeq0Zx7WJUJ1HtDCHLVHelyf2F/E9XVzvB7eH2QubzGjmj61FRbeZcCVMwab0ZWU4FuBLXp2tV4T7DVNdIqA2N+6p76sz1vrnIcvFfys46RQ+wPkUybX80omMBolTzEuiWCCL1ciaTari80fiweLhFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961822; c=relaxed/simple;
	bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Adp3lzNrq0ZwxT4u43H/rx+KnAipV6JRDOgTG8gHNGH//DuCt82g7Gtpf/WOvLyshlGIopn3qLPEWMEnUQRdsSpN2Qswz45Sp2gxpnb8XgWYl+rVOCDqr74qi0vqdHD4vhLlmJQWNX/kSyRIDZcrJAHSCFUzkJn17RvN4bZq6Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCSCVqkL; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCSCVqkL"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-483c607ccb4so814380fac.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 10:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961815; cv=none;
        d=google.com; s=arc-20260327;
        b=FZXBeUhdmnrnOqW8k9df2q9kr6u6fUriKR2e4/hOW4kkX+B5OP5Vcfib++ylVZ6ggH
         4ZprofYpPk0NI150t3r3jM7cGtvyyRdQP25leBulBGceL5OviNIMVAJY8A/fluIbV2p3
         1qcDy99xHqWeSgWGHPsylLDBF5D81mCKv6QmUfVWgSUaMb4bLToDbpUv9J8QbWN8MDZs
         eKFEQ87Dom932gT52KOe0Et1wydYnOFIkqbxxi4xkZfxYbvtCzMsd4h5DvcaK8sJOLZT
         81+nhnIuM+Hijr0T2U56Pp1WIJB0I/DdRyvTFjJd8wy4u2GjkuN+cjO+Mc2EZdxMCEfg
         FwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
        fh=fGaeVpsNshGiYuHr/ZJoiUz2zII9YoKYEB+j9MwW+fs=;
        b=Y8SUpqclynomf9SE07NmhhFulJ2Nk2HolBKwAI3EZEC4Nb/Vj2A/EARG0yVIEjl+qO
         KSZ7piEXwC7xjWoRoOn8nccVvd1Ar0GVtHzUzqH30iRdNWzfT6tjtlSmqGgxPLbYokKX
         r3BtZi2Il8+r424qw9aIJ3ARgW7rkIiezR4zXFx/fysTMX2cBOMh3/kwvzoD5rdYwZn7
         N9N5gjkV/4FeY5jVCobRpUmg4Wyu9hTdvlBcLbh8m+M0HYfVWb/b54JjdNn/UBXDs4Ng
         OVUm7F2l+EwuMZQMEbhi/paMcKdcwbQrsEuCvE5o5IldV+VE/iTFJbixO0Vl7EZZ70Xi
         BFXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961815; x=1791566615; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
        b=KCSCVqkLZGbPkkoMS/tDoOzSnpLZSqO1KwyCz4wI/o11wnEcp2GOIxRnrKLQzsjzLr
         IoC92ieeptBNGwaIHBlggQwYC6y0bgZ7OLcpA5BMWpcpaeBP1rHPOPXkkVx+J/iwACvr
         x84LYeKCsaq1MXQbXiY6U1K6bzwI0xiZHktP8qTEk3wYrLUpeuVfjThRBtptxz8xOGsw
         bRy4mikgxQ1eheWECZNOcnGyQ7XkNbRtS8Vm+aga5mGAOkN4/U5HfTFl+EN7UZjDKXlY
         8kLj8VRdig3kR9tdCUvR6aR59lgKihbeil1ygvaYTkEbI0+21kHTmp1vCgaPfFXfEuUo
         Td4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961815; x=1791566615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
        b=OLiuJ7d/JabVfle5DZU3UvxCf6bswce0tUN7wfIIo/IGFUFcni2IS3W2Yb5RaTT1da
         b9aZPnGdCAHEVckms0sa3FV+S/MeMgSjliD1r66BIpqD/l5t24G/oD9XAJCHSjCK0rKh
         OoMxRJnhzhwN4S3AudReZAF3ZN/r9jR/R2oJybeQ0+2+MK6giB5+6gEKRvqf3uz5wErx
         V6VNdHjaqO9uQ/TkWNZEjO1hNPo8HRacCwDotM6wXKH+qUEib8gnlSQrYZbjL1dxZJXs
         TEKy0lgv+bPPDuHnOwHLW5yHPN6O6wcBgM+Iizep56r9zSAZGIAiJ/FeojPPnFsJ0l03
         A6Pg==
X-Forwarded-Encrypted: i=1; AKwUvBygFNIJ0fOu0be1x3spdOHg9nCVpiLai7NKMMoNxu+YsAvv/Kt4Rh2OKi1OaQlWKQfDJaL2S0MSIEIwF0Uw@lists.linux.dev
X-Gm-Message-State: AFq9FYKqbdwN5v75PBFEw9H5H6g8mOAs6UwlO1y3U2yDx31NCZr3FZED
	7nVBj0ObXaevnOI0bvJEJ03eVckmGNAlq1LpRaQjURSbU9RiP9KaDC6fHqQ1D3EFs8Dk5Ixhuw0
	8JUfYAbkJlDwszz5b1IDRjbZlCsgapGM=
X-Gm-Gg: AYBFou1n72IafMi66nmwDQKg8u7qrZjSV6vnyuPhzyahsO3lv4ijATGXLyrNsV6dAei
	KJ7CaEkjecPA5R/pkOwhcYVRJycCqiqm+rfMdM12Lg2J7v2vSsHIO6BLwyuB2YGZavOc612DiVs
	uhZp/GoxGPpI89tyP0imZLuvGoPSxR+Tcbd/Ye24f6X1nwncPqS6rFXyTsm3loH8J83yiXHkF8r
	DrrGNmqMYqa/tAsZbzAzY/NF3UeJJnk5I+XcQAHbT874RRHhxKZlqY3c2jb7mdtt0G/5gU1+P6k
	je5Pss1boGJ/9XVA1C8G1vOkcnK6qo6gaIF4Z6HQDwF8WU34U/rdVV8lW/vJnDZxorY=
X-Received: by 2002:a05:6870:e18e:b0:49d:d850:8170 with SMTP id
 586e51a60fabf-49e3a8c248cmr24800fac.23.1790961815496; Fri, 02 Oct 2026
 10:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com> <20261002153302.5c64819d@jic23-hlaptop>
In-Reply-To: <20261002153302.5c64819d@jic23-hlaptop>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Fri, 2 Oct 2026 20:23:23 +0300
X-Gm-Features: AclHuK-al5mseWXmh0Z-6X6KwSRpq7Wu9lvhjorTUxxTKLXGZtC6BdvJZuUovys
Message-ID: <CANpqX3YLq5ckiwjaS19YCVknmz7pRsZXw_f1hht0eWwxn-3s-w@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com, error27@gmail.com, 
	narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

My apologies for the noise.

Thank you for pointing this out. I will drop these patches and ensure
I base all my work on linux-next.

Best regards,
Abdelnasser
