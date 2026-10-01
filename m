Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1325494830
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855822; cv=pass; b=AyyKLTBRC9ELNmAMkfi24CHE6xv4Y6yzoIyejQ2mTcnyyjYDjIjd0psjA7yQbXbi7RCts+3T5Jv1Sb/W1WvXgPxKq6C0XR1A13+ATVCwernawHt/ZmQt2CMFtdOe64c9ko5F+3z2+Uh2Sw6rhS73eHnL04khyTC+9VurrUEFKbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855822; c=relaxed/simple;
	bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh+MXVY9xu866a5ccowv02EZbmrMJwBHSznuuNziBz/+Wzrf6LhnAgIZgAFfgkv4mEpny0u8akmPY26tfRqgNTo4qLeHlJB3o8SEvMU7049boZfBL6TJ/PLR9h7ByqLfUaGk2+noFmVHwkxoGEjsjL2c79e5CXtJF8kQvCwiFZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il946TDD; arc=pass smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il946TDD"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-448a12ddfb4so2672320fac.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 04:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790855815; cv=none;
        d=google.com; s=arc-20260327;
        b=WwBdWlDm/7fClqIOtRfbkvlfzQjLz4iZ4xGgqJfLwSH8hCF/ZhsNlI3WMWUSekVNFL
         Pho280G9LqaWmDbPm12JBZTmtAOiNlBmKepGv0ZqWGp9VB2NCK+SBw3g76jHxFXkEoXA
         R7EWzUsr8HLLpnROuSZC1pejp/bwHeh4asmMChn4mvlURGd6Ivt8rOkdJ/FVei1yac0n
         qv3KzR81knIr3aFVA3wZHS5cRX+jS6YATafi1zPfoksfH0na+uAkl+qugd2qk20ZtmRV
         +sDi6786jZxyBiOtOTF7+IY+zgYd4V8ZQ/JAD8MdilVH24Efd4ZRCvtIUeXOUsxj6IJa
         clUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
        fh=lyTKOvhjn3MZcOFKRt1/4/imMYqd62A49+gYxCCDydE=;
        b=o7Bl6yP+1jwCPB47rH2C4HD528l6I1RYZr4U3oM1mxPlUJE/8SXw4hkmabNh7MybiH
         4yMf4VFq7Yj9g0ssnLbYImKCcQw7Hdcn1o6O7tlLgb3az7xFDAkE00ExEs5WiGma+sAB
         c8liuDz0wvoBAXcem7QS44ONnPKkgNwapY9A/6bUZTmuBh+M8u+MUKnkamqSUG2g3Azv
         3Xo4BgTJfzuUAAH5GcSnzChETb6JHhG4EGfJU6V8H+8hfOfbrSY28BAlgjefNtzgXNOT
         qWzWsvBqU07AocaNv2Da53mqo8NvJcpJ+Zx/SqL9p59enuEobZ8Co9X47Qo48nnPhiNQ
         appA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855815; x=1791460615; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
        b=il946TDDXZVf9Mm9TKU+WBabuc1wzkLJH0KsrziZoLOu5Z0dOVrjUOtfj08qjswLc9
         TcVdOAZmPyfdcfelmAu/Vi8AYAZAybZ4P2g5fNJ/ntRMY/K7s9j0NkJx9fTiStCgsZ2L
         DbGerdJR7FjA8Gxe1d0qT89wQ+W+GuUxXIfIo5zdDsOm0yoJJvPhU6jbp/lkB80C1Zlq
         98ANbBWLGN3l2qNpPY/C4MK5c67Zn+3dQkrHio6UArxpkifyVc02t4AD+1Nnj1TaRBHU
         RzhJ0vow0rb2ZeTO6FfxliDUrNQ1ZU0N1Ok3OkfUE3yTWn0LMNMjJGsppYmOJNZVfpXU
         wtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855815; x=1791460615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y+tEtnQzS5pdOb7X/5WJzbpmudgE/kqYUx9jMaDlfOk=;
        b=Z7fbUyk2QXDWwXv0OSUZLyE9/4Ay/PFlVM04ZTuz5u5Q9V3KWACLO3gW1b8R2Y05IA
         0KkvVw8sPMF8ut8t47DGard2nyyWr+Up+HvrRnuKDwmPZUYTUNBaykzmL1Ch7n9F1JeP
         bFZAJl8v6RLSYSNVwIzEOSqBhpFv1/0os1JU7bWa6rb3l8WYME6pb28IqVwrk6Y/3UZ5
         iufkkhh96XdQdybggDW1vvnFVAPp6b7w2qdwcmeEwjWPlN/PIuHUu4PAI4SDoxVQGL3O
         C/yyGzw+SRQ7+i3fVKsQ0UQQz7pnvmdvEUQ/LGBQNs4ixG7Q5srRkH5zE7xlhN6iqGUJ
         JmCg==
X-Forwarded-Encrypted: i=1; AKwUvBwLl3zCkkHVXvdb4lq9BZZpC/5OjbI9vQlQDWYbFLBQ4Wn8lt8bl5twrwCkXzY1/U7I4A2Ch3gXCEpYoxxq@lists.linux.dev
X-Gm-Message-State: AFuF++knpdYKxxLbqLFSVo4Gl9gMwQqDqdp/GBioBF9HoooMHA6/Xeq2
	D7aNIf7/uYgQBBtCF11X2T9P3ngCUjNLTzEBalsG4zdb6HrTdUYPPOqs0ZiyeGz7Sv9LAqYWxC7
	wwn3DEf/hWrhyARfJEQcer189bYvr0eE=
X-Gm-Gg: AYBFou3uIY9unuHU0GyOkFqanSFmMubGA/bFXJA5ctFVlrMD6du5cZKy7ZpGjmwgkFZ
	fUWLu3ncWlNOfZl9O+xfITUZdDgoFzFhuAyshOXYmBXDXziDSR0jxrf5/spQocHRrQdQJMvp/uQ
	KTq3Y0fwAxYlAgtfzFc/NJ6NSNbHZkmyFG6GFtXuj9r4W02ZERjjFmjDXtE8sGJCsAkrvYIau8K
	SMkmkdJR3LpZyTtJNeKu5Wsh443gtHLDQ6CoRPA93T42iI9uQfd0z1kOzXLI4cr+rvQqZdBehn6
	Lb9yqT+XqWKSeTU50c2fFBy0ZPXrqRbrDz7ai6qtMuzODh5B5q6K5RaB790QK3MRs8sC4/5Jfus
	/sQqxeT5D+KG2cNQ=
X-Received: by 2002:a05:6808:c194:b0:4d6:93c3:1aef with SMTP id
 5614622812f47-4f1b7e044efmr5667033b6e.58.1790855814672; Thu, 01 Oct 2026
 04:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001100319.6228-1-dennylin0707@gmail.com> <2026100153-barber-financial-29f4@gregkh>
In-Reply-To: <2026100153-barber-financial-29f4@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 1 Oct 2026 04:56:43 -0700
X-Gm-Features: AclHuK8rLBMsJtiKPmc67dCARhCBIiOvVaJT7B67MBAw-F65lmlRrAuW0I1lNKo
Message-ID: <CAGEkeHcpZeHhpF2omgRx1wgLRxVoJJ90H-1t8FEJohMr_59b6Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: use errno in rtw_register_tx_alive()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why are we returning success if there is an error?

The original _FAIL means the firmware is not ready for TX yet.
XMIT_ALIVE has already been set, and the buffers stay queued.
cpwm_int_hdl() uses that bit to wake the TX thread once the power
state reaches S2.

_SUCCESS here lets rtw_xmit_thread() go back to waiting on xmit_comp.
Returning -EAGAIN instead would stop the thread.

I should have explained this in the commit message. Would handling
-EAGAIN explicitly here, with a comment explaining the retry, be
appropriate?

Thanks,
Hungyu Lin
