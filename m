Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B8347BC1
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429961; cv=pass; b=aOr8OGxR45yJV3YUTTeSG5YZQPHpG0IMPIcjpxaEwQEYSLwqLYtgNI+EMZWhwFB3QEVdxdO9j9RUftfZRJ/omXwltJ/Y2UkL+7YLm3jH6tOrUMxsOJK9zeFL//Vc5+0Mn2pHCE6384EpX8HphaNclhZG6BNGrOMCXYGaWbu9o2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429961; c=relaxed/simple;
	bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBGwfXki5YvAu71ZHhINpaj0ySYuJrFXZmFjBw+TQPj+yUeZi9TJJjHJoQ/krUlQHffsT9lkhD0NYZRoopwC4lvs5KdBrRcmNnf/udebYOkVDjc0QjztZ5HJVsMwJtK6Eew2SDmhwCTv7do1N6d+gWDjgygn1XxRBMA4JN47YlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=novo15bA; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="novo15bA"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so1345168241.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 02:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774429959; cv=none;
        d=google.com; s=arc-20240605;
        b=B33pH7DTd52Hy/L9XwreI7DE64gWiM8NgFD/fsAPbn7xcYo2uunGRyuCyq6AL4/AKA
         Br3ZhuJVywf+39FMONyEVe9JE0eTXHVYvbQU2Aso5Fke150CUw4NrRkecirt6tNkQBZn
         tVl1/0v4Aj95XKJ1WSVnHpD49xBfzwtIoLJy8zkTuRyed23UnPwUc7SgGWLDj20DDMvk
         sb2V/GLSWltTJx3OgDQgnkUV8Qd1AZjIpib0+62KwkKbhS0+8SDD8xCC6lV4r5kPXXru
         9Vlja7KU13WtcfHp/SQ2gr1ZFV3ZDB9AQe+XChJ1TcGci1dFIv9YmtMUsrIZrG/a2ZJW
         ePjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
        fh=pJubJ9dtO7zifwr8WC6leSj803FFltFlDucWfP4zPEg=;
        b=Sl8GN0l0HMkBSOUl9DAoibk8std8pIt4LcZsbvIaZgsWhN1DuYt1X0id6Xr+4Eiq72
         y+v2shK0G9swgOAqBAsSPCGFAwhfTy9/mW6YKRmFajiuvyahayGEvodeXpct4yO7Iw5/
         nilY+xrsEBHBmz9RqFTKU7zt2TJacDnkwsSkDeUUXV6qT8orn3GLp7bBqBJx42Kg2oQB
         lUzbrEv6+nZuv97CAY5bw6wrX9ALDknmdCPo3E62yatnYYhEz/5HF04/9S99b0dGIqW5
         5c8vTTBaNe9lgzWtZMZuKc351JigVdtHMpUe/1ktCQSJASc8NM+NvTIyR+aetnco8Vq6
         GczQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429959; x=1775034759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
        b=novo15bAjVSrvoC7fboN6LT+BAzprkv9IRM3IgRUS923hQvcJhCBKR8RSrCcjn5Gd4
         uNWgc1yqPzTl0dgblbfLMvOapzytZKtEh76MOh/DpGNEMlcgH/5suUC8ZMTS55NNYEon
         7GEWefd5zAFi49e/HfF5gV6Weqqcjmp+jfSzx994oMtqC8ODaC4umN4UrpDT7SIEotZN
         ufjojX6IggwmCakx6i6yZ/j2sv0BWwkGyGOT5FEUs58/ToFI3JZpo8vBMRS/YeCNrqe8
         FtZb6AH3P676WLhd6iI5zG9qL0sVr8M24d4ysceo75rCbh2rHrHBfFJvUVVMET65punh
         WW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429959; x=1775034759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
        b=CvowU64lq5oNeMPKIfY/Dg4tp0woqpiHtu4pI1p4viDqDCW3bOtItFmTBVOULAjGGq
         koHn2dkQTE4DvNvso5z6eFHOT7SgUN5NclcyI84ebOnbKzZIQSVOIR3arC1gdN0miCs+
         C9K6m8f9PTmcUHRv/4r9BrOGoUSh3jeRrraY2jnfCYQRU/INqmOfgjaytMDoSYVX37Rw
         KdOh8Wy7ypy2pT9COOifuuvAsVqPRD00yN9by/TxdIg8J9bLQO+C4hJLBS3ag8G4GNOP
         3U8muQe1ctc8IMx9NzhZ/XHB+2Da/mIHRdBRnC5KEDjs19PpETp8/kUarxK8JW7afG1R
         HNDA==
X-Forwarded-Encrypted: i=1; AJvYcCXh9tHhACK95vxesaeuHzYHzdyD8tfBBIoiKo/3sQQhoXnw5SkMFPIfGB6YCyUFJ77xQCw6xkBD7iXILu7A@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2gP3OVR+024YGd9shFzKqWepO8OoDMV+oNmLa68LoBLlwoC9n
	AdC2wSEWNy8tUYTu+4Tzb9JCGgmAr4Jah2OqENoj8Aa6tcsN6rifDOKcbwI5STRLrUNLJBbCDMx
	E0VtJuuBbfefqw3aETZC40KZ+OmwWqxw=
X-Gm-Gg: ATEYQzzBN8fEijVode92vaRWMe9sWGEFa4RuLKRVAFCVlFxmi7EGoG+4DQA2rsfQQpD
	rokxDAX6rms/bbx78btqWGJtgXK0i0egSFBXHt0230Wh4zsyYxvKyH4ZUF5l8HcEQ1icDX532x0
	r9ZUlEV8gLn/zs/T3reCAymhycaM2zIhi2TkMvcA3xDQqyeoWGw9DcL/d+nPbQ8NlyVnz1QHenv
	pFjdRTsNU82jCfTohkegd+CiP3gBjLVTY7V8mn1KSFBvJaMoniNn24a9LADrZILn5zeXVueJ1Y/
	CI07Rlo=
X-Received: by 2002:a05:6102:3e2a:b0:5ef:2457:8015 with SMTP id
 ada2fe7eead31-603872cf768mr1246351137.29.1774429958938; Wed, 25 Mar 2026
 02:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <acJ6sH4yUyity0gu@ashevche-desk.local> <20260324180821.42084-1-anushkabadhe@gmail.com>
 <2026032514-floral-preachy-bdb4@gregkh>
In-Reply-To: <2026032514-floral-preachy-bdb4@gregkh>
From: Anushka B <anushkabadhe@gmail.com>
Date: Wed, 25 Mar 2026 14:42:22 +0530
X-Gm-Features: AQROBzBZEMOajOANo1y9YHJJ8VR250nGCap-Tmz8jIbRoNqHIDDFDalNkNp7zJk
Message-ID: <CAAfE=nPo7obbJ0CLJ8krNM2UD2hz93BQdvmzjfngAWRk44YxXQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: pci: fix block comment style and
 merge split declaration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Mar 24, 2026 at 11:38:21PM +0530, Anushka Badhe wrote:
> > Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> > ---
> > Changes in v2:
> > - Fix block comment style (move closing */ to its own line)
> > - Merge split GP_TIMER_BASE declaration onto a single line
> >
> > Checked the rest of the file for similar issues; no others found.
> >
> > Thank you so much for your guidance on improving the patch.
>
> For obvious reasons, we can't take patches without any changelog text.
>
> thanks,
>
> greg k-h

Thank you for your feedback - v3 fixes this issue with a proper
changelog description.
https://lore.kernel.org/linux-media/20260324194356.49090-1-anushkabadhe@gma=
il.com/#t
