Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08412EA749
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784371147; cv=pass; b=HOYk84gOCMK12z0Klnvh2kv5EsmUY/H5Z+1r5ca1WP1aJh4+ztAEVBdHDfC9s1i5nMHA09H8eNrzVjaSHMjHR4xPoidfzWV6+YbeC3FOWqhOnISTIBT8v67LGqJriAjWDEYFIa/cRUB6cCL7Wt1KqMNcWCY6PVq4JB8a8i8voKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784371147; c=relaxed/simple;
	bh=8Aq/GZsIYH30vV5juA0A/3LOFGnfhbf0hAiSugt7pG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBDBj+L+iBehloWjygJIsJ5PGv56oCZrMXYdobXw4CmuAla7AqBD3Zv6J3L+M3YZPwt6hJlhuntxzurUq6MDJbNIb2MpdChATKikhTR+Xq2lukJwM6TUkGNg0esdmleEi3XWVtEcEpOG0/j0A6mnUFppVnvPncycwjn0XFbtElM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL1/+w6x; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL1/+w6x"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69e8ea2783aso487077a12.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 03:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784371144; cv=none;
        d=google.com; s=arc-20260327;
        b=SiSIwNDWd7em7XjYjZsHgY0n/8wlRL+DuHLTLVPrWwTTuXwWXoYn8qhTPysSt4g4hQ
         Y2bEc6L8dpEXCe9quUgclDorB3gd17RVmzVtYQBPm5SyDYrUurksY57M++N2WCJNjM4a
         T5b1lMVqXpRLA13qzCC8e7V268sk2Y6nyqnFAtZ4aT1709p5CoI0Ci2u2Tn+ERs29E4m
         C94uwwSXlmZ3BM/Q5MabIU1Yzd21l1VZqCs66ophO0JuzBa36zfS8mNLNNvEZzmsNk58
         7Y0hmIWu3/Bel/v0rfrefaX1FNt3ypu9OI4cAPWH4a9qppsgoNzrFlJPHkCmusDn4QW9
         H2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qJjvulD++VEURCpHeAgytVLyufur3iMQTmC2gR7Z7VQ=;
        fh=BU2Hw5lnO/MVJh0Q7xyqhl10hADf8ID7Svb91VD7S2E=;
        b=SzpELXaUyHXqEUTScY4iHxjxc1RbaF0CaNHw+1e9Uv+nKyZbKks0j+Fbii3v2wmvK9
         pwwYkrA9/w4vYI5/ohTq/iqKodHQMV+WkR5I74Q4h3QbyFYY9hiwX2Zha93VRs/aTZSB
         rsbKR6+25NAqZj30BrGExU1uJZyqvJ4GetS2v7k+AL+iXraIHUuVnjrZj5iCcHgYBKkN
         CFV4jjw0nyMyKfWiS6Z7DEARc/zOaqz+LVKtwotyVCAbBTE7QNzG+p7nB5jYD+oj8M3C
         pX3NdEUn/251W+8qKcb4uEgXeyCdVHxfhNtdG/NEX6CtYgeVLynTWkhkO1vwq9BTh0h9
         d24w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784371144; x=1784975944; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJjvulD++VEURCpHeAgytVLyufur3iMQTmC2gR7Z7VQ=;
        b=RL1/+w6x5Zp6Ud7GrTdRNPP3bh1cwUrcpnPb15UQwD7uRen9Uf62hU3aGdk0wFsMgm
         b/5p7am7ElxuVEjG3lkkMFDcm227eFdRjXCUesGfLOV9adlDFo34xCaPmKCMVE3wOOhW
         YQBvCwpSZqrVatLLcogUmrVnZ3UXc2z6vgM1CQ+082vmGex/kZLjgSXhO2GSUMHrmo8n
         K5oyE9o3P7SgYekuPMqgv6JEkNK+4gJowcTh2jT/mYD2mXNniUb5V5+pJChw+LHfPLuz
         BKZoA0Mx4+FMjivnP0u2QRNMZ0Ifo0q+grZXRi/nwc+Xux5Lw+siWdm25lar4zM+CvpB
         wzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784371144; x=1784975944;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qJjvulD++VEURCpHeAgytVLyufur3iMQTmC2gR7Z7VQ=;
        b=OpQd4y1VQTZ27vaBKv5S072SUCaBnTH3qVvRIpAaKoYcFKZmLUr40A61/IYaUCVQI5
         tPGYTOjWkJNB05tJNWPGl/qgaz0Tt2oJHB386RVvnX3G71FxQHZhjf/WcV01txF7zjyy
         kSmIyIrTfQUpA75IycubIxK6UKSgrLgBidO6YT0rNRitHdrGCZIiF0AEUvHy+rXJqZpB
         dinloCJv2QhrW/U9XAhDT/O2kCrJYP7VMRDRr53lcX0P0Luxxsp0l1tQIE+lq1h4Mmgb
         GEfkswip+arfTKFbjTSHtw/F6bbXIbTfNM1TS5yRvWQDVc+PRDzaDsABeAvuyidkIVsE
         5t2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0nE7849w5rdFCiZc6Gnmanj/m2u83lOET58hQpVwMZR0FqBiQibklnsGoQszbqYXTKX+8bU78VJ0qIOC/@lists.linux.dev
X-Gm-Message-State: AOJu0YyN4LuvRC8QPeY8hi3aALosVhTsERSLmaSagQELdHQhA/5X6B+B
	gQGhvcwfWeljtCAVmDggBcGF3uZVLuWmco4IGdV63w/Ztf6ZPapV48S3J6PNeQ1pAQhjXQM6ZfU
	NqQSVhO+7OEGzEjOTRBp4+HVaGgJ1xoA=
X-Gm-Gg: AfdE7cl8zBXj56xSAVInPhngpFBU7993Jc7NgYQrtHKx0Tq6Yt5M5ZfH7NzifY08cdB
	lh8UQgyV8O9kqVyfiSr+bIenChJ3YrzX36hDk+x+naFFfSSNOkM684q45ofLGeZ1qOP5ebRq+xS
	1R0D66YhdZZDsCXHoWgzf18iuSIAsSiPIu8LMrxAzqz87g6Eko+lq+ARt4wVhsPtFCojtOYyRNA
	nsIRNhnyeBnpyt9vjvErVITXmc4CcYsBjjQfivL3q5xaXgAjyFnmpSYHiAYWdlyaDNDLrc0IJl2
	M/PvWVBTa0OQ+xQg0tC4FzWOHn/B7WonAQppE175COMeyQ==
X-Received: by 2002:a17:907:d09:b0:c12:34f0:49b6 with SMTP id
 a640c23a62f3a-c16b486b27emr278236166b.57.1784371143830; Sat, 18 Jul 2026
 03:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718045641.468640-1-meatuni001@gmail.com> <alsSp5tAe8tunTeG@stanley.mountain>
In-Reply-To: <alsSp5tAe8tunTeG@stanley.mountain>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sat, 18 Jul 2026 15:38:52 +0500
X-Gm-Features: AUfX_mzWEaXEc9_dlpV7jH9CpyxeBMPVeiU5aDpieKtm7CrbxKF0a-_KtoDkwso
Message-ID: <CADqcGB=F6Qvk-3zQ=DCPewfpOAQvCta2q-WrfuSPanmoVqyGpg@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: fix mono image source stride mismatch
 in lynxfb_ops_imageblit()
To: Dan Carpenter <error27@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 18, 2026, Dan Carpenter wrote:
> Looks reasonable.  Add a Fixes tag.
>
> You have this hardware and are finding these with testing?
>
> It would be better to move the source delta calculation into
> the the sm750_hw_imageblit() since it's just width rounded up
> (or rounded down if you want to be wrong I suppose).

Thanks for the review. Sending v2 as a separate message since it
came out as a fuller rework rather than a small diff on v1:

 - Added Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to
   staging"), traced via git blame. The bug has been there,
   unchanged, since the original 2015 staging import.

 - No, I don't have this hardware. This was found by auditing
   sm750_hw_imageblit()'s internal stride calculation against what
   its caller was passing in, and confirmed with a clean "-Werror"
   build. No runtime testing on real sm750 silicon.

 - Moved the stride calculation into sm750_hw_imageblit() itself, as
   you suggested, and dropped src_delta as a parameter entirely. It
   was the only caller and was independently recomputing (wrong)
   something the function already had every input for - which is
   exactly how this bug happened. Updated the declaration in
   sm750_accel.h and the de_imageblit function pointer typedef in
   sm750.h to match.

regards,
Muhammad Bilal
