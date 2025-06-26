Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E62E718D;
	Thu, 26 Jun 2025 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951198; cv=none; b=MgPW/6reATLYzbdqBFlMxNJf+74ETOmq6B9xnCZZVaS690/Am6OYzPIraOsd1SdmG4z5Zxl1FXZoaoTISG/Xqy7CYdnoJLBQNcJqNVkN+NVc2wao444KXIY0EVDagrO7HA6Ntq7+DetB6jvE3PEzgV0WtRR4QJf9KN0ro9oIeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951198; c=relaxed/simple;
	bh=R+c2qSbTSKIC0tT9gkvNPds08WjRbxM6PibZWtchYDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcTABrLnMvcPc/zATPlySI/WDJEeg5FPvJKB1bLgPVu6zs/wXOehqvAiILIF+SpwvxvIs5lqrDGx0Jj6WzSD/mYSNq1Od4Qw+9Y3TNbIfNvCcQgOehyGNKxXJSW7OHEntS/IEnCLn3ydKBCv+Kx4KzLrT4PMOHmaHH75RPlf1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIO0MaWG; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIO0MaWG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7118c12e45aso881407b3.1;
        Thu, 26 Jun 2025 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951192; x=1751555992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JJKqMrEaML+dwFM/EI98+cWAy1tTBYyBi2gNj/iDEY=;
        b=jIO0MaWGvK6AdTDSgaF4w2WCLu19vN1yfuOx93ogWuiidRgFI+ASHjSN86CHG4fOum
         6MBZvSUq7IQT0ZemJjQy7ASJjgBGyzUud6uuNxRefBEHEwshNk5mk1k6dk7qLg88rqlG
         cJRC5+yctPU4LNMbbt9OgKhwPihwPYnpWC2cQg0gO6ELWEZKecmdQPRpAseHLkgiNNwv
         rvcKonZtDLGVvp3dZqyLkf2NBDEZXsjLOvEEWGO0sy0G1JnILq+l1xSCI6qgUYwxNUp0
         6kO4bQdRBzXW0oJ25tu35dhrAhpupk3dDrU6xLKmyz9BngcHgrA87FQQ2XzkWFDohCCo
         d10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951192; x=1751555992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JJKqMrEaML+dwFM/EI98+cWAy1tTBYyBi2gNj/iDEY=;
        b=wb2BvEuuCrSGH1PP0lOtn7EuhPPl3Nuc1c6vZf3IgV7/lEEp3zmlxQ6wzkeq11W5EX
         1K7IzZVycsD6kabI6ahxN+09PLoCbAQXimqV1W/FgnkX2093z323xt8/MWqW3T/uQsC4
         kJ80+u9IHdEZ4Z7KBKRUhbe1ZkA1+6SDIQ/xyJv1cygFPtzfVr2R+RsbmkHMEBMO/UML
         IMxFtS5Yg9bhbQKcuO95KVuEBbaubKANZDAdoL4TSr1ugSVX+J99FfkKdyLG2gbBIs7B
         dP7J6+zx1G9aYseyyih+C4OJgdTJQXRkcCDFP1Al7RrU5NZILXizacJQbOrCh1VRxTVQ
         lw8A==
X-Forwarded-Encrypted: i=1; AJvYcCUOty6Zf4rN8BxyW0MYXOxs9iqkXEm0Gsfowpm5K5ft4YU5Ad0im5zKvDf1T3Ko3PvUt9egv6U/mZDh8fmHZbpaF9sAig==@lists.linux.dev, AJvYcCVhVcwBB5clkczYoPSDDUc8kZo7GeCTl0WOexbv6ArwXYewiBvc3AOpEwL8g8R9zp/d29RyzHai7Pf1mOcaPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Pv4RxBv1D7WNQkMlFTvj5t4BB3G11wj86klBP6qoevpo1pxl
	MdMo/DGwEGw/YB6wuSuFxXLnQQjSxjKBeZmt0J6ewlLNuNKrkb8BzgJx8LwSWvUHRiQxVL9dk6f
	WmujLz7ujmAAZWksW4wz1t7JlmsNvaIU=
X-Gm-Gg: ASbGncsJ+vJuSsvyRUGV6jDq1fRZhpwC4H5ZIbocm2PrFD6gIuMkt4OTV0MURz49qeC
	fXzxIv+BCfyxbx4GNvD1lIq3okRJ53I07uIWgZmZp/PvNnHjpLG5j5xnkrxqhKtp4ST7Omt3OSc
	PbvHS2ocJhqJKmEF0NWIi6uwGq0z+VMUXzdlHt/2yOTvUCEvGi0/fl
X-Google-Smtp-Source: AGHT+IFOnJmKn+JJ2frYecHk4EE6Fmul0pWhubm7itDVDM5Ubw/30TpmRooTP07goDGc31er/cpoSSsTxEwrFRlC4XA=
X-Received: by 2002:a05:690c:6f84:b0:70f:7bea:5dd with SMTP id
 00721157ae682-71406e1368emr44684307b3.9.1750951191557; Thu, 26 Jun 2025
 08:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain> <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain> <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
 <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
In-Reply-To: <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 26 Jun 2025 18:19:40 +0300
X-Gm-Features: Ac12FXwpty1WwCsHouZ9sWJvvTacKyf47jvNYTt5mDohhxxtLmxfkIn5JlmFx3U
Message-ID: <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dan , Thanks for your review

On Tue, Jun 24, 2025 at 9:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> Yes.  Nothing is checking for if hmm_init() fails.  Step through the
> code and verify that nothing crashes or bad happens as a result.
>
> For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
> yet." and return.  So that's kind of annoying but it's not a crash.
> Search through the rest of the driver and verify how it will behave.
>

So, I have been searching through the code as you suggested,
and found a couple of interesting things to look at.

Firstly, no function that calls hmm_init() checks its return code,
and it doesn=E2=80=99t crash anywhere because of this, so it's not a proble=
m.
But the thing is, the hmm_initialized flag inside the hmm_init() function
is set even if hmm_bo_device_init() fails, and this can be misleading for
functions like __hm_alloc() that check this flag later.

Secondly, the function hmm_bo_alloc() and others don=E2=80=99t check
the return code of hmm_init(). Instead, they check the flag
HMM_BO_DEVICE_INITED inside bdev, which is set by the function
hmm_bo_device_init(). The problem is, if we inspect hmm_bo_device_init(),
we find that the HMM_BO_DEVICE_INITED flag is set before the calls to
kmem_cache_create(), kmem_cache_alloc(), and __bo_init().
This means that if any of these functions fail, the flag will still be set,
which can lead to misbehavior in functions that rely on it, like hmm_bo_all=
oc().

Should I tackle these problems after submitting the original patch of
removing the debug sysfs attr. ?

Best Regards,
Abdelrahman Fekry
