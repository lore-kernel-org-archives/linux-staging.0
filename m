Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42011A5B8B;
	Thu,  3 Apr 2025 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743723134; cv=none; b=E3lzTOHvvbZQDW1R5i54wSA5A00vMRpKfOHyQRPwLLuCVORFxcZkLBSxkjdVLk7wu2ubRa3rXyBjmCILu9/v72CtXvj8lY08luFyauxFMWAcq8N6gU9MlDPHgbGXaibl+ptuQ0k+VNbB7eQX4bXSwwhZPZh7Qid32yBGjss/hTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743723134; c=relaxed/simple;
	bh=ConqJ9yxOfg51AtX2KXDQrRifAARBrdGYo8uEJMersE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRBEYa0j/vA1BNqRmpuCb/kYQrTWvd2KYsa9IN2eGVB7AQ0TEpC1dqnLE/8Zc/icZcQRFovFE7rN8S1ehvgcyVXjz+bcyc+6AIRQIGdVV9gzoUbpG2U3QOczs72vwhORJlHRKbEsjmShJdEj0DMKyNJ6bQnKJsoSbZBLrCB/43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq7RdEJN; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq7RdEJN"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-525b44b7720so707577e0c.0;
        Thu, 03 Apr 2025 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743723131; x=1744327931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ConqJ9yxOfg51AtX2KXDQrRifAARBrdGYo8uEJMersE=;
        b=Bq7RdEJNoKs96aPjdpFIoXYcU9/hn4xpCoYes3Z5thMD7F6lVg4Ra3TgHhJECzTjU5
         ++0dm3eEylnqiFnbCwqkr+KtUfpU/YlaJlbaR5MEVRlyuSWUYJJ7MfSxT5+RBTiD7H8T
         MF4UYMsYY3QyTwfIM3DHRIVHL+lOOYMnNDN79sc7QnL8aiPeyrncbE3q92G46K2JpZ8D
         SRv0CURHtAuwflpxgeYncYqmQRZ9Ndn856syKuDulcI7ZXqH7cdT8QWBUXjDd0V5gPcv
         RJkJ1DQMF34GoMHEu22gsGviXb/5xQJFlhIgwa8VkrMlDHuYBFSsaNruuI+lSIyatzef
         OqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743723131; x=1744327931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ConqJ9yxOfg51AtX2KXDQrRifAARBrdGYo8uEJMersE=;
        b=WtHAiqRx2PiX9IIe/mJvOF/nXyQNFp5S9A6dpXHImgUokQyczRpDYUzTjYCj2Sf76k
         E30j1P36fEz9WMS2ZiQ87u0tP+224w+0AzYU4qKb0XzplqCOwz9Uq17mCbGdPWzRv3Dl
         EOegaDlOSoDifoOt3o5ZW4pW1rLbTcX7/38SfyDH77lgJDRB9tBzvuWRWSkDt15aebZa
         eFWuPEIW2KNw0JcpKJH97hfwybK+XlOYzqQqY4tJJDiBUgc5r69AbCKXt0En/IHAUyma
         DYuvXyqlIpgxPSRVH/3+zCnPHyRVQx7etzxYyGjuK3+ly3UryvUSvfpHD1963LEUfL1R
         8DWg==
X-Forwarded-Encrypted: i=1; AJvYcCX5LDBc0maJsZXN2Z0axIPPqHy5mUumWZNgXrXmf2W4Qg8+8NcAoF8BVk044wiNnsFpxXO/weX51Lndxw3t@lists.linux.dev
X-Gm-Message-State: AOJu0YwVyrydeHkolJDzPkigVLA98QStk5nKKdnsacTeWi669ajuV5nr
	i6joDWWeahVA60vFGYF9NBj1vv1DoW+k6d4Etsyi537fjUFoaDN7c40fS2gPLF0EdW8axTyJov1
	1uRm6b+pZ+rbuDe3riugm+xhaYws=
X-Gm-Gg: ASbGncsTab+3OtTzktatCGCmszydWhtuCfON45mUWTrnCLZfrkgMsFxYEbB/CJt5YQ9
	+9Ai6qURgFPSQFiQOI14kcqo5ur4rREmaW0VT4FQqWGbt99cKLwBtUHYkILyVMUcyBmAazpzC5e
	WqxjGBfKXJY/TOrQX2ydiQHNyNYTQ=
X-Google-Smtp-Source: AGHT+IHG8yvd4/Gvzr9bsPGoHBMSRP7NVpPpyONIrTuFi15RTw1YFf2XgcnaKkTPRoWR1r0MApg+ICHPmv4tFtGyyWI=
X-Received: by 2002:a05:6122:8c01:b0:523:7316:7f31 with SMTP id
 71dfb90a1353d-52764494388mr1303595e0c.5.1743723131626; Thu, 03 Apr 2025
 16:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
 <Z-6Nwp5RUdgYt55B@smile.fi.intel.com>
In-Reply-To: <Z-6Nwp5RUdgYt55B@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 00:32:01 +0100
X-Gm-Features: ATxdqUEbWVQJ00lu3HouPrhS-aMc9BZOWnPJCkk8kpjTlk_IjSIFvDUvpW1tCTw
Message-ID: <CADYq+fa4FxmiynHg7BJRCusr3V-GqofEEddzP9Zzg1muPXGdqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:31=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Thu, Apr 03, 2025 at 02:26:41PM +0100, Abraham Samuel Adekunle wrote:
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle
>
> Missing period. And Subject should be as simple as
>
> "media: atomisp: Remove ..."
>
> ...
>
> Please, send this patch separately from the others.
>
> --
Thank you very much for your review
Unfortunately I have been told I cannot work on the media driver as an
outreachy applicant.
I do appreciate your apparent reviews.
I will Cc your email when I apply your review to my rtl8723bs driver
patch of the patchset.
Thanks

Adekunle
