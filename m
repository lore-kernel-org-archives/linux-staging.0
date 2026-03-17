Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A43AE1BF
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748272; cv=pass; b=tYOtL/WMOrgxVEiZI5pc8eZ3YN6Uq1uZBvRJUFH1GbgR51NmBxreqgdxVc36InSFBBqeq4j3FjETxkSri5b1SVLh/OvXBfXUbL3bMZWGvAcp6YQA9X6KYHaDeM5A/WzQhTe2AawA54W9g635BltkT6DYCCes3V9kjgDoE/szKIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748272; c=relaxed/simple;
	bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bk5ZfCGS3R5AX4P86QTael1SbT6ql9lSBQ+2qJeK/coh9GHJNxgqktzv2R0/8udAAE1zpgBoHIC54Fo7BCfv3NoT0eCvUg6xBAcjAyNn1wF46TgDldMEOo7MpdnPcakNY3nIcXgskfA6kggRs6Z+P3WpPxEIMWtv6wDjBs8zWS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYzHuReb; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYzHuReb"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797ab169454so57024077b3.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 04:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773748270; cv=none;
        d=google.com; s=arc-20240605;
        b=IlnBc4DLj5JzdepkOisBnieAJ2hg5MJGJTv0PzIT2Bjcf5dcEi4Xd/LDeFHE5ulgAa
         oddYjVUrlkfeVVzo9drRSdR5bw9sROEUJvIvFoM9R2Ct2d6TqAO5CQLcbXfX4LpjeN/+
         DhsxhWO0QIiQUK78KytchR4VEvFihifwFeMkmx9lA7jw8ScTfDl6YQUqcXOB0/7DURdK
         LxMBJc+Ogop78rXLdPePpAi5wRNbasmun+BxNrqRXj2Mf3hYuhSDOdW7j166QcJhVKtu
         7Jwps4ctJ2zOgRcmx6HI83kpyiOoA0US/dtbrkunTxUuUbWXf/IR1TdQ3BbJN/ej+pXV
         d5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
        fh=fAyL972FybB8QRvwRJEwvr8uck4FvA4VAenYgC7UC+s=;
        b=ZatBRx8luPbzbe67ieoa3LDeTVwmCNsFHyAkI2oyF0/wlUJ3s6gYVwAU6BowxcT/qS
         MpTiYCg5NFv6F5+HcszEfAcRcwBbb63lPQ9TJCXrj1vwUJqfVJNWNB8Jgr+Le9TpI0YT
         4qtiyCa653EFWqeJVqj/6BytUYcYBi71hvF8n5KOT4s0yoZytRnnSeZw4rL4JCYcrGUI
         IWyVIfpsrq2AX9dimNkB/1mlfCUdtAxfMGYNLN0cb4EnZ/MUUadP4bP2+sf/YRSKM5rX
         0C32Wd1jaIeV1cIdZKBibYodr6AnmoAoJ6aN6cbNYybn7Xb9wNR0xGEFoTQw8UTwZt0Y
         /pCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773748270; x=1774353070; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
        b=HYzHuReb2o/z9QYr+rDJkmgg8Af9ybR342GX0ORBzdbPSdfJguBFFaJpPWTZZffDm3
         GJ00u/C2H/gNs4rqkweX/J3sJTp566jTrrPwWFz8Izv7J0+Md3aHJqbH6DQtEgvRfjYJ
         U5NXholOAp1oJu47DBUSwte0e+k9tbJ0mVciHjUVZp1LEOOa/lfW8LNQQ6oQjAOS7qop
         pUiOLRdZ1cGLGfC8t7fzy40Mh+eKk3nuYURDH8XqQKeQurXfdhxh1kB191uvg5U6m7PI
         B54Du8rEhwh9Jir8fqD4KrK2l8bMgCcUPo5yO8UpC6BXS/pWWWkVS4yzmFGEM818x9wk
         6K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748270; x=1774353070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eDL+Y3X+8pX5273rhUkUH7wXXTl5oL/fIUGWdNBy68=;
        b=ig2fw94v2IRpylpf7fcXAM4vF7pJi6cj7/7O+MuxjVHj6wGWIP9S+6TXfFNEirgNaN
         APmDpaVDiphQ1uIQ7SRyoDnmCQkFqm8BTgh400xZgAOpbo8XUS2NZGhGUqfxtEPvQu7m
         1lD2cN1Bzy+uPrjC2FGfxeVBt+XMqhqu55xs8338z0I6oHNnT1f05H0TjhPjCNROHWrp
         bUDyRw18ROQk1DdwxZpwrONwfl0kSv6pv+D2JEHBq9fwn4DWl3kV7B3QCWzCWL0N+WPA
         9aPGAjyK/L+LE1o85R/Xp0qnjR/BDB0tbU+TBEtY2SbQWaIUwtCOFw4m9sa9yefQ81dO
         iqKA==
X-Forwarded-Encrypted: i=1; AJvYcCUHRlNS7eRCulYFb/n775tArWTP5/toeCXME0/DfoRR+/KRqZI7Xso9LeonZwnVwRRaTeunXn31C3z3uW92@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8N4qiqt9z9c3DhcTl39saGbhJhEctM4I6TPV+kprK4c5QPFma
	6h4gzYxGv4GCZRtTNdb1y1uKLh6h/fFvIKa3yDm3aLlHUtRU18a1o0Onx+aS/Zz6Zi0fG229s6o
	QfcDlxLH3bnUxQ6Yqsy8mrmJ48T+1zuw=
X-Gm-Gg: ATEYQzwy690Fae3BDYbk+Ryyp2OeO7SbEmqBH7GOmreCk28+3vLYlxRxj5uBRcPGgWl
	dteYlH2A27AfOOWP8PfLnoAVWcOe3x/nj8JIjavtDCoyqLOidfoazPvMujbMm6XcAn02Oc4HLpJ
	9EiYmb+M1+kIQp3Sxmf2K5FBSZ8o7RqrDNyKvvx1PUhM97SYTlGA1PRCmAOMxlr9MD3vqopueQV
	W1FC2dYnagKqVoe2PFrB1oZbiz6/HnMjyqkqz8c53rot4XLqq0gUyh7gBnU6Pnyvx62uJIJ+bOd
	zrSKIhwRMw==
X-Received: by 2002:a05:690c:389:b0:799:23b7:5680 with SMTP id
 00721157ae682-79a1c129452mr172898477b3.27.1773748270287; Tue, 17 Mar 2026
 04:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310203646.8869-1-rayfraytech@gmail.com> <20260311170423.13157-1-rayfraytech@gmail.com>
 <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
In-Reply-To: <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Date: Tue, 17 Mar 2026 12:50:58 +0100
X-Gm-Features: AaiRm51nstSTvZRHkOW1q7xv4ApowkamlBVcycD_uIs-L5kwFIS43Rz_nVyUzjY
Message-ID: <CAJioSGd=7LoMA2gTNK_6vejtjfFJFwHvnh76Z7EYowq8MVQqQw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Tue, Mar 17, 2026 at 8:59 AM Sakari Ailus wrote:
> Did you write this manually or generate it with e.g. Coccinelle?

I made the changes manually, file by file, using Vim.

Best regards,
Oskar Ray-Frayssinet
