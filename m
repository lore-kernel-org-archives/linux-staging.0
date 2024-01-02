Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CBC36A
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz+K97Q8"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7813c90e61aso458766185a.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155198; x=1704759998; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHK+weecdtd0rznwJpxGMuBeQUXVbXrx5Dnm7/ILwvY=;
        b=Oz+K97Q8gAuS+3i657hfKEB7HkfIxNOxM5q3DENCHjcjr9mT8S6FyRQCgAE/0i+ZfB
         7Dbjxvc6UJ6hAgwdqCZ+CmylzDPZ7cYsawByH1Bf4d3dXcZIxB3yoqygtzweb02yIKdC
         B1jt4ysRxesVoxBFxwooOxP2CqRZUQIhk8kEU253Gb6TpZKt+pmjsm8epqKIUY9YKCQD
         4iVzzoNBEbAYCGxyF57Hg8GOdT9RJuFnaOk7zqS9fkOQ0HxFTqn00pR2szvEQeWaaqxX
         LrHslGkT5X3F+CwDDl7+QZ8GbyzOQwyCFODR+CWwTtLyO7GvFkSqPEMZbmhDwAPjMWqM
         m7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155198; x=1704759998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHK+weecdtd0rznwJpxGMuBeQUXVbXrx5Dnm7/ILwvY=;
        b=Yr41w28fgI3ePhToa6p+SQ+R9AsisfLsXLIqOyzbZVBHuK/CQtvu+rcRif8msBYm0b
         kSmdnDJ7YV+U4D3ugdriRe6xNpNBNKndUpZE9rkZcdrxkV9uVrIrfTZvq2xRZw9rpAXM
         iTo9y1dxUb42DsV3ZjaEMxQ2tpRblcv78kJnqOb1+6V6fNoDWkvVIV/h2NC4LlWu+phc
         TAFtF1Rj3yQGRTFFlYIxYvuvMwLUKFK4aF5MzeXbLNXoUWhg25lCITojszvi7BnmyMxd
         pZL5E6hpwWtlr2twCW7StNC4vF/bPSq03k2vE35wogTNmdLSmbGx5o0WPjCtF1BrEXW6
         ueUg==
X-Gm-Message-State: AOJu0YzLZNa3kLetbTdBVacab8meah55PLxY+ebo1dUJ6MHs2djtFI8O
	Z0bh1M+ftcHTMSFw9H29RjK+1WSk5lwgMngtVgY=
X-Google-Smtp-Source: AGHT+IHtxOC21wcsahP167SQoL/Xm4w3nq8uc6lhMBVOPkLn2Sfv3ar5XOLbBJ2wBG8A2Rz2gG7tS26IGjZ6t3SRpuk=
X-Received: by 2002:a05:6214:1bc8:b0:67f:33dd:633 with SMTP id
 m8-20020a0562141bc800b0067f33dd0633mr20524292qvc.9.1704155198698; Mon, 01 Jan
 2024 16:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-9-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-9-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:26:02 +0200
Message-ID: <CAHp75VebvROx+oQJ+R+OZvcwVk2UzcNdo2Tf1-N8uxNjT_WgYQ@mail.gmail.com>
Subject: Re: [PATCH 08/15] media: atomisp: Fix atomisp_pci_remove()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:

...

> -Add missing devm_free_irq(), atomisp_uninitialize_modules() and
>  pci_free_irq_vectors() calls

The devm_*_free() is usually a signal about something either tricky or wron=
g.
Please, split this part and/or explain better why devm_free_irq() has
to be called explicitly.

--=20
With Best Regards,
Andy Shevchenko
