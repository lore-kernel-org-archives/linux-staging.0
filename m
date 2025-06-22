Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBFE1862A;
	Sun, 22 Jun 2025 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624583; cv=none; b=DkY4fwk/iDRjsWdbZhh1ZaG35nlpAdguMiFA46UHO3/4e+xz8ef8BG0OEDruj9PYe7y/jyXPAipynbCwV7imPtxqms6fFM1NkcBmPsq/LHugnf9fZS1dogDO8dSAU0g3RNuh/0JR+bdZd0jIIxH8CwHn9UZBifFTNw8oqE3gcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624583; c=relaxed/simple;
	bh=hz3Jdtz+LsvuzD4rQ7JolouH51M+SUxhZRQ2TBHTSzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmOSQvqbgmCx4RJhqbLKEUyH2LPFmxyng7GPVwRfdMEIGdwFUwTQ4Z30J+fl2mop8hcDJMSsrapQhCR2Mb60S59pH4efSxmN/NVvjTMgF2Dq8bTXWw7sHHew1Xs3H/MTmIQAwNfmYSBITVTzxGEBpFiCxyKpb2Jo2756GTf+dfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEWD8EYF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEWD8EYF"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso5862219a12.3;
        Sun, 22 Jun 2025 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624580; x=1751229380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz3Jdtz+LsvuzD4rQ7JolouH51M+SUxhZRQ2TBHTSzs=;
        b=WEWD8EYFBvR+xP2f74+qwVqEI/IauWO1+CpM20CUYE8l9N18Rva/tnpNMjZjWpr/ML
         ILJ3Q7bG7fejE3if4L2qbzYIt7K6X2gihNwG8OkiNZYzfQWl913QYfRuw76aMQc56RDk
         FFFlQ4Rrqe3/MfxqgqkLRcxmonWHVaMB3ZZTaa00P/Dysmw5KJJ/ys23jv59hDqueoqg
         UL92PAOUkg9tE4bjB8YXVIEpuSrI0PUMJNL9+VFCjQZOigMXLJScSFja8l1NAMpg22xQ
         J1b/gjCBwA4ECOatAxQzkkgs7tz3oqDU7TPQpHyybkCwk/oiObEtl4SpY6sXCH0InWdY
         uCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624580; x=1751229380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz3Jdtz+LsvuzD4rQ7JolouH51M+SUxhZRQ2TBHTSzs=;
        b=M5pad53w3TvLenyzpa3oZJufWs+SzdxaylouXDaj3mkbBbEJFmiAz4zCTRJNGRqaFS
         IiNC0rPa5y7bPdsfIVeESjApcTh/4K3CEa3Cw/DJVO3fgFaG7m/HEcy02saQBATMvjGT
         HIxgh5eIOekPfLwBWHftxGELna0gG5zuItFaSGPXxqLZPY148XMI+h2Uhr442VMpdzme
         he9uGqL0iCfRCMd7fUlHi10nHjZ27lYY4D8qT+jkEPZKs56qrwmOV50dH+IX2DMlN7Tl
         ayteY4vnvqaaDIwY6aEwhLguEgy9KsxArrpN05Rrd2ljRWMPJbt4bDG0i812ZG0pnB4A
         vL9g==
X-Forwarded-Encrypted: i=1; AJvYcCVWf1lpVAKV/zqFprLJYwCUJib8KJyhr5BhTlQXi0X38CeFfmhJ6EdnwX/zp89dE9RA17tfXxsYCDUaWVbbzQ==@lists.linux.dev, AJvYcCVj3V9bJ+8ZQDrRjZLVQ8Fw8N6Hkpdyi1aeZKzl6SwKMbVnyn+aN+FSFRRnw5GmedZ1rHlrJqgXJDqUCcqpJdRc8UeiSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWiVbD/6zu6QHy8jsbQFnoQLlPxhUqb0P8UZYmG0DNuPA5OZFv
	Pv+S63AA36oDX0teIJVIuQ7iawdV+Aou6UScf3ud3ijwC5kRWlYthvksVpe3OtLOeQl/R+vlfK5
	1YnkkbUM4yoU2kVJqXjsd4iOtje75h3U=
X-Gm-Gg: ASbGncvDVb9uvv9pElW1d7wI+EitT7M9R9lXKR+P1kp1lSaFRE5FqcMSWa6YesJ0Hyd
	HMMNeCfrT9Qy+GQnUNTwwtXcSXzhbvSXIlnaYse0hDiZGUK6KVLJEEu89GrA/ICeai6M06o4Rtk
	cl00XmdDEvUunKB35fg4NfO4nwrk3HIydh2WUeJ6O3BfhjFi5TGEQKRQ==
X-Google-Smtp-Source: AGHT+IE1qtYTmD5i8tt1tLxHs2WkHZN3ZMS3MWRlSqhlP1av9VhwsiUOIXlfY7gC43dVW4482nERLdrtCfcCVeuroFw=
X-Received: by 2002:a17:907:7f05:b0:ad8:8621:924f with SMTP id
 a640c23a62f3a-ae057c5bfa7mr962698266b.56.1750624579604; Sun, 22 Jun 2025
 13:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:35:43 +0300
X-Gm-Features: AX0GCFurLx4IgrMkKza5bDYc9jpXk2K2q9Q6k47AZNNXK8As68byYvLJwDsXEcQ
Message-ID: <CAHp75Ve_3M3rqmHP5rcbwvhH9x2gUOPzezOCiNzzPp4PmMKtzg@mail.gmail.com>
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

On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.

...

> v2:

> - Addressing a possible change in behaviour if sysfs_emit fails.

I don't see it being done. Can you elaborate, please?

--=20
With Best Regards,
Andy Shevchenko
