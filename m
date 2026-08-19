Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79A4ADDA7
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163399; cv=none; b=mDUGWqdrqIb3sYIkLx4/5yH4W+SwsIB3OyLExmarJuUSr4KWDs5/DxM2k9RB9o061utvDvf9sNSNsQ3CCtvTK1fJljDRIJGkpgIg9oGOPF9nQy5wv0kSV0MZIJDJzuCzHiX8adkSBIJpvxkm9LG/h4Zv4tcQjpBype3i+ZkU1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163399; c=relaxed/simple;
	bh=HKbHUPzIF0sxOi/gVORJXE9q94etDqfM25thtSz+r3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEs3NVkm9hJKM75enxqzoYl9aX5RsPvaLulx+JMLydkel6jZMBrxUOimndbqRkOpRS95Jp+W8fuUvyNnDYYM1y7LBwGFm/UbZIR/IY0YpniyBGjDjQ/zy64DWFsNLcip4OuE/eX01lFitVZH7ht/5RqqJeHOAgQdaoLNKKzDwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKF4mrIF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKF4mrIF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998e0916faso11055225e9.2
        for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787163397; x=1787768197; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=etwYCc0YG/dlWmj1ZdGEpwanMrLp6se5hTk1lCrdgCA=;
        b=tKF4mrIFZdhYemiThBnJb2A7ygRCJ/l2mAPTZRdYmA2bpM2MCEkfSu2R6cKgTuCe8Y
         wQV6HYAQBfKQXVOb5SCsy6Jba2uq5ykGQSMok7OabtwmTIXz0t0MVUuWmVO/jzhEXhe9
         meOmspMqqX8b1la35TjqkLAIo+lMAqK1OCkxBqZJB7Ry1F20E3nVi+ZH42aHn8eKdTTO
         7FE/fsqUBujrMe+6KpxH9Dz3moLqbh4vzJ8w7TysrX9QkpiTZZmFaz29rMxdfnRkX/8E
         GUcK9mtV5O0JW9t1yLquDcnK8npn9RMDYvmUU2T0iVvcdlfioA22m+PJ87x5miKIzLmw
         hgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787163397; x=1787768197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etwYCc0YG/dlWmj1ZdGEpwanMrLp6se5hTk1lCrdgCA=;
        b=KUv1mj8j5qkhKQyMd/sTdc4nZxPaer37VVMD7iTUHZXUPd0720oZTnpiSNJjM8a7eh
         xqMvwBUev1q4anyYTJM0hxQEL5bvAudPJuBTY60+mSXC3CAtiy2Aq54rezYrgDI6KOvu
         uH4Ef5QF3gy0dBZC9uW4IJ8uAU1YusgOr3ibqZxWkfHDdlMJSMUjaBiD8xOcesoBzfyl
         6yUffZNoLF6lstiAzXa2UcoKSYevM1E1UIxG2IdkN1LAaLPwq5OxiMnAF5LoNxfuFtNs
         rogWF146Jka/9iZFgxoHK4a5yB1cceOhXlOe23pCVqvXyEU2wMAiSojx+X8oraXgJ6eY
         QLcg==
X-Forwarded-Encrypted: i=1; AHgh+RoKwADqKCK39TNFw4xHprlWUb5+Q8QxQ4Qbj271VZosS9HliZR+gFHVhANWpnuRwf0QtGaSsOmZC1skMur+@lists.linux.dev
X-Gm-Message-State: AOJu0YwBqpmz2HOrPT0LfCYpcg8ZTWIeJ8OpVlmsYumatxofC3O6OSOY
	QaWx28yQ04Th33K6i7clnLneDU7ijgErepQ6ymvDX8ZoDGcOCZ9jFUiTzmBfbwNLGCVGhs55
X-Gm-Gg: AR+sD1383+XRbYqVf2t2rz1nvl7oJ+w4ouqCooZidFyIHwQLv9G8e50wJ4dvQ6wEq0p
	EYFqbXVA6COBpVTcxe2KYHaxm2GSG/2oUisNIbtWmXIYdU+5w5B38LBNXq0yobquYavqS6l6CJJ
	dbhipESeEr9ZuU/tpMsUQVsQ/qidRqpc1Yp4EQkrR1I5JnaqXKSXBnHkPAFRBi311A6hJm1EEnZ
	PTbTJ/DlW6tHuTpdfb9Mn61S1d6pB6AYAg8GYUkRchPGOLEN4FD+3PY1qEy8doEguPhvATQjrkU
	2hnnNbHbQMNCCIZhxDHUGmurRGwLlVekPVcuMbKZKEKR6onXLEbdbYvqW0xalWKfsluBPAzofMD
	6AvtyFKnIYcqIlVvNSHI97mZ0qkW1axYp1KxeklSgmfK3zxv4TfkmFPgr89bbWlvcFM2gQ8Mctu
	iiSbnU0ApR5vyE2bmWEUbALx0nfUBLUkZCr/ytAKN1nYPQeceSxf1ZqW7/
X-Received: by 2002:a05:600c:3590:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-499aa14a75bmr129238445e9.2.1787163396476;
        Wed, 19 Aug 2026 11:16:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e784b3sm67635045e9.3.2026.08.19.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:16:35 -0700 (PDT)
Date: Wed, 19 Aug 2026 21:16:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: prefer scnprintf over sprintf in
 fbtft-core.c
Message-ID: <aoXzALsRLqyqro8X@stanley.mountain>
References: <20260819-fbtft-core-scnprintf-v1-1-842c0603634c.ref@yahoo.pl>
 <20260819-fbtft-core-scnprintf-v1-1-842c0603634c@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-fbtft-core-scnprintf-v1-1-842c0603634c@yahoo.pl>

On Wed, Aug 19, 2026 at 06:44:44PM +0200, Tomasz Unger wrote:
> Using sprintf has potential for buffer overflows if the formatted
> string exceeds the destination buffer size. Replace it with
> scnprintf, passing sizeof() of the fixed-size stack buffers
> (text1[50] and text2[50]) so the write is always bounded.
> 
> In practice an overflow is very unlikely here: text1 only needs

I don't have a problem with the patch, because I think making the
code easy to audit is helpful.  However, change "unlikely" to
"impossible".

18446744073709551616  KiB buffer memory
123456789 123456789 123456789 1234567890

spi-4294967296.-4294967296 at -4294967296 MHz
123456789 123456789 123456789 123456789 1234567890

The other thing is that scnprintf() is only for if we care about
the return.  Otherwise default to snprintf().  It's just a more
traditional choice.

regards,
dan carpenter

