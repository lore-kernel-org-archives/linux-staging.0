Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06923C4E5;
	Thu,  3 Jul 2025 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579078; cv=none; b=lQcTq2pqcXvmZ4qXCRQVUf28DUPBVK1E9lk8mhYRO9uh2P+w4klT+Umcub5Jmqw+Kw3ExYGIXxlI7pkCPxbxyEOhy39afAmbL13Cq3RcZcBMYuboSZVQuFlQB2lixEfu65YaFgVZN611p1U4Rg18v8JvDqMIHe8RhSKmc5zV2dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579078; c=relaxed/simple;
	bh=IIoeyyq1GZIa2BjYk3OpqgiSGOD9oO9LywnSHtt7jvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jm1kxgwmmLdQDi6qGg1Tb74YWIbisBqG3bewaol2I52LOWmPAYmpkwVTnCYxVq0hdj2Ejhrmw6vhmSto90gl9NUPK+Adf2/T7MTuP7A7VU2/PVasS+bEMBURFg39tLNVDNUeoLr9FevL9NYRW1UQiIutA0gj87Bus01aCl/ATaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2931pR7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2931pR7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so426037a12.0;
        Thu, 03 Jul 2025 14:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751579075; x=1752183875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIoeyyq1GZIa2BjYk3OpqgiSGOD9oO9LywnSHtt7jvU=;
        b=H2931pR7gu1a8OimSf1ytG46U6OkutJQl45xuWG91+QKaMNJVnIH8/m2Hbah6QdM6m
         KROAlR9Sb/CrrZkYKOjswieDs7AYROvUethmlAVLlYD9kj3R1SF2QN0/kS1pTk2ZBdou
         aoaDHZcwCknRAUwL4ZSKwmSIAcCgQKbT8NLd9CAiizEBDa33mILAcvSv4kEbeGI4zBJI
         LlEEfbUObFHfbO+pjYWLANmDyyKe8dHLAHQbSRuoihvZc4zKgRBxPNxdpSp/t/IzpdBK
         zPxoI05f+Nwp0TtSl/UOyUbN6jpLx0H6kNwbTjyrV6SNLc5l55FTb5tZYMF3C419edTT
         X9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579075; x=1752183875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIoeyyq1GZIa2BjYk3OpqgiSGOD9oO9LywnSHtt7jvU=;
        b=JY2B0XJXbze0E3wIVB4E5Y67UIR3ZRGW0/8pvZBWBsxsJlLh4IgBZIZSKRMEn1dH9h
         4zYjGFsWhGdtL6sCWOC2oa8JLsJfydWtIo9qx9iDZIoqvlUENszcDViJ+ohRp2fVo6Zw
         8Et0AEsfkZGS9BiOR/2sM+o2O+MykpoEM4tnnSQWrYXQFmKTldgaJjifKWhdLFqJVJjQ
         /w3qJNrCI30Y38kbXLTva70aJqOrlVnOgFmD/W1gFRfdjcg4aoOXoYg1MMXZn0ow5phD
         CRDBstFbjLY3EWd5LXzRhldU0idi01iVc7wPD76KtgUrfvNxUac/X4gnyPyzaJgO0kn9
         SU7A==
X-Forwarded-Encrypted: i=1; AJvYcCUWXENW/aOVXSX68PBr4yGbuh0pOcyJGiKE/+PB+D7k4iLhTcntxAll5VUpC9kIOqxFluCHEXiwnImuXnhSeJn9vPXGvA==@lists.linux.dev, AJvYcCV0yVblxP1R6HZQrUUBiRUiOEdOW6YZZOiOgcIMvWGS9Ryx8oS+foPlswHoa/NOb+CM0uR6laOXWbwYgin/iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHIxM/oaIFdIMOtHRtFtz1TfMlZa2fyfdg8UOtMas/wv+7qAAl
	r3neHfcf/fTs6S7qEgYkmeT/soLKsIemUNjs30X22bm1tBayxTzc+3BvIE2GW9bRcQgDDSLZNx+
	oC/6DGmr5QYmkFCNqlprwVI6hCyi33nw=
X-Gm-Gg: ASbGncvX/YAJ95O+5Jf6f6XLUQL4Dm1JErfocWUVpqpS0W6GNC8ltzOA7fXIKxegPq9
	bPIbojyQwIiazXpSn8YYAYwsB6T4Wzm4keVAE7s3hIsYo26hqbLRY9igqot1Rl5LQL4S2/ad78e
	1resO4PEvqq7XOMaH+SUWaxBaTrU5J3zLnbzBIPLPbYBQ=
X-Google-Smtp-Source: AGHT+IHp4LtpoHgPrz8vKo5NxF0850fg3ZRp89l0VEVuQnqdnTSUiMkcg6zqLhd4WpnMFCUIhnuEr8ripxN8lv9rITI=
X-Received: by 2002:a17:907:3e9f:b0:ade:4339:9358 with SMTP id
 a640c23a62f3a-ae3fbc5bcc1mr11741166b.22.1751579075044; Thu, 03 Jul 2025
 14:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250703163350.5163-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250703163350.5163-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Jul 2025 00:43:58 +0300
X-Gm-Features: Ac12FXyhrh_8lMHSEmUBcj2pEZdCZKx9DoJsYb6ibx03ED0ZVcENiX9lPD_jlAo
Message-ID: <CAHp75VfOVksdSwLjWPZqSeRS9_zxSKp=DD2xL06TPnjy5N2jzg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove custom sysfs attributes
 from atomisp_drvfs.c
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.org, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 7:34=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Continue the process of atomisp driver cleanup as dicussed with hans
> and andy in [1].
>
> Tackle TODO item "Remove custom sysfs files created by atomisp_drvfs.c":
> - Removing dbglvl, dbgfun, and dbgopt sysfs attributes
> - Eliminating their show/store handler functions
> - Deleting the attribute group definitions
> - Preserving dbg_attr_groups[] as an empty array for compatibility

> [1]: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@ker=
nel.org/
>

Make this Link tag:

Link: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kern=
el.org/
[1]

> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

Change LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
