Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F682F7F14
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511536; cv=none; b=CrMv8MpFyJMooLQsndeZcFme5B+4sRTGFTU+JG46NnKOn2AUiAfmalsjk7wGw3UQFPvN6LKVMvLcLUVX/gJ0izpaaTNYfNmmkCSbtz95SHWZtlaPgHt/1r9uUPKAbaPvRhpct9KAlTmN22Ro3+TXYRNP7O7k6HNNYTOePLrKi0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511536; c=relaxed/simple;
	bh=C6GWuDxvvQ0aygQNHKFgBKGLEGmdldxySmV/5dbAu7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRzGheEiITXpcmc9X7gBMbzn2ZqeTVEv7y1mWawvTkCpO33aAmJN5g2+gDrArurN1E0YX0bbt0UapS6BMY/hV6qJdRWvgOi5ZhYMBEG871BDWY58l004PPjmcRM7urNhC9fdpyq2UPzmEVNs3vigo8E4nlYS0gCPoy3Cah9Qv9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIP+7rBv; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIP+7rBv"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51758478240so16115811cf.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781511534; x=1782116334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWLdQLm3J2zWM1QA3MmZV2U2D1DL/u5j1Qzgws/RERo=;
        b=sIP+7rBv6Eykqy+XPF5W8ey1fgixM9hE59UUXWJVuvT/E35DzMpNg1BrM3l2EyKjux
         7+qHmTeF8iq9rOahZc25xY+W8GKSYTNlA1eem5Le1RWCUKxEKfnbF63KoaVUnb05uTty
         UeDwtjqKoSQy1LD5orHG32c31vKDtXnyN8XlhymTusAHA4iqLqYSMWkjxmufCeqikprg
         VK06Sr8pghBYSv1q/JUNgPRJ754HHU6Ou0E2whzkfPPpjW7RNN9jgauIISChJfeH8Jac
         grxjxsrXzjUixkyBaxvvgYDMxyUVG9JV2Jje7UVNuUE/k+43s1ZsRDFrV+RAhYFqd86w
         0Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511534; x=1782116334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWLdQLm3J2zWM1QA3MmZV2U2D1DL/u5j1Qzgws/RERo=;
        b=JNtzjZHttbV0I8VkXCDIHh+slYAFoNjXfea+VLJWFzHg01KE7VPUnvDtKPi7g0v44i
         KghG10DPFvBuEJq/5cevCRZ4yF3xoA3iP/a9fjS4wtWlwc7tC4tKjZlq4vHsqrS8H7Mf
         1hC5Ly2lR7HRe1FYYTOLdWrwrZiXKWl1h96wPR2WXtI3iV0ADDgvgkbNb3PBpfjvaOw4
         ts/ZxkQoPjOD4yKe9XAC53pQd+leiHMtR2v+tAXXL3xwjNrBDSc9qJ1WkDa+aurWeDxj
         RsyYyWe1TeLDcJAJ9ZXGnrQXsZxo4TZvI0ZLCeI70IW9RhR4aYnmDUagMHYPd1YOewdn
         cUnw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZaDZEhUGFqoKIHoJSA/Nnyk9Te4iJH7MLHEgeFKwMVU0E+clSIJkj1VmQQCkbOJPsDMDVe5g0P1k0h7kt@lists.linux.dev
X-Gm-Message-State: AOJu0YwB9JL0sXeAiIsjyeXvRcx6MWjtXm1yrkDW8QrJE6+Cr9DnLdWX
	PApE552wyJiukKXBD+WPdYlBNNlQx5cTOCaMzfC4kL7lo+PBUO7GQ5wh
X-Gm-Gg: Acq92OEcHxuhPg1YZmFEsGYjN5KMgvn4WLhZ47tOLjs/5dEhn0RHV9nOGzIL03uzxkc
	/Ps8cKWHENtgSvD+Xc5HPtERLHnuhqSc3xO/g8h+4XYCtWpVwNqAeGimUqOLXAyS3zrpOL8fXSh
	N/ikTH+QD7LHb6cXaiaiZt5RKtLkbOffE14f/rO6mFvGfsl3K9FrchfGnsR8dgwk+vqVLZ5cAMl
	b1M+PTNHNs7YT+Q0I/GTDl0q21th3+wyvTSPBLQ+TJt0YrKzcl1rc1VyWJ3VzB0/gzfteVGF5n4
	ulytQgUKxqUp3y4rCfrP0zYksHPLyOoWT58dLXOJQhISqbC/fbx/IEGQBI/fnf7YSoXELSNebYh
	NEFmTK4FP+wurOfsEHtalTjFuyKS24KVMd7OUi3sz/dCTnbKpf6Ic2/We/LWR6jzNLpYqoKZ1xX
	ISTjq+XXfaQTzEojev
X-Received: by 2002:a05:622a:14c:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-517fe4effd5mr188145831cf.13.1781511533908;
        Mon, 15 Jun 2026 01:18:53 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6428a6sm118854651cf.12.2026.06.15.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:18:53 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:18:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] staging: octeon: add missing tasklet_kill in
 cvm_oct_tx_shutdown
Message-ID: <ai-1ZsF3dzqXZcbJ@stanley.mountain>
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614114739.87061-1-ayushmukkanwar@gmail.com>

On Sun, Jun 14, 2026 at 05:17:38PM +0530, Ayush Mukkanwar wrote:
> The TX cleanup tasklet can be scheduled by the watchdog IRQ handler
> to execute cvm_oct_tx_do_cleanup. There can be a pending tasklet in
> the queue which might run after the cvm_oct_remove() frees net_device
> structures, causing a use-after-free in cvm_oct_tx_do_cleanup() as it
> iterates cvm_oct_device[] which is an array of netdevice pointers.
> Add tasklet_kill() after free_irq() to ensure the tasklet is no longer
> scheduled or running before teardown proceeds.
> 
> Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> ---

Looks good.  A couple process though.

1. It needs a Fixes tags.

2. You need to say when you are using AI.  I think you're supposed to
say which AI tool you are using as well.

3. You need to say that the patch has not been tested.

regards,
dan carpenter

