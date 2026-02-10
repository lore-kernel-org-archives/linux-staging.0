Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012D52FE579
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763916; cv=none; b=rUNAIKT4Zq65KMDUgPawyZjSDvTJsTHIhEqJrc/n6uTOKCe1i0s/okzJuy/ycmd9vfnn5FXnLBHBzNW47iuJg802m/xSOI/T6bLaYAeqLUzEjQ7bNx4BsSnzMuJZMxkiAoynGDnqj8wAyI2vsEAoIlcvJ4QIwWs7u8j0Lscee1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763916; c=relaxed/simple;
	bh=ojnLFsnGQeAhbZxAI9qeRW0Ds/xb8yBobc1iN/SQL98=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DHS3nVEDFD2MplrlEDi8qhTkW2ojIvcMp4BP8cAJ2GlEYMlpsL7QuJ8DEyzqKb9teTMe0tn/AUnZJWbPW/7RxBERP1MqMPJziP+nrrjKpLmykKctiiu0B5IYeAzvhzpzQVFQPYasUiGThESKEWMd3UsOxiY/LkaNQnlmlU8QwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MH55IvwM; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH55IvwM"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7963aa14dbbso5589577b3.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 14:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770763914; x=1771368714; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojnLFsnGQeAhbZxAI9qeRW0Ds/xb8yBobc1iN/SQL98=;
        b=MH55IvwM9wUkiM4wkReBIiqQmE38uzBVpwdO+GWyq1m22uSvO/gv6jcHCpvzfzu8KE
         v4EZHCx6ainNpuvzWrFS7t2ZGwFE1V0AtVaZ5ni+YzAiuCYUc7x43Q1qEJ5lhjFm4m/n
         7pqa2QCmINjV7Yiq8w2e5p2k/vHtx2lyXl1Zywd9cchT56kwLVlmwFqlMNcxaUl45j52
         VwINW2eNZA/blBPemdI7MRS+Qfu0eqoShmUW9mMChwysGLaWmzXk7X9DtqG9vvLRDe+d
         aOPeK6S3RzIlJ11ZXS8DNp0nbmA/7Xng/ZD6GNUPLyMlc3faPqpzycE95EPIusx9JQDz
         HwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770763914; x=1771368714;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojnLFsnGQeAhbZxAI9qeRW0Ds/xb8yBobc1iN/SQL98=;
        b=DlHN6B2kyfSInWuLNFmkhEhti1CWCiO7Rg0DfN419CM2lXxoJDZllHP0yUqqebsnyG
         bbHlrlY2lYv7zS3oJEUHjCWxAnxIlgbRdfGcpUHLenfAdtUCpbVMNMFS/xvKdWDkdKs7
         rxj9diqP7QNNmFkZfqd5bAGnGu+HwcRKzZ4Xo/do9J94BgRIFkKd2Iwbi7FS6UqPQHtY
         XStbLLDX5T0ZR8zmMxYA/KTVH+uN9ZmDo2SO3gNkQQJmrvHaLpihY9cWThgnFHDbJSOV
         7taEgdt+eVHLcd7PG2daw1hzQCO0+9698eRLWlH8lRHdA+wG2hjL/8Gh2UZtwNh6AY4C
         nCyg==
X-Gm-Message-State: AOJu0Yx4R/XIdqVkp4V7v6x6g9IImeBFpeNxrY6X6Ez/Fii0mnejZtsM
	c+L/TxywcQQG4bndIWCdfIC6qi/6OmM3uUnDoOsJ2mmGzapbLlPjmtxy
X-Gm-Gg: AZuq6aIooZNgrpKZ0TIVmAuFjgHhOhBpdqV+JWTKsWawSywlqEApggs1aT9yfI02ZrQ
	cTmsCKRMWTfhOx1rFeAa+1TT3+Sq/oX9fIw/xiOlspvXoMAQydsi9NWqS7rf9m6W9yabDD5ADmr
	5IpDZa2sDpZhS2cJMIi/mVDFY8XrtijMcp1wMPtKjd9w6xRO0lWoXnC93CQjPbmYKUl8dr5Xo89
	zyABKp2Vd3+AdMHtPM4NbNxr+eN5bCoyIud8JuUFr0pEhAqetWb/e7NmtJxy3Z6Hicu3sFOHRZi
	y+o2yGQkB6wg06/XwapGPWL/BmGg/NaNJKnzTIjWU/cDGsu7jqUoCQ6MprgtnbTNyqK+Z6bFnpE
	P1dslGD6gKdWOdfPn9OUJf07WFQPVj2mTWHPH3PG97pUnyyP0y3mRLKqwpUA24CbfLmHQg6Ik6C
	HDFK2XwX8BC147xWKDKdP7kvemb1pXNd2EqLMzSSNtHSn+UTusoDTZ3t3OueuqjSvWzrMq63/sZ
	DG73wwFUlFcBKFMMrwmDbjZGcriFFpq
X-Received: by 2002:a05:690c:3612:b0:794:baaa:cc71 with SMTP id 00721157ae682-7965e2442d7mr33920857b3.16.1770763913958;
        Tue, 10 Feb 2026 14:51:53 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16ee7csm307587b3.6.2026.02.10.14.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 14:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:51:36 -0600
Message-Id: <DGBNEW30FUI3.LOI6M3QV8OT4@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove shadowed variable in
 sdio_halinit
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210185630.54577-1-tmimiharoen@gmail.com>
In-Reply-To: <20260210185630.54577-1-tmimiharoen@gmail.com>

On Tue Feb 10, 2026 at 12:56 PM CST, Haroen Tmimi wrote:
> The variable 'bMacPwrCtrlOn' was redeclared in the function
> CardEnable, shadowing a variable of the same name declared at the
> top of the function (line 21).
>
> Remove the redundant 'u8' type declaration to use the existing outer
> variable and resolve a -Wshadow warning.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
