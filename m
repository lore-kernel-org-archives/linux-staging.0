Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D9341AD6
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779006718; cv=pass; b=JdjKHXz0dgafL0RY8xkU9f/5mYleRlvw+eoqQvCDPfjxsrUq4E0tdAEFPqSYAaWlM4TTAYCl27WD5x6Sgsf3FWP1xM4a7YI29H4GwVSDUx0wD4EXgAJem767Sdymr+rxHRDEdNHepF0P9HHNHUqZO+tegtmYrWPy1nk+W9cXwu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779006718; c=relaxed/simple;
	bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0WEG2/BM5g+G7OLHeUlr9NtYjtCzpphrkqncIVrxwmZrsNIe8TNhjcCG0GDT22FadgL2tZHN8YexE0snQUyVtxh3F0FLRQTyX5r3/AAqwvuVrn44n36mzNkIzbhEaOfCC3+5nhrzAZHiNsFlVphALbt+5nPowqr4OKz3KRRizU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmDLP2Y6; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmDLP2Y6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bb91b426e40so281063466b.0
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 01:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779006716; cv=none;
        d=google.com; s=arc-20240605;
        b=RjhqKgmS4wLGfLkvSnPGFXcV2PggaqCWKPDfEqiUUZoB9IhZ/Iq7N1GbciKyUbHyDo
         DETjLgCh+xGahE6apX8BLo/PBHTaYQ8MmzgYqCmLU6bbo6gqtWRfMWvI1bv8tmCTXFhW
         2dzhxfLGN9PJdfjz/YA280A2ixt49USSNqRLHMouBxkmERN+r4fgbS+tNe3MfXk2hXVa
         LixjaMkIw/rMPHnwMC5cetSptumepjMF5WZ7o9NYIylzwkcWkqK6rtCkFOHoOJ4/Y+4c
         LMttvMEMuOKL7y8HQ3HUWYsyqhS2UBY9TykgXtQGwV6lCbzcRH/qAX9saz45gcZRMXOr
         vDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
        fh=pmZ7Iv9Jt6Oei0mUiykFP+mb55blpY6s3hqF1ozu6As=;
        b=M/s02A5pNhQHCZyUji0o9x18w7FqZElihqsTSKM+braP4wZ1THmSeEk7LyPjvgPuP4
         kc5DgJQaWjb6+FzAyDr7TDY0mZ2EZ+yRsJ8weT+u2vZLGE1w2t2DoyVMI390q6eiWNHs
         7CBC+B+e9Q2LFV1rvmjLqCTgUKUF0M+yOylEPLP439PcD7f6yZ2xmdsjYtnM89x/obXM
         8IpcZtrjmgYJ3YK5Ib1thXYI8daqenTns8KryJCYgGWdPpUmLThHN6hmQxKnASUEQHQh
         yJac7Nz8ZygRvBYtNzzIckbY5s2HmWvzkdLuzMK5IZJbx8grKVR19i0ggtSXskQmo1rZ
         rDgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779006716; x=1779611516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
        b=NmDLP2Y6xp9xNDb6xwfD0L+eAUvhLAiqe8AOc3tlhzLl/70Emcrl2uWUmkbgm6zIay
         QvXfGJF5Eom7eaBooyslF1elmxJxZp6Cyeevf5xN1dzRO/adXsQCDZ4m8wAAs5QtFMPR
         3l2Ydz0J2+Nth+Qg/KclopXlsWNTgISont3sDHuBUtuCkuV8wQA6YxbLGPkifRkTTOgt
         RDPlb8TG0uh2lsp1CefL7ZnW0BzCokrvrI64oP/+FEMzs05dd6fIOWWWQdlR9h+b+8en
         fGLyieTR8rtUmKoiSIWDkpDmxI4vLgLOEyAODMoNrv0OacWs3hlxfcnsS1KWkOSbtNLI
         ETuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006716; x=1779611516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
        b=hMV5YbOFFiTspSWFcNJpNH10VvuA8RlO5wvrbVAVNp4e8On0rESgjur+XYlgIO36zj
         IMwIhHQcQQGRfox9g7hE7R7TKgvWtmd1ihmV6ABRu22FekAsB9Dzpt6JNVwp1GTBT8Co
         yHk9S4iXRQomadw4hhccWKM/OzO9MUeNsOoGpaT5sDdg88lZ+t1JmvjfWozPu80CzITl
         P9Jh596MG7MB7GkoknPzijwBx3lAKKCaBwqPr+mkxu6PvMVIKthHyFZDxJG2vQMCA5N0
         s6xozB3PnnoTGsDUZek8LExEl6nJe9QkNC3ufv8FxI4a6LHF/XprRRCgDFrAPHVMEtUB
         8VjA==
X-Forwarded-Encrypted: i=1; AFNElJ8e1VjSwsP/TRIXFHWU6HQ6aqWaQrDCdkgh/V7pNgwpYA6p/onOhO6zPHhgLbypM+tIc7Ayl4g2fCNOdPeX@lists.linux.dev
X-Gm-Message-State: AOJu0YzGsN6g3TO1lsHH6BpWCstWRuY04kktSqSoVhh0UxZfAzLa/PFu
	gzayqy4sbd152kFRSziB/I/ZB6uvOiHMmzOKvtdyJM1c9l/E5FR5mzPIj+mR93+67cHuWA4bW4I
	6CLL8zs99anQlSXdoS6HliuGkYRL8G9bvjnu3
X-Gm-Gg: Acq92OFe7YaRYJuVgmfYJOO09DwZom4UGWRIbHD0rG6Ef3NfIwmovzGmCea8HyancOQ
	yphjyfyt0UNO6JqSXkZvjUIQRfKsQWQ7ZXhq+jfywwnQnN6TPoHcwQRKsjRrE+KPcRQhInAhx/p
	mu3vhxcse8mQ01Nd0mclQePOdUqoq/RRBT5CruhWJ1ojZnaKPHS9CZ0mSY9w9NqihdXeimzzS7u
	QD4dQ+ZWIfS6w9rIdf4Wewuql/mE3PZuzU7gFJ+z33uIK1nx1rZpQVMGKzW924wM4g27oGiUwUl
	xVXHwcn/mdBpwZ8c5Wd4aZI4zL50Sw5RnYTiWR669WopYpjg0KHt31zcmQ9P8+Z+xA1GVYUt2eA
	565lcIOITi8p9eOb2FoNpcdq8nTJ3
X-Received: by 2002:a17:906:d503:b0:ba6:5728:39f7 with SMTP id
 a640c23a62f3a-bd5178fa622mr372718066b.27.1779006715592; Sun, 17 May 2026
 01:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517060120.221278-1-diegomancera.dev@gmail.com>
In-Reply-To: <20260517060120.221278-1-diegomancera.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 17 May 2026 11:31:19 +0300
X-Gm-Features: AVHnY4IKuJB8GQXR6TT_rAhml2_1w_riXe4jyzDn3gohPdCzJ9W8ja3SHuRRLE0
Message-ID: <CAHp75VeBjou4m5YA_9=7UBPxft-Q1+W0P2uhED3+UrkfXbJaaA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove redundant comparison to false
To: =?UTF-8?Q?Diego_Fernando_Mancera_G=C3=B3mez?= <diegomancera.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 9:01=E2=80=AFAM Diego Fernando Mancera G=C3=B3mez
<diegomancera.dev@gmail.com> wrote:
>
> Repetitive comparisons to boolean values are error-prone and visually
> noisy. Clean up the codebase by removing the explicit '=3D=3D false' chec=
k
> and utilizing the logical negation operator instead.

Only a single problem like this in the entire driver?!

--=20
With Best Regards,
Andy Shevchenko
