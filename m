Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698139;
	b=CVM0Gy+Pd8cYdBkXYNT+E+pGfX8Pfsnn1sqfFUnJVIvXVeRzbF/9nkCXh1nOillBUrqq
	 fBwYs5nxpqVnLhXIWYYsgdl2wNqEwopaE142TOSi2VPnsc0/XSBVYEDMGiI2d7/HcZwo+
	 5Al7BMzUy7hySc5b2xBsSeN9XcULS8S+nTGREemjwiTM+WPxEsGNAqnQJmF+5Pt5dB61Y
	 ITknehIOgH311AmE06luSLAn27PQHBAX9lmyji/QVXz8cTY3CFbme73hND3K0JNELqbB7
	 VPpKxVxum/CnmY7sThFpspYy6nVxyg5AORNPPmIceARLpyauGAksrtLqQQR2JEza3Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
	b=z/3M4Yg1JZL9X/88/Q9Nj0bXGQnw6oAm9RHajm7xqfeiRTpITxyyRkgzOjcuiGxhMhQr
	 MMZBtCjlIPZCZ0TZfkkjb1xW8U7la30ELByQdJPp7mLXa/E35KWtzhO/Ug80rKbz0MCK5
	 wJC50Mlk39d0HMuxb/prY0Eo53xeel8+UR5GRVF4Vv2Zaj1tqgO/ClJOMI9pagocSxdLm
	 4ZP5OhPUmSrEktXLSrdh07DjL+Zh9NLSpseHZTWcNkVAAlEbN3QlieJcPyh77CtYtFAP6
	 CkKyc/4XyLYziJOLiXVqruj5AskuilWKmUWtzyizA9Y+VMn0oDzMBkvW/7EvIFNL7wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ca2rW6A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55ED606A333
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 09:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55ED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ca2rW6A
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4395d31228so605828266b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 01:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698137; cv=none;
        d=google.com; s=arc-20260327;
        b=rj//GMOdP5/K4i34eOwKlf2VJkvC0zSiJqgMi1hnZR2o0Coopmtaw1DygZKjdda70M
         JOLDwMIKVsnHJXBnUl47n5He3mkmFdKSssokRX+WGT9FdHHtrNc/zzmu4z0CYoMlBbug
         4YEY0M6ryJW+uV4vBaX+QOiJmdwCge1KskotTu6PKFa8QQYufZ5HRGNKnwj4BJiwMCke
         tbN61uTz4yZX1Ntv2bBhO9m5F0kTe9KMckomubZNZlxBZMeEHWzS4u1bmWJKUIUiYolV
         EuWojRqWNsBatjWi0IS7RrGpfxyIaedR4fJprCY2guEqcM7xYOgSXwZdsyo//4i2GV5d
         i9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        fh=FZFr0o2R/XHmfNGxItw0UxCMEsZr4W04sAxCbbM/0C8=;
        b=TCcBzeCEM4/n+aWEjoG7CObJexeEezDHcRlsm+QhgwSI2EpE1TE8s7giiRbUgWdNrc
         hKgFiG6DFCYYnGMcX7xczfvBng5tYpuF2QurDZqRLiK+VRaw12e/mRcDgIs+embKFVc4
         PgHRR1gAc6zwbl5pp68BMNJ0ertUKQ/DYS5yakKaYEfX1qgmUz57PzklyEMUbZzvsyRD
         dG1VOyLXgeXyXZ+u3fVOZNLZorMrbpebybw1lsHz3OTPE57CvdZkgeSRvba9tThb1xCm
         2cIzD6+oo9z2bn2ZLVvdFdMB2u+rsPoLJ5u1uaG6l6avawcVuf9etu5gqsasLSZQbL6k
         cyqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698137; x=1794302937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        b=0ca2rW6AFdWbArK1vD+gj2H31YnIKkYI1sVYFfFGG4YxKuB7LxFRlXSMBPNvZS7IYN
         6TOsLfA+x08mDWSkmvKtvirmChfENdh6JPjPOsaD+6LqmPgU07LC9aU+MyaNPGI2MHB8
         6qk2uV/UmLaZPaVFlS+hF76QGOYu/X3J7JDgeg1E4MQIKfgDf98cPj5v27J35UEZlGUi
         DVYHIFVGRc3blfrJd7WOF4ZmpsI2RoDOsWGwfJe65RlSiGCMOuSKduU95rYUtJ0ndqrG
         +FmaQnPim19RmeEDTbkT6Cuz/Usn5F0344ywZLx5X6jRwy+pQAhwv3WdMf87jhAAYgJe
         XOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698137; x=1794302937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        b=tBiseM4vfHnqzaf5Ji3naRjLUPLV733wGW0CM9fj2oe1ozjWvizzEbl8xYo2OgH8j0
         A7J5FTaOeeY3U5+GlkgU3mNq+l5sumLyy5YqW7VtX9dog4RTwODG9O/TwlpRDs8xnIQV
         qVOKq/3A3ZVvAKnVEcu9ywZwjnJjZ2uZw7SFGtF0GMWyIxwdMlIj2Sav7h+V8n1P2u2z
         /kFNGTGqcCXVetYO8gFjuE+XHkRUFU+Fkw91yaT+XAhE/V0Ikel+lPNgeIihqdVgrupB
         mgJHovY/xrdsLvilCrXE18j++xEutWyGNsvKjiP1eUdqqdMF6UHMIa1o3S1WODDpawkV
         nfDA==
X-Forwarded-Encrypted: i=1; AKwUvBwmcRU3sNRh4+6L+rGLa+/Xv4aUyCb3jw93LUt1ZOc9Ncx+OSvQTnEUKc1zK1+w9aPSLcH66/VnhdUe2L3y@lists.linux.dev
X-Gm-Message-State: APuU4Z9QgijAMi2hOGos0+8YfFhZ2v85N20bcu+aFF0milWPZeM7bw+L
	Vv0mXRp8PDo5gnA8gqDg+7XXmZUw16XtX8Avol8s4wqql+mj39Wuj3ZXyTEPJN0iJ7zxcrDYsdA
	iCYzQF0R3S5qj00Fwgr8qd579COl8N4Q=
X-Gm-Gg: AYBFou1A2KQKQXuayJB8Hv5OXOTSPiAmwFsRYkfnFP7bbjkhsD2LcUK7PC4u5c5/T+T
	bGoVL1JgUQxYxPPouj1qO2h9Gw12OHifJBH8BkOUw/gIkbFW26GO1woi0P6xfQsgQjLs7M+3rwR
	8wffPUjluscL1LAPRk6rBrHZSWGLu2O/AnjzFi/B7EO+fZxMJMXikwYBJwMvtyDF5XlAu2bVMxp
	ndqUj9CE1vOUEhv8IIni0Hkp/alJf4vqD7Z/veV4FQKcbethWO7vcWmK42LJCZ3wGOY3iHBCV79
	TgAIDTN0jNbQkFUfBrIlTdYSw1YbPrDKKHe+Ntgb5GV6lNopyZwJJhXmNiuVzQQw7qRNgXVUVp6
	dFWLfmG7tJrfX102j7Td5KwZlvVUGgmpW5uYVndTy6L0R9Gvu+Y8Abd38pHiJ3AP670+P5AjMlO
	+9rzl1PLF6Ygk2XDMe1o+7gjX4sYFrdTa4ATf0juxZtTZKY3Arvn71Kr+VVHsI51E1jbDeQQlUK
	J8rZVX8RrARb3wMxMvvgkbE6w==
X-Received: by 2002:a17:907:980c:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c4ca7aaffdfmr1012303566b.40.1793698137094; Tue, 03 Nov 2026
 01:28:57 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154959.381-1-chaulagainavishek14@gmail.com>
In-Reply-To: <20261101154959.381-1-chaulagainavishek14@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2026 11:28:20 +0200
X-Gm-Features: AclHuK-4DCzMkKqQ5F5CE5Xu5EbSE0JkNjosn43vNvWvHQzU_y8WRlv2eqtT9Uk
Message-ID: <CAHp75VcN0N9vO1eHJcD+y1p_rP25geYYr=ucuQKgO9ktrKCtbA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Remove unused atomisp_get_pixel_depth()
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 5:50=E2=80=AFPM Avishek Chaulagain
<chaulagainavishek14@gmail.com> wrote:
>
> atomisp_get_pixel_depth() has no callers anywhere in the tree. Remove
> the unused function and its declaration.

As long as the code compiles (I briefly checked and confirm that this
is a dead code)
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
