Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25B315D35
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864686; cv=pass; b=CjSYkc164I0VMW5X1ty/nlA3w5qoKA9eFHh+joOzQenIJiC9dzzcigvsDkiuiLMA70m8aAqQ8tfEM6p+bseIOh/ky2Ucc8ik3XLLJ9lmYF8rbBRyAjqh0RbofDfj7zY0wOjPypH/nYAU2iL5P0RCEsnQRnNnmK5W+eK9BlMsitY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864686; c=relaxed/simple;
	bh=ey4eOTeV1dSadbYtAbI0PXStP3ZwwBZegI/2gPrDeL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlLBAeG/WUvh2W+soMbjy8OZDBc6MugXJs1Znbi83adTUXpybW64/3TEF4+/2eoKFSLPtEhPfBkXWsiER0iQEXTc5Q/PeklFYqq5Kpr6oo2PFO1RsJGCXYuEfitjzFjODcw1/ZT9AA+bs7DKCkv8IShkvYgwLHyvuQMxP9xQAFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty2RDwZC; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty2RDwZC"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79628fb5c05so33554587b3.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 08:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771864685; cv=none;
        d=google.com; s=arc-20240605;
        b=lGtfYLePsan2DIGUQVtB8B7UzzwkbYNq9X76GuQ/onNp+KfGMHJJwK0QL0oO/B2+RP
         YIWXEimpMyTOfsYi6Ja9TeaUC2pB7rBkdVHxZxINUSkfqLQn5AdzGeQhcDqiMZd6dDrW
         lNIA3Zf+c3NJMJc6Cv4+8xKcfYztPo7QQurQ2kbAF5mfyTK33HSj7lItSszhtEeiBIwz
         PKwwyCyA6wmhFglz8Zdqu8/sTSLONzT+sWjit2wZDyM01nWvCOMjwgxKr6X680MzVsoG
         Lzg+VHrnqtC++hbmk0/t8Be98fodpi+A+t0lM63YAVluXwvroZmchYiTpFrqpAOHOfrb
         JHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ey4eOTeV1dSadbYtAbI0PXStP3ZwwBZegI/2gPrDeL8=;
        fh=keP4/42LRak8cnyFnWXRuRmrf6mwIxGFXfk4OwqgL6k=;
        b=FN/sH91HSGsI/4WWIrpF74KSdNcXOV+7OqTFGoHcr1Hx0aIwtsBK+58WSWc0TbNVkA
         XzZaxjVUInH5lKJnr8w2kPB5nmlLN/wh28Fop6Ww4wlILdFRHp/S8THqrJt3u3ppNPtq
         hf6ALic9jwMlzYIuKVNlJSdAFDN4nsjy3WduSAueitEiL9R3vsb0KsCspM8FstcTRJdq
         razJfVnE7c9yeK0I9m44ONeDGFc+54zxt8cC2Sx0+LM7HHcjDM5Ewu03NcKhJUmvJQyp
         co/nUaxfSwHZeJwPFRhZO7SYi4E4eoKYK3bkDP1C8v7+/hAoN/fIB1awBX8A9ahUfWOz
         xlGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864685; x=1772469485; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ey4eOTeV1dSadbYtAbI0PXStP3ZwwBZegI/2gPrDeL8=;
        b=Ty2RDwZCSYBhJ1T/iS3Z2z2HMux28HegZncsVIr6qFaVN/U7gqqd2po5lQv7wNOZqN
         c4eVY3zQI/L3o7K81uZEa/vKNleVGcTmJALFdBhl+HfJV8f7YYM6X2k87KqoaPR1SEQX
         +rohHprqZuWTcPM1g+Wcm1jibdUXwViHoRBGf6LfTlDgGS6I98DzsmETtBTirTyD3XuJ
         zeS25mQ17KZbgD0ZwJR8bGQrFw81bEoNEmglDNZZKN7rVI4McI6vQx+MYXm0B6oyseFT
         +DWbjFA/rgipbbDaNf7XF3it3gShw9gthvEVP004yfZMaVDAtniXFS65HF3mw29ZixdM
         Idsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864685; x=1772469485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ey4eOTeV1dSadbYtAbI0PXStP3ZwwBZegI/2gPrDeL8=;
        b=iu8SJn7LJ2rtMNJtdeFo1afwPjHuUv87tmqEgcZVTiq0BD+jz48TCMMOVIiQ0K50JW
         Y+c/YNrUZtbRUnU6aZtbxYQkCz7mLFsopJdPSTJeXFtyV4ILMWdYLJq5+yrkxfPVs7sU
         ElDe0n9xRkA/Bc7u15MJELkmDLaFqv1y3FD+b8pN0QSb0He7fwYp3C5MpzfOP9GhmS4q
         MlgjH3YC5+mgaXdR4cjv2p+vCyyP3D3DrVNvN1q+G2b/bO1SWmf8pIwtQ5bxoRZiwxIG
         iL2uJ0051SWgzj5K9w5elhc6ajtqwY2l5a6Tb3tFuOIFdcBb5j9YcSTvJCjOUCjt7UVR
         qTdg==
X-Forwarded-Encrypted: i=1; AJvYcCXkyICNiix5KCN0H+q1CYsAb2CvRW/4Tp0ayb2tVfharJ73xYgLgGuMyz4ZJNmVrt04DX6oDKVvsetdTMg6@lists.linux.dev
X-Gm-Message-State: AOJu0YwIevRQB0kLdLiDgDuBFNUsLzRgM4U6NPAwvKebb75CNbjzBoBU
	jPN7E+1yeCdTC7qVnaI4pkd7/+evM7crrYrvGKXseETQEYfphPrAaLthz99Y2BnXV+PQZopk6Vl
	uYQeQBC7tyAh2M5BYenCJt9XLqFaFe/4=
X-Gm-Gg: ATEYQzxj45S7HF6FZCFK8qSm2S3kBoGtZzYXlqnazLc9etCvl29hsgzBmzSfywf73bI
	XS46EpaN+L4+ALdnkJkIptBp+ozCb4V4pwHqgHLmE26+7aBRLOFia/9F06mL0k6nl4tHy3Dgv2O
	TVz5rBqiJ75+dBnaMtk236cKVW/4BiibCNbQszHqagLUwlscQnkeZEM5EVwjOZWpqxK50e2LlcB
	42PXgUIsXxVufMYggA1s2jC0QN0qzPUbgTV1MGbiBbvYuqdsKM5MOgbjNgoX+wyIZSpWHrRLFD9
	zcIynzuRV70=
X-Received: by 2002:a05:690c:8286:b0:796:6d46:8f8d with SMTP id
 00721157ae682-79828ff3a6bmr56521447b3.41.1771864684758; Mon, 23 Feb 2026
 08:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260221111003.11339-1-mariyam.shahid135@gmail.com>
 <20260222162018.4744-1-mariyam.shahid135@gmail.com> <2026022249-gloating-bubbling-e7ac@gregkh>
In-Reply-To: <2026022249-gloating-bubbling-e7ac@gregkh>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Mon, 23 Feb 2026 21:37:52 +0500
X-Gm-Features: AaiRm50zFvieYRRk2YGMsOixLJYeSrj9-nKvMgml_iSGvKWaJtm8muG9DeALyHQ
Message-ID: <CANhxO_g5xc4suj+HJ9v8sGKG6XxkdDpv3yCUoeXC3hrb71pCMQ@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Replace kzalloc with kzalloc_obj
To: Greg KH <gregkh@linuxfoundation.org>
Cc: straube.linux@gmail.com, dan.carpenter@linaro.org, 
	ethantidmore06@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 9:42=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Feb 22, 2026 at 09:20:18PM +0500, Mariyam Shahid wrote:
> > Replace kzalloc() using sizeof(*ptr) with kzalloc_obj()
> > to fix respective checkpatch warnings.
> >
> > Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
> >
> > v4: added changelog
> > v3: rebased on staging-next, kzalloc_obj now available in this tree
> > v2: switched to kzalloc_obj as suggested by Dan Carpenter
> > v1: initial submission
>
> This is not how the _obj() calls are changing to work, please wait for
> -rc1 to be out before doing stuff like this (see the changes that _just_
> landed in Linus's tree for this.)
>
> thanks,
>
> greg k-h

Hi Greg,

Understood, I'll review the new changes in Linus's tree, and update
the patch accordingly before resubmitting.

Thanks for the heads up.

Regards,
Mariyam
