Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00971E502;
	Fri, 28 Mar 2025 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174499; cv=none; b=Jg27cSWlfHqRCFvTbMPDppJVKyPd3pLtTMbFMjcmmhDWMODqp9ViZW3TmIZNUcckv1DIJxJDLkshtaYs/wBL/vhEWJn64RqCMiCtxN24zR+/E0eYPZFAac9KJkzOArNiPW2Iw4QSt0wqQdK+Npu29OPR7UMf9pB8/8T4NvcbIT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174499; c=relaxed/simple;
	bh=VGu4GrSQiMMLBzkfrV++9lmmMOpw3tUoYmItjCf4DMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJTpV1MrJ0wk+H1aIk4/8V80hA43q+Uci7lEiinkyGFc5GfnEVCktgG3DP2N4O5bmTlNbqUTczuCMGwDtwnk4CjZSbQaHk/7p89bQE7lNxe9dAIMhVaYwDoKsYZqyRd+f3KrvYy/o6Z4HpFLCDeNbVx5HD+Q9xtAnhKkNieVb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+6HIF/a; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+6HIF/a"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d3907524cso1006299241.0;
        Fri, 28 Mar 2025 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174496; x=1743779296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+juXaJ8LOBmxG3pSfp03xaOI3VThFEhwmx8j2LctqzU=;
        b=S+6HIF/a7OHLXCUBUs2LBiyOAyBFRu1in2KD7o7y9QRvtFYgZkx6Do8DUCmRItWsi9
         /kcFu15mWPet5aAgYg/jMaTKq3y7uJmBRLcEtDTPiMBt3oErUSwt6ema8gt8tw6BXYxN
         OacA68jQeJ2mcHk53B3hTcxX+sJynEerNi8bf8POVT046IGVPwaPiBbADH2MAfLrrgpF
         MGtLRL9HSvdLwdgXTWkiQN7OPuTaBiLIdbn8kNSAuRp9Ko6bAVGu3fKsbB+gi6ZoYkQO
         c4aDXoBb+nhOmeNtPQE9S8QaP4PgqVZy//TNUZNy5/80RYySpJu042qosCLzvEg4nEkr
         k+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174496; x=1743779296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+juXaJ8LOBmxG3pSfp03xaOI3VThFEhwmx8j2LctqzU=;
        b=mhSIjXReW9gJzjG9to0BekEVwPYEftSY/nhuu3V7D0SUL3kSojg7a8DyEgPTJWrPdS
         bxAHkWo4J/GRPwbBca1F9NSTeMs6RL/Yfhsl2Txg02k6WstzVBOKDwPFR8GqUroaQTWj
         4bydwC0mbEqPeITdL6OWEAgCxnWoWUXp6oZ9OHsdlEBMAC9WouvSTnqK/LbCgIDaETDu
         aNF9NfSCt3Fxo0jSFApy6hrzpJs9wNwJ++v1Mdr9noEXlobDL0CW/ygnJm7KdzJvFMBy
         9aWJscJQ2Kn2EYrf9hSsPizGaZpz0rwpHXCUgF2kyqMAQ4SFLCAgmjbc/wf/zVu+cR4H
         RmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcuKJ18inyR60cb+n0PKwvtqkrUeJ9M8Zg2UbkAz4h2xGjoT9okEOAXdMbwXh7Y82dM4F5XeuZSX4lI/2a@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh9VcYroBo3hFpj1zoY75PlPVIajHpqAOQWn24DkMCBEYvYkx2
	yUwhj9Z+Eu3aCi5VfAuUBeeoi02MRGrZdeBpLAOf3Ugio3jCTX7kYQIwOXQ+uQxwef+MvBSdXhs
	aEG5zE10qm6Pr3C2+knZNDfOht1k=
X-Gm-Gg: ASbGnctooGeVUPuICTPUejPbmBSm0q3k+vCE23vLnHcn3k2qd5pU5ajWNrAzr6ZvVEx
	83qP4AWEOrlxwDGO9o2JMX5amhsBAAzoOLi50EanWF+IpouYtdQjvo+Iv/xvV3g04P4n7Me7kB/
	6oURtrIJ+avQfuZDbp3lYfRVJ+TtI=
X-Google-Smtp-Source: AGHT+IGW2TB5Pt0rLrAQzKWguP3AvEdN3lRS370FZacNbkDxA1kBarJpL39ObYrkazoD3DY2m9Ub7mdK9YwD3OIBX60=
X-Received: by 2002:a05:6122:4fa6:b0:520:42d3:91aa with SMTP id
 71dfb90a1353d-526008eb4d0mr7133614e0c.2.1743174496366; Fri, 28 Mar 2025
 08:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
 <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
 <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr>
In-Reply-To: <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 28 Mar 2025 16:08:08 +0100
X-Gm-Features: AQ5f1JrbYHvomeCPHcyZ2r6t6buqhwyRSgbJWoum_rnkO32e5uiGmU0b90AK8WA
Message-ID: <CADYq+fZd=C-EydjBmkP6Rh6XAJS6Kg1nM7zGhyLrGYiLGkZ8mw@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 3:55=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Fri, 28 Mar 2025, Abraham Samuel Adekunle wrote:
>
> > The variable names use the camelCase naming convention which is not con=
sistent
> > with Linux kernel naming convention.
> >
> > Modify the names to use snake_case in adherence to the Linux kernel app=
roved
> > naming convention for consistency with the codebase.
>
> There is another naming issue that checkpatch perhaps doesn't warn about
> which is the encoding of types in variable names.  You can see some
> variables with names that start with b for boolean and p for pointer.
> Those letters shouldn't be used in kernel code.
>
> julia

Hello, and thank you very much for your review
Do I send that as a different standalone patch?
Or should I send a v2 after attaching the patch to the patchset?

Thanks
Adekunle.
