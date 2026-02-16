Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702019FA93
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 04:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771217579; cv=pass; b=QI6PYgjL8pDM2ePJN1D/xL5qOY8WrCIAqlNB20n/WMBOgmHBwyhJEhzzcit+yaOjL5ZsxyiXdX3lPJPkClCZTBu7itM7ETJEbaITvrfRVr+fbau/bU4aLA66NJa3Sa29PUf1KpIC1uLXvvbTq10c6+KLbqjPF76j9MomeQoHXOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771217579; c=relaxed/simple;
	bh=iDlALZmZBj3eNOx869SaP2dDPTfBuh4AgTIOILzWCb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYHXhVBuoNMQFSZaqpuIdHA0l0QGutpnuUyJ/L0cjj8TseaAOB9E15mIAWFng6C4et1cBT5ickI/UrKTEPtj4oeS2lznfN/ygz+ULq1vDtczCbV0cUBNycpReL5kWkK2U1WnGfIDWVUIccy3NSoGKFVhFEBLZe33TNC5xRsAvdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKjWkwXE; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKjWkwXE"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1248d27f2b9so3511071c88.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 20:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771217577; cv=none;
        d=google.com; s=arc-20240605;
        b=NE5r+whq+Y161cvI9q8Uw5+J8jbOwVTENskr40JpfN+HYb7+1RMZAdvT7MRTJ+Od3b
         r//6aORF77RTP3A9jgLhw4IsEyx51tqyWsmCBSSJLUKvOeGp01ZUW9n5qF0mlRxwxHJ3
         RiOzIjicQYcHEHhVMYBe/aBo3AochWo8NF2SvTGPV8d5ilcOgo26qA+agluzBLmcH70F
         0+NhIPkBdna+hIFydSC1BubswQXk4HWBrYx8w8hWfVwCizm4YL8rvGOLhco5TbzGRZ5U
         pITbO5v6Z0GrZKPahW8dfSyOF6cvGZfgFJlenCAPQPmB3IBXnTzdYHfiFuOM6hrMjyzI
         TIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTccCMI5hfj8LcwdYU904F7AvHteawVNHgOX7Um48Hc=;
        fh=FuRhULMJXUzbfs7Q5LGm24wUcYx1ElcudXHmil0yX7g=;
        b=PdR1L7cUSimR3B0mUPdzvmbpS0JkiQLICn93xkKTEHl2yc6WNgtT6JIAuMDPGy3cJy
         Y/uvKMUgbXZguivIU6Z05OlNU3XL0+jMe115kf7BwpkI3B+8d5nTSqjidGGGWw9zFQ26
         T0oXJTK+SBEfE3MvOEjh5elI3gdSaVuO7uWUPv84G3ieVnPI2hSnak/o0NmXyHWaf0uq
         RzhON/aTuLkL7rfB12pEBiqaTT0t8jgjrIWmVjh2WXTin9+W8k5X3K/1RFqitt0Eo7SC
         dEhPLI0ccnELJSgqmijHpTa51mwdNDyIuHQRTRdAbCXjnGifqsuvb4KCslQwJFQWIY51
         yHIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771217577; x=1771822377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTccCMI5hfj8LcwdYU904F7AvHteawVNHgOX7Um48Hc=;
        b=nKjWkwXEruyX/HlZaAXM/tAg6HqGpi0J2zG1GUAvWKaQQKlAXRape/cASUrvlamF76
         theQuHXOIrSRD5TdwLMRtdNDdr2u9MUN1/aSFNGNBAIp8YBEMaFed9WnNQlbKfnc+7oo
         QZ4lWwpsOWYU9r1Mse0z9PfOilS0tmR5XJtECwcztz/frKhLVgBnoNF0mg8ALzdz5gGR
         0IS32kECytD7AUVcrXFbw08RRjhKs5HTSu+FKiympwKvuA+w4oDGsgw5Zhe/Cd6oTqd9
         WUBehWt9czAAOg66Isl3Ig6u79rvMIfVsRfjXUDDbQFthQrLFridjR1gqw48NlOX+OeF
         3D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771217577; x=1771822377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTccCMI5hfj8LcwdYU904F7AvHteawVNHgOX7Um48Hc=;
        b=AwZxo5xH0YrObgfdUD5ncp9eyzZrbpKU/w6IfxUezPpp4kYAev6bmWy85L7nKKZGFR
         5XBfv/fgER/YewFJfmzJ4zcaaUcX0x7edFiHX3HIemvrgJK+ZYG3yVWJ27TtZCyIGfj8
         UcttVfC7iCtrpGSrI2ePdVudT3vT1J99NOQZko2bvp02UrX8mu7I1PxhphIL2AUWKDmj
         Rf9FDoRl+v6synNCW1knT/dKsA6+mvJ78TNvq1WFQGegF+HdNVUWDn9nBBUijOXv5VUl
         4G0gXJRlRENXbffd3MRoniKCSbY9b0BYnTX4FNSv4InJz0AcXevNDCGP6S94YLAk8voh
         LEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoZYVqEY/Dsxlb85hoLNUGyl4IdJDiKH6lXcgrWMrvMWxX60fggHHQS0vmC6beuJlwnWgvxvdFnQaQnkLr@lists.linux.dev
X-Gm-Message-State: AOJu0YwZRRcCpW5QibDm2kqUF8OuaPL73MuXFUNHCkTXHHlJVd33z2za
	xr/hWzUjuwSP0kHmmp3yXGBOeG3RaQ1VUuHXU2DtE/sbhVBBSRbtYqx7BVZjrQH6aLhmaQE7xku
	b25EvQ88rfUQDF9zHk7/LEjkfN2FhX24=
X-Gm-Gg: AZuq6aKlA/71z9qXT69Wp5DEaaRo7sAOsnUQOamJ8v+qKUx0KjqH8iWxk7IEpQndnu2
	+TB2SUTE1DnfzeoexnCkshApT4iU3zup8+nAStMuKkc1khMcboNMpc/Uul7YrQtgkFFaA9oIQ2R
	GGcq/fspuV27vDL9rvGVxloil0x8T4I7HTQNboEBTXS5f3gpGy30kGYZJ06TOChUlDZZsuTJSY3
	FfF4tH3/cQw5rSy5gHFYS4vZHEqsfMHxManLDGfOnsygP4DlrnGggIKs49uTYXFhgNgS1sr4C3E
	64ckmhz7LqSvwjIt8Ea6+df7ovx3Nrq8mIIAPuMqPSLv8Asgnh6pvEWYAxGeReJN
X-Received: by 2002:a05:7300:cb87:b0:2ba:81b2:7811 with SMTP id
 5a478bee46e88-2baba1471ffmr3489314eec.40.1771217576936; Sun, 15 Feb 2026
 20:52:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204183003.182728-1-rchtdhr@gmail.com> <2026020704-velocity-palpitate-afd2@gregkh>
In-Reply-To: <2026020704-velocity-palpitate-afd2@gregkh>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Mon, 16 Feb 2026 10:22:46 +0530
X-Gm-Features: AaiRm506_xdwKhH2D28TZwmImFjCHLEnEQ6v3rUoIq7gvoZd8rwauRPheZaUrHs
Message-ID: <CAJH1ELB2k_UkNW0nsH_5swy9YaZWCC6Osbq7GXnECHpepb6UHA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] staging: greybus: added comment to mutex
 declaration in fw-management.c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 7:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> How do you "know" that this is what it is for?
>
> Fixing this type of checkpatch warning is hard, and requires lots of
> documentation and checking.  If you didn't write the code originally, I
> wouldn't worry about this type of issue at all, it's best for new code,
> not existing code.

I did go through the code manually, but understand that it might be
deserving of more extensive checking and documentation to make
such a conclusion.

This patch can be dropped. Let me know if another patch series is
needed without this patch included in it.

Thanks,
Rachit
