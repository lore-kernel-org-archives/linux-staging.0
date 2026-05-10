Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88B225A38
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 02:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778379177; cv=pass; b=hKSq7VQuUkDgByZSRIoclSf3koOVA7k7f1GZpZtKupHSE4IsnVDTK/UQwQSQsHuQYH/E2dQYPhZ4vJuqpyvMKNlWLCi/NGF/vFgTsiXeTckPLNyCzAYXNb4QCupD5C7fq4J1D1dYohUtDANUej5TVtkPo8vEr5gaWeLIHdGQdQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778379177; c=relaxed/simple;
	bh=3jDb3mTNEpyjHA6WW23n78bjF4KkyuBGc/FTG5xMqgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKcTIpX8c0whyT8l5yARe7AYJP1yN674ob5CrGIEHkNm91bGk86h7X2Tkqo+K7nEuVA4c5zLkXcBehDrHTLXgxVL6UOHYKjRsjQmbcf+Aq7X7PTUlFdSKEzRMSQFC32RXSWiMdJZYRHoCgnQIUkAIdHOYuT1sPiR0YnRgs5RL2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npb9Ls/L; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npb9Ls/L"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7c0dea734b8so6534407b3.3
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 19:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778379175; cv=none;
        d=google.com; s=arc-20240605;
        b=eyqMWEqL6ZBFUDJ2R8nWM7m/RGQ4OpzX82i5SOSOQShAdXKppdwqpoxL++Y7nhYXcZ
         HfEoVQKr9RtfGWYeqrRBn0hQTPvVIY8dUZ8zpBV0fyXEQt4EfZUx5jONeix3xw74GnU7
         TMbaKZzzXeZKqur367FAtlHc27Lt9EPj6rQtzNBuPmzSsOCymZMupAA9h8D7Bs/wBvfD
         rV74iSZ+i7OWUKoaoK12y8qGXLbq7czwow7Q7x2ZeQdxopwviXnJa5EoGKcC3ImtGcKx
         XA0AxDuNF2lKlryiIcaTIYsaaL4ipdZwTucIGxalH0WjyA8xJc9ucU6F1zwZXm8w08EA
         W5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3jDb3mTNEpyjHA6WW23n78bjF4KkyuBGc/FTG5xMqgU=;
        fh=Rvmyc7vVtLIZCHZdbyS8hCMB3HHvWqELfwco5cvpXIc=;
        b=FdGVj7mKPVBU2DmFxHfZj5gRZtVJwWJboTMrccsw2wmfXaK2f/31VnZOX9VUxGwHFh
         aEuOiSkgxkqkOAdph8RJKSz1VElNqSbd59dKL5RGLzsshrhQWjs495BQ/8BxBuVTLS9+
         iPXLCf4B6m+ANCRlltqM0PrRWOOzd5P0rzoANpE9H9YQTG7Fmn1aI0O+WnJCiPHWJ8Ft
         ftqc5BiSxK6UndQhmmiAO1Vp3QBlzwifEm3TlqOhfz6Gzow4F5VrNfzC5ODHw1IVX0N8
         uk1ivOcycJb+wdYt9OrmjO1ANqhDLGZGEKocZdbrGuFgSPLdfHU3RKvD0KyeKHs4UKOm
         fgTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778379175; x=1778983975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jDb3mTNEpyjHA6WW23n78bjF4KkyuBGc/FTG5xMqgU=;
        b=npb9Ls/LxX0HvXC2DQ3CdVK0Y82WHp4Q0Lsws8K4bQG2A0JFWsO1uXXJUeahrszHIM
         HD/P9uPlstFtUoKBfAWOYmBh11+WVOMqr94oIAXp8GZcg8pUBCF0ftbr1pFWDNb+JflT
         JeSXirEbEbDh3WaOoGrgRsfHKw1Ft0lIOvWCIYJucOvfoSZEayroiDMOy4esJWX0RwZE
         xIxMQH+vXsQbpLotpf/CWz3VlvJ2h4BZIQPiHO6PnUHHKsBas+kJqbOTK5recXbxKd8G
         5HUiIlXBfdSFkyWhygVb/a2Z01lVxRFce+ox7kw42OPIFdK/1D2zegE4G3Z2W0EBG1pa
         dlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778379175; x=1778983975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3jDb3mTNEpyjHA6WW23n78bjF4KkyuBGc/FTG5xMqgU=;
        b=hTSLsDV24PIzTd5VVU+IMUAjfel6zQxqq/cuSDS2XzANTF0DRRUvq2dYgWJGY7qaBS
         5ESrDicS5GIm43hvCqLpwnDJM4e2B2wlQYciwYsP03cLI2u3wRd2CXpwEy8RYoTQC5GB
         N5QVeEt9dl+vy5pkeR38I9yYDPUa3VOGKf0LPkfKpFOmt8w8JMYdMyvKGWDZ8Wq4tyqe
         gcnM6++eRZh+FrYF8MD+mHopBoQFjdgq5w+r19OL59myR/Q9ry+CaupkkCXtfTAvJ/vp
         qQXWwx0nUNkx+Olph+E3k7WNshRk+E8p308UhsxuTx8axzChnuMXSn0/KWo4oqHbuLF1
         BaKg==
X-Forwarded-Encrypted: i=1; AFNElJ8HQEv3JMpXGIwI70+Z3GGOZlwu/+On8CTuG+Iy0P/cKjCTnXGSAzzrRvDjXc6G/sWuQqk8Qt+5/qwIIyqZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxch4vZPl82W+iB5PrMKHx0O3vejItaYe1p2BTVVLrg3yCXE9ZX
	doApEUhNIq2h4FUUyaEOUSvQstmQA/8Syrm22jMozrQj2mq8EOFeO0rG93YEToRIr1X2M/yT/By
	qSIii39ElaVZPOrATDmRgrSLQ/Lj6zF8=
X-Gm-Gg: Acq92OE4igGC/yKet0S95/0ujskTXQDsnqsd1BiLev0R1eRTG709pwmQqEDz0ihBh9j
	hT1MZLswAFa/tN3DaBN2fI48LHi1AirA95ppmbasRu195Qv6O99LN7wD+IVNcVjm4oa4HasOdeH
	Fz6bvW2HvoWz0vCCvUG2vPZb/beMozxYhhviM1SrW6gQIYEZ1nUEjkIPwLyktXt77VdDhDua6xE
	/6yxBBt/bDKWNCKnnJ/09c/E3eeubK485lOLjUbAgfhA8tFmwK0LavldmSVfy8RznQKKuvENWzq
	/txS
X-Received: by 2002:a05:690c:9d:b0:7bd:a6ea:c4f0 with SMTP id
 00721157ae682-7bdf5d9900fmr201868697b3.1.1778379175389; Sat, 09 May 2026
 19:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509090320.85481-1-dennylin0707@gmail.com>
 <CAKqfh0F+rAqAwdu=BtagPa2D-F-TANm8Tx3RCOoLyZXkYAn2pg@mail.gmail.com> <CAGEkeHcqG2_c7Ls_=ZMkKfR_MpSNiuRO5d159oWfuN_A6qNEoA@mail.gmail.com>
In-Reply-To: <CAGEkeHcqG2_c7Ls_=ZMkKfR_MpSNiuRO5d159oWfuN_A6qNEoA@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sat, 9 May 2026 21:12:44 -0500
X-Gm-Features: AVHnY4LMH6WvX4zqy0BvUavMS7RDKEzSzDKDYvu3-Nxe1FV8HgIar59z8ZP1SfY
Message-ID: <CAKqfh0G+vLjOHhpVi_CC_eWmEfw26ZW71ptRA1WKAhmY9HJJJA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: check SPI write errors
 in probe
To: Denny Lin <dennylin0707@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 9:00=E2=80=AFPM Denny Lin <dennylin0707@gmail.com> w=
rote:
>
> Hi Nuno, Maxwell,
>
> Thanks for the feedback.
>
> I agree that just warning is not very useful, and we should bail out on
> errors if we check them. However, I currently cannot test the failure
> case and I'm not sure how the device behaves if the switching sequence
> is interrupted.
>
> I've reached out to Analog Devices to clarify this. For now, I think it's
> safer not to change the behavior until we have confirmation.
>
> I'll follow up once I have more information.
>
> Thanks,
> Hungyu
>

Two things. One, please don't top-post, and two, from what I've heard
the switching sequence tends to be very error-prone since (I think)
we're essentially spamming the bus with spi data while we're still in
i2c mode, so we may want to ignore error codes anyways. Just a
heads-up.

best regards,
max
