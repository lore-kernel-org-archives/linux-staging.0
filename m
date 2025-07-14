Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B441E2F22
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515453; cv=none; b=NL3X5NrXy6z0jsD2/7kXG5tLBYuXHEE8pjGkRvVkYsTk/FVK9YHwDv1qMkUVc9hXdvY+ThgCAE6XAv0xtYoUGije7lViUV6ukUBEnbO6L+wNdsWdASqId40ivg62+eduDW5vNmOpV4Vc8Nn5WTyXiPJTp4hbuEK6vzNqROC9kZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515453; c=relaxed/simple;
	bh=uUTXXLQ8c+rQk2auC5k3o67dtJ7OisKI3KhzZJAZiog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTdxPfFV6+BY+wLaobe/5K/TIBV3OF3cFexHhaUI+59p77LESmKUFrscxyuPddXrc20Guw2y+7WtC7zXtLO1Qm1sMi4AV3MFWKBN0pHP+pDOtWuddsjEdMDxQwChDcbd3Jlyb0N5ZuckVOcS5bCVxUz/hjXlZ6+oZHVfGSGJeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlesbK0V; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlesbK0V"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so8732544a12.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515450; x=1753120250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUTXXLQ8c+rQk2auC5k3o67dtJ7OisKI3KhzZJAZiog=;
        b=YlesbK0V+Va6bymRCMgQq3k89JqXrXlNd9ruM82DqvVMJgqXmMyz9dbFiONfmTBdr2
         WO9HtQaCImsO8wu8JMz3v5qxvDC9oAn6cfEuvF+nf+Q/qiUVNTghkbHEFdoi913/KJNu
         YK6yeaWGSXDP86bh+/HcDn7hdUk3xCCuTC8yV3Q7LFbPKk600IMS6Y2w/OvcFc2deI26
         JMH7MPBdiSkKZmM48te2OGSG36fkJkO16cFGBgY7ydve407rfYKtS6nNJJRVRggPyufX
         JcfX0551KI6X9cgmEKScl0osA7oJwdMJvcr9WJy6xI8sKU+J45B+bzHBircgGBMWZPAY
         Ko0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515450; x=1753120250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUTXXLQ8c+rQk2auC5k3o67dtJ7OisKI3KhzZJAZiog=;
        b=T5WG6LeNSTBa7+lOWCjFvj0LeOIa98/1uVDSvXwtjKOqENB/zv/kV0Z91s5KBw4N/D
         vsc7f7UO+c7p4EwBDyRhaBnD/YyFKPgsX8UWz99eWxud4Wgow3Q4gQV06v1kyjb453NL
         8xU1FQ736GUQ1PE6/N5q8Mi3s6waEYM62cXEZ26e3G/POMTQ7ulTQbn0bsDno98eZPSt
         0Bo/QIToiwMJ/pvxUsWUdAZrrPQxXhFlB+hUh5tuxCjL1rkmKwbVJZXbrjYmoOE8LF6/
         rb1bYboooa0s0vOzja78ZeisxmT0/81n3eBNgFzFVxzHcFnpi8rThOUbvJNczVk9SB1w
         JJGw==
X-Forwarded-Encrypted: i=1; AJvYcCV6UJZwWIwE5NIZ9qgeiZARbzexBvSClieA6NmQq5svTvRN7ceofVSoP/rqFkKarYQ2P+1ty9KzQU41XqzE@lists.linux.dev
X-Gm-Message-State: AOJu0YyP+qY8xRw4spKoFEZdHQxWmtRXzIaiMIoxzR+fW7JzaZLI6uo1
	V8XKJFd4nSMtHq6DaD1r0rIW+yoSyLfdunlnjmts3kcv9JQtc7HewU5QAFYOwyhXHwXPt/uPsqw
	K8dD9xiO3hcpnNcZirL7lYavCdar9Wac=
X-Gm-Gg: ASbGncuGd8dm8JdYDuNDa+6Kgoj8baj1rrkkWDJ/pSUB6r7kvW1RO/D8qe0SknJdyUo
	+coead+FETGHlClCEHYGa8hpm83UCpxdkp3SxdQjXD0hbDnag/hjb1UuQbha+P6lrkkIZXaCnwD
	fiJ4+n+1BnQY8svPXDDcVBPMNHuXrG+Q3RrV4vYSLmJXdY+HgMxpIYwJoXO+s6iQfBsIOxY8Lx4
	BCgyqM=
X-Google-Smtp-Source: AGHT+IFpS8/N5yB0rcYX3H/cqfEl5MyB5jRqqTvyCvvL3Qym0VVsBnG28wuw+hwRccAwfKyDouIrRtXkS7XZpxh6TLw=
X-Received: by 2002:a17:907:3ea8:b0:ae0:df46:abd1 with SMTP id
 a640c23a62f3a-ae701297e9fmr1262359666b.45.1752515450009; Mon, 14 Jul 2025
 10:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714132221.4611-1-devrtz@fortysixandtwo.eu>
In-Reply-To: <20250714132221.4611-1-devrtz@fortysixandtwo.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:50:13 +0300
X-Gm-Features: Ac12FXwZInPOxKdn9zkcyU6Jp4YGebXnDMQeYpJOE_SM2A978q9jfuslZqNRnyM
Message-ID: <CAHp75Ve6ejJSH3X4fMJ6MimH9On_V7Ors8xVWtcjWyp4jx+VHw@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: put trailing statement on it's own line
To: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:22=E2=80=AFPM Evangelos Ribeiro Tzaras
<devrtz@fortysixandtwo.eu> wrote:
>
> Fix checkpatch error "ERROR: trailing statements should be on next line"
> in ia_css_formats.host.c:47.

Is this the only single occurrence of such a problem in the whole driver?

--=20
With Best Regards,
Andy Shevchenko
