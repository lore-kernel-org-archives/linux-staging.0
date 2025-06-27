Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79FA211A05;
	Fri, 27 Jun 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751006353; cv=none; b=nqvjNIP5GIazMmFLWaimzPiNckmiioHZm3OOTId1+xWSe0PIOx4IbOCEiSoqb0FneQekgs13SwhBmfjgQDeKq/1/ntW4v9RXkJZ7AUOTCAgM4fghQUbVvvNrBuaoVqeLHiyfVc5sq1cI5wZ3hXLLNyXfQ14pT1WWHbG35nlBr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751006353; c=relaxed/simple;
	bh=H9s6SjNj+RDHJHJdAu/dk43mt6UKRQE8bixPQovPJ7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spOgFJC0Ry+beNnnjIQKPJ39zHipFbZsA2M1+sHkqTCQ952BMZROs6ChK7/A/0juQedxAryzT151RRBBH5ZvVVaPlP52H7OFrO0SXLEhAx4XKpNLZWNm6AAx81049snaFb49IiVISPmxviICWEKDLdQMJ5J8fqHWc1efLU44xQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUM5NAQL; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUM5NAQL"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-712e7aceb0fso2675917b3.0;
        Thu, 26 Jun 2025 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751006350; x=1751611150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onir1NlpWyCI0dVQmmMsqkrXg02cy81P8SAAeEAoBLo=;
        b=cUM5NAQL4/64YJYUvEeSPN+qPTpmJ+nn7ngMNR+S7pUTgwQCIt/+fi5StKyOaGG1Z9
         VFCfQYDuR2Ul7bN9aR5BSPzJNYEWdwWG7wyIc/n7as7/jvhcjt/6fCyKI5PsCin9cxey
         TC4PfLNtNh5OeYFeAtWP6SwYcpEGi5ygF2hhzGCqccRnkqt9m6aiTjBxR2IOk0cQ+dhl
         FPZbCKUNa+ELEHW0/IDMC23PTJM/WKWREadzOlsO60ak74CjsCIXSn7IEPY/py5K1Gnm
         X44kZssfniWvojFEOy/KEG6ySIYA7WfoX2qCp/ia51BHY9AsEl1VYXDAaYnGYA5G9NKx
         NEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751006350; x=1751611150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onir1NlpWyCI0dVQmmMsqkrXg02cy81P8SAAeEAoBLo=;
        b=bh5GNfJEtbBg9yPmkL+8YvZXlWeRhBE+xX7IhhY1MXnF0DZ28V9AMdTdlQy5GgDmEH
         XjX7tje3xOG8oPcH3/WNwXmVTI8KlWZKvqFMePiJM3yGH1mckPg0iN5B2jcucPR0jusW
         X2lqkjFbujXXJH0FORpK5oAAGC+XcCZl9srM+PwCj6um91n5xEus/UB9Cb5d9xEvZ/yf
         VhvfqUzgzMZChkGyfafzXvDTKAllvGaGjowM/yHqeOSTjMM+8QdC0jDqSOusm7sdyrqO
         /4cWCExx051vfoC8iYV85+qgga6o8q5t72UGyZ1C20SLh+H1q3K6agHBtgMuPz06cSUV
         hT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2/SeP6I/N3ws1GgfF5kpIbc1KijI9bALzzvgPtXYiS44o943vpRJRxnOV3V7e4q6OOCVKsx/yZdC+1NXH8TH5t+eIBg==@lists.linux.dev, AJvYcCW6A9sFAc/7hYva28lHyIgtEcZJku/xHNGF20pxjaR2/AHmS3eSWKlQfzHxfuyHbnM8qlP6N5jd3lNoo+tvig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnYxh3VG3sKnB18yCc+8tIOfVF1krcqgJwMO4M9xSynmgS6ty5
	B4+mJ6Yr2pRouiXeJKHrCSIDb9NCcZNhwjuR2NLsh22krxuuP81wenHq8QdAwLMcwcmWdb2nxvW
	KJQoc5yEGUC8ekskLuVPIXDvdlDBhs3E=
X-Gm-Gg: ASbGncsSGqvgvsRmrR4tXSpT/sClXrgn0n1zXdKv7cRZkWxl/6Byw88RkMBYE8xT+CE
	uThZomOxv6pLYF2zj/tL7qMI5K6P4pqUCS/E/gl0kVTs1l2zqi87xNO152NKac9tx6hXuGLZfoI
	w+t+t/+6ky/OTlFKmpht5l/Ek5y0RCBkVb+hc9DMYqW6g=
X-Google-Smtp-Source: AGHT+IFLXLETAN2g0YLI/m+TdlWxRgsW7CKClEWk8SveKK4B+rK6hli1LycaO27zbXV6hVpgVFRcMcgj4wyLs3zsHjE=
X-Received: by 2002:a05:690c:6f0b:b0:70e:6261:f7f1 with SMTP id
 00721157ae682-715171c2777mr14644577b3.7.1751006350533; Thu, 26 Jun 2025
 23:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com> <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
In-Reply-To: <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Fri, 27 Jun 2025 09:38:59 +0300
X-Gm-Features: Ac12FXz9KhDNUrKyV-tQ6S9YDv9iqORA_TjYOWzlsoG6CfX-2Q5mIrypUCkMpx4
Message-ID: <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dan,

Thank you so much for your good words

On Fri, Jun 27, 2025 at 12:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Resend this patch with the changes Andy asked for and I'll Ack it.
On it , thanks.
>
> The other things we discussed can be done separately.  It's also fine
> to never do them.  I'm not your boss.  ;)
>
I think I will continue working on it. I'm very excited to contribute
to something as big as this .

> regards,
> dan carpenter
>
regards,
Abdelrahman Fekry
