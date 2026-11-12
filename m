Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794466813;
	b=UprovK+VdpI8vfrPgJER5ZBjzfjFh8UAE+nZvqH8D8wYmREye8Uw51TchwclIEO8WbM4
	 KRpFt28z7wJzrEVb3JNwMs9Y1RcaJ/2XSv1kRYcARN+LXrAWYvPC8KYpqcKOtIjyo9Ayl
	 vgjOmGmAVaMaRF0FRrM1Yu2tdmv0YqxI9Dk965eE5TRRRMx+tycWL9/DvvyBksi5SogqI
	 0ZqBV2U6WpdEM0zSB9U5EM19PVGrbxjYBTBsbnL0X6UirJz1oyhyAtQiSIl1vqEBKw6s2
	 +tf2T1HuppqPpnuMcNfbt+ePMp6iqUvvswRHJk4XEfXtEr2DKSwFs6YdLzxtEVli0iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
	b=YmwyYtJuYWf5DBnVw4AtjuLY0g53oGwN0PK8yT4NiBkMCrbHlFTxcW8F+mAxnr6XQ3Tv
	 8GcGSUxcba6tnKw6wnAPTbLEJ4WdN7htkUns53htL3CStC8WH50NKu9tWAo4QHo2V77nP
	 7aUVsFLIaoTAazp5YK+1sXS+7xpM5HfWWiZQG+LXgqu4vTZ13Fa0N6Sr8yIET9aOMqnqN
	 AEm0JZAJsXemg8ZdOI+PYZF/lPwpciZygrkqKYPVtSuF4s/zrdoRWT+oN1wt4RSW0S37P
	 8fAs7916bxU4KBWSOMPhInR/jrLy2gY2GxU9OGSe7m20Zj3KvzIEeQ1zyd4fiQscDbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRVjAN0A;
	arc=fail smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C23606A32E
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C23606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRVjAN0A
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b349d21fd1so29345647b3.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 23:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794466812; cv=none;
        d=google.com; s=arc-20260327;
        b=RkRpt5lBTC5M/aFdZXoy64pkwrOX0vnbh5QJN8yvNmZqxABTzO8V+P2iGPflAk9KqP
         jXMmIbUGPMg9dbf7AHimlzZEnO9rLB0Zl8FnNWZe3ps6wxseNvYp0qNvWEMRRg+A812U
         7+4M7sqUzypU7CVGgU8TAPjs9AtXB7jqgRm9QwrQBPeS8vzctGelLooquTdEwo4MYaKl
         1scehUPeVGZ/DzWF1lCFZ3Iz4zMW3pv/juovizUCo4g9YxK84orBTghYvmJ4aal5LhcP
         SAHrzSKyuBs73feKaaJQmyZ3FyYfryGIBB8sTABtjye5kTya9EYOGM9w/Id4Zc+LM5Ib
         IQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        fh=AlzZ8pREyy5HWmAW800uu9J/il8UV075cds1gnbKjew=;
        b=bvvZqGL53R0u6FLyEEb2VCaGp+cNrSPJM05wSQPyjfmAw897I+WWdoJhkBKALDe3r8
         bjh9u5/H+Zjc6IhedlCkTXQWib8pANayUqLGkdwg74dY6ZRKic/waU7n48W4aBvtjOuD
         ROSX/ChJRlZRfOpfIydsxNUsSkJOKSDSbXr1zspUhKz1s23qLs1qSoPqO3U5M0jXpwUS
         gqza6Wx6WmmoOxZtvhhjAYcndTYcX57vTrh2yjWOynve9q6M2ckIceslVdm1fi4fJb/9
         1lECUdxnmXSQ520x/YDX3e5plG9tlcpE7JHTc9hChPlBs/fxBNE6oIpwWW/LX1+QRxcS
         z0Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466812; x=1795071612; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        b=DRVjAN0AbtqBMhJ0YZ4jKiyfkqvWB1xq6C0k8RSC2UU6qv9tQbxVlz5s+RioK/s8Qv
         jawidJXhlsynPizOYvPiteBS+L4VB2dH3xF7CSWY9yA4e9cx/F1La7pOMHNC2J0bBCSu
         tE8GiOcpGZ5Vkjqbgyz5Wfr5e0wmnpkfqXFtZ75J98fjNPxPnqLNUX6mz/mUJnn3FmmE
         430FICkvTU11DD0BOIwzrgQViCJUTUrWhaRe2Tvfr+cWZx+TSRNv4BxeLWG/vaCtjZ4T
         ZR0QNBWRyV08O9wfhEuvF1/jNRQ1xPmRnbeHfjD/2Bp3rIDCLkielH/DqfC8PgPXQwAC
         gp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466812; x=1795071612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        b=DUZrvvg7IgxI8RmR6f5S+zJxpCMwRW3m/zk/h4gmDJ0eXTRB+te2uVWf1loLkb7Tyq
         3auDXt/oPtoEDIjujPI9nVMNUwwUBqn7D/YV5bN5sK2JZi9UpDjiNleyOp8FK3GcvDKj
         egxbv9e5TRFskFMpnOGka+CbUsOPOn4+mKLIdJDQbXV9IpLd/1M1V4D7Xkfw8NsebhBp
         LMqeLCMfMjjvjPFSpcaYgpdCJXUheJb8RjQmS4odfyeNh5MWgDFgkw4jJL0RHI/rYX/v
         a6tD1dNdrDMPmCETgy8uicGkWWMrE7e0KQNYXS+FuLWRnmGGNJXKFHI16+9njUDk4dpD
         0zsg==
X-Forwarded-Encrypted: i=1; AL+hErG3M0K3bry9PcZfprqdmL9HPipssDnvuZegnwyZ9nNYmS0SCKUksXPYifrJ5dsMtriWww1ySwhTxi71U5EZ@lists.linux.dev
X-Gm-Message-State: APuU4Z8avt1sXPsXW6pwHARHOGG2xA+rElFevf9gHO+5xiYEtmS0Brbg
	mUahRuU3RiL0umQOL6GzbHxYQGVfQKXJfCbkk+OKjLOMJ8mi7bGN92Ql5lKcFQBHRit/5ND+y6h
	LxME3fDChBEE6ooINF/J/aHFtdsPAkL8=
X-Gm-Gg: AYBFou2QwzVItQK0NTbi3mzgrVOKa8aDnRLGDOhU8RQX5JgwyRz33rBxgzbOqnSBlt/
	SfsqrX1ysWoS60E9zoiSLr0iLGVjqcpXRKoynmoX51bbDI642CBCu/J+CSKwgimOBR6lsJKCH17
	gEpMzD5XXEcU7Ff9257XXG9Typ4E2hpwuNWNFsYjs0mFr+lIwHSLXcMdPVtXm4Pv1FUaw+BC3eE
	1KGdSMvm+ebxLCpPy9POkkfFEsz0YXj8127FfasA8LbDRbuUQss3QKI3MAXvlEBlG3ZOZ9rURJ8
	Y8nTEvroFkW4FiPU+wRCXe7JK0YJPybarUuhjs9IWer2Wn8/yyEbqvRwP9qjSuScKdMyNDM5KK6
	404A4WPvH1RVywIJeTXxIl+sC0BQjmtFvuS8bexWMODhe/ASbdU6KKyOzSrLswh6mooQHlVkboS
	R3iHaTZhyUfP74EE1I50dtnr/KF1dOU3zoHbTDumb7IG/sMgF3V3grCna2j4CVO/iUhyTaG61tT
	fSKfmFelltBOJc9g1ucCUwUL0aXY0tRk0fYvKagQX9ia9o71VM39y6z/rYw9A==
X-Received: by 2002:a05:690c:e016:10b0:8b3:2d9f:e5e4 with SMTP id
 00721157ae682-8b3a808cf11mr23524727b3.23.1794466812390; Wed, 11 Nov 2026
 23:00:12 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112011025.101375-1-hmjm081106@gmail.com>
In-Reply-To: <20261112011025.101375-1-hmjm081106@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Nov 2026 08:59:35 +0200
X-Gm-Features: AclHuK-mtvH5nJYZEQDl4p7LrxPm2ImC-KMW5NnR0JKKS7aflF6_FvAqZyCHuxg
Message-ID: <CAHp75VcFZB7Rz0cs2iHqzRoCaGKWS8Q2Mt2MkgTc-xbKSg+S-Q@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unneeded return
 statements in irq.c
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:10=E2=80=AFAM Hezekiah Mogere Joseph Mayaka
<hmjm081106@gmail.com> wrote:
>
> Remove the bare return statements at the end of void functions, along
> with the blank lines before them. They have no effect and checkpatch.pl
> warns about them:
>
>   WARNING: void function return statements are not generally useful

Only in a single file in the whole driver?


--=20
With Best Regards,
Andy Shevchenko
