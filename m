Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563C2D1913
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870416; cv=pass; b=PMhIwLQfIoIXa/qeJWAsnAZdyqFkbnKA6nEOWjv88HaYS4rdKo+rMkB52dRsM/8bLceNvrwr8x/s/ojnoeDSGN0MZ5PS4fQu6lMkZoXk8HpR2HlG6rbM43ANpfVDf8li0kBkGWbNUCYZ4UX+FxCnLgm79j0rE5LqjkTj1jZhd5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870416; c=relaxed/simple;
	bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBTRmGydFxM5k0c7K4Q0g/AIlaPCKymfjJ3Dm6hQbKxd4rDBbQdzxY+5ljCciglnwbfPeq9TcktjwoZ4gvUv+8wdTvo3sSYZAQ8JcVmxMrA2wcG+LQeYHKUwqROnPWUIJw6sB3/1crmqy4HafabwbY/v1qjAc3KKseCLBnQghR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/fHBODM; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/fHBODM"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a5a37113aso4453297b3.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773870414; cv=none;
        d=google.com; s=arc-20240605;
        b=LY1SHOT7OcV8P5tYOkHi8GPKlHwIgZkLuQIJYYR+F8DPV3axqDS+NK6oekdMkK55/0
         tVnX+tIH2d3lCK2Lmvm30rgdMtfYGl6c05ADjBBJMa2I3pU9XdqFkCevqQNWXiXnwl/E
         v+5LUrG3Ujxz0QocYTPoYzHFuX0KX+AzaWD3qGaBkaSJmq9nzWCViuuapKbLls8GN3HX
         9Udl1ACBVzGRWFpVMbrpbb5o9DUKo0DJeYQH2t6mXsEkDhjafk7Z1J7MTOuHxjpf626l
         X1s7O2yQ5syvfbWRkIOOJuyvYZXb2GZW6OAsZrdziVRhSEtLMgBvfTWZMIfncgSY8eWn
         RoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
        fh=bINO2DENXOdA2XVRJrIWor/7m5rLb7asca3r+GPr1L8=;
        b=i+3JSEyY/xZz0NPGIcbpaqLj9YZX7oZAUzFhE9iXYXxQkpCcmOP9KL9TvC3yE7tVvv
         XtdOPiNP9WVPeSsJKfghmJqRAp77yAWuYBH7G8vdstOc68O8AIWEa9Z1XbDLUvaDtlqO
         +enG5ZYJQGGpQaLPbhiLceoEWdPRNs61YJ28l6nOVlUyqE/9r+GGASnt/V0EtL+hx0Mw
         WIQculsD9zk+4QBrf3L+lojXdAqRjCL+bQwgBt1LCGsg7as4PuKxfzll0k/d63QePRbB
         G/L6/zJD588GzYnbzfrccM+qVXzKwMyH4vCAFQoVjHZl4OU4r2jpj6hwr1iuZlTk87U+
         75Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870414; x=1774475214; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
        b=N/fHBODMka7UhjBMixYZcLBc7d5GtAmVCRyHCC1jpfEI+SxHW7n599oYen6W0T6lho
         0SEmL3cTg+lyI5mtGrCKUm7tpzzvWDQM2reLI3VqS9/tkcleKq+unMfePf6D8Hp2+odL
         vNnt8PDPPvJ0/oemQna6T5C2DKPHK3WJPIF13Dn1DGhr6vpfMUU26q3DFzjZC3v1Zdf8
         oduiJYJ4zWqeWv7ZOjjylrG8OV/UOs9dNTWMMoyvNval2qXZVyk3znxgwJsLpo0VT8XO
         CCli+nAcVT1HTIObWcLpCFl7LK4IJ5CHjQD+SDtIR44wLrSBIKhsU7J9arbcJ6aCXEBr
         FzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870414; x=1774475214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
        b=si7Q+v0o66EQjFOpR3f+ybfqH8UUuF8Oo/cAktLP9DlugmHWxITHR5v+ke/b+bOT7r
         UeLAYb0pXotatrx8iW//2AJqRWrZS+DWd1vNAcebZxGm6GK3K55YM0BkbS9moPshS7p6
         BPNBPnA3qMEROSlnzWmMj/zt85/FRh5E8dSTZs97QF0J5xkr/agFPfUzlPZ9IZaTKoyF
         Jo0f+6ho6Lld4H44EEyezXz51Ckw7PMq5FF4jGZoKT3eRC6PQ15FPnxRZMcpT6bTmExf
         Ds15xznS9vb7vNxM7yOuZ9cji5NQk3WFsiq4AgAGP36rv8htVOzUHMz4pFwuvrQxzknK
         5f+w==
X-Forwarded-Encrypted: i=1; AJvYcCVMuj98HhRYYfch+CRbPfclheKsC34sgdAEoQRGLc5ZFrsJZLYusen2gfrbVLAJULnGvcZhcg5ZmG6+akup@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgufuaju2a2CxrKMiRNJ6RKMeiiF4F5U9DEPGARlixKhVudnwM
	8xVp0mbugEkoe4e4SwECU+9xe14X9Gm8/FerMPw8aVtV62dWC/DY7kJ9dLUeWO02LmxFllUZnNM
	VtutPWWSySi7ERFI0kGBtXpZLeNrRZ/4=
X-Gm-Gg: ATEYQzwHqhLMFpucG+e8n4LsJUbI2AGiooWnI+0psbifv0YG9lpDJzbXELYuAaTCl2k
	Vih1+cK4YvlR0AhigibnF/rIYLWy/+y+k9H9PC7CTb4wHlKqshbcJj3ZIXo2SvOTka959c7bfeq
	UUEg5/P1yc5h0CNBeb3AFmx8RqbX1J+sc/9wCdhYu0Trk2TD2PmR3uWhmHzXjvaxFomLjrHWroc
	BMVv78loMEwaGJT1l9gZxH07+zpvb+Lt1UBAAcAuQ63xIgxOM7TRTwZB3wLac+6IBFF9lxbjj/I
	1TTeHJ2P/HIWI8jkWA8nqYp1aZc9SHkBOQFpbQlWxQ==
X-Received: by 2002:a05:690c:306:b0:794:ede8:16c with SMTP id
 00721157ae682-79a71cb441cmr51434537b3.60.1773870414582; Wed, 18 Mar 2026
 14:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026030929-uncheck-reclining-315b@gregkh> <20260309220718.6475-1-rayfraytech@gmail.com>
 <2026031833-pampers-steed-4804@gregkh>
In-Reply-To: <2026031833-pampers-steed-4804@gregkh>
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Date: Wed, 18 Mar 2026 22:46:44 +0100
X-Gm-Features: AaiRm53ByA6VMxh7mCaA4VxNX-qpBPtj7ba4TdrG9fDe7BmJ8WXBi91iGdO7w1A
Message-ID: <CAJioSGc9+_g_tSaSjaZKv=1Gw4YyVbSP7k_cfhKVaMEB31o3Zw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: nvec: fix block comment style in nvec.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 18, 2026 at 3:59 PM Greg Kroah-Hartman wrote:
> This change is not what you documented is changing :(

You are right, I apologize. The commit message was incorrect.
The actual change was reverting an accidental capitalization
introduced in v1. I will drop this patch.

Best regards,
Oskar Ray-Frayssinet
