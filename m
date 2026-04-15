Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FA3AD53E
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259883; cv=pass; b=TuvHXzeGdUkMtiu4da38NJmTELI6u+ijYsL2L4hFEFqe/L5OVkSwSmkJdWSR1OR+HFQwT8KfonQobsinzsgEjSngtrpitLyg3Lpz2WrpU2VX7/3CBck9OqdakrK5aFkAkmLqBj+3IEhckUg9l0Dzo3aiU0emvNQygTNYVUpyqQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259883; c=relaxed/simple;
	bh=lC0wURyXAz69bWv4J3Sezq0K2X3Om6r1orhscUgI2ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clgbZ59QovjsVE9GOBwVTT0zalD2qCOq8zpAqW36Lwq97o9MYI97RxN9odnzZ/iUXcdqpgNXUkSKOpNY7nVh34455FCps7UwYToY5vxchUn/72OaHrOVDUsxDMELhiLr2ddD43oLTEmHS881FkYK7OZX/AyMQHKiUR7A9hknPmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd4j2Qet; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd4j2Qet"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6501d32b04bso6378860d50.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 06:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776259882; cv=none;
        d=google.com; s=arc-20240605;
        b=BiENQdjFyLPN/mhE8Ar1dW1yCqrFifYRopa3eKQ0d4VZTtWBQDy+XmtbHhVl3XBmjd
         /euW6WVvlB3Rkf1CbtHXdFpwSSoqcOL2mcQjoO0MuN8S1uChSsqodexrjD92Iy9tL0ay
         BBwAs+KiPmzJ4cTDKK5asd5dk/B12yqlV3k8RZZk+x5QXDZh3W4snYfTjVOyGKH9/IeV
         zhBT//i9aktp39DzVGQAQhh8lx8XwjV+uzh+vLh3NLlq2OHzqsgp+uUO+bBbdzR0wits
         RydhrlEXBNMhrmbMd0j436zo3bRO0eWnl15sAcx7TFoJZY7LfwwCOtNW6uPaBUjq6yxO
         7tOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aiNIbmZ4B5Zir9OP8ysiY4IaePW7fiJTfDRuMBJ2dRA=;
        fh=hXUzS3G5TCCvxTL7LyPv0fuDFyQqxqiHWBwIY8Zys0k=;
        b=DkB2l2/8U5txrEJ7nCHMXd5fTQaAnFy3Oy07BcRDRyrggge80lfgJ9f+3rkqO+ysyB
         QBiXpayK0qxdAW4a264buka2byImDYDSg4GE1/6x0Lt32PkiGwnk8a8bW9LhM8guVcde
         oe5HsDuzSxhQv1fL//gP+jhWRRkrYciDvlF6VuoG2ZJmX9n4UmMmx+P78beqcva3SDoc
         k87KqnzVdgf/LmbPio0FMZFnzlRaFfZjaJ/Op0acwKaBfsYoss7xZVCwc9Numo8wmlUj
         wx2YmMdClFK2ryzLFqrpGVK5aldgqu2caXLBbr73OiDXdqh32hitpkleZwkxwjvlgPaP
         JF+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776259882; x=1776864682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiNIbmZ4B5Zir9OP8ysiY4IaePW7fiJTfDRuMBJ2dRA=;
        b=bd4j2Qetz2vmnulDpZRax07JyOmo54ERixwYsmPQUxDvA2UDogYLTVQ5g+gAo3ZSwO
         0+FBlpMDc8zDAn2vYgITm8Oj0I8ELWVB/lLGmuiKODpKnYVFDzkDPe6mETNvk2EPuYE8
         F3gJPqFIdLMwNv/cD1cJBQJGfif3ZDEXeQwTcuQyibEZcwTkahxayVuiq88hliHlJ6zC
         aLynyLT/BqXWM5r/jhYohPh2NJ9OL/iTMGzBMwkoGCO7yh61SwNn1gcHgDpVS97L0phy
         9v4f/uuOkwWo+pZ4LnWOV76Jga9eSo7M5c7a+9RP6cd8WxmU0nE6+wNUALIcT2ke+BIw
         bsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776259882; x=1776864682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiNIbmZ4B5Zir9OP8ysiY4IaePW7fiJTfDRuMBJ2dRA=;
        b=aVXTGLaI4J8BbiKaEajyYGkDtIQxPo02RaLUqGczfTQZU+hGh14WM8a9gKaD9LBo2E
         0DebLK9exavlF8bAzBWoyBS+5hpHZv0lu+w2nbIp8IiRS+QcbTKZicJ3VswcACIGgQpZ
         ilzobCx3OKH8tS458zHlmUo+Z0wsmCpmQoZB03QN4GixbcRbcaveZBCmVeuxsc0bd8IJ
         skKFI3uPHMC30X6VfZ0IdUHIyj2jQFN1hjq497xeTin4DZISr2ZuZvogdGVWwiwt1Cqi
         D7xr8pIewUqR8lnDhzHzfbMvCiWyzppRuXc6NAMlyLeehzm+Ifu2rCQxVIOmJHqeHbea
         PLhg==
X-Forwarded-Encrypted: i=1; AFNElJ8cisYJat4cZ3LHB0Zvt+h/Cp9hw4DFLWsh6tuIv1fRZ2TKHdFl/wA2h+e9rmT7ItpmoBIftOVipNqnADON@lists.linux.dev
X-Gm-Message-State: AOJu0YwnB5JjRPPmQ82LupMh0OSIQpM/8GQcTr/AvCpATXIwmC1XZIgr
	z0nyYGxm6hLgA61pcB1IL8nvCTpSh1KlNQ+zKlSc00o1i6A3QTkZ2KlEr3ZvOz9I5FGvoQTHk7q
	XVJa/Ucgp4RkBa4dsyqmWMs50+KVHjjQ=
X-Gm-Gg: AeBDievpsTKKVs9cpdnfksyyLvhn2NJKUAz9B7L8HxFvwmAdlhCl84A9t500bdYF++v
	sOZtU077GM6EU29dtT7siQu99ObXhP3NrIfI3EkZ0bBE9hJzkD3M1qiMfJ+Q7kdhYHn4b2Cf2Ba
	ssWQUfMO8BO/hv1QkZ42gp82qFbZTuHYJ5gEwORw+WEZnBDnkA+ar5fE/mBuDx3CwIVUNupEWkC
	eRmNYPWqovCng0oKYPBRY3TGZvJcVV8KlGa6hHGRa829PhFdUR2OJOCeCoN2ZzaPIQV7bUb63+P
	gSH6J9pTKYlLW5GUZJuI
X-Received: by 2002:a05:690e:1441:b0:651:be8b:e87e with SMTP id
 956f58d0204a3-651be8be93amr13590889d50.34.1776259881634; Wed, 15 Apr 2026
 06:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415122939.77847-1-m32285159@gmail.com> <ad-FcZeXsFlSPXQj@stanley.mountain>
In-Reply-To: <ad-FcZeXsFlSPXQj@stanley.mountain>
From: Max <m32285159@gmail.com>
Date: Wed, 15 Apr 2026 08:31:10 -0500
X-Gm-Features: AQROBzDCVgshR0QY4mUa0slX2Xn2OyKuTOQxV4oq6LCHOwNRLSzw7gAYWraCvnA
Message-ID: <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us, 
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

> Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.

This was because of a struct with the same name, provided there wasn't
the "_e" suffix.
Just curious, what name would you prefer over appending "_e"?

Best regards,
Maxwell

On Wed, Apr 15, 2026 at 7:32=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Wed, Apr 15, 2026 at 07:29:39AM -0500, Maxwell Doose wrote:
> > This patch removes custom typedef enums and replaces them with standard
> > enums to address the "General code review and cleanup" task in TODO.
> >
> > The following enums are affected:
> >
> > - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> > - cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)
>
> Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.
>
> regards,
> dan carpenter
>
