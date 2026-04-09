Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850EC2C21FE
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741648; cv=pass; b=C9LKmFfwkOlgHEoCB3EyixPWcxgjMKYo2HoCRd7de0Tm9V3bPQUiOh3ewgSy2f8V3g4FpzqXiuj2oCH6yOVnUORJfVN6VJcLzpuCc1yOuEZgNEvQY0Fa8vDb0ryE1yXkv3BxSEmO2MjpGBNk0grjufWhccLnhNNdfOT/f9sXSXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741648; c=relaxed/simple;
	bh=2PeriTX7MX0tbuSVy3tWdm89iPjHYIvNlwIK9zEkOlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVcNBfNS9Ko7mnjFXiFTjoovRMT9I0TCc09x/fMyt3BvU9iPahU08vd3h3RJ66j7z505HCOpo6IsymhO1t72mm2lDgFXJ8kXybEnSA2TQBXklHkK9JdHfAEgB97xx2Vig85NRN8COTseMN95GJWcCN1sG93ofmAhRgOmXZI6IWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnqgdRUx; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnqgdRUx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfb723793so573852f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775741646; cv=none;
        d=google.com; s=arc-20240605;
        b=SzLHHX3Y6bTBQB/INXHO6P6WbesuXsB4ruUtas3P01ZILwx8ce07hrmC/HpfcYyZZm
         h59Kf7zV7akrdMhPa+3FTfs3NzNwDm+/kGRGLp/IcQRysoHUdH6zXVmTjmRhmRbE1yBq
         6WIzt1RbJmWyVdvGc0AwiIZUIh4i3NK/hLbH7WUJT8pZwI6T52w1cH4FMbuSaKt0i8k4
         g0kwA6mURby794/7OUEeTuODDB9JZcsbgsxRjsYZ6IjDDJsbsCm+jPAqeMbp4NSCjwAn
         VMQpYrXtmUGbT6DffImNnqLcQWB5poKZ/1WTC0gv9RRJFrFUNDtMLkcjOTwBHhCe7gW9
         /VTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIemmBZ3pLlz8ppJLiiEXVO89W7y0afNwFKQfoclPgE=;
        fh=3u5S2gMZXdSg7muAk+OQEbQPLcnx7OhaXl1BXjt5irk=;
        b=RQ8yKX2hHinuWLnytW9QgtccIpMLh0j4hNFGuM96mvPOV4VEC8LzahPiKDOHm6LMWW
         tTGt78u4bY+s8X49NfRYuvhjX85AvkKDzVfoI5TlXBpsrwG8jIDicaKa50bhpzGEZkQs
         vmXcusFoYSCk+0jmISIAMJlRG8UMuIhTszMEIV6lEopAGwjD1TAT104RwqDK58XWfunm
         R+GZw1c8QB92wVytJPKzhNhkBY5EyQOL12sZsY7VEU1E4XInwHDFaPzhpWIdzVc2H1yM
         N6i7/G/YSBbMUyYzxmdVzCyfyHIINqYCsGPHkmEwFqw49B3zIsw6pSE42mpYPeWcYz6C
         UTiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775741646; x=1776346446; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eIemmBZ3pLlz8ppJLiiEXVO89W7y0afNwFKQfoclPgE=;
        b=GnqgdRUxutTTjT3QLOrr2J0ORAhvf6vXIUWOhcF/vnRsbSYm9aifzb/j7TkmxXp1lz
         C+AwHmHJ8FkR0G4B1kw166shXNnhxW/NrkWADGm2nqtaQ81GtfDt7ZZWVYT9oq7EQmTK
         TIQN0npqEr+nUk534uixYQBgrDhtOYT2uTIv3M9gZL6vko3csFIn2mJ1/JygH3xhkW9d
         Gg2dWRcN0ncISzZUT1jZ4Q5pPnvxYdPbYtULMnrBQZPw7zWDmvM8EoGDvp44xjylVRMa
         keUOpxQKnV+i3DYg0ttjXdVYr+g4od+kk5wtWEc6pAAwyaSg2cFvPbNzR5o78jOK0+yg
         ygSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775741646; x=1776346446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIemmBZ3pLlz8ppJLiiEXVO89W7y0afNwFKQfoclPgE=;
        b=U/CQBFKwOaAjGArwsVP/WhFbyBYe5mRHtE3M3jindv2pe5Nk8sCLlIzChgYtMZIwSb
         1kZonS1FaiQtQ+gaZT0Y0MsufViWOuaWdpYz7t+if0g3jdRqzbTbwkYYZJAIF6WxyKtU
         m8wY6iaciYwQEISVqx12m5aFGRTpT9LszxoXJefI1GYtdgXFCPDUU6Elo6Luc0ov8R4t
         UgbxAznPJOIEtKpWGu0AUJtPgvhBBYtezZzpN6yihtcIBajmUIeeBe9NKxG8ElLgJ9Zl
         Z0/r5HqmV3OeE/IX5Oueg8nsZEONO1MuHOvRlQFLrkCjogwBzYnqeXOcrBs62oCLCYWI
         Hafg==
X-Forwarded-Encrypted: i=1; AJvYcCWOs1EJZYfc4g6M6qjod+nvj/zhrJRBzXfAt7g1veNDEuRRkR6Fd4Or/kBVFX3emHIpDit41qmdUSeor1lI@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6wQtpqG/f/nCIV6sq3iYpw1XsRMZs6Lw6rnn/Mo8S+9iDLk6n
	E67JTDfsD4/guF4d3tu3LN0lj7UyhfKmuy6ybGK3zXsd/8xVCVCm1C2qNMVNYn1h0E3lsKpQW72
	tLPcVv7apmG2qWRi6nkIFVR5agNjkL8o=
X-Gm-Gg: AeBDies52ozDMFLz+YCbP2yaVjARUphjyXkP6QTVgW/3AGuqTaOo4IPYwimHFNQIjc0
	NxU9WLgU18mLOFh9XPSl1CpBwBabxLVrMEbBnjjXYku0eE/orDgeMOb6RNqM72kY9GyxKREMPCf
	XKyjWkN6a/ycApvAR08Td94N8vIFWb+1g6DeCuuh2l/HyCit1J0j3mvxjQnZJIfn/ecurju1dJV
	fr/q2QJoeuR7/E1safwlxIk+mfZRCUZDiDLCTHADWVJb8zg/iJfM6ltQOGT0ciRdsXJugduPrje
	VOEbiZ44vrdmxLQK8d8iv8QpW7pyo1QspBSLVqv3B25wrwn/ByCKXzovbgUtBX3WVhvTEu80VFm
	IymfqIvB1cZjoFYJfItzJLSKLPA==
X-Received: by 2002:a5d:5f91:0:b0:43c:fde7:f4 with SMTP id ffacd0b85a97d-43d5a129b1amr4809509f8f.3.1775741645768;
 Thu, 09 Apr 2026 06:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409131823.1289-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260409131823.1289-1-joshua.crofts1@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 9 Apr 2026 15:34:02 +0200
X-Gm-Features: AQROBzB7z-34upBtwQp9GXXo8paMA0qshk6phPef30jROSYsQ15JY22dxBSxK1s
Message-ID: <CALoEA-zR-4xv4UkHqZmwHodVzNu02xRTJ+RDcfaU_EbnDdQahg@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency: ad983x: replace do_div() with div64_ul().
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>, nuno.sa@analog.com
Cc: dlechner@baylibre.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Apr 2026 at 15:18, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> Coccinelle reported the following in both ad983x drivers:
> do_div() does a 64-by-32 division, please consider using
> div64_ul instead.

Apologies, I typoed Greg's and Nuno's emails in the original CC list.

-- 
Kind regards

CJD
