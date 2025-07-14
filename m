Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8D81CD1F;
	Mon, 14 Jul 2025 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752523876; cv=none; b=lAk+XSwPgngaXef59q2pyX3FqIMBYqoNFgeZQ/nKmY9fCpFNAMSDRetdRMzffFtXRgjDtNYQuv/K/RiHH+Y2Tikt+dhledpw8YnPDuGx6wjSx0c1yY/iVYk6F2yTetRSgCvmCfK9yRbr0gQLa2r0u1pU6z/2Sa1KOj7ZGdtmTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752523876; c=relaxed/simple;
	bh=o116LaKgiE9093dMEoxX9/33WuiYNbhzU2RyjJOB82w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btJl0y4SWqYE9TI4o6GJEoyzF4gCM2lfn1Huaj6+kK10x+9eRW/3U66pNpbhvHTSKCyO1wMpvDfNQHXjWj/bFnGNruXp9OZxBcUONSPiqMWKQ4S5tBmK+6QvcfDt3LW1bEX4EJ/pBq8EAzwtmDzp8eCvkSDdtO9yQNXA7v6gCwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr2IayBM; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr2IayBM"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-712e7aceb69so2263167b3.1;
        Mon, 14 Jul 2025 13:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752523874; x=1753128674; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o116LaKgiE9093dMEoxX9/33WuiYNbhzU2RyjJOB82w=;
        b=lr2IayBMvOBajuJAsh9QLaEB8l/uEv+8Wp9cGfusqqTiOy+9Wh269GZskEcha+u2Dj
         /M72snRb/v2cOjD7J9vB/zmhaTKGi0eYGUkqKsOJeSkqg2OkPorTzD3XyD9BUbNfN4j4
         4sTKKuEsE0od8/pEVJHldEzv7Hk59SVtk5SHakAZL9qq0gv80EI4vrQmJkxKf5c4NRiA
         aUXxB6UKxOACdI2i58jymS2uxQQEmqs1LfAAJoAlHEgG2jwVr/No1wo7+9kvmGe4FfeW
         ergvSjWzav296jLgQNfwEi+8X/89dPU0I+ihpnhAKPlDcvenw4Ubapr8Rh1jGlgC0SdY
         uNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752523874; x=1753128674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o116LaKgiE9093dMEoxX9/33WuiYNbhzU2RyjJOB82w=;
        b=C3NhjoUg0vzRFucAb6C+d4FE0LsDIj/BrG20kYztKSXBZJ0yH/bqkmr/1c6X3IDgr6
         K/NSkNMSU5FJUxnpdD4elF5QO8I1AjW7iMvk1HNBzitOBUU2w+eybYuKWseZf3GbtGII
         r1x1q7BgSezZYifeCbQ2P6x4SooMSMgzRGQFMcXWiCollUpoCFI8bOOgujsy9uXvXFvK
         gMEzRcslUM4S7flrFFwLQMw3qU4dFlJVbNdW7LQ3F4vbLBDycbshs15FnpOxSPBLL1U2
         iSN1nTXZsV0mmymRbKPopuZXVAn3yKgRWkqfPa9J/rxagBo1cwdzi1MMOOmb5U4TuGYK
         l+9A==
X-Forwarded-Encrypted: i=1; AJvYcCVLqYnT4KMgca33RFsK1DenDeS3v051ClHoHduI/8llW8mKf1tE3ymVVoAwmgPQo91FaVSLZc9pKp9Yx3EjBYaswquHeA==@lists.linux.dev, AJvYcCXoWpEN2fn4LK4tMTSxIbGp39Pkg0+EOrC1L7GZTk2qLCAHWnI2yUQ9rr66C8pq9oPES1wEJorbZURyLccK/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTNVFNKosPL+78G+QTtDwj03LjopF7jYRhBH4kJlOMQSVLGUHe
	dTKvUSDGwlpCCeh6wTAaYrinLDp5Rj37oVm0gh+dhGMx/kvQ58K3V9jw14YwWzDNlSgfnlchFZl
	aZMIA6TmLq/AZ2BAIq8TBTjdT0DJiP8k=
X-Gm-Gg: ASbGnctb+3PRg1DkvY+CxLbvI3kAT2ceELxQX1P/HmPIQZNG1PHCPyQvE7qcIDUgAi7
	pUhHuUXtMv5SE3WpuzZVRRAGr8SfoRH88lE2EX6hw/lRisnFHo/LR4sieh78mRtVJZGoIXB0amb
	9BgtnaQdL1RCkwzkMhzf8oa79wtmtIyeI95DCl9o0FkM6gTffmNLdHtm7JYm+ty0841CYNxJI/1
	UBIo+g=
X-Google-Smtp-Source: AGHT+IGoo7GzS3HLrAW/xIlHtnfmsPdRduB748ZUUggtMZR0LEKaEK3EdiT40iM/XPCwFZzKs3a+IWXQUp7hfj5Hohg=
X-Received: by 2002:a05:690c:8:b0:711:457a:401f with SMTP id
 00721157ae682-717d5edff8emr83001767b3.4.1752523873831; Mon, 14 Jul 2025
 13:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com> <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
 <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com> <8372cba0-61da-468d-97b2-85deb8bd4129@suswa.mountain>
In-Reply-To: <8372cba0-61da-468d-97b2-85deb8bd4129@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 14 Jul 2025 23:11:02 +0300
X-Gm-Features: Ac12FXyIkEobG-8R07HIBrMYPv4NjZ2K5m2DDIlRYHeClMiStHBZzlat32RUJ5s
Message-ID: <CAGn2d8MmZjJk=Zr+qrOTP+wnOe5qB8T=kXEdunzWNxW2p1nwxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, mchehab@kernel.org, sakari.ailus@linux.intel.org, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,
On Mon, Jul 14, 2025 at 10:13=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Smatch has a check for this.
>
> ~/smatch/smatch_scripts/kchecker drivers/staging/media/atomisp/pci/hmm/hm=
m.c
>
I have sent a new patch series that this was fixed in and added other patch=
es
here is the link :
https://lore.kernel.org/all/20250712191325.132666-1-abdelrahmanfekry375@gma=
il.com/
> regards,
> dan carpenter
>
