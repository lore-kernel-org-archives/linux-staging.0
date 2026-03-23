Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71101FE44A
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273024; cv=pass; b=LelzSGZmKLjKX8Ant33UgiDyQ192lbgCOykmXoYwMP+3uSTKawnJ6iHKOFWzTkPY+6vp4Nfjv7mlrfx9UTZIN+32ULMh6aEjnB18V7+Zspte4mvG7nmVfdKabwtcQyYXljw2Ecmu2abKFbsIqkMljV1+0kKWDYtdXN18LsJZOVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273024; c=relaxed/simple;
	bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcIczgh48/IUW6Lr4P44pSyF0OqbWvByWMhmryVAoPV4jkxfNcaW37/GQ9yPuYU1y2rQW0CHtLkzijpYJBWVjRzblCh6YUpe6DBRLiK4GPCQec5qY3F10kLH4K1DWBwbNDz0jY2AQ3vBKun40tHoB9Fzi4TakKzg6UGKTObtapQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiVZEK+g; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiVZEK+g"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-667de793310so534410a12.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 06:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774273021; cv=none;
        d=google.com; s=arc-20240605;
        b=G+NZN+4GXVuSUdsSLZwRb47zaUsXY0gSzxVR2J+5GNKxWdYGlHxVsyL4DpaVxTJhmm
         TNs2lJl4a682R/cgWqCiJK43DlbR8QAX+5Md5bTZL7ZehhI4ZlxntvovRIB7itwWvkdY
         pwhxxaE6z/hzw8xc8XT6t2ErTC4Ro+BuF0kFXHwFhXWbnpoEu+xkr30MCYnIYmp4KTwR
         gj9NBcvFj9SYSeaJ+XscGgiMC9FHFwbIrAtBjtRTROSBt6KrYg1MuSYbNuajYoZU92Pl
         pwFRpkmWM3lky+IF7Q3JDkBrbonEAyfUqnK+gJqrQxBRm4f/hnzu91yBLJzLVq9eMs9+
         k+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
        fh=QBdW4CRWtX8Dq1H6RodKUemX1Nw/4VRAE/y9hkBlvrI=;
        b=GsH2Vwiela9fhF5keC0tLia/bwksyXoaDTRUnuKeCM1YbNCGoSKti0getifSK9Z37T
         OB4OplLa6nI3wVvRoUrUykoOWJaKtkm3fVrIp0Nw9CCgiifto26K956Z9PmT2xZA5z4G
         5uJ+9kQ9lh0M7RaZvcpqNxtXu7c3tsyCRK7YnZasSTFAywXC0kZ/0etpH8YXge7q+P1I
         Fmrz6fJzXZQYjpdsPBGv1IDpTP9IkarF3krAIseHGM0PTxLkUEGiOJgesxK9dIu+KojC
         n81FmMhIOCGlcIuAYsm0zsyWOYAbcaT3zsXJGGLq/5U6MdQgRJno/awTu3FnQadAIXYv
         Lrrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273021; x=1774877821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
        b=YiVZEK+gGx9HDVas5kaDr8cs7ZETbI1ou7D1v3yzWdN9EsyFD38Cs6iZ1eizC1JMpi
         8zgE+JHHdMHWmCdpknF1QJMUqJvWg6CcbnJezRBVZLXiqHahoa4hKRIQRlzv0rHl/l82
         4jGgwwbEhBnWG7x4CQOPTA7dthgvJOlBT/kGWuQNfX3gdJ5BDoASw31gUSi2vGxp4MLU
         GU16PygjWkicWO5X+blGwMykuq2VIGS7ZnhWi0r8sG2lGv480NEwOES3q+nDpNcm+8H/
         WoC7KNvd5kEbYYN22mkDIt8xwuLUZ8D3y2xGT8Jo8fsxT3s4lkTK+EuHuGKhGJbGOHPb
         yGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273021; x=1774877821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/G6oVkXvhHmwEyhL18Nw3vuTBba+ZEuChKrvgwSjlNY=;
        b=gk1DRpUXfzyTCbjWiHZatzq/VhAURI9lZJTkA9RvHhdkQ9c/vuW92cPs0r+OjJJ6qV
         J29L1on8uC05RiBuwNR8jLdSKhq2SiyDrHHk9mjJEpAQ62LfFgKuD333QP5S3r63Pkjr
         a+CFIY5tb6kKfmKLAr6cyEiAkDQ73rnzeWPnvTBtXfUXcBYR6tIjLS+QW7fLEXZEWkV8
         aDvZZ2ctg2fzIKB979wvCsVt5+li4U2UtvyebrR/86hy+J0UapCqCNoG/PEvpjK0aJhU
         o+hQIQpTid671wj3cmZxmKRjbsCu4VK26SNHb9+8M9JOvm5Ic/L5mAMYMDjCj6RTnXOF
         o1dA==
X-Forwarded-Encrypted: i=1; AJvYcCXB5KrTNP8vFdqWcD3m+KuP6pAYClwKYff2ZVFcls8l4oRZN8wwcoKaBPxz1rkn/mfCH7uOC2CjMhYPg/LW@lists.linux.dev
X-Gm-Message-State: AOJu0YyUZt5Ga+oseqlfTk5JRLQrNPt9iLg/fSYzIWjJ8AEsKo/EcvIm
	JcZciqXKYma9xVzM8zCcI/CTOzFQd3uSqiO3AJWchkz5DZPVLq43YNpRWz37keN+Fie/V+tV/Fz
	OrfNX6GdpfB/GZq7ObRex2o4yg+sHMCdic/ByVQ==
X-Gm-Gg: ATEYQzypFshmyt4/lAOYL8tjvL2SfhX7l1n4wnoz+R//AR0ot/Ml4NPWVFXWIA9hVpJ
	3Bspr55bMFQtmaEafiKYH7dmVo62GXxWpuWfF7dq8tYEAFWuIXUO3okz8DM38XolcfKAW2qj8la
	xq9gxejG7AGJCo6apqEHt1ypGtidv9SOE/V2NmPiLS5tPTB/53DSkSb9CRlHhbYDFb56fSy0frN
	Aebb6RmAiXRORg++VJGKQoNdtt8nJiIAE8cabqzELOq2X+VEYKrf0WaYyOFyqVo4TAggi1zMRWG
	WQQV8JYFg5ISbDhhITZyL6/25VQKLWkbpDvv+QiMtadbQ9wxpQ==
X-Received: by 2002:a17:907:3f98:b0:b98:4b5e:da5e with SMTP id
 a640c23a62f3a-b984b5efa8bmr621165866b.43.1774273020740; Mon, 23 Mar 2026
 06:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322142506.42022-1-med08elkadiri@gmail.com> <acEPK6l3_gFQEuFj@ashevche-desk.local>
In-Reply-To: <acEPK6l3_gFQEuFj@ashevche-desk.local>
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Date: Mon, 23 Mar 2026 14:36:49 +0100
X-Gm-Features: AQROBzBtvGecoHnJqvMLYEjNSPvW9HPpt7WoD5i1UZyFuty2-6oqopHNZttB8cQ
Message-ID: <CAAMeuQTKwjVr5fKTkgbXibwdzToxjLUqLaTNKDZjQbuVK0wvEA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: fix spelling mistake
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:00=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Is this the only typo in the entire driver?
> Please, run `codespell` against the driver.

Hello Andy,
Thank you for reviewing my patch and for pointing out the need to run
codespell on the entire driver.
I=E2=80=99ll follow your advice, check the entire atomisp driver, and send =
an
updated version with the corrections.
I appreciate your guidance and time.

--
Best regards,
Mohammed EL Kadiri
