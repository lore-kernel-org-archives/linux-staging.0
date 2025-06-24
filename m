Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53241A2630;
	Tue, 24 Jun 2025 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775461; cv=none; b=OIKs9l3E6TpBDHrRjA2j/rwTmXs7DhL6GcDXrwZeHO6n0IiLNZrqxxJKp3WGivECFA/T/LreuRrxJ7TV5ILUFsWmKS3n/x6v/2twfgWDSE1BDbqqxbsnHVG2oAx3B1Hwl2/jvym3nNjfhaDdezPCGd0NUKbJn5ltJ/oK8+KMbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775461; c=relaxed/simple;
	bh=rUHKFAGtpoHh7qi7QoaP8poZE35x55yLFNHotiaZsC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcZ7G7gWclt3Ie8eBdplI4woi2ARg/fuanHcXhEMMoa4++yaxT9oDgcxuOuhADYPZEuQ9fMbhonqM18Pa0tqcqWgvAhdFR6vtAFYDvTzOQ3O7fgTmhFGUviBtTG68+y3S0dMn+eRSjXVfQsi6aNz2DI5VV6tenG04PK+RIh9JiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT5cPjWq; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT5cPjWq"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7dc7245bcdso654087276.2;
        Tue, 24 Jun 2025 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750775459; x=1751380259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47JKdWTsMsATiMIUqYdzfJGuvO9OstUGqC+AM2ehj08=;
        b=jT5cPjWqaB+z+0i228Hye8VlRxpcf4ehsWekjvIecUnOzGOFwBoKm7TdrDZWmpdE4B
         9H8Uj1uM2S7UIT3iTmstnPC0B0MbxALndmUWPRav8ueh17HIxHYyZO7sXI+FU88oSFgr
         6CuDixSfDuZDV7Y+GB5e59ttFSR9yEah64ItlGqAiu6dZMqJcEyLcfEp5brI844IKi9b
         czYPalWoLDi8howBK4mCTv8EcuY8Wvhy0xKZZ0u6v50S3raCKO0PUVn3PrzWUSGueHaR
         zsMHLMKbj7zD4+hHptt7bO9YEqh0SLn/MCuMUtlL57UGKRRQcSWVt2aN+VmhHic67XcL
         aoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775459; x=1751380259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47JKdWTsMsATiMIUqYdzfJGuvO9OstUGqC+AM2ehj08=;
        b=CGDAK9QYrPiMUeimK3u9T0ZBCv070U+80BxEYZybFA7a8YKF1tJFue/XpmsyFv944h
         dqIosH4XiyiRdU6S943J5YpLEgbFzSNEyRr+9xneo4Koo2k6/q30UO1k8pm78YkOA7lb
         rRz5QU0Hafw/FxWHHX0pDqEHV5nKygKZvRstC6yk/YMhDu5QNmpEwwAbhzkmEi17SfaI
         pEwamFF6A43LDu/6KPhnpYJHzhMGMBPz5zn12fD1oTQ5qEwvcjqE967WuI+Cy+PxjXqC
         VCMeRmUcB/5KEUR7SJYpQGHUnx2bYU/BsC5qOv9dbpIZGbB8MXc5Uh8Yzr1YMJgvxlvV
         BLFA==
X-Forwarded-Encrypted: i=1; AJvYcCXIN5OkqSDyboUjBuy3izl7861RW3jSSg1iBms2bWRgjzOkUnfY+rZ6FRFF+g9eE/oTyrtr5njP0NHgshksxlV93VpqGQ==@lists.linux.dev, AJvYcCXgr/agqhvQQcJyP5tCbp1VOqUDjE/SAXgvckJKXby3UgwDXWJe4TIqH9K4XDzuro5HJ46Un9rD5RVTC01npw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1gcLGCsgs2R9O78vY7qpoRATvHV60ZxvDm4T4tYwWz8lf4ej0
	4UDVzMa3tL+D5muFL5fH3FStcEbX3ru1BO1PDgqsZfPMMrn04FRHQDT7pqwckH3lwTCWSrdLaNC
	RgPPMgcBU73TNpdO3BUwvgumc32sBmcg=
X-Gm-Gg: ASbGncumgPmcfjESEKBRaMyooITPW25wnYpy2a/f2HIpjhyhZhWZeOBSeljRPhdTS0T
	DQXhiSxFhir/uHJmtwIKRSdik3stC2Un6qtP4OXHnO5pIPX4v/2Q+fE1wpquNv66jgq7CNE7AMI
	ufNdJ5WtTggvNjI7KtZvAj6g4qD14c2prM3otj56ruCGCW
X-Google-Smtp-Source: AGHT+IGkc9lDh/qTdWnQdUPKLcAIyMi8ZYUXwuqjFHaD94kvXRNBk8ZVu21FRKUl2y6HHg+AtAc3aGAkJb/C+PSHZWc=
X-Received: by 2002:a05:690c:4b10:b0:712:a286:2ca2 with SMTP id
 00721157ae682-712c654cc21mr112798577b3.7.1750775458572; Tue, 24 Jun 2025
 07:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624130841.34693-1-abdelrahmanfekry375@gmail.com> <aFqnK5nIHilUSxPq@smile.fi.intel.com>
In-Reply-To: <aFqnK5nIHilUSxPq@smile.fi.intel.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 17:30:46 +0300
X-Gm-Features: Ac12FXwbJgmBpV-jBM_-Wd0HLMnK31Enz6FwQ4_mWR8PFGdVY_7Dq_TVpSDZ6qc
Message-ID: <CAGn2d8NMApie5Ba8HuzzLtmhixkPpyXh3_goHbrMCzY0DE0wfw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, shuah@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 24, 2025 at 04:08:41PM +0300, Abdelrahman Fekry wrote:
> > The sysfs attributes active_bo and free_bo expose internal buffer
> > state used only for debugging purposes. These are not part of
> > any standard kernel ABI and needs to be removed before this
> > driver can be moved out of drivers/staging.
> >
> > - Remove active_bo and free_bo attributes
> > - Remove group registration calls form hmm_init() and hmm_cleanup()
>
> Suggested-by: ?
>
> ...
>
> > +     /* Removed sysfs group registration for active_bo and free_bo att=
ributes */
>
> > +
> > +     /* Removed sysfs group remove for active_bo and free_bo attribute=
s */
>
> These comments do not bring a value, no need to have them.
>
noted , thank you will send v2
> With the above fixed,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
