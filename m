Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD391E4B1
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705591077; cv=none; b=NVx20LhNlOQXq2wSbCrhg+AhnaBh9bwTVCJXzdExvlv2qrs0NRW5EtmGCKXg+Y9Jk3zwOdWeAWX/uGySzrs848LRWZ3JWVDKTbdSCSPd4Dla2isT6WLWAlYRGAkYzwu+GeFZY1qbOQkFOW+QYBVXInYA0tFbQ+RAQldlpvYsBuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705591077; c=relaxed/simple;
	bh=y2f1I34XlBaXKaJRsT8nYxnUv+jA8opfGpK2r9ub/rM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=sDZjp8TQ5Fhsmebpprosz42RhHzHR76FVK6niCSi+xCGRuAzKUKunGsW2I31++VO8pIPjViago3q9W1ANu+0Q7MZJA5eHYNYE42jHXVHHvZtMOs1Doyzuc5/F6qrnwjIZgKOBubuwvMPxIiqc1LLe5Nn8NZvlYsIqaikwe0Hz48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjBQ2i6d; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjBQ2i6d"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so1482413666b.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 07:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705591074; x=1706195874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNIeN/MszADqIFgoeR3I4RBj7C13Kq6e86qa9HX4xI=;
        b=KjBQ2i6dz6PRReexv1wNivUiJQimd3SvQnlLdlYWqMWt/w3hR3YD8utMSo1e8wT6/2
         pxBQ/5aH+V21SLSewSaxgf3uccDgGlFeN9lshao+Eou7kobDXDAfodr0OXtYei+EXhYJ
         eQqDPi23G7ixfw+PsQZ5Tweei91zS1zGkgGaHbDNiWcA+UzlfkLSPQbF3/d73kjtnzjB
         NqHQzeUOCH0/e9g6ls3cGgvPiHvvDkQEk/qKx/axMuenb/FjISqOihmkRam2IQwPuDyR
         oOh654pDU7QioQlJQcPCzihGYE345VPap5IxGrtI6ragijrojh2bkTBDyyJyDgOH2Gaq
         BnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705591074; x=1706195874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNIeN/MszADqIFgoeR3I4RBj7C13Kq6e86qa9HX4xI=;
        b=Er1Q6SdvYKBD9TFKfvzQpHqqcOaTWE/leA9lU9jcZI15AkLENqSLfgvu4XeLoCzJmc
         3KlAkYPrfrr/mtTW1rSEC0mFFbEwZTCv+r2ysZdZZ60ltYhl9xRzLDa6SbhzpYRebfim
         fEkJ08Q4VbSq7IBzFPMtJvgfejTKBtEA/8cwbB+cL1XVe3916VCjXylBAJ1+vsI5cQWw
         V2Xo23CQqc8Sh9v3668XTDIPS467od0n0aTtVRfIAVY9t3O5a/nkf0DRo5piCFA4SZVp
         WwLwc7IH0tJDI0QcEJtYsl6uDnkjXorGci2WtIXHPRoP/K5w3chM7A++SCTM7nD/VcsL
         edTg==
X-Gm-Message-State: AOJu0Yz6P53BL+3oHo6caSRvStnfaV5M8euhyrGqz9+1NuXoqqrE/Ps3
	q0VADRty/+vt86MfDY8U+MRpK4VR98FSaY5UD8a4+xM/w2DuLAG6AKtF81pFE0CjoFj70RxrEpq
	WXeGRp8DyFrP6tDVy5TyEzLBICNw=
X-Google-Smtp-Source: AGHT+IFxWpCFIFpoZ3849a/o+eU3juZNCrElQE/y1Tth9QxilfiAvh77bZdBf3nXrA5jRv2YTsqpo5ZGCSf7J8a0+y8=
X-Received: by 2002:a17:906:4ec9:b0:a2d:359b:2435 with SMTP id
 i9-20020a1709064ec900b00a2d359b2435mr390836ejv.116.1705591074445; Thu, 18 Jan
 2024 07:17:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240118151303.3828292-1-alexious@zju.edu.cn>
In-Reply-To: <20240118151303.3828292-1-alexious@zju.edu.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 Jan 2024 17:17:17 +0200
Message-ID: <CAHp75VdCKg3x3vc7TyjZ1bBwNj8aqk7Th8X8O9+kRQxM_CNdBA@mail.gmail.com>
Subject: Re: [PATCH] [v2] media: atomisp: ssh_css: Fix a null-pointer
 dereference in load_video_binaries
To: Zhipeng Lu <alexious@zju.edu.cn>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Hsuan <hpa@redhat.com>, 
	Dan Carpenter <error27@gmail.com>, Brent Pappas <bpappas@pappasbrent.com>, 
	Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 5:13=E2=80=AFPM Zhipeng Lu <alexious@zju.edu.cn> wr=
ote:
>
> The allocation failure of mycs->yuv_scaler_binary in load_video_binaries
> is followed with a dereference of mycs->yuv_scaler_binary after the
> following call chain:
>
> sh_css_pipe_load_binaries
>   |-> load_video_binaries (mycs->yuv_scaler_binary =3D=3D NULL)
>   |
>   |-> sh_css_pipe_unload_binaries
>         |-> unload_video_binaries
>
> In unload_video_binaries, it calls to ia_css_binary_unload with argument
> &pipe->pipe_settings.video.yuv_scaler_binary[i], which refers to the
> same memory slot as mycs->yuv_scaler_binary. Thus, a null-pointer
> dereference is triggered.

Good for me now, thank you.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. If needed, or Hans can do it, the references to the functions can
be amended in the commit message as we use the 'func()' format (w/o
quotes).

--=20
With Best Regards,
Andy Shevchenko
