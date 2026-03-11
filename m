Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4F30E0DC
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198544; cv=none; b=QnpNDEmAew+5lgm7QtmACLm30GdSdKgKZIomsY30JzfWLx+ZnjfzzD0OvXNqzm4mR10eqtExlv6UMxqaK341zoPqQhzdVF1IrqeyaYlv7bav/Avhnr7OAEIDOJWhjND9gA+2PM3F/x8vVX1WfqeTXv0oVejRTedKj8zMGRic4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198544; c=relaxed/simple;
	bh=u/jNIUZhr41eDTrNMLH71SkHE+qL5MzQDQyDV9jlEA8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cjTCueumnc4UomgXz6e6GihX7434pzi/CAczVK7LWmI5iGuVrfg/4AScsL2y/YnkLNduHjbBgSM9Xrv3PpTZA4xiLRyLCGcI+uWTQw97ZN+ao5lSDOG81+bTSC2DWExvE9aJVZ/1ybqKKtvwWDpyxgPojvhddp9zQi+bgx2i5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb1INA7M; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb1INA7M"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64cb577e79cso14697930d50.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198542; x=1773803342; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/jNIUZhr41eDTrNMLH71SkHE+qL5MzQDQyDV9jlEA8=;
        b=fb1INA7MccHkXMZr1hREcMxD/dbyYgZ3911+coL/Dj7VoHGILAaLk5ToEdXEEMyvrJ
         73XrDDh0WKrEgmGlCx+2hzeozPsB0P8K0qxJqDKujcnEpLD1oL+BNKFm59u3Fg9j8ZtG
         H2eoBDkAaJzQqNCjzXvef6fJozB+o7JeAMYYEMuvIyk3P/dLida4agUL4jNGU76FkehW
         YC+PJqCjeWJpgRNpXyQjEhCoAEJKdihU/MhI/S//0QMrexaQoqoVo7LViEFfDkGehpp7
         8+mCmN38WGahNvu2sE8PnIm0Gy6gEZQJRP9U+2QhHJr2ArYk9AtXXQ1GFFbYIsef2moP
         gFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198542; x=1773803342;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/jNIUZhr41eDTrNMLH71SkHE+qL5MzQDQyDV9jlEA8=;
        b=gQ7EIrJKnqdZuK+LMWe1IXdVmdZGJCFpps7LptULydaFwR354edtazKRitqXROkKZk
         2gUQG0uX7O9eBq6GL7c72qkIziTk2Ag2U2rlBBc5eBOZLW5fS/hEjo340AgB7/eoT88+
         f2tL86KCIdMhANTBiAnq9P9GSARMifj4FJKxGyJn5WwP0ScOeVogLKFFUvm6pp/UDys/
         dNmLzLM1VeLYth2XXoHis1HEMb9Xdlnxc3II3O6KDV9LwLEFw3ZYiK8aCxN4NSo7osgv
         G2vEDcr53fB8GQYLutgG9tOhQ7D1y0Bz0QJMHhFvQP7ZmVCH3TN7iVJJzKC/xMivzKKG
         Lmbw==
X-Forwarded-Encrypted: i=1; AJvYcCVGavjmHMSmTfCnAWvstRqxE+trN9BD+8CT6pgrj1ItFzOF5u4/0JraREWlNwe1r6fdyXL0kzF+UvGirVOb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9hK4zOfCfbJVibZU1pe00rFFNI4ic0G7k2DpHYrj49Q2w7ilo
	9yWg+5aZqM9NYn8Nw8NCQWwKRyGkQBlodtSVGIggFlpU3u6rQY+iJLxa
X-Gm-Gg: ATEYQzxX7K9mJty/OK8K9hEvYEjiZSE0dRfAwgVi5HbjSv7gDqG7KvO5Bvab+U5Ogji
	TMMXScYn/MycDkAtgATgRlY8SqYo+VsU9RTjlkbsV7gcb7jr64E3XMa8b0nYsQxOFpefOlLjc3P
	3A+DfRlw5iqPyuG4gqFnMwczSsJ5SWsowbrzkiHpgaXIie1c/iCP54GmAfY3DVevGEB5Iw6TAj/
	iGy13rwWaDO0zSJiE8PC9WDft3heOgW3xYPe5yTwjJTbCtYhs4ENKN+xKOQUN17FnnUJrLb2U9M
	FDoeg224abY2Hj+oQ7Q1gNcudBW3vTocyiIBE8OCSCnkXxneWQ2m4XvWQUufBJfj41KsynOssMX
	95r7WrT5k/A1q5wLY5pV337nFZwzYS6N8hfakhXBGtfAUNaJi2zKmTiLY4d+kG5U8bmDQ7TCZZm
	r7jy50Bo1hF4+NBxK+OqMbe/TY8hjgc/E6J7AXk7tfrgqw6FPHxOV/gH3tP57thX9+I1Q+oM+Ge
	TjlcgFKHJAA1qG/YpwpjCiaknfMq5RnxaoTZTHeDLTIlJ7mqAi7XTYZSeNgkYtiYBJn+Q==
X-Received: by 2002:a05:690e:2558:b0:648:f57b:d07c with SMTP id 956f58d0204a3-64d657cb7b3mr609053d50.50.1773198542334;
        Tue, 10 Mar 2026 20:09:02 -0700 (PDT)
Received: from localhost ([2600:1005:b11d:678c:cdec:c045:5f40:fbfa])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d6515a2b4sm630188d50.22.2026.03.10.20.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 20:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 22:08:59 -0500
Message-Id: <DGZMF7K42X4O.109GY06JLBRFW@gmail.com>
Cc: <sakari.ailus@linux.intel.com>, <andy@kernel.org>,
 <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <mchehab@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310203646.8869-1-rayfraytech@gmail.com>
In-Reply-To: <20260310203646.8869-1-rayfraytech@gmail.com>

On Tue Mar 10, 2026 at 3:36 PM CDT, Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the atomisp driver to comply with kernel coding style.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

$ ./scripts/checkpatch.pl --strict -g HEAD
ERROR: trailing whitespace
#201: FILE: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.=
c:326:
+^Iif (idx =3D=3D IRQ_N_CHANNEL[IRQ0_ID]) $

Alway use "./scripts/checkpatch.pl --strict" before sending a patch off
to catch things like this.

Thanks,

ET
