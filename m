Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB21B0F2E
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 23:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729036216; cv=none; b=T0Anw+8fI7ctuYSUmkY/FpjVvBNPHUKS7kKRGIjoEKBJ6e8qr/gZZNoJsdDJTfTTjtZngut/BVGOqJM+Ne3rd2G5yoUDMdJp578b3h9U/ru8YqKwzWi4jruO2wrl2AtQhXQSl8FX/kf2VhT5bRmb+cuys806USsq++0RazX6y2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729036216; c=relaxed/simple;
	bh=BPqG4gTsk+vhLnlZTlNewcMhDPZAaGvvlDX/+YqAcOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0QihlSfLlCveEieBgiNkgir6P45eIq0a3ggekAnpiN+G1BiD9chJqzEfW7ysNco5xf4Y4AB/U4nB6NwfEaq1PEy2f+pe6Sp1tBTpzXdDKChLVI6/0wks8aI2OIMOFJ3cVYROhK+1OcfUO5wu8YHWbPGyByowGEnzXy+cA0D098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=gd26tlQe; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="gd26tlQe"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c97cc837c3so3676951a12.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 16:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729036212; x=1729641012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XCHEzfb7w2t6Cnrv1teCZ2LLAXX8T7VUwX708rvPrE=;
        b=gd26tlQeaQjTKUhfTdj7UXfwEwZjsXXAVhFv2lCdaRTk7gJvaQgOUfpy8rw1iMyZo7
         CVixSmg6/JnX/UGu8uAsV837qklqpBCQwHqfMTjk3qV7ZdUJyW9gOJB4eCvMktyEcMvI
         XpIlIUR/4XGaz4g0Vj7N3ZmO8SzFic9cQzwEO7ecUhR+xJcMx6wYwFJsfly4Ezm49FLb
         26cUlBKLKBew840x3n35J8VErP3rVOaAPu++2EpQwilI5UDIZNaRLeOj2HJcn+BWStmc
         MW5Toecj5MVooA5Mpa+XMddppFxJ/PrYlUZwpUcuBR714llLq0B+RRonqT0TntheVIUv
         zlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729036212; x=1729641012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XCHEzfb7w2t6Cnrv1teCZ2LLAXX8T7VUwX708rvPrE=;
        b=Lgrf3ot7f07FRzgU4relhVxrX/+UTAQ8vpH5e96KOz/dzHtFJ4733318kK/u9wRssW
         t55WqGadhTLSv9IduIWHw34iCQyPDcjoTrriokxjeAaGVOSz3ba27hzeU8/Jps5KL5Bz
         yp7XxSNuthN6sxtXbh2dkerqYWIFBONHNo1f6lBjtN+ohcmBJjOnzxjw38VTFSK4eB65
         h2Wr7iaQ42g+zjG6iCRBRVcM01t1il3gNEKQdy0Y1IuQcXnDG6bcxbSDMj3zEQW0fRew
         8Nbp3LF8lOFJtEaI2PSRjutCeV03z0bycMJz0Xxcl3sxEdJMykv3FAhBYJbwCWpfEsQN
         qMqA==
X-Forwarded-Encrypted: i=1; AJvYcCUtuLDuYphZVsRchMPELSYY2LqFkLPJkR3AZff6NQu8dC8LDBOiMFrtgNX1UjRUV9WI7r5fJjpod8qIPD2P@lists.linux.dev
X-Gm-Message-State: AOJu0YzautNhgY7/ZBfGHr9h+HY1yuyWq70CHpADju+nVKkSYVJKE1EZ
	qHRCg3+GLlE9kh+1rDr1XxDAcpT3e+H86xs0PuBRpmUVOR06ye9TGFS/LYavXnvGLfIAFA86EIf
	F2Hvk6ootoZgRUm05t7Aw/b1Ubv2RHQHXrVLtPQ==
X-Google-Smtp-Source: AGHT+IFgb18AKuNMlykdo7Bc/k4uImWvwUeI8NNoAS7hD8o0sKiqPbQle5yPJkU/9n70pfkL/+L8Qy1G5YAS0ETCMdg=
X-Received: by 2002:a05:6402:2350:b0:5c9:76e0:2b8 with SMTP id
 4fb4d7f45d1cf-5c976e007c6mr6843891a12.3.1729036211831; Tue, 15 Oct 2024
 16:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015200655.17444-1-everestkc@everestkc.com.np> <59521671-db23-42ba-8db3-ed48cef53c05@linuxfoundation.org>
In-Reply-To: <59521671-db23-42ba-8db3-ed48cef53c05@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Tue, 15 Oct 2024 17:50:00 -0600
Message-ID: <CAEO-vhEPmPSSb_T2b17KDjuvXCTvr41_JRK0tCBSqustMHjuxw@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Remove a dead condition in if statement
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:47=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 10/15/24 14:06, Everest K.C. wrote:
> > The variable `residue` is an unsigned int, also the function
> > `fluke_get_dma_residue` returns an unsigned int. The value of
> > an unsigned int can only be 0 at minimum.
> > The less-than-zero comparision can never be true.
> > Fix it by removing the dead condition in the if statement.
> >
> > This issue was reported by Coverity Scan.
> > Report:
> > CID 1600782: (#1 of 1): Macro compares unsigned to 0 (NO_EFFECT)
> > unsigned_compare: This less-than-zero comparison of an unsigned value
> > is never true. residue < 0U.
> >
> > Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB dri=
ver")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> >   drivers/staging/gpib/eastwood/fluke_gpib.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/stagi=
ng/gpib/eastwood/fluke_gpib.c
> > index f9f149db222d..51b4f9891a34 100644
> > --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> > +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> > @@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, uint=
8_t *buffer,
> >        */
> >       usleep_range(10, 15);
> >       residue =3D fluke_get_dma_residue(e_priv->dma_channel, dma_cookie=
);
> > -     if (WARN_ON_ONCE(residue > length || residue < 0))
> > +     if (WARN_ON_ONCE(residue > length))
>
> Are you sure this is the right fix? length is size_t
> fluke_get_dma_residue() returns unsigned int - yes
> the coverity report is correct, but should fluke_get_dma_residue()
> return size_t?
I agree that it looks kind of inconsistent. The variable residue returned
by fluke_get_dma_residue() is defined in a u32 defined in struct dma_tx_sta=
te.
I will wait for the feedback from the maintainers on this.
> >               return -EFAULT;
> >       *bytes_read +=3D length - residue;
>
> bytes_read is also size_t
>
> >       dmaengine_terminate_all(e_priv->dma_channel);
>
> The patch should indicate it is against next. [PATCH next].
The patch was created from linux staging.
> thanks,
> -- Shuah
>
>
Thanks,
Everest K.C.
