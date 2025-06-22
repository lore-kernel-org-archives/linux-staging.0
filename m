Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658283B280;
	Sun, 22 Jun 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624773; cv=none; b=oc9EoOKsyiQBPcrWyN7sivZOuMH9SWS4JthaN47S59P8rYrglYzzxK5zznAPJuVPCq/oKoIiO+nYfVpb/5bE82pj4uEPjxGYWr5JaRXg0kpSkWnlTitX5HaWBncGXM5iWYdSj8yThIuw3YcohVSXx576rzXyb00G2HuaSgd4lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624773; c=relaxed/simple;
	bh=N6guHtyGMULMEJD0DmeqXfTFFtMsmAZzCxdt3JROOYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEOosJdIJAgC6l9BNM2gMAl1ZjXruAvsXwgHLVrRPbo9ArizJxqvmiMIIBVNG3WQCsJwMD1rfn4jRngmPJWckcGYK2Ividm3lTOdl/wbwvN0r2Ae0LiIT34gNl0wEiEKbny920h6ZrrbxbrhImR5710Q8qHrUZ9VVVUGjBaZiSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un9nKTP8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un9nKTP8"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade76b8356cso592481766b.2;
        Sun, 22 Jun 2025 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624770; x=1751229570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSQmRB6rd2h8MVTx7uEJn3zEtDJCTLtNHMbRBxoBn+U=;
        b=Un9nKTP8l5QRCNG0P3eRB0v23ukNgmEtXtPW+oAaiAsH4hRb2Ya57kcd3cdth1FTZL
         iejIFD//rY/Yp4sJFhD7d+EGuY9tmvOXDUax3lqPFyXGughgVHck8a5DFfePruq1jL21
         a6lSWNK57P/+nMgQZdgbq9Dcwv1dFhRDFjlefnfIsAukQhq3UptpzRogdwkYN6hM80of
         mIxsQvZza6yp8RHjpXvpGlGq1ICWDjJeI6SjrSbbkXb4a9W3et9yb4UIJBM5tec95blt
         WL7iZFcQPAlbYV38FRjpuVUyQ2aHvTcdbIcFhWYTcNh/w0fiZc0X38Fp5zbg2Yh5rFli
         o1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624770; x=1751229570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSQmRB6rd2h8MVTx7uEJn3zEtDJCTLtNHMbRBxoBn+U=;
        b=avqH6iRI9B3vDuA2qPf2MK6DiE3zheJZn5RfJMvwr0C6tG3lep3RN8EjbS8LJOa/O+
         4oskZl7tlmox/Oa3XfuQbNpzGse+vOjIYbY00wh0yEaDzsg2y4cPrhZLIrQldyGsiAyK
         hL8GJ2ikW6Jzt67SoIMZTreSHImHQYE5U7PlBjf23QHNTTQ01u8SaGAM8OrHZ+UGLBXq
         r05j7YKslLhf37EJIhOJwLgcdG9ETLiw/OcTqEr+GH9xxuiYV+iHDrORXGTnQ5d1NnHR
         GgWOqyXS/hE1sZovBsLBkdjK4TTdSXywGf801PoTgjF65aZuCHNcpJDLvQKjN9hsylCK
         /6pA==
X-Forwarded-Encrypted: i=1; AJvYcCVeiKQDTaIXWX07zPkB39ni860FAm/tlkfpN/AOljDOrU6bvzIsr4Mq4jN9jcR5uahmPKCjmT7aX8DyRneulLVsqEUTXw==@lists.linux.dev, AJvYcCXugEbRrn8nmQZx2qSt4ynMwDE/QtYhlGJgRsA1Yi6Cy4bxvfdfgr6XD/3foQP282gx/siXhCmiMaVBZKSH3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEUomFT4P2emzp6oQ9TRPmqFb3Vl3pUrdOJV7u+VJL+4DuR3qG
	yWvtPmT2hLqz9INmbwVosaUg7gWIvvD1rMf4b/5IL/+qHlY6B/cQ+9YrU4bs7LghlWc+5wVRI8q
	g8lqh15GNZo1Z/2DPEtNu7uiloprixYYPvIvo0XY=
X-Gm-Gg: ASbGncv8BcA1w0P8geFcUjyrfQLT6V0YUjXZTeLvYY/oBNe8RyaTyrISMM/PuNeOXDA
	lc2x4j3cgx9QRqyFCgRVoy1OzBiLVwh8aEDrqTFuFDzGKqhqtdOwMNCukyM7cnLJj5YW0SlXazc
	8DX6cLfJXLHMVr8M7CO7VE0nKZ6rD7tz7MP1wDDBmfHazTlvFt8/VitA==
X-Google-Smtp-Source: AGHT+IE5Og/WZWlEkV1UzETWK6WHUVp7h5VoEVNPzXLtExpnzD5jPbsGBhn4lHPKUW0pDk/8U4CEsAuh7LKSEOmRoz8=
X-Received: by 2002:a17:906:f5a9:b0:ad8:a935:b905 with SMTP id
 a640c23a62f3a-ae057d7a6b1mr795786866b.22.1750624769749; Sun, 22 Jun 2025
 13:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com> <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
In-Reply-To: <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:38:53 +0300
X-Gm-Features: AX0GCFvAarN_hJUIGnkkqkGeTc0xTTJwApkpFWobyp93oaVzvKfSCAh2aYpZQSE
Message-ID: <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:

...

> > +       /* Changing to sysfs_emit changes the behaviour if failed*/
>
> This comment, besides missing the space, is useless here. You need to
> use the comment block for the proposed change.

Also the text of the comment is a noise. You need to explain better
what's going on here.

--=20
With Best Regards,
Andy Shevchenko
