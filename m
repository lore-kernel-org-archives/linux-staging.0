Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B226D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 16:31:01 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id z8so27771386ljm.12
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1c68GAsslZ29ILy/hAq4PKTci1jWy3eoAhYN5bcDknI=;
        b=L39UNpvvEEVyaaUZM1BPvSN/8jkX0FwrjhVW815znGAEEtsb9DStzqBCuB56kxdp4X
         +wxCjj/xJO+lCUSM3Bs5kKFirREt07vRFPK0WvkdaEV1/iQkGz8ZSf8qpig5/Y65bTDs
         //2QVAFJIQDWistly1sP0bUIhsoboe0pTIT72ru3X3Skeoi0N4cDYpSpmAKN7MftVT15
         +dw0mgXkxGkkyTuvSxVxquwIlObkOmSuwcbv/SkSC93Qr89DWoCMq6vO1hRWiFosA26C
         T2OMtLxw5ZQeCYF0pzkemvwWL0ehpbN2IyZONGeREikuAkIMMEwU+2sh9kMX97W4ZS5y
         kiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1c68GAsslZ29ILy/hAq4PKTci1jWy3eoAhYN5bcDknI=;
        b=J3hBjpC3XbPWiDa3lmB8fMRsBTqfSEKwnGDF+pdy/1rPlTONO26I6GvNH+VNDwTzWw
         HnZluiGIc0n3PDhYHXTz0Z2EF94qi15zEyD8dT4OFOiGZuYzqYfbprHwmL4ClLJ4aVtv
         +mgWYNGKHd+/71txEZAG5BsU2uBFdI8d5Baxl1OdU0KRLySSC8xUgCMxklKPYNbF9unD
         VJeWAKkLX/b3kmHPeEozdN6OdetFRGmpBjU8XXMCTCe65dykOB3JQPcTr+3Dw3I0gCbC
         6scPvDBtc1MukOPLBwzinnXUQXJyscfXkucn9KTqEx/8UcMTuvP2rK41txQVP629nZA7
         G2xA==
X-Gm-Message-State: AOAM533DYyScnHmOznKqtN/q82HJeSysOljPh9oPHFSRwo/xNzIDSZ2b
	u2zHeo99WEkJltuacmRrgcwXf/D3rhdD5A/kkhUmlQ==
X-Google-Smtp-Source: ABdhPJwxH4n8OeuFIgmlVhv7TMkBsupTtrRj9EP6uoOhs2dxadpbtA/csZWJbmKXquP0elmZCkX8+i9H1m2gmGlzGx8=
X-Received: by 2002:a2e:90c2:: with SMTP id o2mr33947ljg.188.1618504259211;
 Thu, 15 Apr 2021 09:30:59 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210414181129.1628598-1-lee.jones@linaro.org> <20210414181129.1628598-3-lee.jones@linaro.org>
In-Reply-To: <20210414181129.1628598-3-lee.jones@linaro.org>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 15 Apr 2021 09:30:47 -0700
Message-ID: <CAHRSSEw94qmnRnSdadpFS62WLm7n+7tqSnjPKmaKYVaza2=v9g@mail.gmail.com>
Subject: Re: [PATCH 02/57] staging: android: ashmem: Supply description for 'new_range'
To: Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>, 
	Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, Robert Love <rlove@google.com>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 11:11 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/staging/android/ashmem.c:189: warning: Function parameter or mem=
ber 'new_range' not described in 'range_alloc'
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Arve Hj=C3=B8nnev=C3=A5g" <arve@android.com>
> Cc: Todd Kjos <tkjos@android.com>
> Cc: Martijn Coenen <maco@android.com>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Christian Brauner <christian@brauner.io>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Robert Love <rlove@google.com>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Todd Kjos <tkjos@google.com>

> ---
>  drivers/staging/android/ashmem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/a=
shmem.c
> index d66a64e42273a..8ee4320a5dc6d 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -179,6 +179,7 @@ static inline void lru_del(struct ashmem_range *range=
)
>   * @purged:       Initial purge status (ASMEM_NOT_PURGED or ASHMEM_WAS_P=
URGED)
>   * @start:        The starting page (inclusive)
>   * @end:          The ending page (inclusive)
> + * @new_range:    The placeholder for the new range
>   *
>   * This function is protected by ashmem_mutex.
>   */
> --
> 2.27.0
>
