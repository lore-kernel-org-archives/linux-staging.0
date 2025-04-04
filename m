Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7230E1459F7
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743735813; cv=none; b=S5ivA+jNS6l6QWG4y5Ge0Dl2venwhfFPhjRiivLQPEUCQ6RJzh5T1bBrCQSqhv+/81vX7e/xl5G7GetX99rJN4bUYNU78hQg/TZ/tMs5EdMzw+UijEx0GVKE95U+l/yAR/a06fk6DjMXR9UCTqUJroQSNE9N1qtQ3OrdNW2ev+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743735813; c=relaxed/simple;
	bh=XiaaeIh0ZZaVHZtsslFXr81gPq0X5PY2zA05Qtiub74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chVdJCB0w7vaKjAeYpPthPeGbwfHI+ppILoZJZupaM6w0II0BAuyQmG6uFe75jBC/6nLRj3FmnMnVq4F2vv7F25FY+VpJXtMxeOsNrpzkSObNd3z6CMF4hYm2UVfKclVIxRK78ak1N7QV1ZoSIsWA7ozVoC54BBYOPalVIr1iSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeGSi64w; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeGSi64w"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4775ccf3e56so28079361cf.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743735810; x=1744340610; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UE3DzoQpmYHs8xWnfdPWXAlmV19fVHBgLJAWXS0P6k=;
        b=aeGSi64wjrudJA84vAmM5Tyg9tf5lcUVN1lvjFRfc0dbAMxcrujF1kIh/L7Ag000RV
         wjuYb7vhgVpIZJbF3ebm35+1CQUmWYZng5bRQKz4cdGqXd8ZYWffAeiM1IGyyCpZ6kVa
         VdbzaRoVAEwHEt2AxOWhEPIJdIgovq5FHKYoCCN/B4U04LKlrrj15CEgIq+Z+kIwcaiA
         LXT+VfcD4xMZSRCIKonmpjpQb+ZM9RkHZmW+5Bv+9x/HdIzqpybSolC9FCMvZ71KK8i1
         JVXd4pTKAor+LQkaIenQjszP3S80nq04puKPVD78FVqlAoQxsOEpcyAr4rFtRusbNeZW
         v9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743735810; x=1744340610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UE3DzoQpmYHs8xWnfdPWXAlmV19fVHBgLJAWXS0P6k=;
        b=oCHKpvmIKEwQbjiRccLkQEO7RDnLklTRtTTlv7uhkt+E1L3VyOMvJv6FSFHAnZc8Jn
         6JTWY6GUuHR2eVW6+LsTIQ4NsQSXVPcnTfiZXQXHjQrEf2rO0ivysyOglQ0bdIAvEpWt
         JxXewBOVvahVXx4ULc9KUBdtYGgtY5lfnxU3PSa74NmREN9Oz+2Pc+ye4H/bESwSm3iU
         CZncT23e2BZBbzRbKCREVLVDsAI5ja5fjvf2HbnwGWBOemPTAWnx9eWAhd9yk7eZdHBD
         zxlgQo40y8TxHUNyAYp354sZ0R1Of3+XwVAw79mC1A6XAnRxysr9hMm8uCOT7T03ogZg
         2I5g==
X-Gm-Message-State: AOJu0YyOcZSYzP0Hy4r8oPUONwkIyXgaL93V+VOQi++BUjzBilnIr3I8
	iby5dyffnsiOxgQT351aMeUeu3GZlE5kx+66yqL8clM/Rzw/2BLOwdAfBNnAybOXsc1knGowAdo
	nLqIVlLidRAA5lM3ex9NNNnLdBq4=
X-Gm-Gg: ASbGncsdO7aqmgFdBcJVkOkeS9iEa087OPxwhLXvRNy6h/93gmLy5LxQSdwQ1wblzAI
	nvU4TAZKMj1yIiRlxjSi3v/WHSb7KHM4Ye+wIpURs4QxTGhnCs5Ts0mHkSU1SRu0YSAFofSmx/P
	R25Il+CPglcWn+///2EGhf2YeEZic+qzIwbc0NE16Hh0MwYdfD6Akph+3d
X-Google-Smtp-Source: AGHT+IE67I6IaRfM0rS55FHF15LclgBp91ol+WbrPbsE/bvJ8JLhseURL3aCgdYJm7i1B1fW0+AJ+lCmBZeaTRnm0sA=
X-Received: by 2002:ac8:57c1:0:b0:476:fdb3:28ca with SMTP id
 d75a77b69052e-47924deb441mr25796501cf.24.1743735810315; Thu, 03 Apr 2025
 20:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402124207.5024-1-gshahrouzi@gmail.com> <2025040350-footnote-fanciness-50ac@gregkh>
In-Reply-To: <2025040350-footnote-fanciness-50ac@gregkh>
From: Gabriel <gshahrouzi@gmail.com>
Date: Thu, 3 Apr 2025 23:03:19 -0400
X-Gm-Features: AQ5f1JrLNamMMZyLaUdMMmSLfqTt1l4dcqsI5TL7NKevMMIIyEHzOQcagU6MFCQ
Message-ID: <CAKUZ0zLTCw3HDxmyiPD14TxQk-g90h=-7=e1Zp9ucDXQosPB2Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	kernelmentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > Remove trailing whitespace to comply with kernel coding style.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Changes in v2:
> >       - Resend using git send-email to fix formatting issues in the ema=
il body.
> > ---
> >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/stag=
ing/rtl8723bs/include/hal_pwr_seq.h
> > index b93d74a5b9a5..48bf7f66a06e 100644
> > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> This wasn't made with git, was it?  You are "one" indent level off, the
> diff should say:
Interesting. Not entirely certain how this happened. Since it was from
an earlier commit I made, I rebased it, amended the changes, and then
formatted another patch using git. Apparently one of my other patches
for an earlier version had the same problem but the subsequent version
has the correct indent.
>
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> here, right?
Yes.
>
> Anyway, because of that, this does not apply to the tree at all :(
>
> Please fix and send a v3.
Got it.
>
> thanks,
>
> greg k-h

On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > Remove trailing whitespace to comply with kernel coding style.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Changes in v2:
> >       - Resend using git send-email to fix formatting issues in email b=
ody.
> > ---
> >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/stag=
ing/rtl8723bs/include/hal_pwr_seq.h
> > index b93d74a5b9a5..48bf7f66a06e 100644
> > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> This wasn't made with git, was it?  You are "one" indent level off, the
> diff should say:
>
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>
> here, right?
>
> Anyway, because of that, this does not apply to the tree at all :(
>
> Please fix and send a v3.
>
> thanks,
>
> greg k-h
