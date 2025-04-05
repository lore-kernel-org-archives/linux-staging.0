Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747EE1C701A
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743853387; cv=none; b=RS1x6UjM7fPMYu3z2k3PBpayNCQMTH9F6CDzQhg9gZIByi1okHJfM+ArmCrJW6gHlnAHxaAA9UJ4lp/Qsn3oCWth9bJ63XLdhd8/ohEssRqSXATC9OFJcQJFf2QOhGzq1+nw7Sydu4gPW5v5LaB3M4aWCYme+gXh7VcEr28nE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743853387; c=relaxed/simple;
	bh=IeHWiIJlta9V/CcKkQRliZD2ZLDbrn5xIAUOm4xlQVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCqRLM15DqDMw+22gxWZcADKMmIurwEiqgegMNyyh7HrLTJLIhmMyhtHDxaU9pCnku6gTv833taWvJRYuudRF1rNM+hTA7S3/U3yAfRIZzBwub4Li4Mp7AqQ4wV5GfgpUaC0FxkTO/o0eHPCRBghapNQQjG6kezey0GMjrRXkKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ7JmzOE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ7JmzOE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so4180310a12.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743853384; x=1744458184; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAQCxkgn54QHpXGK+XuJQEXzbLMiEpvUoIf5Iinc0gE=;
        b=VQ7JmzOEOHljgctLfuS8qTmveXaEvH0enciDApjPd3n6i4U8EyKP62wbspBn4HZqxf
         v1WxFE8O7TO9E6VnYGOq4PufzIrwjZhyVghn2ypxR/XxCmACGfpQQCPOPzLtiiQpkrk3
         mToobkR1T/NpNq2oYLo4GCqbT59FuF0LpZyWX8uGHhcclBJnzOHXhh+oNr7rHaFr8oP7
         kVhQjyWKnDvw79vxMZXbPcdUaCcpnURoCk/Wf+zugQrsklQGbgS+SSnjA7ku6cxa3uEB
         maGZZmoZLCQ64cUWj7tx0FrANmrrl/FINPCOysoreinTofJVn4M8yc6iDdWNTChtP0aw
         +Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743853384; x=1744458184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAQCxkgn54QHpXGK+XuJQEXzbLMiEpvUoIf5Iinc0gE=;
        b=CuBhVc1wJtLFjE/aL1z/i1F7DOfzfOCwWegZYOnS3sbOJ2+r6IJt5fP+fWa55I19KG
         ZAw8iYPYdwR/KD68osfbi44wn8Ih5//uMypzaxsXQaydDuk6LljOKEflGjyP7BpSx5I5
         F8tlhMakjXV4yndzCh/7NWct6MR2jHDe8v64noroYORsVTvoE6OE2ly+InyQlIikWTWW
         mYz7ROqYieP/LuralzlMRX+ZHW8LhcuEcMesayCcU/DTFl0rWNbvRS6+1aMri3hymDKY
         nPdXSNKIZSFs0ovBu36SPYxNHp5cmJTzbnd4hlfBmDQiKrrfbek2m9W3RuuPz1AfyQff
         jEjA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpG6f0uEv2eb4YchQNfWFdsMakwAPN/Lu8T1csK8yRnx2Lvz6UYfkzwrcEi+j9fyhVfcqyiZ0kw0Dk8B6@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm24YYrgPEDMci7PgZbo+yuqIEB5K8fL+lSzdtwaaMq5gsOhOr
	HLeUKHlGxkKNwx+JJUcdtjtn8AyEv9/RUxdETd7LpRtrGfxcECTMUlPQJHphbOsHtKSAPO0u4WS
	LQdhxvnm64g0zYQ6WfB8wapWPV/0=
X-Gm-Gg: ASbGncsMEMipkI+sfgHdeEJG4pU/v8lAEtpLvr/LqrBYnA1J9T0+GoZFMJItzVFtOWg
	8Kgv/+S6PRLQYnlMcyFM+BgFU+iNBcz63Hj3s1WFIWIdE6/1CNf/xHE9rigHtA5hkcGk0JNw4pe
	YBbbMjAx+p5lSa/xpSqoCqT9Qx6w==
X-Google-Smtp-Source: AGHT+IGR49Meudv61iYvBzrEPGWBseWjPkmDlmkAguahpWMV8F7NVB92wvM8pzyr8lhEzQ+Zp2Axv76kLM28VS0iFds=
X-Received: by 2002:a05:6402:350e:b0:5ec:9e9e:3c3 with SMTP id
 4fb4d7f45d1cf-5f0b5da703fmr3990871a12.6.1743853383704; Sat, 05 Apr 2025
 04:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67f0f9ff.df0a0220.33076c.f0e5@mx.google.com> <CAMyr_bJpE=NHi4bS=_eAWcm1gxKiKDA3YQ_mYRCDi3tjuBjknQ@mail.gmail.com>
 <2025040505-colonial-pencil-69b4@gregkh>
In-Reply-To: <2025040505-colonial-pencil-69b4@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 12:42:35 +0100
X-Gm-Features: ATxdqUFvWlhgf0Awd-vyZfu_-zhGNfH85tFXXZeE6evOOSEAfi9M90Pk7W_DZtQ
Message-ID: <CAMyr_bKq9dnc2bzu=qq1pCsqkHwMxK+xLApbOy45MYtXLXnTBg@mail.gmail.com>
Subject: Re: [PATCH 1/8] staging: sm750fb: change sii164GetDeviceID to snake_case
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 12:06=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> All of these need to be linked together, you are sending them
> individually.  Please use a tool like 'git send-email' that does this
> automatically for you, because as-is, I can't take these, sorry.

Noted, would do just that.
Thanks.

Richard Akintola
