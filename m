Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1C277C9B
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758267; cv=none; b=YNUi7IDmmVVgo1OQTAqzdzAsHjOsuE1kHUy8EfmPptUrjwgWfmOIsr7/dUjfxazxMcQo4KgA290NbmDJecHPIfJZbVUDdcsfWxsycPJ5qVXw/iY99sreLxHCVLf71veORii23PqZhArE42R8WHB9GQmwSgbV92WwDjwwl08u+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758267; c=relaxed/simple;
	bh=PhYPqA6hOPWR2DVP4gF6Ag53GcEYP5E9kKRpJSRcAGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lP0P1+mjmkvaCKAVXLaxSaXIrdk5o3uXuLE3UMC5VLu5WAoRXu3eWtVHtCnsy87kYOy8Tw05hP5QQTChzP+A+IxyJ5maiRp57isGyuxioDx4htt+OmdBZ7sMBkW4B1OUMmTjoNEguIhrWj3FWks6ruE7jvu2+I5k3h1VRS4nUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8ni46lf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8ni46lf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24457f5b692so6740195ad.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755758265; x=1756363065; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhYPqA6hOPWR2DVP4gF6Ag53GcEYP5E9kKRpJSRcAGw=;
        b=S8ni46lfwyAHC8JOR4cDntuzKnmHgJUv27/T2GI5l23oeErJOjhWEeemR2EFxPjGen
         qNm6EAlTqIomvqfDseW7GOWygZNrIezpPvmdPuucmVxzidSYDzDdzZrT9J0lmMDp6IIO
         g4RkpRKVGsUS2CQ/xszwSwlkvBDVNySeDufWCRY1ZWvzQK9vkHJihYebdp0uHprj9qr4
         uO3qCAnBqEiT6NlXAxYQ6/q9/lXVyLLCzs54vXys7Q/21s73m4LCt+MiNYKRuPtt+nss
         0IDL+OUXn8BPbEcl6V1c39lr0cd2HqANZq75wxcIgK7yLkm4QP5nEtZHoBHijdf4ArLf
         FPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758265; x=1756363065;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhYPqA6hOPWR2DVP4gF6Ag53GcEYP5E9kKRpJSRcAGw=;
        b=wCEEoXxDHXoDHdYqDlIk+yPivYtgDTW4/50R3PmXkRPc/1eIm50Xk8bCAFoEbaEfdd
         FRlOMKwZ1mf9yIez3aov2fjD1KLQjcfsNz/YNE+KhEwigxmtYlf0MmdAvFjueFuBI4pl
         B+M03Qvvka15RqfhQ6YxqfhnyWiic+VqlGFg18a1A5OfZhl7VNVMdX/DHITBZjwY+d/8
         lxpc9LsJS5ZTxbb1JvuePhgwY5aiZI+ZOnp5ZgbdwIHTHk4LGZZJ4xfxdju20PUbBQi1
         BKxaFeHbRvnlW26V2QeS9amBbdfC0gjwyWK4B9YMh2cj4jAPEhRrBIxB0fOGKElHA767
         uVjA==
X-Gm-Message-State: AOJu0YxlrkjQxofZWSkMCwn1Sj9h2BIzv06RIiatsLpfEO7pSISlCdmM
	I5p9kZ7L1k1I9P5JLHNJMLSvsuKzUkSiX9G9WpYmquEn8w6AFjzx4522gq23xt3w3x4uxg0Uwx7
	7bT5etg4wRhYI1hp7u/RB5EHNkZTpUnvlLzzyQsIH6sgdr1lGB3netcRbVPw=
X-Gm-Gg: ASbGncvbmQp7Z8tenUv8yyf+nR8qub+pdrerlsDR0Vd51BweL6WqvBleErb0vLcVxPk
	stbGWHrv67KAmVNE0oPz7ZqTC1xPD69cgGw68BioL5KOTB993YDi8Vv5QYpqd5Tmyac60fYbR5V
	Wjd3vbC1nkWyOFerBfnpJcTXMNiZfICOigPAIrdTXibA6+BXVbDtFCUW62Y7mhijl1bsrubrupc
	uXc7mN8PPFZUqy2FAZTE1eCwvjTOGjCPNUjl04G3/zlvsKTFHoHrR0zEcyGmHOv
X-Google-Smtp-Source: AGHT+IHcXpaYUvuvHbg97J7ktgYhoFhHlSK61tRa5Gn2HGyAhLpvnvBPUNwdFiKjC1PzNYk9gIJ7lsruTzjTfjL24bQ=
X-Received: by 2002:a17:902:c945:b0:246:61c:a67b with SMTP id
 d9443c01a7336-246061cab36mr14478945ad.58.1755758264921; Wed, 20 Aug 2025
 23:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250820124519.2287171-1-abarnas@google.com> <aKXIoFpHUjSdCbHY@smile.fi.intel.com>
 <CAATBrPGqkuLrVhKi8aj-tugZNVMD3kqv5_v3WB=kJvt4FVtFzw@mail.gmail.com>
In-Reply-To: <CAATBrPGqkuLrVhKi8aj-tugZNVMD3kqv5_v3WB=kJvt4FVtFzw@mail.gmail.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Thu, 21 Aug 2025 08:37:33 +0200
X-Gm-Features: Ac12FXx_26dv5aIj5KUUthDo_hXrvOsEk58zD74CpJhjgeW2kMIsNLP7aELjdNM
Message-ID: <CAATBrPHZHtW0Omp=KRskunP_2QFezb5DRRQXiCFzW0YzQcr7mA@mail.gmail.com>
Subject: Fwd: [PATCH] staging: media: atomisp: Whitespaces style cleanup in gdc.c
To: linux-staging@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan, Greg, Andy

Will fix the message and replace the tab I missed. Also will refactor
the unnecessary forward declaration.

Thank you for review
Adrian Barna=C5=9B
