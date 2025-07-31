Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CD23B63A;
	Thu, 31 Jul 2025 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753932263; cv=none; b=dDYaQ56Ag8L45PzwZwPHbgCJQFAbTZYBUIYX+RItaq47zLwYSWyJ1wLLoZw1JbVfo7I5b0ZaKme8Kp8yiMmkwJsE3cZzYhCFCPzl55k8F8j+YkFRdrLKesX1iWJLCoQcFU6+XqSHog49BTeWebPYl16L+Qh9Qchqea6I3JvyEKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753932263; c=relaxed/simple;
	bh=U6DkH/1QDDTd3JMxVGF5kKk4QFH+stGjJsLlnJmRzA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vew6FFxH9EWhXUK1EJg//uWY8oyaKX4IJLONynVsL/wvpSspxLyfFLdozvCOrTEzydy+gt0bn5ijf/zxcw7qkeinwT6E8RK61xfsq5lpxzDIBhiHbuj/XdH4h/7J0ud1YoeTf1ZswULBHbFU9geGKXE/H0spynWBLElqtzTVc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiISjiFC; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiISjiFC"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71a40b3b639so853517b3.0;
        Wed, 30 Jul 2025 20:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753932261; x=1754537061; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6DkH/1QDDTd3JMxVGF5kKk4QFH+stGjJsLlnJmRzA4=;
        b=HiISjiFCwav+bkEVUmJuhtenB7jNkH49ppoywoB99jb9sqkH8YJ4kRoMylg5g0cIVI
         oDAOnrPjVawYMo1lUqSxK00I2Pty5m5V8b6m8GW8VKFNXF/n3/12SAssS27EuXKmwDeF
         avJsUfklGU+sDs+gI7UH26NN83Eip++/40cP/iuiXpTcSucRLCy1w0pV+b/aw0OT8OUn
         b+yOyTz9lG9emtUpjuZ3Z+kcPgk2+zj3ZpzfV7NbRREI8ULz6WvPkNgxo4rD/4KM+Q70
         1rD5BFiME7pZ9+7JtlLwjLP+y0WtNnpKfK+OAsqrxjtAeFzOWV81v+BfnVguZHNvsyeb
         +ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753932261; x=1754537061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6DkH/1QDDTd3JMxVGF5kKk4QFH+stGjJsLlnJmRzA4=;
        b=obck0n6KbZ/fBATSJEZbDOa17hIjCPXpcLRaKgeWF2kO7DkOopV1UCjI2T9v9JP05M
         ZL1LgjcDir3gJSchHzxiksf8wZ2Vw2s+eitSSexiu3PQohoC83du9TdskP0BCFUaIQlS
         g8b9FvQ2XRKIoYzvzwqKPth0b/E3rE5qpmZ2Y2F76bXg3As5eh4ITLtiSQ6WKMR7kvL+
         qXhVMrVk5GDU6FcV3BMb0X3684SP7gTQrdr6PwdlyjV4Tk7o+fdZ+tlXb7gP33CtioMJ
         zRrKBIaOK42oEjeTu6QUQZwTz34bKMK1PpgmCxo8HeeCxWVj/4CPpTIrx+9k7B5uUwSs
         LMcw==
X-Forwarded-Encrypted: i=1; AJvYcCWJjmqTwhEkXYiC7M0XUuAEQf6M2uSvIOKODvfGkaL4V7owgRljMUwAFPpgXmNm1pCijULhEC4RALI7zbHqKQ==@lists.linux.dev, AJvYcCXdALf7RW4DI2uek7cwC0JL8A/fPggau+Cd+mVe44tCLIuW4oAhUd0XB+2HMHvzz7Qpo9vliQNtU2C3KWmDWHfxn+EpLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI7qnC987DIUUjvy2/EZ6b+yqnNGLG/e7CfvSFYkxUHqjEYAN4
	UzFisjHMErTbaDd5cDi0ghjPZGCVzDf8AKZadGTbwz2BEAx8XjN5ddKkhyPHtS2f8KaLX5c5CHu
	Cx+4fE7WqIYt2rRSRS2vM6ieIK/uPHzk=
X-Gm-Gg: ASbGncs4t+NPcm7lh00fw1nFnO+Jm+AVCJrn2DMNT71zmX0WxnQYZGBhCtjPxooCNHw
	sqFp4BD9TEwaQtpj/1uK72ufcEs2tFbVU2H8iozCcxEuHYy6YcNyVysi/x6idDbUT1bDK0glDiH
	FiQgPV5JNF0c0oY3zarKxLo2LpxYgfM/upy3sr2liORP7vsDEuoil9wlKrcVH6xHVs5NUwGDerB
	f2hP153Hw==
X-Google-Smtp-Source: AGHT+IGOd8+ZpJgg4qZ9tVXZE6w+6iB2zor3TqPJKna6z1lPau7qtj8Gdb7DMXXGYeelV5KrAnIDySwEhaUOXTq4jdw=
X-Received: by 2002:a05:6902:10c7:b0:e8d:d7b4:c8e with SMTP id
 3f1490d57ef6-e8e315bcf86mr658013276.8.1753932260833; Wed, 30 Jul 2025
 20:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
 <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain> <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
In-Reply-To: <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 31 Jul 2025 06:24:09 +0300
X-Gm-Features: Ac12FXy3UekZ9pooVRP9Ag5gzRdN_OhDyRgiHFhGiv1y5-7dvvMpoA2OO_WH4A4
Message-ID: <CAGn2d8O0TMqBR0wvBVbWzKKKqQyLWzn9Rn-8bhYTC6wR7-HwcA@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maintainers,
I'm just bringing attention to this patch series as I have a lot of
other patches that build on it .
Thank you!

On Thu, Jul 17, 2025 at 4:35=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Hi Dan,
> Thanks for your feedback
>
> On Wed, Jul 16, 2025 at 9:21=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
> >
> > On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> > > Continuing the cleanup work that is being done on the AtomIsp driver,
> > > This series:
> > >
> > > - Process the error inside hmm_init().
> > > - Unifies the HMM init tracking method.
> > > - move hmm related function to hmm.c.
> > >
> > > Previously, These patches were sent individualy but they build on
> > > each other so i resent them as one patch series
> > >
> > > Suggested-by: Hans de Goede <hansg@kernel.org>
> > > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> >
> > These seem reasonable enough to me.
> >
> > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> > But it would be better if someone could test them as well.
> I tested this by building the driver and i really don't think further
> testing is needed
> since this series doesn't introduce any behavioral or functional change.
> >
> > regards,
> > dan carpenter
>
> Best Regards,
> Abdelrahman Fekry
