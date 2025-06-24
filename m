Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B900F2E889B;
	Tue, 24 Jun 2025 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788600; cv=none; b=J84rcFNYG0HmfACsgGz/cqvEjs0MaJ5fONmcQcoEBqqdxTJMCuurJJxSc2F+IzA0X7w1suI5IKMhAhTtlG5JsauYeJNwzbvhwJoP7VlD29+bSrX2h6CEqQH8gtvqR5mWR5wRWiSuGTyx55b4lkuuz918QPU6ySw4M+PidAyZKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788600; c=relaxed/simple;
	bh=FCIIYY5qiec2hBe50pDiWONT5FDHydwnIw9Ol4ckVRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/Z9ebjwxtHsOzVMEJbkmJtnk9cJbujqzQ28VvJAJJLz8ix5b7CXiVm1HUsHfmRrt9CJukoppgw2V93m+5MMtkDJ09pDo79jYUmqNe4F5Y5Xc2Voa93Iwb5EtC49wwUBGTQ5guVWA34AfQl3bTzw8yJrfaakSzuCfE3IWrgaH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jurQ9045; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jurQ9045"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so879009666b.0;
        Tue, 24 Jun 2025 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750788597; x=1751393397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCIIYY5qiec2hBe50pDiWONT5FDHydwnIw9Ol4ckVRc=;
        b=jurQ9045bwGiENoCggJP2xaWB8vowA7XWYYKG7OBIxiKpQSluqNjxq3R5mFEfAN4U+
         LJw+i9sDT8Ygq5SJAZtpT3tU0xpy9sVSr2zSbQY2VkgPUB1zBVMz2dFgBV5Lea9H3mlu
         Rl7Kqu6nKlLL8FYZZvZeOVnAQkEPgTxhoiMtZuf9PqComiwHCthwQADU/33Xzwd4itOg
         TsOlE4in+tS862OYBqxwx/aKgtTaF6eTXpUpiKybLKhOoPlRQeIo18mHjl0bx5jPnDGQ
         d2X6lFgkS3bG2YGJx7zrkNkfDq+pIdSfS1/YeCWh66ZFeTjXHZpAtMqLOvF4agOvLt/E
         u4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788597; x=1751393397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCIIYY5qiec2hBe50pDiWONT5FDHydwnIw9Ol4ckVRc=;
        b=fpIhI6wxQgew2kFWxbtiyqryCQxvwm8pVt0fDv+7Raagb9t6aaLZCj4rNPVsy5Y47W
         0dbU95Zo0FzT0RhD6G+dV4d31/Vt7cnSObe005ZAEkc2Gw1ykf43B7PUbQV1Wr4omy+Z
         DHLXF8tLKyF06uucTzbD4yGmES6Y/JI3x+unfYXxS6w/Q/OhIkoljWJJPOdVV/v6mi8U
         fSQzx4hDJb2l5zP5QoQtL9sB2VG0up0fepX6m/vPKoEAP3f2PQzQ8hhkZ1O6XRA66Hvx
         zZ99OpkuTRhODHcd+v4IdmRzwaN9zLRsF8V2Mi1gDLyzhwtwzmYJGJntnCMlXd7e78Ob
         Qi9w==
X-Forwarded-Encrypted: i=1; AJvYcCVgwzlaz4Ild8u3CzCjNsR4jjv42P4uXLmDzkT085VHcRSk31YXkLcsNIJWR8nGCIyCe4s2IK/cm0jP3QVXS4O9NnvInQ==@lists.linux.dev, AJvYcCXYfhoc+Et+wW/XMDGT+E3JpWCGeK+NM7CEvIxNvAA63HD2prjZFBl+0gIoo/QUrE+4cwTxSkrSaoJgAlrNng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVvD8XJmK5mz6trHiQQjz6ayEH2k5W8oiztUMvXb9v/BYIuz+w
	VQKEBkeNNanA6hakbKxuy35jgAc6pc4UsTWZNT/5B8a70w/OKijSwAYbeoznmI/BR+Mewuib61t
	MzJ69DEy9I3P/BEQLJGiUrHHUAd+Pkzw=
X-Gm-Gg: ASbGncur2PFapclQp8GbInsgFLEHUp+ZQs88QgvPOtox3tvhOGuWtWZCwXyS1mOqfAd
	FXKqElk3dOd6Obu3oo3n/2JlYMoolU2CqM8C7a7XBbDvZ1VBgKIx64yVBOjUM7125nEYLgxAbW+
	wLAwGlwTgPOu+owb785DDGJN7U4Gki+Git14xzKniMhcg=
X-Google-Smtp-Source: AGHT+IFjXqH44JSIY4FR9M2YtgUubwZ5Ww1de+8Ma1i2aCedPQ6TNDK+zEWWzi3PePdzsy8XyB2BHESWItZygc14TPs=
X-Received: by 2002:a17:907:c810:b0:ad8:ae51:d16 with SMTP id
 a640c23a62f3a-ae0befc0232mr21137966b.55.1750788596736; Tue, 24 Jun 2025
 11:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Jun 2025 21:09:20 +0300
X-Gm-Features: Ac12FXxMOJwp6ramOYp60uAHkuhid_dAfeHVQHPNfJmZDrOA2sU6IjPkvPJHtoY
Message-ID: <CAHp75VfL2uMpOP2xfa6zf=MAFrt0Phz87xo5w3bC21t0-TTQKg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You really need to slow down with the new versions.

On Tue, Jun 24, 2025 at 8:07=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The sysfs attributes active_bo and free_bo expose internal buffer state u=
sed
> only for debugging purposes. These are not part of any standard kernel AB=
I,
> and needs to be removed before this driver can be moved out of drivers/st=
aging.

needs --> need
can --> may

> - Remove active_bo and free_bo attributes
> - Remove group registeration calls form hmm_init() and hmm_cleanup()

registration

> Suggested-by : Hans de Goede <hansg@kernel.org>

This is not a tag. Check Submitting Patches documentation and find the
issue and fix it accordingly.

--=20
With Best Regards,
Andy Shevchenko
