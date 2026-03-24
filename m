Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E04406266
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372858; cv=pass; b=GZY/SKSVch8uw1liymNkHs4m1sdA4fo7AA6YY2mG9+8vUvhkIKC0UyOCeaJO2yc6zrHOEwUHbnQGubdpiRjriacRoRGUQ9Up7GMzs99qFbp04B7SiCPgOPMPeQjEuqQQ8p3s6zn4azCg8lcmqZCPe73JN1KAPNK9+EP08eE8h+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372858; c=relaxed/simple;
	bh=WCBe6xC/pB6p+aMNfwKmK2EHutkGGduXZX/L2BqsHYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVYkcE7rjYh8+YjDxZILWO6fsEalzGZh64nvsJ1H858FwO4EAuNTY6RW+ewMPDG4eX5YWAIp7/pgFgBY2j7ecAAiK0XNzYl2oJUk33ABT87zQHUKhqHH44MwoOWKCxSULeyNRblXb2p4NZNPV8W9U/75eXtWUiJjsSA/07FLm0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reQANzA8; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reQANzA8"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fc4425b6bso17955587b3.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 10:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774372853; cv=none;
        d=google.com; s=arc-20240605;
        b=kdr3faJf3ZSOt15rYtfmU2j02usQzVqLU0Cbxgx3H2v01wDFdwc7BCLsr0USf+IX2p
         YOsL+F6VVY/LLOvvXMxm0IGg6vZOXVsRxQZ4g5mRCbtHY4wLYzyuAZWjHStSO1hK2rSa
         JDdu+JFDbbjVKJA2kPZDx03XPyWxJCd077bHUn1G8gFom5hxEGC1mXOW067QqZBJwnXV
         wdK8B2Z2exzzENF0ArlUxcj9U1rQUrufVTaK4KYV5mEZJ1qT6zr6uhZRka7Xy2d+bntn
         /9ILf7oqP2pYMfu40+wWQRds6uJkIQ6B/KKihaCZlYw1dA8Y4PBuRlFr0wMz6PAxzST8
         FwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCBe6xC/pB6p+aMNfwKmK2EHutkGGduXZX/L2BqsHYE=;
        fh=r8m9tplnFgibyzhf924vkYHGCD0x39qlB8+oziiyXs4=;
        b=RpPsDCLWC3Oxhl+h7ZjrbG7xNhCQvGmOqdzqgCRKWBkG14JAw+8jIijCU3qpz/MowI
         xq3TUXW0rsMKz3vE6UIx9zJvQWCC+S1alIknTxDKPn5J/3IAl/L7/asmv+TiR7zVkeUq
         gKwcnH9kCJxQKxtPE9K+EXiJAFCkjll0aCdFbhKd9HGsSE1muKFQDRcl+q9VjrfYar08
         OSLVk/Tx++QUYxIM6xYAqVg8IpTvRawInsdKFwa4q/UhxfOTd6B+4YYWvG3T9K8nqJMA
         7zuNcQgiYIsseWVe8PUVbX5gK9cA0sDksu9qBLIQ7iljwedZQ01PTtxeuosWRJkgdFr7
         yIHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372853; x=1774977653; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCBe6xC/pB6p+aMNfwKmK2EHutkGGduXZX/L2BqsHYE=;
        b=reQANzA8bSj+72asvmsu+nHnwlp9uyHV0oLG2qTmMmyR3bfUvBIbZlmDZ1k8vWG+M3
         E4Ne4exkwbt9/3uIKFA5qMZwvOWNYWGI/JGMAFQJO76Zhxk2qV2bSv7ySGV1NSbQXJ+H
         HWCGCzm1JEmYU68CPuAq23832KAu6E4RePV+X4K2u6P1TaZ8YsQ5uKwQ10REnuMaAfEa
         WlSMY2rmR31we991I04qJ20Q/0MpafDZB0nZeRdVonFBLoVC77BqCffY70z7azJ+2tyN
         iNB5IpmqAWol1liopkxeaavescrovD6dG9q0lI2NB0kR6NOLO9d+Ff2HQojK/oHbyeGy
         aJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372853; x=1774977653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCBe6xC/pB6p+aMNfwKmK2EHutkGGduXZX/L2BqsHYE=;
        b=e9bL0UxRKWLwxZiTsOpeRGSSJuJtSNyVlMWL0WUBBb1tduBtzya4ea4PzCrZN0KUCZ
         I6XD6TSZzm2TvDH6OEKipwjgwmG3vYL/pGsk0uAWmTivr1mQ4qTENYJdLf6+VfnCzT51
         /RyYd3pu6j+4nMOMOgFGODrq11Er1vfGwf62RLXZpTZe548Zlg3mvUkF1z3lhv8iXvVG
         bF7E+0PLlmUWaMx0kmR1Hd5Hwe7FuHsI2xkiuQFj1DwbSwx1zYBbvwy0HBR8cWe7vUkU
         XP4JCOQQsEdRi2kG7hEKY/huKhhiPp49zNYIt9WkNdP8AxSPlfzTOqaiJQ8KNuFryjLT
         4bYg==
X-Forwarded-Encrypted: i=1; AJvYcCWzYFxrnaBPhL3tznhhl5590APmu1XjCXrF/e8bOMRBsFCuX3lIiPv7/d4aOiuVUfE+XVCiz+K0lEHa92+4@lists.linux.dev
X-Gm-Message-State: AOJu0YzrY/3Ow77bdZE2wCSFVZgCZ8CyB7YPFTBrSxfz23tCHhGmSe3x
	+0Cc+B3f9OjyoYaTBYzO8AhG+ESF8bLfKSf2YUxnAQQqHEhh9SSsA++7P7ksAZbyGMppkM2QDZb
	EaqG/EJOZE+hTmiNtC9/JaJ6r9rjDffs=
X-Gm-Gg: ATEYQzxiKKtV0QPpFC+1FjiNm9AK4GeAI292f3O/n+j5oUl4CnnAwBN3eJuxunOI8Mb
	lsgvKVP9LKEjmsTTSTitWN6ahnskYzclICL0yFPOGPtSOfukSf3S5qhCFhjgiaMkcPslObbfJhC
	ZvltVWrn1gn+BEPc9uksZtH5pe6ve3K5hDABcMgotdmQ5gHZTyv994hLfMoY+ckrM++WNKItRxv
	3DTlZWVoYhsQalY8L7S+GOpVQBWo8rwfUnTy/WTn3QlXnZnvkVa9U392IG6x5u5qEYJeCeI6kk/
	aaIpkSWyHZkCSdSi3sndqF4uUc2Tm1kfc2PwCmr8FDsgk7LyaBXytnEtSu+B0/vE+fWatqs=
X-Received: by 2002:a05:690c:ec5:b0:798:138c:76de with SMTP id
 00721157ae682-79acf6c8528mr5404347b3.41.1774372852853; Tue, 24 Mar 2026
 10:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318092715.42538-1-architanant5@gmail.com>
 <20260318092715.42538-4-architanant5@gmail.com> <20260321182710.1621d1aa@jic23-huawei>
 <CADJHxWADo9rA8vt6EEVLXSBb9EqXvyBg=L_YmusaMdtRnOr0rQ@mail.gmail.com>
 <eaaee132-d5ff-42ff-9f68-5d6736127caf@baylibre.com> <20260323175519.00003b58@huawei.com>
In-Reply-To: <20260323175519.00003b58@huawei.com>
From: Archit Anant <architanant5@gmail.com>
Date: Tue, 24 Mar 2026 22:50:41 +0530
X-Gm-Features: AaiRm50fVU4XvLJ1Cao7roR1u0mpa8WhOURP1OasnKa21QaZVfaQKrpJ8vLFHLk
Message-ID: <CADJHxWBXTorkb2BkhsjFCjN3cL+QcDKGg9urQPUou-d2r2TktA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] iio: adc: ad799x: cache regulator voltages during probe
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, 
	Michael.Hennerich@analog.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:25=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Mar 2026 09:39:44 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
...
> > We can't do this unless we can be 100% sure we don't break existing
> > users who might be depending on power management working as-is.
> Yeah, I missed the use in suspend / resume for some reason.
>
> Not much we can do to improve things :(
>

That settles it then, I'll implement Andy's style preference changes
and send a final v6 shortly.

--=20
Sincerely,
Archit Anant
