Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51029CA
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 20:23:59 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id r19so2298099lfe.10
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hShfojEUzBmMpgkHo84N+Rx+m8nkMxhA7mhDB+mvFaE=;
        b=PbSI7ZoxcTaW+kuQhPAk08kUDA6N4JkNzx4JdtEeIvmRiHWaCGCWKDwS6p4LCIWlXV
         mvD7jM3y71g8Pb8XfdxTsh+BKwVysAHHeT207AAb+9UJuUFmHz03UBHo4F3/Y6MRBOqP
         JyKGcbWzISB31bAwOjKCH781k5O7U0waP5sUjdWWgPH1t+CVYLVLvffMdChMKQuSNrmM
         9slw4pVuAkNtXHI+PLvWKlNLboIYurC6OSS56c0Aa4egniPotDX5SSKnfWaitw6TyGcy
         O28Td5+5q41UXITz1jHSf9JIC3gfhf0JP2FNj4fPTjxvUIMm8FmqoTzFF+pCMfOfu/e2
         lp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hShfojEUzBmMpgkHo84N+Rx+m8nkMxhA7mhDB+mvFaE=;
        b=iY7nWUDqMZQ6Cca1rie+bmVMg9dRWXw8Gzv3XnGn902NblKVdaIbOHUhrGN4n/uX/e
         whqKHeRgplWwKFolGEHhqmM2IQ5RnvYwkZ4XvtAgaF6i3P+z2iPFkzE/OPxjMG/1e2tu
         CfKkNBYJgfOOmMVUxgjqDiWiCHe54D5beaNEpBja4nnjNsaQiqOX/RymzyQXOcpIQVKP
         zfXNMTb3pY+S3gbXddBiYDOemtuwOzil8+B5fYWq5vVcSbIhD3LMb+3vOqXP9AhzNrA0
         WuP/kFvvgat20BuyATbmiG6S+JQkEQdsmD8FaKiI0f/3L71oSSvqXUbOwtVZWwox54vG
         KZaA==
X-Gm-Message-State: AOAM5327TnWZnik6LiZPHwIThf+SthKfak4CUtmcsuWLBYSDsl5snaoU
	j7LJFSCGed7GYSqEVuOGoTP3zhIx0I1iyk9DwZ02mQ==
X-Google-Smtp-Source: ABdhPJwjKPLIPfugo5bCl1yL9FaR5TR9KfXNjC/xdkmmFJeIpEjJBmqvBNClLTAWZwu4fkrYtjC39/7x016c69XVKyU=
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr1819811lfu.489.1634588637140;
 Mon, 18 Oct 2021 13:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014215703.3705371-1-nathan@kernel.org> <20211015094344.GQ8429@kadam>
In-Reply-To: <20211015094344.GQ8429@kadam>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Oct 2021 13:23:45 -0700
Message-ID: <CAKwvOd=eEyjLMSEiBd25-Jkvm0DTFtvcB_EmuRVwqWYjQEvD5w@mail.gmail.com>
Subject: Re: [PATCH] staging: wlan-ng: Avoid bitwise vs logical OR warning in hfa384x_usb_throttlefn()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 2:44 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Oct 14, 2021 at 02:57:03PM -0700, Nathan Chancellor wrote:
> > A new warning in clang points out a place in this file where a bitwise
> > OR is being used with boolean expressions:
> >
> > In file included from drivers/staging/wlan-ng/prism2usb.c:2:
> > drivers/staging/wlan-ng/hfa384x_usb.c:3787:7: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
> >             ((test_and_clear_bit(THROTTLE_RX, &hw->usb_flags) &&
> >             ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/staging/wlan-ng/hfa384x_usb.c:3787:7: note: cast one or both operands to int to silence this warning
> > 1 warning generated.
>
> Both sides of this bitwise OR are bool, so | and || are equivalent
> logically.  Clang should not warn about it.

Not when the LHS AND RHS of the the binary operator have side effects,
which is the only condition under which this warning is emitted.  RHS
potentially sets a bit, and potentially would not be executed if `|`
was replaced with `||`.
-- 
Thanks,
~Nick Desaulniers
