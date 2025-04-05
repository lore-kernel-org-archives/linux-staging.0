Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D27B19D8BC;
	Sat,  5 Apr 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743855928; cv=none; b=aHx8/kSTY98ZUq0LyPe6YlAs9cCw1XwY/GRuYPTw2t7b8IxNcyzV8Rpmbs5jitmYoqRpPFGS6HT/OtKzlA2fIwyW3mZsifmYvX/FQM/T7vZqzghPB9CYRfFwSzf5dZg602WFmdRBKN49eli6HreEn5isu48Q4/eG1KtXtsdei88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743855928; c=relaxed/simple;
	bh=CYduOFeB5IT3Kco1O/4Tx9MEW9QbS2Wtx+nqAPLrNlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbRs6byxkLdyuBG/k1M5PjImq4KxS0KoAIve6kcaZLNOSeG5/ugPA55GmtkybdHLa9N53PJfnFyjuIna8Z0qCi1noif6EJH+fA3qgAFKlMfasCw6DOqJ95ty4MSqdPvhkdczx2DX2XgUdq+f0+iFPXa1TePm0mrF6vAGh3C6rC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjjWxP2x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjjWxP2x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso5947797a12.3;
        Sat, 05 Apr 2025 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743855925; x=1744460725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyilPmtJoJj5gHj0tU+EtQiAso8knuigx97pyKiZk8w=;
        b=AjjWxP2xFgCAOU2q7OqSPLarSS+Dcd9D0Yzlbr7jzwrcB6u7jXbB38o9fW2YgljclU
         rrvwcuwnpbh9z/ZToWHqaxH03lr3RXu8PgxOrbNRUlzVxfDHt4t6UrvPLXOhKDq0cZmI
         2uCjtonty4gTk1lPH99+oZ0LHfvQzjdNCCzEaFzioDqzlgZm2cusI6umVNH/v6hPbSTk
         BROe4EFiwKSv77KkMEjcwqbiaDMiAkVpqs6R8ewDO3IXM/GzXnQz3kZviInzIz2G/kBl
         zBdQAXvU7KPFhJuW2sJ+X1mxEkSA3jyVFV+cfgMzoyuAMbK8NUrxRwQZGhgyOVG7wmJL
         d1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743855925; x=1744460725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyilPmtJoJj5gHj0tU+EtQiAso8knuigx97pyKiZk8w=;
        b=KZmXT4GU/Te1pi0uMFvx+V8yon90I/STg/QKRDe5uaQUDF/lEANuVJOdV+cN5G1qHz
         HaNTjaMVbGXFN/rxKsNlIBE2mlAox6fvfdIunxGNeCpPkbw/C75oQD82m49mRTZqlMo6
         7X3NE3Xmu/+W0dHcH7zIhZ92h6SthBUTaikeASUbnyGh4im3e7ymQk48KXBaJZJ3yUId
         i51d5bbo4W09sluVkPnlil/6g0ks3gDMljFjEL0avK4sZeETBAh0jawgzgquX+Cvsgm3
         k72/FJhZMNXhCPDo9/vlZWof06M/hDBMzhlEruAKIjLQRJrZ1aAaMdbGXhp1ZZGTJiQQ
         4RWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrwv8+w+b2PZxiduCLAWU6Jn0+m0Qj89J8bY4lYuc0iwsLyttN5VpF/YF8lx0K7U7T6WEedshAGMMZ@lists.linux.dev, AJvYcCX27gO228Ho8eDiqNYJFfTq+pUoKmzQsYZCnDwkGsF5cp5+qtxjBV6ljaWvNf6cQBjS8Dqf1lPfuVUBU2tA@lists.linux.dev
X-Gm-Message-State: AOJu0YzfWmdnsN4scLWIvnbMpSSlCrZT89FXOPioM9Dy43IkVSDO/qMk
	Gvw7yTUttqH9OUYVUj+xkmFA7EaPZDt1LeruvzOdQugcIqTKfqBnLBsq1iuTZutnSjd8QR79iOW
	Rn2z77RV+yFemPpzcg4dYNwNRT58=
X-Gm-Gg: ASbGncsDkH9TnXCPcy0bufuOko1xTdnmq9vPdPzSlbwQ/MNt0rU2MDH+NkfnrEjZ5t4
	s8n0VPOkoW+Cv+7N2JuXvzt8lk+WQgAQLtsqBQqdHmDSz2biTizA6fy7BHJaS1zd1d5SsGvVJ9J
	85PMLxSiqIyTkgJubUQOJotiRRaQ==
X-Google-Smtp-Source: AGHT+IFMeUZD+hS5ek/jSytgiuRMwCslST268AHJcAuN6buBogopfowCPWraMeSbqEcUGXq/8/oNF3gCMyBy3mKLoxw=
X-Received: by 2002:a17:907:3e21:b0:ac7:c688:9fd7 with SMTP id
 a640c23a62f3a-ac7d18942b8mr554424366b.18.1743855924499; Sat, 05 Apr 2025
 05:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh>
In-Reply-To: <2025040547-vagrancy-imagines-384b@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Apr 2025 15:24:48 +0300
X-Gm-Features: ATxdqUE5jVhnJsdiUE1drw_4pt6qvWaSrkgfi25HGTYyoscM5lE6n-dkdOMmrKk
Message-ID: <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, julia.lawall@inria.fr, andy@kernel.org, 
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 11:23=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wrote:
> > Replace the bitwise AND operator `&` with a modulo
> > operator `%` and decimal number to make the upper limit visible
> > and clear what the semantic of it is.
>
> Eeek, no.  We all "know" what & means (it's a bit mask to handle the
> issues involved), and we all do NOT know that % will do the same thing
> at all.

And that is exactly the purpose of the change. The % 4096 makes it
clearer on what's going on, i.e. we are doing indexes that are wrapped
around the given number.

> So this just made things more difficult to maintain over time.
>
> What tool suggested this type of change to be made to this driver and
> these lines?

It's not a tool, it was me. I read the code and suggested that change.

--=20
With Best Regards,
Andy Shevchenko
