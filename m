Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC422068D
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 17:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914279; cv=pass; b=JF7oHK6JKIEThar3sIWAXVia5uo+o5e2Vqt5zRuT08Bm5a6d2RH4Jhb9VpGpUiKnxOV+bCDk3eGnqAB8/WQfxtFMo/hRN8t6lVWf1fYymegoErlvYUybWUVb/P9J5znC/nDWV1G+YSJqYjeRX0GxhgHwvsp33GGH2aL0zZPU2cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914279; c=relaxed/simple;
	bh=1B6oGlTtzRvP/n5nvn9v6mIZKQ4jQNjE27WqL7Za6ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZgmUCCX93+7OHG6Y8ivO0UIT3pJI7pEosiylXEJNA9mpR2VZqLq9MR/uD/shj0CfCvqFfn8GlYLrCLV+YjGIHlsaaHNQRrpSsBRW7zs0lw1aphYnFcxLAvi4LV7UlI8HsUjCjjviwY6TxqTQVSc/JZiLL/B0/Yvz55geUVXHJkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HelLqsgM; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HelLqsgM"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c1161232dso285951c88.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 10:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777914278; cv=none;
        d=google.com; s=arc-20240605;
        b=K6IKD6KqY1r7rHAKldVeWX1GiIDhkQUKu+nzLDLsI+wtD6Py4ZbPjqOf7ACWrhMyoA
         lsKp4DdIn1M2xR/30r6VCc+GZxeufFKniY2JsapoLCAbOU2dBZwqjBTsGCKBjpSqWcAZ
         bwNqxnSKl85/L/97utBd+0LfxP7IaY8b2Eg2M6SzptkmHnq4WgsZV0Run7AjoWm+H1MZ
         GAP7vCMWyj3wGFp/PQ6Lz5QBqR2N+3e3OqWZEPaD+gBw4JeKeK6MAKFDQQ5iB081pIpz
         6Oh8DmCvCaTrA6ZdOMAWImSLJXfUSZD663ZFKrYHo36ERjyVs+SmciPTB6XbXTjfW08r
         LC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rERfG4yN7TQvy/21xSO+cz7wynpWbXMX5MJUJ76hvPo=;
        fh=mto8jhwOUTv/C4JQNWC6DUkCcLPYfbY/5cjLSdFHowk=;
        b=KmjLUUKCnvK27AcRE1CiJq3qd6VNVyDzooLjcbs0RqVOcddUOaOesY6R8jm0riETpL
         3wctZD6+VAqzRBUXKQJ1tSdSFC0/BU6pPq5HJPq+N3rUNAM0iv4cQAgiLwRrka8XPjeH
         fzWC++9tVtAmjg8m5xR2coY+Z5Qo52du6H/dkbLxBCyVZ3GCqXnrlbCUvJs0P4N7XuQN
         cAnBNy36nIygnTM35RggZYzyvnzxApSFsivH2t6V+CULFjSJzJlnDenavHKrwSTJp6sE
         qSozd0glcro3KaVWuOKktYog74qTbdIcaRcbj5fNj7xgZqh//hQjlLZT/3UgMHHz9meQ
         QxhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914278; x=1778519078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rERfG4yN7TQvy/21xSO+cz7wynpWbXMX5MJUJ76hvPo=;
        b=HelLqsgMymZfJN5MQ6ma5snX4ZnGk8XCYnRg7Vh7w/28InfLN0+iRHLots5u08zF9d
         VQdZbNR0V+qFn/fMeVWTXmXiLi9OouEPveVylPZKHEvhlZ8F/hsZtxbTsYa7NMZJuUFj
         UVi/MqPMfqA5vjmgL7lSc4joFm/8tb7wztftMNLJB76k7gLBNx1Fz0YJxe6XgnmArhK2
         oIN/yDNXXv88J3ur/wUzGk5VpkMuM5jnSPJJVjvDSP3yKa+Jv68SlIvjOTAaxHRd1uqj
         MsU7m51IA0wCS98632HKeIdicD09eGXeS3oHzS8QvEO/+CRQviz+2p4eafVAEqgTJlA3
         LSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914278; x=1778519078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rERfG4yN7TQvy/21xSO+cz7wynpWbXMX5MJUJ76hvPo=;
        b=OR7vwxDH6/s+NZeS1lQ1ibfgB36AhUD9hlzHoHJjFAhrlw0vwr3lsutBGm+7HT/LBb
         M9ujwXFWIuPAkA+ADj+jncXm+i3KX6sLJy9SmIW88LdW7IH1eYH3VHjEkwWPwbgzwv97
         Y795LVQQ4Qa/Rthlw3APPf/nbdQeL20HnMqDM791jplgbAO6Hqj8M4oAg1TTHJOfa+xc
         HyJ+pRnXBA2BFAosOYN1WV3EL0JqfOLoDldSTzyztRixwAzdkrAiZrVrUYNvUD02MPXh
         7aSlpQ8C7PIklfaQ4nio9g+ZPMpgSiVpaGm9jk426rBuv86UI0XNHYkfe0JFg8aQTl33
         vYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xOOAY3Y+ysMRUZwHqDuI4SYsAzYkC+spM61ZBld5XVy0B/1L2Qfacf3Hy3h6AJ8d4YiuZHMl4aPZOesme@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9bpzxRY5O+eSSMQCU3+wlqq0hjy1sulzgWMKM01pecmNlEgku
	i+AeHQr5JHrDwbLptOHwOfBrJvBgKDSMYkA6/6Jgoey+1HVEkjQs5HvlMwUIxSSxFHmUfKvJS7d
	hztZ7KLqD/aqPptcc/o2dWIHFz9/8ank=
X-Gm-Gg: AeBDieuiwoHNOqMzXGWbbpUpVI5z7eDuDfuxTJlstpxMbzBoejY1Xo8AsIfOIXkOl5M
	smqmqYCx35Rkzj1S4llEi5MbNfTZJxCDADj2RDmiDlFHl6D1gXvjPINuX078GlAwP8yf2+BKR73
	phflK9mDuoN6Qjyg6D6xqiHjYexm5pmQN44HZTcI32oiS2XZzAuTiZRm/I3oH6iQ5kASe/pumHD
	6XbgpmZPxmQgbPj2ap0s5B24zpzKK5pOWRr3uA+qCCnVpqLRrK3dvVKDB4KzD3G2414J+UJOxg2
	qGtarcY2FtHpNtLr5+IFH/KPi8Gjct8o26R2Q6DDT8USRzwxzMeC5Y+MF+qYhWfCTTFHJwwPsdS
	bIerbIL86geC3DAMGhh4lb6LtKORXW/FsRy5E4Q==
X-Received: by 2002:a05:7022:ef0c:b0:130:8ed9:2027 with SMTP id
 a92af1059eb24-1308ed92079mr665684c88.0.1777914277735; Mon, 04 May 2026
 10:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
 <20260427151556.91153-3-ayushmukkanwar@gmail.com> <2026050441-vessel-goldmine-2bb6@gregkh>
In-Reply-To: <2026050441-vessel-goldmine-2bb6@gregkh>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Mon, 4 May 2026 22:34:23 +0530
X-Gm-Features: AVHnY4KCJDtiwn4AnLxSUS2fNJ4c_Ep9Se4J6RRFofzm_AzjcWgtDf6YYMwnkdY
Message-ID: <CABJ81bj2OtVPDV15_qLnTHyKmDPqGJG8QKGNRSGUkJbu=7g=0Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] staging: octeon: replace pr_warn with dev_warn in
 fill path
To: Greg KH <gregkh@linuxfoundation.org>
Cc: error27@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 8:26=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Apr 27, 2026 at 08:45:53PM +0530, Ayush Mukkanwar wrote:
> > Replace pr_warn() with dev_warn() in cvm_oct_fill_hw_memory() to
> > include device information in log messages.
> >
> > To make the device pointer accessible from the workqueue callback,
> > introduce struct octeon_ethernet_platform to hold both a struct
> > device pointer and the delayed_work. This replaces the static global
> > cvm_oct_rx_refill_work. The struct is allocated with devm_kzalloc()
> > in probe() and stored via platform_set_drvdata(). The worker
> > retrieves it using container_of().
> >
> > Add a struct device pointer to oct_rx_group and thread it through
> > cvm_oct_rx_initialize() to support the NAPI poll refill path.
>
> Why isn't this the platform device?  And why isn't this data just part
> of the platform device's data anyway?  Why is it a separate "thing"?
>
> thanks,
>
> greg k-h

Hi Greg,

Thank you for the review.

The changes you're pointing out were in the later patches of the v5 series.
My mistake was splitting them across patches rather than doing it
correctly from the start, which left an inconsistent intermediate
state.

I've reworked the series so that struct platform_device is passed
from the first patch, and oct_rx_group is placed inside
octeon_ethernet_platform in the same patch that introduces it.

Will send v6 shortly.

Thanks,
Ayush
