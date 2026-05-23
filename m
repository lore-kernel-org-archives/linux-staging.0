Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098B6263C7F
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 03:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506199; cv=pass; b=AB+XuQAkoEkBpN/B0I2GL3JGW2LA7M6i8ROhFynypKXzFCoAmX17hSLZJx2lzyeNB8LY7MKSTc4yYwp982xFULtVPNDK9zTitHcbIERl0Od2pWqtlynPB8EW9yZqCas2qVnsCpgA6kW63pJyiSOLza+BxUz2ssEbS/5oDbcPWgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506199; c=relaxed/simple;
	bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMe7SgM9uM7uxqahj0D5ckir1VVZFHp/pknHgX0QFF9mAM6p2bPJpyiPpFT0ZSMrnnGgLDkDZkZ9hcTvKLKkJQqVN3q+8gRsz/HufTIlQryxvr+4IR4QO3q5ONr4NkTDnjN5GYb3oqafMOjFYiIY+NSkD3Q0aLfeBSYprAEWjtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2KRzq7w; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2KRzq7w"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-69d8b7aeeecso405555eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 20:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779506195; cv=none;
        d=google.com; s=arc-20240605;
        b=IqZehOcshG+XhUWDvkU4G1p2XgjNl+TfL+4VK7ouWCg/XLyYFqt5e9GTZyhwjH+Fu7
         i97/1gcVi16pCA0sB0tT4btyF+HvIAe0op7Ju1Hewkz+KsC1i8F/Ner6YN4TpzsYnoeq
         bka7ji9wI91Y423yd6M0hTNY/qGhOwsqxyZkw2KqvqgD2j4QT7yMiaDGSO/8+SY069Bi
         TpONgCCoM8A0W3gQjrR6po+t15tDhUaCgfJpZ6CwBpxpbOFtnqKoNG3N0BPznBmWnhdB
         /S/v0N8XjvAtDdiZU1pCuh52XfgSki8xHs//ogSvLeEF3xcNzPcfGiQTxoJ8/cI6Un12
         koig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        fh=Xw8C9D+4IaSF5FHk9yx/C67IkuPzgO7b2THWO5CblL8=;
        b=enDkLvC8XqRFnlrOTKzL+NLVxhthdP2e/Vmfb6stbyslmiOV/6/4fwLncBsQrshQme
         y2TrVigItXd3ZIaSzMenCFRu/yiIuTz+JJf4uCf95vs8PXjei+Z5ame4jFK/5WC2yHI5
         GeYb8L6RMIBjYYUp6Z4kTKoc289KJkaEwe6GxdpOjX8SHHPalYd4yCU6lriRVqS8XJLB
         zB8AD23Xi7kJGqfkSLDNWdeur+vP23G7H2yPNqc95rs586jP52PpLGSgH+jZRmL/9O3t
         7uqJcKdIjd6z0bCzeoFmxbhDxX1rAtbElgy2EuDPtbCTuWPuZUO5W6uhFbxM2SFw6BWz
         JH9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779506195; x=1780110995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=Y2KRzq7wTbcu8jU39kR0dUEn/FUtbRpeP2m0DD1115rYI+V0ehN6y68xk1Qw2USpZv
         /HezoS27z6OSl0aHIFMUZtUtvJo1dbiZVN9hGRboSRD59mUfk+tYp6FJCCLvlz1Qf45p
         Jq466TEdr8Ce9N2JQRz95rTaVBd0kIcbDIpcfkmmBeQzOiEuij7RhLr+5JDwL2HAl05D
         IQYmBSnGJXajaQrn8ktJC7pVe7A11/wMZ7DOZQfX9hcoIj819GiLbT27jWSKXL1Hwsfu
         ypwhqCpv8udZx6q6RgmQjD3FhyRCm+IEXlDGrWi0F2F3bwUTO/NTmO7bAf0CQj+I8Ygb
         8xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779506195; x=1780110995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=XolFg+U9yfnnirciNwu/30czkOhaAxtuX2mOTluyccHPKFOewuksIiEYhzQMi+vqZV
         r4ifdZBZbTjohJgg9RUUtOfhm1moadNnMjrkAHhzY5zQl/6DJPMs4kHqYBKwkVYgCQAG
         /uOVfZvpbyXMikfIkl0L9RJUjiALENienwj0qr3NSOjAejyg5A+9Xwfgk65+APbULt8n
         YVhPXMY1boxCN3vzhamAaU6ua69vtolXbDhHN+ug6x2xkxc6HajdzKK7dswyhc/g8mm5
         2dqqVgB+RXGACo+AJSmxH/FAT/W6+6WumBpflSmtEZSPEKAccumPAnl1aSUBgOZS+r4m
         cc2A==
X-Forwarded-Encrypted: i=1; AFNElJ/qHnGaYhgnAyjzQ0212eveCfzao9ZAj5XrNSt9Y2LV3KVQwCCunMh/ilZEOebBr8ogOwUK0V6s7xFEzDQY@lists.linux.dev
X-Gm-Message-State: AOJu0Yyey9gi7LynBgGrPTmXoYyIbpGZHDstKQ681pV21C9S6siBXJIi
	RJZcXGoGkh1mtfpuUYwI672lqDidpdJQG77tTF03l0W1hHim+NvWCm0yQsb4jX81nQ8Yki9kF7R
	pnW+H3y25f98z9LVYoDt8L/laI7TVSdc=
X-Gm-Gg: Acq92OHi68NhteVA2DLHIituOVlqD6glDv0GNBJbhaa2tLQZXZGZDjmFo8RSSt1ubGZ
	nJrxhwspwQkL96XE0xNoIcQPzmoshfrf3ODQU/U1HiPoGgMs9+crUkG2HjSFb088XMx9Ou7cQtr
	OlQcyUz8o3dg5Wy1ZqGVgJwhJloGvm2A5DlcaB5e4yzgo7ruqiDj8faneKvUAKUEYvR8g8H2Nb6
	FxNg/U88aeOvX5SZXyzp0nBKZb3/dV1xalZKZZpLFOxmEz/XoA/JUdDVRyFq/lvBTjSz+cClcTt
	QhwzROKbHtJP6l6BL5Mgr/1oMd8/jJoFb4c9las/aUyQVpEom9cQxMg+1NYs4ZQ1kWA=
X-Received: by 2002:a05:6820:4c08:b0:69d:521d:a4fc with SMTP id
 006d021491bc7-69d7ead810amr3088050eaf.8.1779506195590; Fri, 22 May 2026
 20:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
 <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com> <ahA61YIGM4Bqipu7@collins>
In-Reply-To: <ahA61YIGM4Bqipu7@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 06:45:45 +0330
X-Gm-Features: AVHnY4ISNoCKi2Ahpn2OwYGMSPucMAJaRMseXVZ6HijrWpM0v0rlwFD_MrYBAdY
Message-ID: <CAMxPZkj_2h507_3d+5aZe6b5wUrDOpA58y4OcD=D0TTj3FQcog@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, May 22, 2026 at 2:45=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Arash,
>
> Le Thu 21 May 26, 12:53, arash golgol a =C3=A9crit :
> > I used LicheePi Zero Dock (V3s) with the following pipeline as test set=
up.
> >
> > ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
> > sun6i-isp-capture
> >
> > I verified TRY and ACTIVE state handling, including changing TRY
> > formats without affecting ACTIVE state. Format propagation from the
> > sink (csi) pad to the source pad was also tested.
> >
> > I also tested streaming with the sensor test pattern enabled and
> > verified the captured output was correct.
> >
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
>
> Thanks a lot for testing this! Did you test just this patch or the other
> ones (especially sun6i-csi format enumeration) as well?
>

Happy to help.
I only tested patch 14 for now, but I plan to test the other patches
as well when I get some more time, especially the sun6i-csi changes.

> Also if you have an opinion on the code itself feel free to drop a
> Reviewed-by tag, a lot of this work is very similar to what you did for
> sun6i-csi and other drivers.
>

From a code perspective, the changes look good to me.
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
