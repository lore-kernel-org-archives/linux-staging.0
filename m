Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C74370AF1
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811352; cv=pass; b=Q0mbrS4pRYlMrb2FEq6cJPM94v7pUyw8WaeRzMpWROUPufP4lNlTBi/qPK4OhoUk2jPC7qGOIGLVsVrlHGFKqCSKaCk7lxvd7lNZ+xUg6Lv4E5BqNJpob23YIUjJ9Zt4lBon74eEtUZI8EH99dNGD9W0fQyD2vA8YPhm5zK/Pu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811352; c=relaxed/simple;
	bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h36yJFrhjCGitqOLF9E37FzBTQwsW7Q/dsLFbN+NjR4aSKHbf9JvJwXGUGdP7BfE9PLzrfKRprYAtRAf6Yle0lZxMiAHScrofzobcIGFqhwhT3CvWZwXZ76zHxUEYvfUuWOFu6k2k/AIvZ8943ifGCCAbEXWaHZcpXKRdvnz428=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC8ui2sS; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC8ui2sS"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a2757826b9so830381fac.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 06:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811349; cv=none;
        d=google.com; s=arc-20260327;
        b=jj2K9Fo7k6w2gLPpTn4itDzXkWp3uoTVgFxfzI0+bpdFqMKum1FZm9QL6uaakUTV5D
         s6XFlCPfD7dZt5vDBjtEJ+yaX0ZGEkxh07lLW/6Ja1Kgp5DdHMfnszsxdoHnnCmZtceP
         XHNMNEN2MxsUQvX3z8vsA2Csogol2dFQtPHKLXaDafSuEvrwvj6h47ZGNJ6AbfCxJyzS
         i9Vyux2Jc+L/oRCphYp7iZWMqld/PIMjUuni2MxO8x4fSvvxnKlgRzwwSvYUWF2c4wXz
         a00XWGPHjRuZHZtpfQY5rxxiL3c1sJZMjMRyI17L/R6l6FuhgBtYOqb+FXv3JEVujj5T
         YA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
        fh=YKyxFqDRfeKHqCGzAhhPKKKbt/00gRj8ii8Edl3+rR0=;
        b=GpOQkf0wKJTviH77QYP4JCST6HilOIwrydHF9aDfPzpWGerQCNsEfYH4iELZuek1RV
         QINg4eJXJ+pFtw7CnNAXTYCQZdDxO7SEANdchHNPrEbj33WIINyGUylTybjZtd331P9i
         8Q+q0mJ6K0AWO4p80qihLEPEdjHADCCVF4xFj8lKWwP+NE5iUrri9wb9URJgEDT2W0p3
         a9NPeDBWKpKyfLYNLQgMmBeHrXGL1N84b1mSIxX/roHPQdsuxxggT45pW6j0Vm92lBHq
         AuArVknO0trmvaCg6ujaXzSLTcR5gQaN7PSfwyU3RpLitgD2bJmJ0Vh+wA6/3+iUj1L8
         uJyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811349; x=1792416149; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
        b=JC8ui2sSFldQQxC/TVN8JJE4U4U93T5LBTkpvI+0+K3lA1fTYZRtnIWn3ymNN3hoC8
         Dho/m6nCLFBi1PIIjN4c9p8r7f2/4xZv4y5z4n6lCeT+BqqjLgaj32knrs701WG3wfCZ
         sh/pxRyNs8PxjMsFagfz8Qq4k+GeYpfHETXw1bGDPnGbfTXoAGGFiXCG7zV+S1Y0a5U3
         dlBkHUeOYxOSXq4TrYH2SGyKM8oTyxI1ehOxn8xhOxyGEn1dRf7NKPXszHpjF0rhK39Y
         kiPrtHz7TesEKMSvWv729VOHtMfvdxQWkZU/U9Mhdq6GcZB754+sXCmpLVaYy6obLQBN
         HuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811349; x=1792416149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wHRi+Oc404e7CHAB2GIYQFXXtTwKqetx40dVUrZPg5I=;
        b=IA6CPzxsQREyhQVp7r2rLVaRAUDdbsRgQuu2BMZzD5FFRoknkkuUSFO0uvrn9LKUcs
         f7sD6G73c4cOrDWkRkcM6hK40xWoVFzu9RQvPDDRWmhdJw6NJ/dJfRdyev3BEpa9lfuV
         oQGnK+6C1NQMFRMWHSFmi+hmXV8UH4XUerLSb6i+vChBJSOgKbQBMkI5mYMo13aFjs51
         eArIdc2E/OTl5F+gM+kgkkiexfOZGEp3GpBTICNzGiBRYPI2mXeu8aY/DnDXcyYiima+
         IWmMpyvLhuc0iiTS3nqvB3xcibOzgccAVmgDB7QuTxCGZf6D6wii5tzh2PYPVx7HsH6X
         8K8w==
X-Forwarded-Encrypted: i=1; AKwUvBxUah9X1ZjpOjkgCORXFmfPXsEM6oYt+lrT7tH0SgGuK3xaYqQg+otVkqXZaNm+cNTTEM41WfVvcNqWLof8@lists.linux.dev
X-Gm-Message-State: AFq9FYLX12+vWpKC+0Vjk+9zUiD2+ADA9SXeyjmkOu9m+NBxylCsYBtq
	CKf3sz7CrjUlB5sEJkx0ny5V7egqjVbG+a1r1Irg5apglRgkjQwf9fidgfYwFLz1o0CTR3gtn7L
	t6FzA2Zy6DoGCdNV3aYy7a2WRDrMNXDg=
X-Gm-Gg: AYBFou12cM0uPcY4wHYec7qI+P/y7T7dKgemrcFP/h9IYmbeLPYnuE243jedWvgj62z
	6+HZjQkMYuCHSAkB93Eg0l1vBx4rtSysMDuvUv9kNKju8ZAextSTxHTSzwzBiKx+QK7HSn+5Xjs
	2TuU2Sco/O0EeTaD1X5QgV701PQbJRzTxW8kFVkbISSsWJ/wOnD7r0Aqy8DjChbKd6AN7hqRZXy
	+4GzDIlDW/gqmR86/GHAqwiS2zE98OQFzoI8ed936R9eDmkm4IpEccg16Cw63mvIe+h0z5Pg7Ie
	GumVYWvvLiipRCl2abs7lAHdW0ud3TM3sV4XHFKPFLqfObmk/VpV5hmL
X-Received: by 2002:a05:6870:8929:b0:49e:f7c:fa52 with SMTP id
 586e51a60fabf-4a2a8a649a3mr7055634fac.36.1791811349384; Mon, 12 Oct 2026
 06:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-3-abdelnasserhussein11@gmail.com> <aswW2bAapx3318Zd@monoceros>
In-Reply-To: <aswW2bAapx3318Zd@monoceros>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Mon, 12 Oct 2026 16:22:18 +0300
X-Gm-Features: AclHuK8W8Rlm4uemP4cn0xb4FiJCWYATf-Tyo02d_DefuCSU9DtfwEC-86YeR0U
Message-ID: <CANpqX3YqJ307B7p_q1UsZco8MEfO8-rGdaUtRsa20KahxpJ9RA@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com, error27@gmail.com, 
	narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Uwe,

Thank you very much for taking the time to review my patch. I really
appreciate your feedback and pointing me to the correct headers.

Your corrections are very helpful for my learning process as a
newcomer, and I am grateful for your guidance.

Best regards,
Abdelnasser
