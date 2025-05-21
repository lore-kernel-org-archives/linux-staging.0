Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68D235049
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816944; cv=none; b=qoD5/vy6VliLLh1rwxO3Fi5mq1QL/qysY5xg2lWHUS4hIjyzuje02J7mxbj3jRsd7Vaf1nb/MERvt3kzuqJZz2lByWjg8Fv5uSHnXDYNMDExzbTNuDCiSytS9jusuQly0G97+KjeZzhPgCayMructz4ZhZSvJl084l6KKsNSV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816944; c=relaxed/simple;
	bh=O9aboa+aA9QUrHv7NG/TajZHCYjHVV9Y+6HTFp4K5aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PypLzKuDg/Nz7+eQqh0ulAALROMCqR9wmgzXxZXAKBLvKRRwAfMFnMGUq3HskCe0CN5pzBWaMc26kb6e0nd//nKmVE7Fb/qARC8GRKjxXUkHBMH5Z6P5nHXJ+Jaj3LlNr2Vttps5kL3l3sMGnfHnw7PQrje/Zi5uOakxpakICPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hp1mUzaZ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp1mUzaZ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70cb1e8263bso42396267b3.0
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816942; x=1748421742; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCgJZXkhtbkjdkE3gdVVdoOPKWGJdcA4tMEqgryxtSc=;
        b=hp1mUzaZn47rBfPtGIJSoGjYaifMmVs6SgAtyoY7aIjd3VPLyjcdYSXdND45jMg9+C
         YovbWVW07mo94xr23xteNq8y4O55SsTq7ZgAr7L03IcMfA7NIHBVWD0Yjncdv4q7VJef
         Ly00mkUA7TwugJ4Eq+egpQCdDsSPEiuxmMAcYMgoOEUtO4nma/iAs5UBX8g0HLQ4bnU3
         nmeJAkTOIhWFiAmckWVKZ304RwM+YBcqgcOhVsA/H3tzHg/HrHZRNBHxuDhiWlS6A9Bz
         Qmfp8Eh6YM59ISUZckbthdAotQyVZC2K6Qv4XARmCxggqfzRmOcgkkJ12PmptAfRAHNo
         nR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816942; x=1748421742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCgJZXkhtbkjdkE3gdVVdoOPKWGJdcA4tMEqgryxtSc=;
        b=I9pFZRB+AhEtjr2ZZrwmtNERZgDDb5Mbv12KILzsfxjAIx+hX4qI76pPzk9ZpPCpEs
         /Uxu7iDBMgQiJOdpvXdBQoSg0QQ/FgfNi5E/fpCE+ZWjXaUVvw/vIad12zheVnauaD+G
         /JlUFGFAIm3cbsH4bRKNJK9b+vzqMuPp4LoviY9J1/VuzxRdp/LHK2pUmtbPPoi5eA+w
         vkm62ixugfbhce6NzSHtEnBR351O8BVbuS7icCkg4wcc9ySGvT2DohhTFYNFQjXm5+xs
         4kiXhq/+gLGxCTJqwYIhfc2qLglqThnvmzEmxMA7xNbSGOlK3AZwLHV4GSqATJnHEuIk
         xNAw==
X-Forwarded-Encrypted: i=1; AJvYcCUBOmvQp267pgre1widze4WFnH+xmYDXgiTlsFVgVQTQHVTTotNeeGMMzFlYb8/CZ1u+OPtsESXFCsR/+QW@lists.linux.dev
X-Gm-Message-State: AOJu0YzhSsHc+RQ9V/KI0emXXS3r2ONKABiETUl0eKDofXX9JjlpjbZo
	YaCj+nCC8OuSd7cVJ8c+wNghe+t+7B3HkBwIUeCi94VhF8C6UOaPCh6oMwaSywxWl6mOi9so/3s
	jA8KXZoEc+1idbVI5E/3GyEc8aAdrsAs=
X-Gm-Gg: ASbGncv/LW/eeIvxij6Zs1ssFEZ4NPpIhbQdWQoemn8l2zn05m1mPuGCeWHegaBWEXG
	FfOb+K7vG7QH3NX0I6jiK+ZVrnf1LUiqNhfMBh24rvPeGN6qiMKwYWmmzBpO61gzcZROOg06Zf/
	aWy37GsmH2hZwSByZ7s/ARxOutdbyModknG6eWHJj70D+ai4rhYGLe1MpTZVHXRFzrvbKoz1eqc
	tL9
X-Google-Smtp-Source: AGHT+IFNHZSYsBdgNuwuykkG1XrjBeWI/DMdaIBKSjsDJ2IOaa44XWs61oPcZaHSqqhwBUVLkt3fM50/jwfOB7wmAmo=
X-Received: by 2002:a05:690c:ed4:b0:708:2604:4a10 with SMTP id
 00721157ae682-70caafccab3mr271916987b3.18.1747816942101; Wed, 21 May 2025
 01:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu> <2025052142-maturing-earthworm-cb31@gregkh>
 <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
In-Reply-To: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 14:12:10 +0530
X-Gm-Features: AX0GCFv4llWsqgoVnjPLvP_a1XEhJ4RdYPXyZq8ZJBAv-ijFh3TqO7nT_Ne_OUA
Message-ID: <CAG+54Daj+1fj7pm+f-a-WYYzV5FGKby2_gqu6WjZMPCEXPGDYQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 2:08=E2=80=AFPM Rujra Bhatt
<braker.noob.kernel@gmail.com> wrote:
>
> On Wed, May 21, 2025 at 09:06:00AM +0200, Greg KH wrote:
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> >
> > A: No.
> > Q: Should I include quotations after my reply?
> >
> >
> > http://daringfireball.net/2007/07/on_top
> >
> > On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> > > Hi greg,
> > >
> > > why is this a RESEND ?:
> > >
> > > >> I had sent the same patch 4 days ago and didn't get any reply , he=
nce tried to resend the same patch for the same,
> > > here is earlier mail :
> > > https://mail.google.com/mail/u/1/?ik=3Df63b03515e&view=3Dom&permmsgid=
=3Dmsg-a:s:12290863930259651721
> >
> > That is a link to _your_ account, not a public record of your email :(
> >
> > > ,
> > >
> > > line does not match this:
> > > >> sorry , i could not get it what it is exactly ?, if possible can y=
ou share some insights or example so that from in future i would get it rig=
ht.
> >
> > Your "From:" line in your email does not match with the signed-off-by
> > line.
>
> This has been addressed successfully, Kindly preview it.
>
> is this the way correct about the reply email ? , kindly let me know as I
> have tried to get more and more answers and solved issues, and thank you
> so much for your guidance and will be keep in mind about the process and =
will
> not fail next time onwards.
>


> On Wed, May 21, 2025 at 2:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, May 21, 2025 at 01:30:44PM +0530, Rujra Bhatt wrote:
> >
> > <snip>
> >
> > For some reason you sent this only to me, which is a bit rude to
> > everyone else on the mailing list.  I'll be glad to respond if you
> > resend it to everyone.
> >

Re-send it to everyone , as per your guidance ,
thank you, and sorry for any inconvenience caused.

thank you,
regards,
Rujra Bhatt
