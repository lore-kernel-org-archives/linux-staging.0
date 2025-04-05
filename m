Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9826E1D5CE5
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743847749; cv=none; b=U8EI2llSRbU1QuHyb3tNM9tcbGjKirENB1fqE+u3CRJk5OJN9/uC1EpTU4pNI+t302ShAfFbytfEBtmyLKBvUXYMkG5g9A8oJcmc/B4Z/0SFSssYnabFXOR2T/C9hwVYKtAQbWXl1Q3EIJ0f7Wqe7pvEZlBYTo1muOnCMnXgPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743847749; c=relaxed/simple;
	bh=fGaTrB5oih+12PuhnBL5Qe55JuLREZCVtfXruGEhLTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KyLHqYrpJ9ZJdqzpiNs5AGmiJ0ItlJXccl8BHE4tPBAZbOsgu5X8/3h3WYuaQPWI5SNRl6mWe86R3kGs2vWSIG7Ib+3PFae4m8cSyn4CujmoPnbrZtF9zY31Q7qeg13i/9SefTW1/Vt2kz1HFvRmcc+9jiuf9fzOx5/mDpMBVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZbXtgSP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZbXtgSP"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so5699945a12.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743847745; x=1744452545; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGaTrB5oih+12PuhnBL5Qe55JuLREZCVtfXruGEhLTg=;
        b=UZbXtgSPYIRTLIEe5OJ5TALd76jZJiHO0FieglL8jlEyi6o2lv4SEd3D4IoxjEgh8M
         kPLE9LyrsO5Bo1unkVD/zgmKF3+01YrIJjHCmMOo+TIYgYrYHhchf92FoVEkFJvbJ8Yo
         EspoHsvmALGVW8ZOGIRXlhAzJjtQFdDP4SyxeB1Gk8CldFrZX90N4ShIcZIBJRXpI6P7
         Y8rwjnaddSC+YBM/luwq3LHiFaUTJYyISynvRNllJGA6yuJTh15p2kdaIjQHCgQ5WtlK
         LBMh+U4ydeVfNA0lmmnwFd0qn52nuVqEUVHrfnIXzRp4Wvm1Hhty3pC1P9SVlgWJPFkv
         6lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743847745; x=1744452545;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGaTrB5oih+12PuhnBL5Qe55JuLREZCVtfXruGEhLTg=;
        b=q2zBo3pf13L9VBC24bg14e1IffgucCwTCsAIiI6bnRsxICfWbVGE/GCSBy4FIUUxCs
         Zl9+nUl6NBMcOAs44KoNkkFMA0vlEFYGNmKyA94xb+XyTtzV1Z9eXnARdTVhDlq48SSC
         ECpjIz75lhJtvlTWfxkkoKvN/SYUlhzz2gZHQ5WWrKYq0kOEI6jjOY6gGzecMdLqUhGG
         hxrBtZQNl7vrqfHWE8lylQHTMBh1Qv5N01cuOpPSu5Lb1C5jRADHGE26k+qEopeeYiG3
         MLmhqvObArPLD8s3AXcIZJEoToVrf9AJB+0WwNfHvNrmCUWjX9/XRoXDN4hjKD2x/0gA
         MDOw==
X-Forwarded-Encrypted: i=1; AJvYcCVgwdO1wcLkgXVdSSkYPZx10vhfMHSq/qHk4ILPPxtHmRI3D2KLT/BjDqYY0HLNymWlgBC58iTvz55tPVsd@lists.linux.dev
X-Gm-Message-State: AOJu0YyxO6joSL0fI471MrdjMmCCowpeyHiJcKqT2JOMx6aUBtrCw5d6
	BigPQD0hG91IFvHusEf2FDThl82XyvwSeW9kcYojb3LYg2qM8VSN3r2/vy3ExlXk+MAqxt/d21I
	A+x9NxFUGRL4PQyNfIoY/bvlMpA0=
X-Gm-Gg: ASbGncvhBWCamT3vOc2/0rD+rJmYQrvYgURfAWLZu7iq4Aeba2AD81+0B4QjX+bvAwG
	pX5vtkJILS65iaCLdrvnRt9R3i1aKdGU0ywKh9705RoJtqH6JgdQrgwnLt0OF57rPaCPl02ATi/
	CuHrJbDErUa/YIRD9zuN2tjj+eew==
X-Google-Smtp-Source: AGHT+IEtBG6cEhDYACphqOPFb+zuFQGv/Yn98G+ufkJiWugDbYthrSCzqMMX2xbYKLrgtVL37wmNk/64SlPv8In6SJc=
X-Received: by 2002:a05:6402:2682:b0:5e5:334e:86d9 with SMTP id
 4fb4d7f45d1cf-5f0841e7aa6mr9124954a12.13.1743847744651; Sat, 05 Apr 2025
 03:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67f0f9ff.df0a0220.33076c.f0e5@mx.google.com>
In-Reply-To: <67f0f9ff.df0a0220.33076c.f0e5@mx.google.com>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 11:08:53 +0100
X-Gm-Features: ATxdqUGx0SOhwurgXEVnAhGv0GSiFsIfvW2iCASBPpp4rfdS8bnPT2PTeAb_8mg
Message-ID: <CAMyr_bJpE=NHi4bS=_eAWcm1gxKiKDA3YQ_mYRCDi3tjuBjknQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] staging: sm750fb: change sii164GetDeviceID to snake_case
To: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 10:38=E2=80=AFAM Richard Akintola
<princerichard17a@gmail.com> wrote:
>
> Change camelCase function name sii164GetDeviceID to sii164_reset_chip

Just noticed a typo here, would send another that has the correct
commit message.
