Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413A29A0
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598741; cv=none; b=AiWajGwSE3bDML7kc/pXJpAL2+JSntX6lG/30tCCIpj/F3ilYzE/BdaIbuoWh71ZgIE9PDUPcR5XIbOJKSBqrqkzjBlGRhHrEzOzEGZt1myrjlmxMQa/ob3KL5amSUrpy8KVfExxrskRVxxYV+hKWeClKihQJZpVqAkCPJeLVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598741; c=relaxed/simple;
	bh=jRzauxG8qR7DrFH2M3BxChSU26/fzr30MFQS+Co3yB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWozhCnVazOt6Th45R1dAuFp2GehMnx5holw1XN2TcXsMs1uZxHfv9S/W6yaGn3fTlu2t1GwnEBR4wMvmPTlNfaiVwXDDkZs+jNDsR7e/TIjBk3V0bhvXauMf/P5ezunt0Ikx3P2eIGkjvSshL1+84N+w1zYt51ClrRJj2pQwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/5J6HN0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/5J6HN0"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac29fd22163so1082024666b.3
        for <linux-staging@lists.linux.dev>; Tue, 06 May 2025 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598737; x=1747203537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRzauxG8qR7DrFH2M3BxChSU26/fzr30MFQS+Co3yB8=;
        b=f/5J6HN0gJ+iCFI1OXW8MF4LWk354loXijdwzboY0Apng4lyPR9hKQstzRg8UhsXKC
         DdY7cXXdDWMi2qM6Jyldm/eg1b4vkLoEQRJ+ut/Viban9ymSu7kGAdjSuwRAWIWk9RYi
         o0S+b1K8AT4EXLu1v1IMpLgRNWgVDmwBM6z3SRf3JD936lm32rr/uX1t3XO/b4WbQzPy
         ePZnAy57yzkuNK9Prnp9XEbVjrXzbu/Xy6BMdFAUxoyjkr4RZSdyV0tAjXuzQAlNE9/j
         QmqmFSd26zk1zFT4kDq+suZBTQfxCWmsIogouNCpl6/5W8BBwSdBIyKLRjlt4cvGYjvh
         owXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598737; x=1747203537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRzauxG8qR7DrFH2M3BxChSU26/fzr30MFQS+Co3yB8=;
        b=cGrMbfHCxlG55b3yiFnsYQ4JbsMWSny9X51mV8VTYYv0fiKYLBR+tO6jFuepse43d9
         IIgqrkpdrxVlF5crOTk9s6/j6Zkbpik14p0msY1vOXyU4ZviKcIRHboHg/3wiyOs6lGX
         mRPwZnLTkidgVgVdSKL5aePCyEY7IbyXDfMJJavQLD10gtsJDZUIDBSPb4DVp/qvnVLV
         0gofO8rSvBfkZ07BHR4acoOpJ5bskL03yKSNfhpLcu90vDEsRzofgZoBCsVeCVFB+ITs
         mAbDvs5yt6xgrPkVxbOkn8+LcnIxxmb6cxtvY64DXQueOHys92eQ1GkhpGO2s3O8+x3B
         wZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCWJqwSFN+LX82RqiRcSRvLyvDwEiM/woE6LeXcrAAXQNoHKdpAs6F7OomkD0NiDGt6hWhLMibrIlmPcJXNS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+NFNE0uFErdbVbaoSvRQNYACAJ4U9QehP8FyYpN/mXb4xjnIG
	FrnN/UU0u+imSbWZxPiJuwAfr08bNBvVatpAGiFBRsHQbFIpMdt8jCNML70Znl+D83BHl++z/bC
	24VH1plRikc04uKdv7aON8sOa4AU=
X-Gm-Gg: ASbGncuXiZ3t9CCjdOgCyOc8bvDPjf+cew1o7iMoAhb6fhy1W3DKIVp8izAvEinxyPn
	6l1CyXEYig0ZR4bj3+cANhph2V0wgznL+eQGdc3eHhCArPQL6p8pEvOZK/hZKlCpUFbs8EWTmRI
	aWlBsNNgxvNvtclRhGcDkeUw==
X-Google-Smtp-Source: AGHT+IFoiChcX3Mm92XkfslD6rEY9k9x/OT7pcl49YY1UjXsKYau0uSOP8q25/rbEJUFDNgANTycINla39qXcHW9Tck=
X-Received: by 2002:a17:907:720a:b0:ac7:cfcb:c3e3 with SMTP id
 a640c23a62f3a-ad1e8d21cf1mr203257766b.45.1746598736807; Tue, 06 May 2025
 23:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250505210008.152659-1-hdegoede@redhat.com>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 09:18:20 +0300
X-Gm-Features: ATxdqUENbfJlxUl-dosBPStrL_9CYjBiZybCHXfYQAYi3xXPEImqLzYT0J-xWrE
Message-ID: <CAHp75Vf_v0YbXttzPz0H7joVc4J84kKUzZi3t-PHaEO-NS7=Ag@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: atomisp: stream start/stop error handling improvements
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 12:00=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> While working on the mt9m114 driver I introduced a problem where
> the sensor's s_stream callback would fail, which turned out to be a good
> test-case for the stream start/stop error handling in the atomisp driver.
>
> This series is the result of fixing various error-handling issues which
> popped up using this (and other) test-cases.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
