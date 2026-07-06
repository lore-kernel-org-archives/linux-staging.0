Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419E3AFAE6
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315738; cv=pass; b=ly8mBLxIB+7LAs6rsXco4DzJ+2UIva/Aw7CIgzlolMVK4nCTfTVHEN6ROKUF6hXuAW3XHSElYHGwBGZZ4I6gZWPodrHbIE7KMbIhrQA3fMQpx6+nTBhdcRPob8BLc3i98mPOF2XEoPxqm1nkgM1/T94Z3lS71NvGFFjCNymF7gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315738; c=relaxed/simple;
	bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swXVmXKJjiRFreCf7HsYeMdXJGTa1jO/YfcKb8H0Ng2lZY+da4FRs4kEo7qVAv6pVxi0+5JZZHWwF0CyuDJE6Mr8wwfPhcyVWX3jZA2097+8O89VqbrN5+M5NgY7seFeWBh/H0mDJebPM7ODf9mg0iwwC9gbZKR/sfjvAGlQJOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e52VeTxz; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e52VeTxz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso3078987a12.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 22:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783315735; cv=none;
        d=google.com; s=arc-20260327;
        b=c4zcFfBIocY+5zyuqGqn9R/n52B2RNCu2scLxS/F3WrKAjOi7WEjyjO2tCwIJ05rb5
         UPStU8hcZUPoQzEHvluqklJaWLHHO5RX50Exl+mTrsqtKgwkQ289yRCCAne2KvFczUeJ
         cITxWToLG2jUwqsxENrrmrcnGtjXSlbI2EgWideIKM2IbZszmlW3HFsmLFcboyIv2u/m
         8tvNkMVDBNmnMrYufOtwZJI7tXnlKhFzZ4BbmQt2PwwGEw7a9LiDmTh1QrBa8s87AwfG
         3YtL+vzGYlmNCSVYB/q1su45bAlsHdHDvc/d+jwLpC/lOnwlwaFhfKTKT8oiX06Gbppc
         INBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
        fh=nwu80F92oCy3WaY8RGDAQhrt3Ns0X1un8OwTfxvDp80=;
        b=n0K6+dg5pwoAPBKNhqVPX/Y2dMXmb/OHnEWPFvsc0w6q4hmJHIPp7F6mxtoO5ov5AK
         sTNjjB0auEHorwtQ9+tYEyGWbehJJmdBX0b9nPqkXbsGatnmn/8/BisMv9MnucSdA8kh
         c8gv/qySPZuv4LkzKBrGZ4Mq/Yabu7JiFHF3eRJYFwOQ89TuEGSRdLo5jpl6RRtpNRs5
         V9sZCYXq8FkqJ3/GhltgW4Fwa9NFVLoUejAJLRazBbc6BAL0k6INe1JbSZ37ClD8kzxG
         YffzMNO0wo09t2sh7I9BCLKCarBWnDqy+hEuliD8Jf8pVHrNk39p34hysfxpfmtS8uP1
         F6Cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783315735; x=1783920535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
        b=e52VeTxzFro5tvt/KAsBX3Xr6+6HX6f2tB1tbU6oyCY6YphJHUla+LDwqvFbrratmI
         tyATXwX9HyN6fPmHoQHMI/QZd7/8ULTyHp9F7Xwb8AanZ0t6vHKJohhAmz3bU/ryoDb1
         gClsPi5SbZgacCpdiimnhdWCeeU1PJqMRpIkS3MGEPTsdc929bdMS53H6rpfqqdo8Ihc
         6eoMJAF6Gj4UjolgkeORQadsVV6NkWTWgfO92+O40QNGbfXM6jWm+Dm1DJOKmpgpqwaY
         tyz9QvLNRpSNpnA68fpiwEsn5jE/S5umiYv1dLNROYHludqcmqx17tIj/o82QmiAQ6Or
         F4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315735; x=1783920535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xl/TbKH+g9cHqWt17u800xn75IkzwNS9iGyCcYjzCmg=;
        b=ACoo2KhB62F1IU9K/7EsmvwpMLcwvMbqVhZD9rtKpGPKxR7aNsonTvV4wqEY0U1QnI
         vHti8nQ8DWYC0lK1vPDAiMrf2oKudhg+yKWM8Spo2u+MxGXKRelo2eMGpLA3UlPEedv2
         hh4DUUO1Y5Y1AAwsGVbokGd0PpU/PJb98TfxrpGdLim6jIfkDLrIi5/Y6Kk1b31Ejrqx
         JXYQZ4KfJeJJUIw53mLj8MlrRKZ5r5JXbaP6Q2/FK1TuUOOoJWjTp3aomgQL8Ne+OITq
         l49GqNx/I1lELf9nPU9X0QRbFaVQGGTJ7WOuEJETZ0w6FMJMwDEW9X2KWLy8BRCOOeyf
         zMwg==
X-Forwarded-Encrypted: i=1; AHgh+RpOjNces0epbJBhklQKGDnhO/GBCzdtFiewfqnN+ZddemDq6X00Ohf9+j2uklSF16eS5bfnz+5D9dzbtD5H@lists.linux.dev
X-Gm-Message-State: AOJu0YxQnC5O9+UueTKZHn1VaO4ruNd+V+jqVB3RnYf2cDKoX8y5fabB
	m19f3/tPfAVQlFXxeDL/WMvkU2+1dE5OI8WpVOnj6yHkfcpqrVWnDZMrQS4iRY4TVOLi457YfnM
	0GPiz9/zr4l8PzMecb8B3xQz9ZIivcPI=
X-Gm-Gg: AfdE7cmHQ8OETX/t+3RSQ7P8hTOD/9fQlRdeR7s0IHCrqCFgqG0UPChBF/JQ8B3cBwh
	/bKAhsP4tgJvbjVAj93BN8EAdYM0OHL8mxaZESGEdD6YcwDzj5MpBJYUUDHehET4SGGSJQSff/r
	YFRFHfb6E7AReEL+GkGDRUoB+NbXgxaQYwxA2iETmuanOhP8mK9An8x5QT+00bllhhmPAAgiYFY
	yB+T5O1dVQFM8t7xhhH56/BlFSuwKKpO4sXkvc0tNvqth7wkPmh0gLw3n272izuz73I5IzY2Lxk
	NzATvuaXo96N6Os9Yj7LZY9MWU0s0S6a9kNa+3NaBO/sZmz14x1T+9G8Jt2IVcUXqwuDStMITSl
	89cK3L2nnFMcDALKrm25w5vltW5g9nYjx1WBOoJDpvoebmD4Yp9ufva1h/A==
X-Received: by 2002:a17:907:3e84:b0:c12:8c27:e2f6 with SMTP id
 a640c23a62f3a-c12e6947284mr285067166b.13.1783315734816; Sun, 05 Jul 2026
 22:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
In-Reply-To: <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Jul 2026 08:28:18 +0300
X-Gm-Features: AVVi8Cds722lQuQUNeNlHcyk4-qd190SE0LVbAYjHjmEX2jaCmB-aaJBsXCpzD8
Message-ID: <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 8:13=E2=80=AFAM Dileep Sankhla
<dileepsankhla.ds@gmail.com> wrote:
> On Sat, Jul 4, 2026 at 7:15=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > Is this the only place (of a such kind) that can be amended
> > in the entire driver?

> No. There are other places too. I performed a quick check:

> In my patch, I am trying to address the warning only from a single
> file. If you want, I could try to send a patch addressing all the
> above warnings.

This is a huge driver and doing half-baked work doesn't make sense.
Also if you want to continue working on this driver, get the hardware.
Almost any cheap second-hand Bay Trail and Cherry Trail tablet should
suffice (of course one needs to check the specifications beforehand to
be sure it uses AtomISP camera).


--=20
With Best Regards,
Andy Shevchenko
