Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586E3C65FE
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134584; cv=pass; b=jf6o6wE8zyXv7GY7D7nTKwojw7aHWbxBdBonnsXR34bSCZyqFlOw6wUimaaRS8vISuRT3VvKi0r4NeF7JxlYQfI59znvcLmwyOBoqG8GI9nOXZs2eG/usMBZNtn28PFeQtwf5o2jTDSjJM4TzD7+Rkxoew8wvNyXlxTnBkLkjpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134584; c=relaxed/simple;
	bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZw1hL84HFVfU6gfZzQU8Mo/0o8dGhbQhGPYrO/djzu9hUoHv8Nv2rkUta313Wd2kEAg5DQARaAb01vxDgB2RIbc/+On18weg5mJDj0bn6H7yMJtz9s67qpyNbfFvWNOqbN/V3pjnJ+W/s+FYN7CZ9UXTt/kzBylKe6xEgHrU/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbP/8aMT; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbP/8aMT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfd832155so482349f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 05:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775134576; cv=none;
        d=google.com; s=arc-20240605;
        b=iXORKys2cMnZQHzTBFj3HTjluef2lZ9eI3yMBBKb84bqdzojakMw3hkk/yTyCT1GjZ
         vMTecqoklJvjDSEWCmTYY3VQL+DFx4rJtAIkwoFiXf2Tpc+9i9uoeAW+iozYbPLKrEFm
         vA+FnDimiJVDqGY4xsGhkdjvSpx2MHif+r0Jl2j96X1ue7WeXoqwxuqK296k9YaB1mIc
         W18nscCJb7UT0OFDJuejN0Mu2sApXBGmZXDCyXQtsI6zikfdWHS8i+P4Ke+cR4I/NJC3
         SR8rzuARkMQOqYHbQkFKtTG2H6uTSRsgG1acgctuEuQruP+wSNWo9XAeRXjhWnVoPD7q
         KMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
        fh=jiwVPOmV9tSnjYnIYRFud7CL6ANQmKlDkxfhvklB7RU=;
        b=kde6vrcj1SPDH4H0QY/j+u3pzIkqcdYyTgvfkw8wK/GThJstUcEI6gjCprWMRYeFl4
         94ip2mdOq1bkisKAJq1f7lcUoJ1RiHwubDHGdpZFC0EdwJeH1R8xEyNQeb90601bFV7R
         PX6zrJ6O4O0DAOOGswXxV/dp+KYR8f21oU3wF5PPDNcIhZRr4YFaTBjQ3MpcbwPu34Fg
         yVNbKCjrBbuKEBJLUm1Ftad8y6ossvK9KRaCwqKWZ+qbgpph4xTysBLR9tPDmpr3MoWu
         9SHuKRwCn1Tys0XoPmUy++pjSwcmXpjGAAB/+MNPdX7KB95pgrPAwJxkls5Yb5Kbsnsm
         sOYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134576; x=1775739376; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
        b=KbP/8aMT+dviou/ozLU7GAbtZnEndhxtiz6dDl/K11vli3CzMFwRn0dP3AUM9mNypS
         91MKcZFvQEpJkwDJjTjR+77D1UwPpFEQU2kDIB5eIGOpe+1tmDFvrq3Todf7WK58Q/2g
         DkrjQGnAZiqa6jOeQIzrQVfjM734OL18+HZm6+NRzgYP+pNxSriyd03h7q4La1Uu+c9a
         UnPLVKQi4avYNrad1eDUcJ+XHxdvGrYUsvgsKY4m7zdmHljEiAJZNlgkrXeaZrQN7dTg
         UzvrEJlwlT/3v4Eb9WHYJ+9bNZiMlpK/6vpyvpM1r5xhW7G0JTI7OuFT9sJTIxrqa5iV
         4A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134576; x=1775739376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrPcur8rWSRDc73KraqkFzZJG0oRMgLEMHmKM0GgjEQ=;
        b=cHFKG8oAsUZwxlepGuMb0g9WYQF9/uwzp4z2hbBZzjki9h1lRtait4vY2W6+yMTmMa
         ws3E1/aUFM+vOdqcDAN+aKFzsC2OpKr/38LaMJzqWwCzLUrY+DWT9gPpEl03tYgRn6Fv
         vYWpUsYStObh4eVNEw0aqt3eK1U6dQLHdNFnhFm1u2g54Su96wDKBOZPlO0eTOojJaF5
         8S6rLNOH5HzWCryn2IxjWywtexCuc+m5FCXDnmdsdQeSzGsFBKssdEC8hLavF+hZknSS
         aHT7a7T0Ngj4ZYtaWLhZS/iLq9y0CsR2AIBS0J8PYZzouy5/PpINIYucXkOQei56OFo8
         S4eg==
X-Forwarded-Encrypted: i=1; AJvYcCXrPjTkwO7SsltZPoJtUO8Vxzo/15E8QZbVzA+71RUzJiVr5I+R0RfFONKcm3LVhHTtBCPJPKYEDMsiC7Je@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzy1kJu+OyZ9iowdgWYqSo0gYzT/p5ce5049jGB2BjGJWk9T/D
	Wfq0ZpCPTM/4pwKwMFOkchIr6HYMYW7I2CKIPPjNy6fli4O7V7G4XdWnm8cJNIkOMYnCcAq2HNj
	A3igKTJfsSt91cXLCTWHLlPCAv/5yKp8=
X-Gm-Gg: AeBDievps0TVBDTxCyn+kXV2VG0IC4ElgvmfX72MLo9fxQpT0/k+URz/CyQ5RkpJxpd
	nMdKbOd/Uefd69ZOmS1QgKLBgJI8DMVzPOvNNfnEheyHULRl4SMpgfUNm+ZhFJl2KitD7d4ZgWp
	RIWdO3PWkycQIxZevzr+6ge6W2rAvDa0ACLkeQIv+RMCVaoKB7Z09YS12Do1JCgCuRa/Vn3+Tsd
	297PAMbBkYP6W6wJum/XMA+3F4GGTQSToacCYfYQaa3LLaAd+WJFyclJVDdOsVZsRnC9kyadL8U
	6i69SfX0VH8gJ7vjJ1o7kqf1G354eul9skTaU4auvIJev2/91/JdvBwlUygUqVTsKYOJbPnxZjU
	sbK4kIUAVTyB2nYuCzgCW1ULdyw2S7IRzrvsH
X-Received: by 2002:a05:6000:26cb:b0:439:c040:cc8a with SMTP id
 ffacd0b85a97d-43d150b81c3mr13568988f8f.32.1775134575741; Thu, 02 Apr 2026
 05:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260402091827.2163-1-joshua.crofts1@gmail.com> <ac5mFkf5RIEg410Q@ashevche-desk.local>
In-Reply-To: <ac5mFkf5RIEg410Q@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 2 Apr 2026 14:56:08 +0200
X-Gm-Features: AQROBzBQiobo91bTvzjKKMtSIQnrUjZDadWIkQdvPePCAeEFxjoQ9jHpPmctU2A
Message-ID: <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 14:50, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> First of all, missing period at the end.
> Second, why? Does it fix anything?
> Third, is this the only issue with the driver of a kind?
>
Hi, I was doing some checkpatch.pl work and got a few check errors.
Wasn't sure if it's convention to group all check errors together or do each
separately. Apologies for the misleading commit name, i'm aware it's cleanup
and not a fix.

Kind regards

CJD
