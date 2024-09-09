Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A71B1422
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 08:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868866; cv=none; b=P3tTM/TRNGdW+2NSQoO7mrouLfPvGdtGMsdu++zZZHeMBDNtkaxebNZ/3EmWFp7/3qHG1HG2YxIiIorLEGqR6qEmmI9bcaFSaUUpYzYc/0yymsA/X2QA1YRzQFFf+dLjQq02qiTxNSuLHB1GbdC5K+3/Y5jhxkT/3e5JFhUnMRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868866; c=relaxed/simple;
	bh=M1SnVrjyFwIbonn93AI37PHh6KC86FBSMlypv6VaacE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sslbkdkxT2Cb4rdIXjXXYdGRdvbGhWDZHCDOkGDYqAhHaoBhK2FzuePYiPsOStigTlUc1VGqIaO59SQ1a5fbDENbVpjsIF7Gb/5JrM31WNSrJbI9P41jPwb1pmtWrZ3PxiO7rfWlm+GTNbX/7xdF++C8hPdxTHEQyRGXKYKMbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmfOsMvN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmfOsMvN"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7163489149eso3237244a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 01:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868865; x=1726473665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1SnVrjyFwIbonn93AI37PHh6KC86FBSMlypv6VaacE=;
        b=mmfOsMvNX45vBgzpc6+5WBLy7crIOLpOhpHCMnL1qhwAlOZuK9lNmm2esU9Z/X32Hg
         uDXaYWVl/nmDC/YvsJ3jsBKUByQeW6eFea01VJYXNFSLBwAfYiHhBvf5IYcU6mJNhj1f
         U54YVRkTKM0scmfHak/Y1B8EZMzNVs7oRHzqOcKjodcls7h1r1ubhNKe4XlrF+1//qzj
         zTSBNgjdQhEoBrSllYHKHgqkDSrBmqtyMfQrTzXYezsjDEXSOYxhzeUQFhqm0+4L9roQ
         dN/N2Wq4gDKfSQ+kH2R3Uj/KbJMxzE5mjf11EIM3/tsnsn2xWGFoVauJed7r0vwVaxTX
         nNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868865; x=1726473665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1SnVrjyFwIbonn93AI37PHh6KC86FBSMlypv6VaacE=;
        b=VhjX2Rjbdjdn/lYHDHy+cDSk0M/ZrsoYIUS51PpzXdig6/rC9lVlON/NV8Zkt0lAdc
         93saBDx711kOFZtUx4kIVmVsuWIpouztNfhaJF5JX+hw+i+CABc1F+MZhNlOMSAocwEt
         dm0fpDla10sDKlgW4M/8ESlfaF1MrB4l0M0BazuY0e5AJXo2foCWf2C49u7UE08GXXax
         wB1abG4jbFYAbnfszaRy31Jo7ntulUObe6/+9RggjHO9cl1VmfJudrkQ2VeHNqZ0A0El
         g1nJZjSPkrGekxoYcgu+738y+wKwhCCtuhiUTKVOcgcLLfMIrFr3FyAtwzN2eOIbaUc8
         Q7IA==
X-Gm-Message-State: AOJu0YxNCvuOz/ZuoUK5fjgHm+ObAn6b9hVfjjKaKhpVTdVMxwU+24cd
	2sBx5dmDEBE65tN+tnfMS6AH7ju6hB+oEr5cC+TiQFQztz/inwoThz+ib1KuZmi/PGFW8HX6egV
	wuJfaVzVnD3NvkDKcqQLrSqPHr98=
X-Google-Smtp-Source: AGHT+IHdwPsJrzBChtnBGdvf4x/dY1fxzfq6b+Uyf7a7woKfUlA2U3MS/SjECYiyhnNs3EOyU6Ur2rCGhE4jqVAIzUE=
X-Received: by 2002:a05:6a20:cf8f:b0:1cf:39ee:f259 with SMTP id
 adf61e73a8af0-1cf39eef59emr4016543637.5.1725868864521; Mon, 09 Sep 2024
 01:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908180902.3196764-1-sayyad.abid16@gmail.com> <ca1908f3-74aa-45e7-a389-3995aba2660c@gmail.com>
In-Reply-To: <ca1908f3-74aa-45e7-a389-3995aba2660c@gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:30:29 +0530
Message-ID: <CACVUEBme-MqZsUGYE=5_0yYxsyeqQA66o_ihW4NDw02DnMhyFw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Fix tabs for indent and + in comment blocks
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 2:04=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/8/24 20:09, Sayyad Abid wrote:
> > This patch fixes the use of space instead of tabs,
> > removes trailing space and adds "+" each line in a comment block.
> >
> > Signed-off-by: Sayyad Abid<sayyad.abid16@gmail.com>
> > ---
>
> Hi Sayyad,
>
> please apply previous send emails to this patch as well.
Roger that, will correct this and send a v2.
>
> Thanks for your support.
>
> Bye Philipp
Thank you!


--=20
Abid
