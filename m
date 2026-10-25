Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792908047;
	b=Me3aUwEFUThNYgQAthE9elcM4pc1lnBxD3Fkm0Au6wrSXrdjqW7ZmTQaanKc9wbHJ2dC
	 Vlp6N/DzHorkcg+eu7ZV1thnUGAT/zY68hhPbphvyzjwo6m+4IXaViDdGAC0Robt/lb0B
	 sy/0oKmngphHQDXdUjff7aBBB5WV/P5vC0/q4bWRMs8FUknp6auoTU6xSbkkTGPD1zl5d
	 NjJOD/CazHr6s4bYgQjiR/YzGmhoxWCs0BGkRpZo05rWg/wimhiX2F+3c5+kpbR61Nggz
	 xvpTMq9GiGsp/mr9rXXzWKqPjzY6NHVyJoSk/8fHpkdowrFB8/MgyKebeQH3ttqBLSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792908047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
	b=HavWWCz220V+8wOEXF7vWg7anqYx2qbhOAmNPP1xW1txwWcdnJWEBuYfnu0AiBL9eONG
	 pF3W2HKi6BmhrFEiQuuHKJI67+yF7spt4Zf43hu7VZ3wcBAxquP9JAdo0wrBP+VDJ10eT
	 29jXXm3jORGZHB3TVEX39P+YqGgYhHX1H0x8R/cfpnuF6O6Cz3LFNzz+9aCmiXiJbfqh1
	 m3/WPj2g1pn3IF1Xxr5Lf+il12hjGBhDLf8A7G82V7RKQhdx3r+qdcjo3pQzmjXHYwyMu
	 jBjMUMbTN9N8cvudkZjuss/HxzpQfXfJeEgKT4sfvYA6TqNJV6z3cTr/5dfVLPIJdJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gw1xOHHr;
	arc=fail smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10620606A31A
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10620606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gw1xOHHr
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-980c4258105so1187947241.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 23:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792908046; cv=none;
        d=google.com; s=arc-20260327;
        b=a4dXGF3vyKMEF9N9DyT23dRKwnTZKJ3VVd826+ePKGiPPQkUelJFhee7X52Z/bSH7b
         TekemYEGReHFt3ZYsxR9VM3CJI2KiAqNbBr+NQ47CP8QfgRsLSsjYHR4sYH8juTJdlUd
         FDjfd3Fdm0pSVp7hza2pbK2exxFHF4gY+Nnx3qt/B05Xajsz4YhSHf4INazl8H1qQVXF
         NnPUXpF7cYKnzFyvfZn5kkcolvugVZptG1zq024fX9PwwsJ9N50pUqkmIZGsClb2V8Nm
         gbmmHcKFdlUGmYH4FNpG926VY1aP3ZebHz/b4h3+wGqvBmtDm0oD2K0zLmk245QqGi9k
         3kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
        fh=bCoRq6iUVJxn4toAt30qlXZulRYCzRPF1BV/HS2804I=;
        b=NeUOIKq50CyNCVOLQbuzxKWJ8OexKOpeAoTz+OEMH6toklFHUcqlgO9w6yfJiY7FZh
         vBny2II5fwGLdVY1lZlZQtYCUKXj1f/a2NKdO6xXs4ELn0kQrsXA6KGmODWBIcxRrAZG
         AjyZqdQZg2V01uDHVu7QgeAhO96pTJxz065WkFpzDA9LOJL/dLv3OmvRz69MUwA4qNfg
         Ujs8UfXkT6nJzAdb7Ku6fXxPdzkGy9HfDNfCkUAsJdtY7NXJILbwmKedQf6TT7M2v+RL
         VCgIm/yw4YgxbXpZR//nxTfFLfKvgk60Lbu4ai5enNBokTj9Y5iXXXzbjGDAzTzsNGyX
         bm8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792908046; x=1793512846; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
        b=gw1xOHHru6DeiVNBo8zBYtNZG9EeL4YlTWwWjsvFJbQTInR6tGr7XFaCpYS9L4nB0R
         z0DVsPJIt70a+hlDblQov38lx4tbBDf57Sq992FiNEvoTMDc40j39i3Ycn8NdrLDACH4
         gzugjZyqyOfAdPKVg5Wmu1KW8K9H2ok6uvMMbBmK9oirpehv6oxAiZN7/rfINBltQy/7
         QUiDJY0IFoJWamMlm+nWTYI/Ht75qENOPcyanQEOM+22i8jwEZLHlchy4dDAnWSgZiA8
         AK8MKxI6LDupzJrQDr9bPTlPFdNuqIolgRmlLEppu+mLNLXpJI50jqSjI23pehXeuJE3
         pmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792908046; x=1793512846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5aG9/sUaDY/v6QVU25+fMMSYhzDkzcZSaaIiSDMnYU=;
        b=I+VIFAl98faQkeVZReMQxJUkQkxOmFZK8fNE3Wig5n5pL1vGfAAioBZNlMJlkpDxh1
         ZnvxzdhO9aRv0TKxxs9b0S9kXP5lIIEOFDUhIuxa/Agy+spOMHZjw1sJAgSUnsCtFreO
         8ySbmOS6QIYyrpWjOQ43hRRVj/B1XANB2MXaijparJaFuGWZ1kKxKvFcygVn/uWWA6eY
         4sXuz/F4EoITfE1haVuH206z+3MaCinVmtO+zeFYYT62KPLL7dXbLXnRtBlg6Clv2qxU
         FdicIbuCmAywUMtImTZBnSIor4lcbLMn4+0jdblBEbkxjf+rZkNAcO9KvFY0jNzZA/7v
         qfTA==
X-Forwarded-Encrypted: i=1; AKwUvBxQa2h51I1ZvHVFjx/Z4IpUdFfyhKDtqd+eMnXbFIwT8v97h43B7VCdUes6/+FcVWKF9AUofKA6B4ZpNrZA@lists.linux.dev
X-Gm-Message-State: AFq9FYJw1tIJmrrLBhMLP0Hq3d2OMgmEwaweKS+1j/6OugXPdPNIID/D
	0KmU6o5LslyC+tN36sPs2HYpP2ILDFCpzw9hwcvQyw9Ut57hHLeX6pqxGUNnxdk6qZuLQ+NduKP
	4BMGfgHpCOQyxovav1QrOvp/SXkRjLS8=
X-Gm-Gg: AYBFou3qczkfEmzfv5gILZVlgCkiQ8U+B3P3Zl2CIoVG8MnGkD37ri34Nq7aGahX8br
	oJxBiRclVX6N0B3RbZQBEQ/rfosgYnfmYvN2OuqU8+yDV2SKjeDsROcG1wqb+ItNLg6u19KWnRb
	P9N74aL4N0drrULrST9RZA/0pcIW8Mv2WCCXqsS6YUbHeX7mRIZlKeqCZRoxfIZba0nPPueLR6v
	S5wI6cEuTHFerD9ucm1jKkqZfstMZEqa8VbW4sSIWcNidumiiiWD2NiKR0aexjA4SKziL8pvyZR
	vWQlKH3Yu2jIZAKkR0lZdoU4aS32Qv6p4DcitRPXkiN+ovNAV2FY5T5GeZ78iTfMG8eujZkwNH4
	9cVgHSk8LQYWkUubMy7ZDhvjncOyg5/OmLWQ=
X-Received: by 2002:a05:6102:3fa7:b0:7c3:3f26:8785 with SMTP id
 ada2fe7eead31-7ce5cc37c83mr1116161137.7.1792908046029; Sat, 24 Oct 2026
 23:00:46 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025052136.389541-1-dev.adityanagar@gmail.com> <2026102519-polymer-gorged-bc90@gregkh>
In-Reply-To: <2026102519-polymer-gorged-bc90@gregkh>
From: Aditya Nagar <dev.adityanagar@gmail.com>
Date: Sun, 25 Oct 2026 11:30:34 +0530
X-Gm-Features: AclHuK_TcOcKb9WAKxu1FqX-QDlLrI_sal7kxnj4OmX_2Ibk9PcCncKk3AAFZfw
Message-ID: <CAHLX7j6Ue5gVxc+bLZS5kphO39bs=Jf55Pc4nEyN-aiqtnmndQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unused argument from FBTFT_SPI_DRIVER()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-staging@lists.linux.dev, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the explanation, understood the message and I apologise.

Thanks,
Aditya

On Sun, Oct 25, 2026 at 11:25=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Oct 25, 2026 at 10:51:36AM +0530, Aditya Nagar wrote:
> > The _compatible argument of FBTFT_SPI_DRIVER() is never used in the
> > macro body. The device tree match table is created separately by
> > FBTFT_DT_TABLE() in both callers, FBTFT_REGISTER_DRIVER() and
> > FBTFT_REGISTER_SPI_DRIVER().
> >
> > Drop the argument and update both callers. No functional change.
> >
> > The argument has been unused since the macro was introduced in commit
> > c222ea5d2f33 ("staging: fbtft: Deduplicate driver registration macros")=
.
> >
> > Found with checkpatch.pl (MACRO_ARG_UNUSED). The change was prepared
> > with the help of an AI coding assistant (Claude); I reviewed it and
> > build-tested all fbtft drivers with W=3D1.
> >
> > Signed-off-by: Aditya Nagar <dev.adityanagar@gmail.com>
>
> Sorry, but please read:
>         https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
