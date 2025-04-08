Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4422AE5E;
	Tue,  8 Apr 2025 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127076; cv=none; b=lqHMfwKwsEHVZL9rBiepeLYikc2r6UBgU7FCA7G+NsP7tXvgZenleN2oZyhzKTJ6bT0Sjdc/ZpDPAVRZJAbz0NnXSpJk2P+Xe3ZQVw7hQvSoebA7YXbcpopXF115P69FesMEcq2lH2hyNm3+hPIjUwpTrx3cNN4xrTPBBgsUDw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127076; c=relaxed/simple;
	bh=K5G2ZwYExtfm1cVAQRkf9bRTo5tSCqqa0BaWlL4b0yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXCoPS0VRwGcek0uwnTi4nchk0FtzCLjJ2HTYudhxTAunfLNYJjgakc0jEQGnQ1JYF9QVeohytiw1I2tYSe+Z6d5V/0jW/3IwhtbRSsXz7stXjYwaivgfHxgZ4v4AhA7bI6mKiEhYsv39FMqC/wzgM+6cVCTnr8PjDDjQOAin8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm3D2ivk; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm3D2ivk"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5241abb9761so2500461e0c.1;
        Tue, 08 Apr 2025 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127073; x=1744731873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5G2ZwYExtfm1cVAQRkf9bRTo5tSCqqa0BaWlL4b0yM=;
        b=Mm3D2ivky620rBfZq05raqMGVwEzuoBmr1mqLaEdIDX96jWJl49Mq4ZYTBeCxX2LuH
         Y/zW8DZ9LljIMBZnx26RRIu8/47Y7CkVJgvYr9nG4QZypCOKqFPsGziCqSf/qBqdrVQm
         mwhj8K9GhDbjO3buxu6UPnf5tlqeYuqEQ9ofvLeqBBKnsGmkvnvWT/h0qjj3LdrjN6hy
         eBQmplm/xK4tx/0yEmk8WsoKJCFOUNRkjK43lrt5dOj/jROUoz/TZ1WEZTNy0FvBqWiw
         +fF5OeRo4rEwiI7WES96DuOQmtnhM4xV5VTTjkZHsJxUAQpmri/5EsUR2XkhODZun8XK
         TZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127073; x=1744731873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5G2ZwYExtfm1cVAQRkf9bRTo5tSCqqa0BaWlL4b0yM=;
        b=cWZl3Rg9DnWBY1pI1jHWlXkbJQo6CByUiUS4TaA+dspVHp1+GY6M0GR2uaeSxTBHqi
         GyD/7e0Okq5DJoVt5ROAny2aR11Ml5JmplCSoNBKJcMlKz9s398FI6kgTGraw+T9o7kZ
         u+hrGrA4Bl/pbGzuhk6kfcT38WDdyDdwPSCzAh+lmBRbrZjPCmw/duCPkoT6mze0eBgL
         jxxhFSIvSI1jjgrksS6avexgvWmHfe61lSJ4RnbsrhjZ7TJ+ugykuzeFpMdJjUbpC785
         q75jpRdFfe3rkb/xzfzG1iw26i+oBOww124jkBbmQ2C3Dwe/nQUh+Qo0p8ZlDXPW3Q32
         2ZVw==
X-Forwarded-Encrypted: i=1; AJvYcCVUqjdcxCxp9Oo1b9G7JbULz5tmjW0p0LskCBBVDcoKr7BMUZXrlahJ0ASeZA1N7kScrVDUHcG2kPtPxs27@lists.linux.dev
X-Gm-Message-State: AOJu0YxctGlHcOetQqXWhpRcSe5wdjhNts05a2sUCoXkhnKAXEMTCuyg
	GvzRCgC2IfDUQryoDsdzvp4s7lq8yec1oINRoCoYOZC40cqyIfiUmWwmXbBcLz9c5ADxGxnaEQr
	t4QZgzofPtwnI4atP2AwmSgC6c74=
X-Gm-Gg: ASbGncv9ToqGaL1eIE+likfTnDIYCmLYlXgA+L7JpjguXQxb5LQhoo4AST4ziVo0sKI
	RzKneBPsmS3DKxXbwYo27tqCe+/JBrLSEYQYqZhwkQlstVp6b4AjA4OYPOxbdzDERIQENQEpZqb
	yBtV4yJBEARkcWdHizTmfzpCIHVA==
X-Google-Smtp-Source: AGHT+IEOAhODFXCQCQCyky6pL+wFmfnADJsayHXZE3pW2I0MMTvuO6cpstPg2O9EQVXHQS/6scTNoBoqj0OUtwsn1mE=
X-Received: by 2002:a05:6122:1daa:b0:51f:3eee:89f2 with SMTP id
 71dfb90a1353d-52765c2973fmr10907463e0c.2.1744127073729; Tue, 08 Apr 2025
 08:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
 <c71ec1f13a2a5cc38a745314f134f6e7eb935227.1744117091.git.abrahamadekunle50@gmail.com>
 <Z_U2ohN4wbbOtepn@smile.fi.intel.com>
In-Reply-To: <Z_U2ohN4wbbOtepn@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 16:44:24 +0100
X-Gm-Features: ATxdqUHHI5EBrUMCMRukwAxv7kKLnF4ZevAVt444jh7qUnEHaPD1eIkis-CJSoA
Message-ID: <CADYq+fZFRF5SLLyfG12hUJLjNk+njWyC6H34S_warp61zYv8wQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 4:12=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Tue, Apr 08, 2025 at 01:31:42PM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
>
> power-of-2
>
> > the AND(&) works solely for power of 2 values.
>
> power-of-2
>
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you, Andy for your patience with me and guidance and the review.

I have sent the updated patch.

Adekunle.
