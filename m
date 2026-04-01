Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C52DCF57
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 12:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045014; cv=pass; b=Q8V/+g1KwNaGWELrq60gY6/unx/MfrXUtFwXIoecmP4e3sU2s/QMrLbS5FZpRHGiwq4s5fhL2ctphEH53O7IYBZBbhdd/g1GTGhAeFXlSHLurys29wQU81vR3tVvJEWR2f1xBYTavR4a4jDbI95Hgds39axr5O4RkiokPBt3T6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045014; c=relaxed/simple;
	bh=RbYtUAInTbOWZVTgoqVQzmu9yqJiXJe1PvvADpVFPd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS2N4depm/UPoUeC2a0UUuTXaJFlcvNO3+Rx+lcmGhgbW0Z8xYWKqziumg8S+anzgKPUQ6j94Sr3SPX63xaS3E+5LXFSXE0p5QHm1BMxguZQbyI7eLDUqEC2xVgfGqipF9sZGNt13ZFQ3cR1u7/WUrL1K8xgYkcL9keWqObBK54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzgYOWDH; arc=pass smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzgYOWDH"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5a2c500750dso251692e87.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 05:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775045011; cv=none;
        d=google.com; s=arc-20240605;
        b=SnGSS1G5vQihsoWFC5BxVAfyNAHyMNpqHSrGatpeqqABlBJya7hS4nucktoRwceW7w
         Uf9IUlCnDTNX6NQgnRFmQYLouJmBjlgDih9Q87+yfDN3MVcwefYPKKRhpEC7wujttd7R
         8/EfSjVxmUlOBKog/CONngUBUAiC/HTvhlm4bAxkYDJE3p0cmlFPWPKIlrmZeg3RCb9+
         jBi0IUDnoWsWhDxE8yMuPm1zKo31GWm34VZAEcvIWA/D7zPplluIR5Z3IM8CkiZyYA8Z
         GQaKTf2CufKezng22xRVWLRlKq1aPBgYc4LlvAqsz4LpF8clR/WWK7sCeb6gdz213OJq
         IsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RbYtUAInTbOWZVTgoqVQzmu9yqJiXJe1PvvADpVFPd0=;
        fh=6ETlK+qWDtQuFuSvE3ZI90fIUD+zRywsxhLOaS8u8Mc=;
        b=UzEA2tOyJTue5G//wFhc0IwwSBoqtwDHpu+BqGziXCcrReq8VIKw/z5dlKJCmPW2Hl
         Uxlg+6iazkDltgiQY+3IYE7fKP/KaLPkQmp0V3HBWK87OT73O8MCADjK4s35WgiLJlfJ
         b4y1he7+tGPNP0lUM3YJH3FSiS8nMCufQ2lbogwCKKuHxPGsFgUmGowRlPb+JSHhgjTC
         iIoGRSuTpeQAMtGsNTNmPrn06UktSK9FEYOG9jvUSFTY0/Py8TKDCa1Ltfd02G6Ck37L
         +aMTtE06C4+v4Iiod1kQlXsH05lUnUqiHpFsiLvNGJ6xYSsZKqVOrYmOcJbYldcXJsut
         gd3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775045011; x=1775649811; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RbYtUAInTbOWZVTgoqVQzmu9yqJiXJe1PvvADpVFPd0=;
        b=DzgYOWDHqnLWEo+5VT2i8kAZLsI376m4gasyAGOL13NuwCdqGEuZwTTfB/NZYYIiq4
         5UsLy8dMV3z0h4TVVi+v8jN3uBMlAIVE1i2537fH26zpD7dG7Dot+MgUhD50T+yTViyp
         Qp1B2iC9SW6i6MLgGX15ddM6Es9z11X1++BciNDafploTe5ltzYK7qWqwJww0PkZxM+y
         pFQDKNkTx2Mp9mmBn7bznJbs88dzrxrkf5kavFkOSh/sQXVxF/BXFQsZivcDZafuLuZF
         uXg0hwV1BJylr0pzvFing7CRTnzcXJzhqjmUmHBwA6f+r4PBvqknwTC7u8SlJnTgK6ZF
         tZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775045011; x=1775649811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbYtUAInTbOWZVTgoqVQzmu9yqJiXJe1PvvADpVFPd0=;
        b=qpBlABB53reNP3kkp416AZmBM51Co4YiAh253eBNg6grcWjSR6i7h+eqZH7mOBvH9i
         OpDR6a2TK2tiMeLIaoEWL6uS4OCDyq7/8pEam0AE4WvV9LqDQjfOtmKsjGqKcneleVjW
         e2X7SgwFqHL4omLtJNYHsTJMINwFHwmXYOqc3S4tr1NpeFWgFzNaU65OrmMAQ5ITH/BQ
         ijOG6yUSsrxPaYmrcE0dYmz6BlYCfV4JeCbvdBWG/MU3yR5VQJF5rdYnoeYz0NW8CU11
         HfWlnI+5wKRlkyXItzCFVGp0A9ZjxBHBInG1U8sDnlmP9Aqz0mki3mviHZ+Aan9VF1rO
         S2LA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZzxzJBcKFGX8kHgcmz3qJPKnilPjDEY92S1A0qmnhgKQVNEs+u90Ka1kHKcl7UHoQIyTmqb7++3OIQ3b@lists.linux.dev
X-Gm-Message-State: AOJu0YwglgarHl/u9AGVslVJNo9mbNgeCNkpUTy7ENd2AAK8cRtj6Va5
	02QdYzK3ruyff2ew67vu9mfF6YX8k2r75Ckh/JNpPOyXxoWStse+4+JPGqcitOHAI83pDmcfGy1
	k6j4kErhBqhdgF/lXn/O1tM9qftURK/HmNhylp0Q=
X-Gm-Gg: ATEYQzxTU50oVYeki4vwN646mjOz1SeUcjwa7L3JfdpyyD5tyN+L/WLKta4xuq+N7v5
	5tfKEnINDZu3AXhRDZepKxPdabJQvT7JLaO2FSPxYqCUmUVAAmzFJjB2Uao2hDydIxALOFs3zhf
	E+hyH+0qUVoPgWDRsUjFbhEGsrsF0gO97qKVR4rslIcFHGlzFICnBFI7bMy8HJzjZC6Iv96rEut
	oCjK26Uch0PTnBuqGn61ZsvSQZm0aZYh5aE+CstLwdaHkCeRpZxJ/47RNwzpGDcM24aAvss2MJK
	DYNH2FEniiES8o19mRYFJxBnEOZ2yYqYxZrUA/G/
X-Received: by 2002:a05:6512:1324:b0:5a2:beb2:d440 with SMTP id
 2adb3069b0e04-5a2c1f196c3mr1229958e87.22.1775045010858; Wed, 01 Apr 2026
 05:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401110333.2535-1-dennylin0707@gmail.com> <2026040134-stimulant-resisting-869b@gregkh>
 <2026040113-ramrod-array-3659@gregkh>
In-Reply-To: <2026040113-ramrod-array-3659@gregkh>
From: Denny Lin <dennylin0707@gmail.com>
Date: Wed, 1 Apr 2026 05:03:17 -0700
X-Gm-Features: AQROBzD4wNeStKYe1zAHC3L_tmN_4q49UndqTobhH3lTKwkAGkJ8Jq3HL-GI7Ks
Message-ID: <CAGEkeHctN_UE4zYqa0TCXqC6RQ6yh5qaHi=fcaVk=ba-8+auQw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: constify fix_id array
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for the clarification.

I've addressed this in v4 by clarifying the const semantics and adding
'nm' output showing the symbol is placed in a read-only section.

Thanks,
Hungyu
