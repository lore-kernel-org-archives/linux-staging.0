Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA03281520
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551063; cv=none; b=MxGWRW2kSt8Ev56qCMQMyN+anwPR/l8sHvRb//SGKz/Lz2i0ITr/R94LsdwzvpOUJJgGkOzsk+QI5Epfhr/3shTCO/J2L0GXhCYRu3bANYsdPlYWfoR9szP5E2dnhwJjTrMliMtqFwlGr6DlGav9T2CscTP5sMc+ESyR0OiCWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551063; c=relaxed/simple;
	bh=V2tFe0XUwxqTapekW1Mzx/DadAu9gNFcir/81DpoFHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TihDNbnJcRlJmPRfraWMWBx5dqACaVmppxDH0eprMXu0u/79Ukm+M4dgzoxyx5W4uqTkbHxIlIIIsNSFhKyZitnBJr03ctEKApPSlbpftVPsvet0ltX49YiRfZltDytixJPGbitu8pxedz0Zi9z59AfnmHn8kiuXMaOxC+IEmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4RRbrU2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4RRbrU2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so2654707a12.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 00:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768551060; x=1769155860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FlQ8Fy3LtvyqW1w8wqJOR68E11Ksdj0bttuuvoGMFI=;
        b=Q4RRbrU2JhO9SzX5Jmn4r9hTt0HqrJZj2Q9l/umwWUZp4Sz0HF2DGEXL1hXnLGSnyK
         1atIt8zqtIQwMJaMUsE9iTM1GNALesu13BS4x3h6X8aXFI3SJd6fjRF9KblfS0y6X1/H
         DTvGOtJQMldQzKT31owZBMZfHPJa3H3MG3KqXBg1SA1CYs/9Dx1p/MU71ngC12ja0SsP
         qHvyS/RND5JnPWRObbRtx3/WyRJ57VQnHcGYLZhvk4djUUODP4LWM71hmsfQrocjNZDg
         3sl/gYNp0ft9SFAUTq1ALExoOqZKG0VBHvu79pWnTX0yVpltu8OrtC/ml1FrXEPC3SUW
         UsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768551060; x=1769155860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FlQ8Fy3LtvyqW1w8wqJOR68E11Ksdj0bttuuvoGMFI=;
        b=YviDmEgPymWSTxlc3FlZblJHDzjgn9fHQ6DYI1h0GVk8Snou9ahJfGaihPq3WfgPOf
         ikQUSZihqnvSWtuNHXg3PzU3lsfbRiIcVvI/LOCHjPSv+IhOaqukbB+HPgOe6OkSXSR9
         iVXj0dY1DlfQkLUT/YvSTu0aTuy42LmvGkbXCXm2s3lp9wcfXnSoI+zUIl1MzdJHJs2T
         O0lsPsEX/hNykpO+UbX2hZZnu83u2Gvs0hTly/5FQuf6DdnXDI5rmjMM6lJC9NhU4PBy
         TVNNZmq31RsdO+L644etnMHqXa46cFzMnlL3asxFj8vCBJ+tql4Dm6/r0tv+lla7/fiE
         Ydqw==
X-Forwarded-Encrypted: i=1; AJvYcCVRaMG4jAswCNS1W+/IrSf1B/p0WiGFH1Td2hubr5T+TDV3rgb/2dsTk2DuvKNQiK37btqwV+jMsmUd9Wim@lists.linux.dev
X-Gm-Message-State: AOJu0YwyIcceU4uAoU9cTct5D7+XhOZ6FuU6fovlZo8n/SrZF3oyvVSN
	67EkI2kfMRrhRMyIx16hsHAX/3+PyOW9ren3yDEIF7VsHHhwgBcrY5lBQzrG9xJzjB8LTVjZOTT
	KC+yVp5yAvq/5dY8AV+OmSgJepXbDmpo=
X-Gm-Gg: AY/fxX6sFJInfUOZCsukn7Q+KJW8GTIgF44yy4PKO3cy3vj0re9o40fP5QEU+r931O2
	T0LuvJUHG8Yfdds53ZQ163F7q2ORjzVVhdbNdbkQzwt6ojLHQKFwnr6gizk+9BxjpUPQA/Xs5Nq
	XUIOJpw5pIr0dQklUtu6PctUv0qJCkpzBA0Koxv9fWkilBoawIgspW/1l5AQBvu7eO0T1/OtjCI
	Shr4WPU16N8tVZUPSrUMyTebLIaB6J8Bk6ICsRdsakGnWu39v4CNxPivBkL39y4hLy/5+kt56wB
	7WJZgjWOfCoh4HNPC88TF8d0/buR40Yr9ha4MPVYT90ER2PsyYMVov0kA40pjnYPvw5X/f8=
X-Received: by 2002:a17:907:7f90:b0:b83:1376:2bb6 with SMTP id
 a640c23a62f3a-b8796afd58dmr129649966b.40.1768551060099; Fri, 16 Jan 2026
 00:11:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116072121.7591-1-hamdankhan212@gmail.com>
In-Reply-To: <20260116072121.7591-1-hamdankhan212@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Jan 2026 10:10:23 +0200
X-Gm-Features: AZwV_QiyUOIxQjOUH_5Eh5Y3o_DUAbRTOzttku8_jqkoyIAjLFnwWX66dCRK5Ow
Message-ID: <CAHp75Vefv2PCtd-xOw+7906g7MxXVzSE7cOm-xJ_fxe_arCx5w@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: Fix typos and formatting in headers
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, dave.hansen@linux.intel.com, 
	tony.luck@intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:21=E2=80=AFAM Hamdan Khan <hamdankhan212@gmail.co=
m> wrote:
>
> This patch updates block and inline comments to follow kernel

s/This patch updates/Update/
The recommendation to use imperative mode is documented in the
Submitting Patches.

> commenting conventions, fixes typos and wording, and reformats
> long comments for clarity and line length consistency.
>
> Although some comments used the /** ... */ style, they are not
> kernel-doc comments and are converted to normal comment style.
>
> No functional changes are intended.

...

> struct atomisp_3a_statistics {

>         struct atomisp_3a_output __user *data;
>         struct atomisp_3a_rgby_output __user *rgby_data;
>         u32 exp_id; /* exposure ID */
> -       u32 isp_config_id; /* isp config ID */
> +       u32 isp_config_id; /* ISP config ID */

Useless comment (no added value), just drop it completely.

>  };

...

>  struct atomisp_resolution {
> -       u32 width;  /** Width */
> -       u32 height; /** Height */
> +       u32 width;  /* Width */
> +       u32 height; /* Height */
>  };

Ditto.

...

>  struct atomisp_zoom_point {
> -       s32 x; /** x coordinate */
> -       s32 y; /** y coordinate */
> +       s32 x; /* x coordinate */
> +       s32 y; /* y coordinate */
>  };

Ditto.

Also double check the rest. The rule of thumb is if the comment just
describes what's obvious from the variable name (without knowing the
driver code and design), drop the useless comment.

...

>         /* GDC shit size [BQ] */

Probably we need to fix this "shit"...

>         struct dvs2_bq_resolution gdc_shift_bq;

...

> +       /*
> +        * The overlay start x pixel position on output frame. It should =
be a

"start x"
on the output

> +        * multiple of 2 * ISP_VEC_NELEMS.
> +        */
>         unsigned int overlay_start_x;

...

> +       /*
> +        * The overlay start y pixel position on output frame. It should =
be a
> +        * multiple of 2.
> +        */
>         unsigned int overlay_start_y;

As per above.

...

> +/* MACC parameter control*/

Fix the spacing in all comments you touched.

--=20
With Best Regards,
Andy Shevchenko
