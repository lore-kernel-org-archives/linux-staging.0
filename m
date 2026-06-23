Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6643D3CE3
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213970; cv=pass; b=Qmhvd4yh/amDeTrILQZtZEc23bivZT3bivhprS08Q+HWkySd2Z2jvcIbLicFkgCY5h053V21jXQ39DIDjyajqcMQogphXSkwzRmVYliXmsrBc7cnXTSaplEniNj1rkKYkrzRiwSjVVJu8B6KOD/SO2j8dd7CwUHUj86GTdn5PFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213970; c=relaxed/simple;
	bh=wo8PJL3FIJMicX117V+MfQNstnozHaTXf1TFnwbrBsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m34K7O+ZaEhKZlqxt3BOY6Myid+gftrW5UgRtNf4Vf9tge8AWM6UU65JtBGmmL6X4LI1W+WbavZOYicXIlnOtk0D4QzybRjIRHw5GYFFaxsZsnxm/BNthfHcusa20t9+PJllOvHoNoJBr9DluByVcgNNHBPqOTKGCt8B3l//ers=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S88TlqeG; arc=pass smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S88TlqeG"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-3998c6e6921so38939671fa.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782213967; cv=none;
        d=google.com; s=arc-20240605;
        b=QcjVhZ0S2BUMYa7YR7Otz3ldja4zyHavdC8Lho7+a9Hz6t/U7vGzHCmlzzULEnuJwj
         PAugG45ecx2FCIxPzmdHMTpq9xXWmfbua3dP3SNiBdCikQXspZXuiLAFUUPNIXgkVsQi
         D5j3JtzDNpB/Qyu3dJqDZrwoshroZUykro+g7SPZWINDPsrDXY1STS7VvyBrLtzSAwv6
         VaplgagTE/9UFLZFZVoMWqxizBzaRLV73Gr2k8ypPWzZnxYJ0IuoXr1ycmDbK/9gnqZp
         Bj7M5ItjemhZmfNvgwo+CfsPz7qrhBBmzvdhOjDPsbIE703xoVM//UNRleNitsoHEomi
         i7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4K52NjK8e+irKnNfEBWlTK753sYCWr3+tYjc++YExig=;
        fh=HOytGBl8IqZ0zGBwFQZZ1LqMYBMAVcEw2SCrf1735ls=;
        b=EIP3LPihNSpNuBXyQsf9o2xeiLytJf3GUAV3gNm0bfAfs4vJvNu8SHiIpIPT2FMRzP
         eXn6aCB8uPHGXFymt5wTcw1pxaNG1xAKdRdAyWvlbzOThFk6xn1dsEnZTewNkex5oRAC
         xmhyL07wxJvoFyJgnNBKj55P+Du6yniKcNSyk+lYArte9fClg6tdOoaaeFy+heXVA1mp
         YqXnWN6AMSedIcMIBw/5ojnQtunvOjqTZfYuHTxflfNxe0bGKQiKudD5XIz6W0tZG1FG
         T/23Hw42YkPwCUJdL3OwuFSVBaOtMTBv7IM8KCUgM02C5UZCbJABEFVUPAtN9E/tK0+N
         j13g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782213967; x=1782818767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K52NjK8e+irKnNfEBWlTK753sYCWr3+tYjc++YExig=;
        b=S88TlqeGS+TQUJ2eqf60EtIgM4aIkZOKoX6NObTTSjOERvmHn8gpqyLpDK8VqYY8HI
         Sih7nnEdKDSNrwPLc3aBXwGz/nIv+3OuPfxKJMPUZEcpVwxSKmoiJ2oVGj+4W+/pU/EI
         t6ean1Gg/5Ur43tN7qtrpeHfty/9ifHkJdflapQLbzXmo+/UukRBQ3Jioudhu1EwxdJY
         ZRooK6ZTlO32ov6ydxtGJzNyh6qhh8BHitkUyPUXA0o36zz7ymDYt9L9wl9JEjWcSgAo
         6mHKlDv68b3KO2VE0dMPGMY53M3iXJ0b3Qzs4LhF5rkR6Br3/OL+Opxxg7akrTiMpKIf
         ZDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213967; x=1782818767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4K52NjK8e+irKnNfEBWlTK753sYCWr3+tYjc++YExig=;
        b=ah/vt4FlUfzniFy2M+wPDn4O9kDmBLyNYEqSGkOlyGiRrDG8IGMIPT81EXs5dKX4JX
         V3ZXoxgAzrH6vIIG5nVXkMHzye5r/nJ202+82tiw/JmhgK0jlnDM4tjkUVV075xwMjgM
         LR2rb19OhlsTwN9t07AZxjBZL+bCF9SPBVl5WylHM1vbRhn5uY7U3jMrOYTWYaWCMVFy
         Io79U7pXHd8zWYGAB3mMIteOLcS76LPAZY/jIt/aKZj+N4r9zl8/a/LPVCruCMITEmHY
         DoBSgnvm+bSuSEL/remcnk2Ze4XGL1tHv+nLNB9muKZjd3HO6OKf6x2+S6l+LAI5ntx0
         LpBg==
X-Forwarded-Encrypted: i=1; AFNElJ8RxUpuXaHHGUfzvom+sYthGuaIqexsizzgoolsAGtZoh22PH6xqyZ4KVfRrrBTz3APHpHL2OnU2XzQpRNG@lists.linux.dev
X-Gm-Message-State: AOJu0YwF7mh5LbuqMKtyBCOHLIh5cG9s0HaJFSfCCC6P/H+2c4UU97UC
	+FdN7ly9niX8UyRt/VH8jSatkWFJDtrPV4zXJuji7HmeRdE2bhdXKkorU4Zv91kU5MfHizfb3Rt
	Tr/h4OQy+Ax/YtPdHzWgWU/02WkuK5aA=
X-Gm-Gg: AfdE7cmfd3xivZIIhjFzpNkDDCUZDm0hu1mJn+FPC1NtB/mGcybKFaQ+jEetYrjGAqn
	2PN+ZSnGysnOOEga1GUFVFBEkVpCuQd8C6eCURPDdbQu21L+S5+fdQ5lkITgYj5HrkOFNv1X/PM
	olDbz0Oe50A2n4q/8X4q08OkPYGv4qnotJRVHCeo6n8HMqn4UnicHr4SoRFraf1cm1WfUkNAGge
	hwwPfBmuLVUpgKixcKrflpjbwAIIPlMPlWXZNLpuJbrPMoTt+0xSQ4TW1FF/OZ7fHaaHoQ4EcmI
	z4w64mjnOPcthdFrt8qxYXyhpOLcRROLHz/MGZDL
X-Received: by 2002:a2e:a586:0:b0:396:9043:bb97 with SMTP id
 38308e7fff4ca-3998bc6d102mr49650771fa.8.1782213966997; Tue, 23 Jun 2026
 04:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623075507.6157-1-oubruce1234@gmail.com> <ajpQD7LyfKNopii6@stanley.mountain>
In-Reply-To: <ajpQD7LyfKNopii6@stanley.mountain>
From: bruce ou <oubruce1234@gmail.com>
Date: Tue, 23 Jun 2026 19:25:55 +0800
X-Gm-Features: AVVi8CcbOg3qwJ5ij9iddh7QJainIPNfJW99spkDHX6HtNr845T1lD5uigygMLU
Message-ID: <CA+h2PQjd8D7yiF8N8R-FwtTFfT7gJH-z9jMOA84esykGP4J+bw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warnings in rtw_efuse.c
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for your review and guidance!

I have switched my local tree to the latest staging/staging-next branch
and squashed all the CamelCase local variable cleanups in rtw_efuse.c
into a single, comprehensive patch with a proper commit message.

I will send the new patch shortly.

Regards,
Bruce Ou


Dan Carpenter <error27@gmail.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=BA=8C 17:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jun 23, 2026 at 03:55:07PM +0800, Bruce Ou wrote:
> > Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> > ---
>
> No commit message.  You're working against an old tree as well.  You
> need to work against linux-next or devel-next.
>
> Please, don't send a patch at a time, one by one throughout the day.
> Send them as a patchset.
>
> regards,
> dan carpenter
>
