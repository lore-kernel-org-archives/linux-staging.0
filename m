Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55733D4F0
	for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620036; cv=pass; b=QNBqEnA0IDN6TFL6ZT2lqthfd9NKyLr+gZeim+yAPzFHZLxLOydS+mLtBAlqvWqtzCH0L52aEFgPmk1inoj0jLY1IWudA0JsCz4bx77fp9J61ITG70CdC18MTaf5zL5P5JHfnUdwfmR5KFYZgDe32uaoeDyiR/1OcZY/XeDzzkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620036; c=relaxed/simple;
	bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4QW1wYN3GeMADV+rC279kVeC0yBfvHyxrdEv07cMav3E9Zva1U/F22byZ/8+/dZrTD6hgSA3ZnwGfZHvTR1JSxhhWr4zdsEAKdDelAtaMwHUgVY0sCVdyUh6FeUJmqo78lA/DRe0FpwHfF+VnpeaERgUlRkSXFYTcAhtFYtHJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dR6p0w7F; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dR6p0w7F"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a9ad623098so4679991fa.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Oct 2026 01:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791620033; cv=none;
        d=google.com; s=arc-20260327;
        b=AbyJiyyCFLGf0dk1ZUJmKyEkSZM2+qKIYC7rbvfFa6YbBIt7MdxhHfe8ZCKj5MwVHb
         VuN0vrq6nVSh5G8qblS1YD6DvSvQeeaGGvLUPL7Egp4x6EG5cgJtbV4E12YG3h/A1EZ7
         EgniLjFmz2HaV0/2wc+PsMnBhYpgtTa7sbnvjTCkQmeWZqefiquw+SBGhv8MEnl9BsId
         qEwbXpH+LZ63yu6CmwnbrxXJw4aUTbbWG8yYDajpbx7EdZTJFftcL+TTDDLKr/PbvzsY
         ic7+qrkv//ms3EH6Lvdps9/d8o/ZtlFk1517IxodLsCGqljquJIYaAemGnT21qGlqGtI
         kAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
        fh=hdwIOEgxB+Dgsaw+TOI/q9xheVp3kTGa3gWFbymcT0Y=;
        b=LlQmu+HkwTGqjwJvrDQp7qklgzAltYxZo3ja7SuuQp1CYLU1ahzG5f6nQslkrIvYuq
         7H/aWLPgtYUMRpnojPr8oixl/2DIKNRzlQCHoRwjFWUKXsSbPWJKjDICf2KbywYoH5bs
         s7SOxUf/hz49J+dZwDT/xqvB5QVEJR88UGkM/eK3HiCGzn2xMmZrO7twgUP4dR7Zl0pP
         q3wOXANN2ACUeXFEJembRMMuzvl86Hx7qrAgk+QP2N0cQcZO4XwF5Q1YOqroBLSRSPGu
         W/F2AOm4+NpnfQC8pQJegjdbXue6iLm9LJdSBbI0t7u15XO4nRQeEmN8CBgsjbUjjrBo
         cbBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791620033; x=1792224833; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
        b=dR6p0w7Fxvu5jTxSziKDFCE/mpgTMsfMwOjPwy9dXIEaLyuF/UAOllvbTDGwn3zDlb
         rbEmcGoN4tKCZuOQIdsNeFg2aKwXBcfgR2yQe6b5wpp4Tc/xeyfcl/nJkyxKhKlD9Ldw
         Afc6MdgW5079/DF+noZNF9jXXawhU7CL8o351/0kFTGNyOGqkFFjKQWiEUw3vMwFw3fa
         4OPmAfZXo74+y2Wux/aljUkle+i86Li98XGdLa20AUWcqNzyw1BMqlXKoTKKbFxplRsz
         Jhsatb57ADS6nFxreYISZdodXAkAtLAOHliaC+uSFFdUsNEcvDfHzPXNtdV/zgNTID0R
         Bj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620033; x=1792224833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v95mXYZS8OV/hddK/8aCeP00yH/oKndJ4AKBv1pvm/U=;
        b=DME9U8FJdXzZbfzZV51c0SskfcDR1KMHy8ZGXX0y5ox4xx8A1r8/2+H9AjGe6F3D7/
         7dlcGHQQeaKh1w3TPdxpno99YXKhUAS25Mrj10hHLH3GDlLqaoI7dHlWHcGssnby+Xq7
         2X5Nojeg/pktp+qEYi5GKg4i/WE7tgXcII0j+y5WLE8FVTe06YhQ8gI+q2n6ejaaz+3q
         OqqFwaRRDYrUr/2ulDIdtmjIamvwzmesPbX/Egt8xDO+c+nHsml4MGl5sYce4hQB3hTJ
         zU5k9wxVw4pzPoZdXmIT7zzBlSQdEORvTdrP1c3MK/cLv0t0ve6WyFVFwyEJZInxy5fJ
         NdLg==
X-Forwarded-Encrypted: i=1; AKwUvByu0KB1wETT/ow8XKOgR8ureJ/yeF1akENOiOz3WGEnIjDY/gDASU8lsIYP+GwZQBOS8C7kZf3k1xyullyL@lists.linux.dev
X-Gm-Message-State: AFq9FYK6X5xb6MgSRDUSSccCn/ce5POUXz/I/A+PeFNjP9bSZn7ggaIp
	z3gsCP6oxo3Iw8vHOPfLk98ok32jfYoqNcQlbKB6ntkiAgd7ZN89j5dF4wiqZBkMVky/ynVdaYO
	R+5Sypav0EmwZgHDfUR0k51DYHxoGMBY=
X-Gm-Gg: AYBFou32vWveWn2RRKwFhUb8JBwZr0r0o4Kw+xNYBuVUFFl1UdVj0b3+r8Pz7dviBEL
	Q5p5cVt+2XdTV7OEY2IJuwECntNQtYoCkHhQHXH2wXyv/LAzq+NBdXMuffVH6YpOhXFJ1ESif2j
	nlrlirkYNCCNYIQvSwD5F1pj4YtTEyxR2ZuBwJuSDm93NDKZt9baEhoRISBXjW2a5MjIJJMGXmf
	hH1I30XQiS2BQm9rE3SA3FliAT3AiHMp9SMtu6j0MOwK77No8EIRxJCgqXXpSTuFHOMOvTy1tIc
	wOGcxDSrJEsaztwCgAowUupojNhV17DsUMJHRneYGUPTd9RdprZZpCpnA6WF27mUeJVnwW0VPBi
	lDiqgnEsh8pXmswxo47Hrp7zurcl4NuyOsldnqzvOKRZw8PZvvZ7M6tmhvhs3rkXx7QZAOZTYjo
	Jj1MfJMzQvGkWgV5v/cagRyppzhydCt62gclQUvC8=
X-Received: by 2002:a05:651c:2221:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a9c53985d2mr10277901fa.7.1791620033148; Sat, 10 Oct 2026
 01:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009154526.43528-1-cenzhang@linux.microsoft.com>
In-Reply-To: <20261009154526.43528-1-cenzhang@linux.microsoft.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 Oct 2026 11:13:15 +0300
X-Gm-Features: AclHuK87hlToSKlaS86YJtsi34MGww0jdhpR8cjy__Mr0Dxl209enwY_IZs85Ms
Message-ID: <CAHp75Vebzu0XHN0h_ehpmNfipzcR_7xS+Lavyd2beHUmR7t_7w@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: update outdated struct fbtft_ops comment
To: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Hungyu Lin <dennylin0707@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 6:45=E2=80=AFPM Cen Zhang (Microsoft)
<cenzhang@linux.microsoft.com> wrote:
>
> Correct struct fbtft_ops outdated kernel-doc comment: 1) update
> field write_reg to write_register; 2) remove non-existing field
> free_gpios.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
