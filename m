Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BF620F0;
	Sat, 22 Oct 2022 05:49:29 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g16so2939586qtu.2;
        Fri, 21 Oct 2022 22:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq8vgxJPi9qRVLA99cJm5hDsGpgcQJTOYbogoNjK3a0=;
        b=iuzbHD1NM69QHYbaqOY+BK2zsxZ+OWnP6v9ksN2e4pMGQ1VPwkxGEpgw9ZWpnrywTm
         pNscVc4kIX02AsAmiHKtH+8gETsoVQQMvhfGIiu2T650DKVQmptVf3KVrlfayXeG1UyV
         ZRF8Gbc9DSzUOMYygDguP4vJ8zhtLQaVnvmBvWyrO8KA7OR9iUPKDlQ5p+p8uXMJKJpO
         trzXLei3WbZVWeaPi4wmxkbpR39I2OSKjgtW5zjTmR02556f8thi1D3nPJuzv1ZTXgkp
         6VIbIrWEzO1n/j+as94XSslnTMLZndP+DfqqacsJ2JYMLM0oIfcnavy1G7x+VfnCVEes
         jIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq8vgxJPi9qRVLA99cJm5hDsGpgcQJTOYbogoNjK3a0=;
        b=zpIYlEPCe9d0vJgISyz23Xgm/REu8H/oppwVa0Lu9CWoC07RKC5L1M18mxRKv6DEIP
         Zigz7GB9kfLdjbk0O9oe3pYIsQwg0/yPvIWIf0TqdpNBqD9OxXtfuosI6ALkmFOolcMc
         0UvLLx8UJMswx4ZIybnZBdSrZcKS1CFK6w9tmE6fN77FNkEQ3CucSdHh9WrE248+RkIt
         k6wK1+6wgtTede3y2orcccFBzvSBSVwW6nWfi8qYK/mKe6GASyX5db+SPVdQzP/4yiQx
         D2D6DMIwqB7QRcAQ3Z8I9hsfaxLp4qEq2vubinOE5uwzJ/fp1YlvQ/FRtT83VKYWra8c
         x3ig==
X-Gm-Message-State: ACrzQf0NyMeEzhlB69c0RDK894hdg6SDdhz6jBh+INF8f7OgstyLHNT/
	XGxJfBqWfq7s9cYtfPeglXU5VvmZEhxLzpmP2Lc=
X-Google-Smtp-Source: AMsMyM4c8AQhSYHDaAKkzdEnXuSP60zvGRNd4mBOUMCmZGmjWtX2YtCvGb0dJ5LHt4RJTAoZx7rhU7DMSj4/GacRP6c=
X-Received: by 2002:ac8:5902:0:b0:39c:e440:6adb with SMTP id
 2-20020ac85902000000b0039ce4406adbmr19333958qty.18.1666417768051; Fri, 21 Oct
 2022 22:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1666347511.git.tanjubrunostar0@gmail.com>
 <03dd39114b1e5c029cd8022245403a079ff03ae7.1666347511.git.tanjubrunostar0@gmail.com>
 <02a45afb-f81d-639c-1cc6-6376e31351a6@gmail.com> <CAHJEyKW4QZHf_wjaR1bGs8vtb6Gu-inJ4oxcFkPPnAKEAd5-9w@mail.gmail.com>
 <CAHJEyKUGJ+E13-oLTHr4PS6za==gyCPWm6siGZaasUw6dJxGmQ@mail.gmail.com> <5bb36c2c-c0a8-905d-3e6d-f42cd8e9f9c7@gmail.com>
In-Reply-To: <5bb36c2c-c0a8-905d-3e6d-f42cd8e9f9c7@gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 06:49:15 +0100
Message-ID: <CAHJEyKWZxU783o=D0n_Gy0Vxn37t5DGt48VX9yQTLaRpyYpPsQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2022 at 5:39 AM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 10/21/22 20:14, Tanju Brunostar wrote:
> >>> Error during compiliation in next line
> >>>
> >>>> +                     struct vnt_rrv_time_ab *buf =3D pvRrvT
> >>>> +                             ime;
> >>> make: Entering directory '/home/kernel/Documents/git/kernels/staging'
> >>>     CC [M]  drivers/staging/vt6655/rxtx.o
> >>> drivers/staging/vt6655/rxtx.c: In function =E2=80=98s_vGenerateTxPara=
meter=E2=80=99:
> >>> drivers/staging/vt6655/rxtx.c:1014:34: error: =E2=80=98pvRrvT=E2=80=
=99 undeclared (first
> >>> use in this function)
> >>>    1014 |    struct vnt_rrv_time_ab *buf =3D pvRrvT
> >>>         |                                  ^~~~~~
> >>> drivers/staging/vt6655/rxtx.c:1014:34: note: each undeclared identifi=
er
> >>> is reported only once for each function it appears in
> >>> drivers/staging/vt6655/rxtx.c:1015:5: error: expected =E2=80=98,=E2=
=80=99 or =E2=80=98;=E2=80=99 before
> >>> =E2=80=98ime=E2=80=99
> >>>    1015 |     ime;
> >>>         |     ^~~
> >>> make[1]: *** [scripts/Makefile.build:250: drivers/staging/vt6655/rxtx=
.o]
> >>> Error 1
> >>> make: *** [Makefile:1992: drivers/staging/vt6655] Error 2
> >>> make: Leaving directory '/home/kernel/Documents/git/kernels/staging'
> >>>
> >> This error occured on the first version of this patch. I corrected it,
> >> compiled the code and the error was gone before I sent this version.
> >> please check again. You may have seen this error on the first version
> >> and not this one.
> >> thanks
> >>
> >> Tanju
> > On the first patch, this error was detected by the kernel bot. This
> > time around, the kernel bot did not detect it, meaning it was fixed.
>
> Please check the outbox of your email account and have a look. This is
> the v2 Patch and it contains this two lines:
>  >>>> +                     struct vnt_rrv_time_ab *buf =3D pvRrvT
>  >>>> +                             ime;
> which do not compile.
>
> Bye Philipp
Oh you are right. I don't know how this is possible. I will send a
third version.
