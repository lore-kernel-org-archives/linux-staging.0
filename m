Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E5F236A73
	for <linux-staging@lists.linux.dev>; Sun, 16 Nov 2025 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763291327; cv=none; b=Ms76Lkn6hAF9IIIcDSj3Uu8gLK1T9gWMEkYO9Fzq8Q+RAUMPPcs5RyxwKkqF7qohVvkeem9yGhRQR5dditP1JqK+BGv5DFZzY7VaNzKyYNACmUXdxRHL52Fybn90u+D9hEiL1UVIAU4haunIOK4ecpUKp5fZPNTjWbAVzxZCmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763291327; c=relaxed/simple;
	bh=++IoyEjM7KOb8pLDO21vO4riCGkzG+6WhUjjBZc7xOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPyoU5+gV+YFGOOmmN25TThRMaZscdQfky9JwE5tuXiUqYvN6hAK3ME7edRii325AU6TlTgH9pjxhNTEcXNEo21UQOqJ/xqCCRQaYap+hfUk8HrSNhh3Br1wB6lj1TKUWspfimg8Y4xImQQJPfR5h0JK53/aYzxGbJ7PysJ5k94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFEGVuGK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFEGVuGK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so5943638a12.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Nov 2025 03:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763291324; x=1763896124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++IoyEjM7KOb8pLDO21vO4riCGkzG+6WhUjjBZc7xOg=;
        b=QFEGVuGK8WVUpcjb+adFSGWeXuhcOs6exeyjad4aU1qRAoFMtawiB32MO9JFB1+CBf
         7WxuBgq7folMSgWmzUQZX0kxm5SBiB83Ur8jFwcmL99VjVinxoK0AlIqnmZGoAD47ap5
         r2w8DfTpATdwlJ04rFdpMTSrHOOGIJ4tPlmzs11KS57mWDw9tyTDQ7lWIIIX3+BGD6oK
         ElKByuYN1O6vsN6KtQaOcC2dymctw5ak8sBqRlsudEbNU23xWgYqOkQwdbHmipWH0n0M
         /2F5nRBL6KesjXI114onnaQDp7F1c4e3la3GefGarCGx+9h6MAv1qjbpSYKvBbb7SxZp
         bsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763291324; x=1763896124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++IoyEjM7KOb8pLDO21vO4riCGkzG+6WhUjjBZc7xOg=;
        b=oGkmLPpX08KTWOk5ensSI0bRlx5j2maLEPY0SPIfD9vz401pZjQ4RHJJo644fDuiLJ
         nCz7K7J/nBjHBHMN2Tko3cfX7K3vNvqcz4VyupQCuJtYDsWVdyggYfOU2OdUrBLUL2X5
         uTzQZskNtNhectpgxQtqgmy+zbVGdJcm+vQ+AvVrv8eJQmIQjxpqNeTRyQ5hmkK7XwiL
         PUcPHlW2jeHNaEqRnOAakI/3E//BvzVPMrjTgKk5FV85pVw22FjuvIvV4mkxTQucvKOx
         BoOBxNS73TqISPlXCE34ART/ttv9tJvojkFciTrs6Ah/ygi5ntnkiqdEbpttKe2kY70t
         tV3w==
X-Forwarded-Encrypted: i=1; AJvYcCUP2nJllFJX+ilYgHIsbjn59ShHYFgD7oMgTRtLyOIn0HZwWuknv7fGsNXJVczXmKttxfLPL93I8s00SV6i@lists.linux.dev
X-Gm-Message-State: AOJu0YwczI3+dzhK+LwGeOHx/K4B0yT1A10qhOnEXc70HTyhNSgIZyWV
	OueKDfGpFZxzd+tJBJP+71YbPbHuNXI2rEcU8ouUKQ1o3FXx2gt5SmgOAkAUgjcnsN4jc3y/p0F
	+XV2PnWvLHn49wnfZivcrlNq3rHCq5ws=
X-Gm-Gg: ASbGncsyxArCtTOfOtYIZ+NlTxv3+mLcIhqNW/SBjb2B6G5yrW+BjabSePcDOvcX//E
	tQpab/5tnxbWC0E6IGi7ekgrnb/zpWliT2Peovvu5dkQMAa4jXR0qf4ASh31D/7n3voO+K4cBc2
	I831YHt3IeTQqtLk4pnrsvRYMfoOScs83M8vZbeOkdY8exSJ5VWHEC92SW+Hhw7kmkkkbse0i1p
	72/dDqc79+aUED9WZ9mnmor95JoxDbDIqxX9lEZI97q/ApfggcDsxIZmuiDbnRyrSD1+1ixKPV4
	1Foh+I96on5i604KEgNUL0qMUxcLJMXoB0EOM6oIglObHHc3HUOmUzUPzwzU0wl/C5N47A==
X-Google-Smtp-Source: AGHT+IHht8SUA63TQ9BgVyqZrHjzgfqHkR7ptlsmUxvSYczTcMjuN8RjFboIeyOG2OJHW+EKkQL5Jqfw814RibCwMm8=
X-Received: by 2002:a17:907:1c86:b0:b6d:5262:a615 with SMTP id
 a640c23a62f3a-b73679628b9mr1077586166b.41.1763291324117; Sun, 16 Nov 2025
 03:08:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251116101620.25277-1-i.shihao.999@gmail.com>
In-Reply-To: <20251116101620.25277-1-i.shihao.999@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 16 Nov 2025 13:08:07 +0200
X-Gm-Features: AWmQ_bmKKoTGDT6BVX8LV4jXNIna_cAeoRA_R9V_7gQFWqzB8w8aFos43v0XDws
Message-ID: <CAHp75VdY7W8EgOfKuxtTALj777aVatxV5dqsxm688JTy=iVW2Q@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: adt7316: replace sprintf() with sysfs_emit()
To: Shi Hao <i.shihao.999@gmail.com>
Cc: Michael.Hennerich@analog.com, lars@metafoo.de, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 12:16=E2=80=AFPM Shi Hao <i.shihao.999@gmail.com> w=
rote:
>
> Convert several sprintf() calls to sysfs_emit() in the
> sysfs show functions, as it is the preferred helper and
> prevents potential buffer overruns.
>
> No functional changes intended.

I briefly looked at it and see no issues,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
