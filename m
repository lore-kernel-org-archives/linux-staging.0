Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2491A680B
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487513; cv=none; b=cuynbM6D54PcU6wgSfZ2ZV7NBAitkzfFIDdDHhwiBLhwVA2KbV01q+SmQfdkWHlptMIZdts1AiYiOt76tqca/aDTgtdmibFTpwGXIdG0xJz/lhA94/qx+NNCStLuwNSrp4zBpm7bvqbvjpJuek+kDGlasiEKXTnP5pYY4kJi608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487513; c=relaxed/simple;
	bh=yvD8PEcSkaMImAfg/9NA8ltzcDgPBwCvX3MKqQvIofk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MffW/eRjreWUA1/vqqchMRWVXt0qvsdaoyAfTIaOi6CY77wjhmH9gOi8AtldtvH+CM7yRFVsM1FiL4DqSnIoDOmBTF1Y2nG9fq510TcE5MlS3ZNLLPAMTJ91yYS1zzngbhu5YZPdRhuZwm1BqvEpomQYKiuy63GrNcuXnF86Tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj3l0/DZ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj3l0/DZ"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-798374d0f44so79636717b3.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 13:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772487512; x=1773092312; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvD8PEcSkaMImAfg/9NA8ltzcDgPBwCvX3MKqQvIofk=;
        b=hj3l0/DZTND4lrHp0iHcCwHGI9P+Kh9MKxmTQILzG/xBENdqXJN22FGzT+TOpVpa32
         QSTvnd9JzaLp2r44WTUacwm4m5Oj5ZMkxV+wRUFmHY3cp7X101UjabuX95/+qmiuf0CC
         WgJg9ias+DixnQi1OrtJ8tX3wMWF3tQtA1dM+ktZ80Vfky14uo2F+JIGFYJjK23FBkVj
         nv7YC1RSk/8mEb4t0XY+McsVeILQMXyrULflwijMdCd5RH6E7Pf75Y1eVCDZ9DZ9zU1g
         2fDq6OfFyZAqN3AdYWWUF6wWXo+dq18dLuJ3U05YPJsdbTSqvHyrr+41zLhYR0bkR24s
         OQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772487512; x=1773092312;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvD8PEcSkaMImAfg/9NA8ltzcDgPBwCvX3MKqQvIofk=;
        b=EmljWbeB5aVzNrBMzFza+Thuwnb2M2nvMUvahbWMrF2wwlnNvXuEtqmb8/Y0zX401R
         YpmY663s2KgvntpdyE/Cvs9inuyibjusQBxZKe/9t1fEWUph3/oCNVryrLtJAQ20eFdf
         TigVJ8wEDrFwB7zyQF1VI9z50+o9buWKytDyv3hXQnHFK4dTbE+/s34J6Epdi+3uqr0y
         oLbu4je+3zqakgz8Y/N2a3QmYsBzvdpYmdq0apB4382GxAeS6HHNa9dEh4md7+PSNlzz
         U4TsYh4mJJ/h8xYJz40Wb5opiabPJpHcCJ6kbccyYK51pUECz5KBbTdhOLY/m/bdtugY
         OfTA==
X-Forwarded-Encrypted: i=1; AJvYcCVTVUlL3oFLuY2ck2tCjho81oBc/h2a0jQkkSiZnyHTaDEbVErCdFrSEBH7k0imh/PAHXjG6v+SibkTMmvh@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7PmHGL4nyULoMgAKjx/a0yVLik39bhbv/lOoHcBqJHVdbL8ex
	9Ga7UU92Osd+5xFzoieTbC1bFg0Hs0kCuJKSuaYL2qEBoE7dmA2+IDlR
X-Gm-Gg: ATEYQzziz6Ha9BqBkwZo2FGiFN9gK4HXO4K8r/ACAfHVfSpsKkbODCVZjc8wogIAWTI
	uvw8TAOoznD0Z+U3Pjup9DiZCYcnDtNngxWMI6smcEjbAk96eGPgBffvK3xy6cHUCkfCflGzofM
	1tejCmsB7NyPTcJuTU08jyE+875fJscBuIL4ju2Ze7+UNEQHV6eWLvjMH3w53rjqGagPOowd4Yl
	X1CKjVHJeNVtCN9wNomPXnWtaivQG4tpcyXOAfHkIe/r+ysso17JnL6fS+EwhuNH1G6H25sNQmW
	yGJJv9G4s24at9pqP8jsg4D9y3bWzkygP0cqf5/SpthaeQVAFra17eAiGplCbsVXV/B3FGsq+rd
	if2PC5ASzZ6aSHrYy4EwEzwrnjkLlGpKOhoEyChuAXZwFpDVzuoQ37Q4rsa+dEUyX/QECiPrWSO
	EWTjIvLaAJsSKymUWi8JSwwquFzldHuiDRBSWj9HhfNyRCE7CsRWKlHl/SKlTdD6B+5B4IWEZYH
	qrz/0tLxqqHDuLbHFuT9Nj5hOLy42P0
X-Received: by 2002:a53:b4c2:0:b0:64a:d7e6:a1e4 with SMTP id 956f58d0204a3-64cb6f587bbmr9415123d50.38.1772487511588;
        Mon, 02 Mar 2026 13:38:31 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7626ff1sm5951689d50.13.2026.03.02.13.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:38:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:38:12 -0600
Message-Id: <DGSMDKT7X2TZ.1IYKDDVKHMYIB@gmail.com>
To: "Josh Law" <hlcj1234567@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Josh Law"
 <objecting@objecting.org>
Subject: Re: [PATCH 1/3] staging: axis-fifo: simplify resource mapping
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301005519.2512706-1-objecting@objecting.org>
 <DGSM87K2CH4Z.244A6JVK7ZSK9@gmail.com>
 <0e6cda63-aa40-42c9-92ef-ce1fe177ba0e@gmail.com>
In-Reply-To: <0e6cda63-aa40-42c9-92ef-ce1fe177ba0e@gmail.com>

On Mon Mar 2, 2026 at 3:36 PM CST, Josh Law wrote:
> 2 Mar 2026 21:31:31 Ethan Tidmore <ethantidmore06@gmail.com>:
>
>> On Sat Feb 28, 2026 at 6:55 PM CST, Josh Law wrote:
>>> Use devm_platform_ioremap_resource() to simplify the code and remove th=
e unused struct resource pointer.
>>>
>>> Signed-off-by: Josh Law <objecting@objecting.org>
>>> ---
>>
>> I've already told you your patches will *not* be accepted if your from:
>> and SOB do not match, there is actually legal precedent.
>>
>> Thanks,
>>
>> ET
>
> Man.... Check my V2 patches, they are all fixed, Please..

Sorry about that, just realized this is the old. Dan's message made this
pop up.

Thanks,

Et
