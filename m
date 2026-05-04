Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943E3B9D84
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895880; cv=none; b=RwbhIR50ODJgcC52dX38hnLXrOMnY1sVeIJTigN/rFzyVzUicIbZd7CEyYilMm51hZxvz+Gdwi8g4Uhq6AYD+TQhKhIjDg710ILimGksgt1W09jHXcKClZk99tp7zOd1tCHm0zwuCmKvVlBO44Gq0QdEnA5snPlnvnG3r9h+qxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895880; c=relaxed/simple;
	bh=BcKKSL8vSSZF0gP55JcdQZVPre5XJmBMh2A9VhxYOqs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=XfiKVfnJg9ZTYDE/lokXoWcxoCI5prCfLYQAXC2Dbp/xzco53iR8TcsMtimFNqPqFx3Z7no37iYTFho+o3USg1jumUnvxddncb8THG6dtdzr/h3M965+s8DFgyEiQHmLiucpLxaEv1y2Mszfaenpf2BABdA1Wq5zEYQhajKPBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrjYoTTE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrjYoTTE"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so912581e87.3
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777895877; x=1778500677; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gL45qAsvoGd0CGyXzQ6wh+njmPCmoNGWYA6JLpdzAXY=;
        b=WrjYoTTEGElMCwVEj1az5qs9I3P8DRp7RpNAtakbeO2m37RIp+BbR0//1+uPXfJMWe
         aKVp8xGmIsSjlMPif/6RHWDca25uN0BNdPmDf2/wqpwhG24VvXUZBZ+/oYvRFqm+LSNL
         EVeFngpJjpdjsyv6VyHqJXqXO00cHjnd9ntPQk80YlqW5MIs1iUqX16OkW7/6tbDONzy
         ZCwVW9HKvl4lvBtcQ8KNAbi2m+2Sfb5lSJGq9S9HJSbzS+matXkf+GLrhdligAz3mP5N
         fVU0wpaw/+YSXBoncpOYvwyhi4u+bnDtZds9tDC99kmzAym9QhPMnOhm/X8+5mFyjz0m
         1QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895877; x=1778500677;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gL45qAsvoGd0CGyXzQ6wh+njmPCmoNGWYA6JLpdzAXY=;
        b=OLEXI3fBH7Kk6yNqDe6kucHNumfB4d6jUKUgNyoEZUiQ9RdHIA+ipzUbB6y/b0dyn+
         uKECtjPfgh2u1OjwAeDOlOjbRvlhCPD2ihuWex6JRygvzERzh4Zjx5qB10rsiGpU9vcM
         ksn/5E4IoaPAewXvvyi4eBXOH9YfRH75ROspJxuzTfl4w7OP7WWITSlUjGEdJiGeeSz1
         wHyC1Z5FGdf+mjmnXdTbJ4hiCoUHqwymBL7kI157ZcIsIW8pjx/dCNsh4jhqs4+q663a
         ga5Tydoinr+m5j/M1gImUQaU7b9TOmbIe2UflE2Mu9dKW6S4oOkgOSBBB6WXKwroIIlW
         VhrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9imILu1HxulFAel4BFgtbHgfPFzpjDgAHdeXcF7nm/EdYLcHRVvyEpm5sH7ZvBBj6Oy4CKnAVEMYS1kDgp@lists.linux.dev
X-Gm-Message-State: AOJu0YyhwFMycLOtlp6VA6OXhusFTD8bNYrVHdTHDHDlBgNOWQFJWMEQ
	GINys0SzOzySdQVQuSrcSPrwbQp/l82DicK9TlYuOinN45wmJHw58w2feb1MFA==
X-Gm-Gg: AeBDietg1L0ioSEN+4zJbvtRkvnaKkNoa6yBeoOJDq24x6tQtBQI3+CWKDOwP/E+js7
	7UYF0Q31JgaO6c/VjQpnXozANNqRH1Tyvu+SwB7e/jv/DhSvyKIYAxrCvRaoRIhQxi6yOFPkzkf
	29H74Dzny83USo8B/TgRpYYeu1aPSauANEHHYNdCK9z7ZrGNEolXEiplCmx02viTXcpmWwsNej3
	oPFS7qQWGlZIxCFP52+U1q03gEVEHVMM/adxCpeRukDg5niSINQ+eAkMNhR0cIpVS2JhFe6R/T9
	/Go/t9ltxsBW8u+9ODUBvxSQlfXncR7u55L5+mWn3Qk9kaDTEvFNEbLSJMDTvnfRojX5xD+C2Lr
	lvZNP3z28KiD+OkC4Eo2t9DD4yb5IoPJyEVMF5W2NcGnptlJbqIgnrA5mOaP73t1jTWxF856U++
	IWWhvhSEbvh3BoKhW7acd9i8ZuQBsqT/eAhmbXRoPWAxW/cw==
X-Received: by 2002:a05:6512:3d88:b0:5a8:6c7b:f9d7 with SMTP id 2adb3069b0e04-5a86c7bfaf1mr2023721e87.41.1777895876820;
        Mon, 04 May 2026 04:57:56 -0700 (PDT)
Received: from [192.168.243.250] ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e5asm2893276e87.33.2026.05.04.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] staging: rtl8723bs: fix unbalanced braces in if/else
 statements
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Siwanan Bungtong <horstaufmental@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, b9788213@gmail.com
In-Reply-To: <20260501205336.230955-1-horstaufmental@gmail.com>
References: <20260501205336.230955-1-horstaufmental@gmail.com>
Date: Mon, 04 May 2026 14:57:53 +0300
Message-Id: <177789587345.4095.15139970597218245618.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777895875; l=357;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=BcKKSL8vSSZF0gP55JcdQZVPre5XJmBMh2A9VhxYOqs=;
 b=Gi8BG8Envm3oWz8U+Tcxz4ptnbVNHzvgJDE0kWRyGosPo4tVFdzTzIJHPXCo8gsep6m74hFFN
 n0fX/4l9/VCBeOlPREWLFND1BKL2waIiGSe0uTmn7fqfB+mZ2nVUEa9
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

On 2026-05-02 03:53 +0700, Siwanan Bungtong wrote:
> Fix inconsistent brace usage in if/else blocks to improve readability
> and avoid misleading indentation.
> 
> No functional changes.
> 
> Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Thanks,
Nikolay

