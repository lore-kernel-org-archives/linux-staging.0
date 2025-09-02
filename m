Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65E2BCF46
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818669; cv=none; b=oyBr1UXPg/qMMfeB6sEnnGpLnrWBNEOlr06h3QPJbaDzgOJzluzYyFEU6dq5HZCysNbFljk/pNlx+YElGQVER8sA5QKKapzbfRbcYGBWUkCmhOqYog0umr+reAadfGcD6jyWQKqRbygXie8Y03v8krp+YX8IlkfpAQY1WZMF/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818669; c=relaxed/simple;
	bh=a6+7H71onDG4ZfaCBC69FB5SY12ev/7tff0d25FMAG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQbZz1hndvO2nFmPn3pOJtScM08o8vNeyIZMWCVKrT7EWFzBkHgef4XF1sExN5qbcH+Su4Bav8+n0Z4C49KTIzDVYu/nedn7lovhKMKcaE0/oLLle8M9jGBCteQkTHPzMwq6G6ptZcAonT7Rn6iVpE/Ra4tOi/X49X8nrXS8lCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iGri272x; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iGri272x"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b49cf1d4f6fso3697486a12.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Sep 2025 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756818667; x=1757423467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm8LYWgbBbSoxzsUxJyqmS94JWyK2thOVWLaY84JeS8=;
        b=iGri272xt+uadoZ+yMQbNObnMHqJk6eU/q1ehAIFG3SiINoxiHHLaoW7d8eHwoxu5e
         00zONYnqjshqTYBwfUMSj27pYoY8GJKpfALnszdp/SK0AR0Y5hCDn9evM45LhkEo6/3L
         eyQHvRSfXl0nMODzf/HI4D6dMgDLRorSpMYIddfKtbZxI4tKP2Ol0y6Rx+XRX3sDpdxo
         Qa2Zba6xRG59izAmgf8qdLCQl8Ax5zesgUOG59PfN99cP90VJsDv91UIw9zlcxKv927X
         C75gowuSbGp6XPQpGb9KX2f90SDcvQaBNJ4GXpwiuEd2NssdEuz56BmldcehcWahjQy/
         zF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818667; x=1757423467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm8LYWgbBbSoxzsUxJyqmS94JWyK2thOVWLaY84JeS8=;
        b=usj2n8mpfx7GPfnnz5fTRV/K/3MNDeggJlupVGhlgtotqu4kq9APWujZmuYmvNfskM
         um3xbL2KoAcvQnGBzdE4RNe+Wfa8/DHTuKgoCHQwniYJotebV7BqKrWL87GcmA3Moojn
         NlWImwYozztOgKPvta3vmWeazue0JU5/0R5t94MEbO6AwjIU6fWA45iQmrs9r81WLjqM
         8MZi3gRWdhwurRqmnV164BBJ5Ds9oxrYnuZwC/YZEzbu8OkSRr0zQgOXpQwQlHLciavD
         Hs0dQLjjSxknuaz6WqH7Xu+AqfSxaTXxmlfYAzGVIO9hQD1vz772aT/Qj6vj0z7g51vN
         m6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe+/Bvms8RsQPqXewLICaQw6cuZqfWEi6LtLnw4IUNUCfZSyAmrBmr4qO+OJMFNkdtLOD509YxBIUIfhsG@lists.linux.dev
X-Gm-Message-State: AOJu0YwgYBGMgJMnuBVNDi7+zhFnYWhQOuscHJLn4jlBiWjtqP6+cqUN
	N/i0Y38x0Ka6d70tOngy/z4wLuF5a/OTamHfpj54c/PiiCEYkPKke2bmrtCQ2WvE3MHSwbcsER0
	LhuUR6tJg6KJ3SOc4PGa25WKOs64vSDrwV5vdCzXY
X-Gm-Gg: ASbGncsLbnoAI6yHcTpFF528HpANvkY9MValO7agzmDNusY826U7+0fYcicCrEnpigy
	LnIdkXa8K1msfIwp8+PlHwVk3/ebM5nZB6VP+Tsrr9SXbPZfemUMkmKMIeQ1BuAgJChmBWdz0rs
	j8/KeIikrlg9zHRR5MZRKPIeTKXXC8l8DxVWdmM6AcLgcfuxiNsdazaN5t/sabr6Q24GkuYgD2I
	eFpLmZ8EiEDNWFJaq0iRqqy1/Opbj9OUF4w
X-Google-Smtp-Source: AGHT+IEajt5n7miuhpVNgaVc7Q6fAs6vdDGW7Ft6PJ5otEsVyTncI7dUQga6YoFZNasinGVO2qLjbv1bEw5pg8a7acU=
X-Received: by 2002:a17:902:ce03:b0:248:cd0b:3454 with SMTP id
 d9443c01a7336-24944873445mr133817985ad.9.1756818667376; Tue, 02 Sep 2025
 06:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902073841.2338568-1-abarnas@google.com> <aLaypTjukJJloGuL@stanley.mountain>
In-Reply-To: <aLaypTjukJJloGuL@stanley.mountain>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Tue, 2 Sep 2025 15:10:55 +0200
X-Gm-Features: Ac12FXwTsBas7UmElXIeqiXIRz_1zSROWnkOhZSndPGsKtOskJgJVh0CaFvpYhg
Message-ID: <CAATBrPEsea2GfK26W5eg4ZFm=hJLO1pLNax85vvXZ8hb=iGaFQ@mail.gmail.com>
Subject: Re: [RFC] staging: media: atomisp: Simplyfy masking bit logic
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> These are supposed to be opposites, right?  Subword and inverse Subword.
> You could dress them up to make them look more opposite.

In fact this name is misleading as well. For me it should be named
`clear_subword()`. It is zero-ing the "subword" provided with low and
high bit boundary (start, end), to be then easily replaced with binary
or operation.
And this operation is not an inverse of extracting a subword using the
subword function.

> The problem is (and actually with the (end-1, start) above that it might
> generate a really bad code on some CPUs, so I really, really prefer the w=
ay
> when _at least_ one of the parameters is constant.

It would be  easier to create a bitmask sing GENMASK_ULL and just
reverse it but if it is not safe, this is what looks fine for me and
works the same as previous function:

// Added a helper to create a mask
static inline unsigned long long subword_bitmask(unsigned int start,
unsigned int end)
{
        return GENMASK_ULL(end - 1 , 0) & ~(GENMASK_ULL(start, 0) >> 1);
}

/* inverse subword bits move like this: MSB[xxxx____xxxx]LSB ->
MSB[xxxx0000xxxx]LSB */
static inline unsigned long long
clear_subword(unsigned long long w, unsigned int start, unsigned int end)
{
        return w & ~subword_bitmask(start, end);
}

Best regards
Adrian Barna=C5=9B
