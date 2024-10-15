Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A621E3CE
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 23:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033466; cv=none; b=Pjqmj3a/Dm5BIzqgb2r6R5T4uay3jz3+BvHnf5dGx0tJkVxunkgrCWBePAiOt97dQ0ON8NwyNDeL+pclVrswWHaIlEZ+kLHgNPaCUxur3Pm0gbdoxNysM6BYKfngWeo/t8yKtPtFuSgzgc0YXLlgeM7BdigqScilgccJqJhxI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033466; c=relaxed/simple;
	bh=R5/0eEoP/NH5yQmWcdDx1zc8JfQ7uaHFsmINSqAK55A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ms22tXj80VQaQKUzIEpRmVrOEACMd547OzMDNBSvKMFf02O1Rxjg9IazkqY2iw+Zp5tLMkIiPUztDvHetu8Df9FIVDKX//qz6g+bYxvRhqRXiILodGytUc58Zfi7Opd/RuZTFwR80x0t28RTJ9nYIw2uCP+8SySDzr8nNjY1uvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=c+vxhqCH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="c+vxhqCH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c9428152c0so7629647a12.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 16:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729033462; x=1729638262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TGRNGdRV8OqKzXcTQcKrsJhdxGMaN645Q/fs5kQagE=;
        b=c+vxhqCHZNJXutuycoCEwITep1+32vDCZd2jg+0dwuzsiE+TMO+h/U5zwZsnPUNVE3
         sSC94SPdtTjiwhJBsF/2O9riKxrDxWy74i1obSE3VEuHKzkyWJCX0KN1wSfcXosPBQgr
         WUxggAVW86UYAVeWhPENCroLPESM0w3K4rG59tgRs3EvxAzHcyQBFk6dHjkyoIXHDm99
         IfwhJ9d2uMWrF+qAlMOL1BVyB22Rrc53Zj7yMDA0VQifvqn4Cln1nnED9gH5LKZuhd8U
         Nc9+48BtRO1Iu7dv5sSMpD5AOTUMxQl1AyxEBunLmZ+5RcpvYpL5VTjDY7S+PzpuxNmr
         hCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033462; x=1729638262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TGRNGdRV8OqKzXcTQcKrsJhdxGMaN645Q/fs5kQagE=;
        b=V3DKeaAl+X6XIoCX24+RAwt4b5iRaMXOiqj3Qdguuv/SRMVxB5oKAGmg4nTvJkISrx
         k4LgOT2t2QDofg/ngc4SqVV2FsOY7r+kTdPKpnXNfrvxdk7W0gQUJzjJcO0NQ4PE6Fin
         5kDEndr4/P9fvSfHutohOeim4X5b26Z3oZitxDlGRf+Ma8WsYj/TBanq8LWqxMG+1+X+
         2oADQCKqqXiKIdv3w+UWqNJEQMU11fBTSIw8JFYOr9ATNEFpFyq4Dg6f9m8TdK4hYr2C
         bysajYy4cS4HbVWngrcsyVDPHbeI+zzLK/ozwI3kjavhKR6I12uN34emn852zT4rjjCV
         UGaA==
X-Forwarded-Encrypted: i=1; AJvYcCXYx+y2D1KY0H+NngYqPmDvHUZeARgBVcEx44ijtswFOaobrD3PtU+rm7Bfw1wcT1s6d/8CEM+BcXG+XijS@lists.linux.dev
X-Gm-Message-State: AOJu0YwcU3Qe0z8R2j7DaOEkwg13Z1zJZXIsVeqMKH0k6FF/RhWrOWoS
	YUCKwoBiJg4+CMew8P6XiJyP0KagmtOm8mdViqNqjrW4b6hzupOjGDqUfzroZ4FNCX1gTo11K1n
	SEP6W4rFufB3rOO6Orlng1LNnpJuy3WUbnmItlg==
X-Google-Smtp-Source: AGHT+IFPXBLWR5bWg7Y+EC/MbuYNZyE0OS8EIdxpUsVAI1TsnbnFwiWuHFAv5UQ4nz+8uww/VQ4hfCgzUUqxYOlFrfQ=
X-Received: by 2002:a05:6402:4311:b0:5c8:ae42:88b with SMTP id
 4fb4d7f45d1cf-5c9950e759emr1527721a12.27.1729033462478; Tue, 15 Oct 2024
 16:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015215157.18571-1-everestkc@everestkc.com.np>
 <99056bd3-748f-42e8-a25a-131f7b194f55@linuxfoundation.org>
 <CAEO-vhEwkQKnPprdw_r=mg6KRbadY6B4A3R_sOsyH0ds78wb2g@mail.gmail.com> <f53523ff-1222-4fc0-9069-10ab895e1136@linuxfoundation.org>
In-Reply-To: <f53523ff-1222-4fc0-9069-10ab895e1136@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Tue, 15 Oct 2024 17:04:10 -0600
Message-ID: <CAEO-vhEGJ-5vX6=32VwNfiV7nSkDL4iEJVti8U0=q=NfOKrSAA@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Move free after the variable use has been completed
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:55=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 10/15/24 16:48, Everest K.C. wrote:
> > On Tue, Oct 15, 2024 at 4:35=E2=80=AFPM Shuah Khan <skhan@linuxfoundati=
on.org> wrote:
> >>
> >> On 10/15/24 15:51, Everest K.C. wrote:
> >>> The variable `in_data` is freed, but used later in the code.
> >>> Fix it by moving the freeing the memory after it use has been
> >>> completed.
> >>>
> >>> This issue was reported by Coverity Scan.
> >>> Report:
> >>> CID 1600783: (#1 of 1): Use after free (USE_AFTER_FREE)
> >>> 19. pass_freed_arg: Passing freed pointer in_data as an argument to
> >>> ni_usb_dump_raw_block.
> >>>
> >>> Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPI=
B driver")
> >>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> >>> ---
> >>>    drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/stag=
ing/gpib/ni_usb/ni_usb_gpib.c
> >>> index 1da263676f2a..75f39e1f3ed1 100644
> >>> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> >>> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> >>> @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uin=
t8_t *buffer, size_t length,
> >>>                kfree(in_data);
> >>>                return parse_retval;
> >>>        }
> >>> -     kfree(in_data);
> >>>        if (actual_length !=3D length - status.count) {
> >>>                pr_err("%s: actual_length=3D%i expected=3D%li\n",
> >>>                       __func__, actual_length, (long)(length - status=
.count));
> >>>                ni_usb_dump_raw_block(in_data, usb_bytes_read);
> >>>        }
> >>> +     kfree(in_data);
> >>>        switch (status.error_code) {
> >>>        case NIUSB_NO_ERROR:
> >>>                retval =3D 0;
> >>
> >> Looks good to me. Isn't this on next though. Don't forget to
> >> indicate it is against next.
> > No, it was fixed in the linux-staging repo.
> >> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> >>
>
> Okay - by the way the same problem is in ni_usb_write_registers().
> Did coverity catch that one?
No, there were no similar issues caught by coverity.
Also, I just checked the function. I didn't see the variable being
accessed after
it had been freed.
> Both problems could be fix in one patch - I will leave it up to the
> maintainers to make a call on two patches or a single patch.
>
> thanks,
> -- Shuah
>
