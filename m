Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876018A6A6
	for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744462576; cv=none; b=DyMVyQOXl6cAHSUAW5Cc8j8oBddGLkYJjG1A5DByoAYkoajhjN7y2ViJpY62hQXxMgJxS1EpxyFgunuyfVrz7aBfAJiaQOpBzog0ZUhF2GWFzxuvEZOPUqaXEBFQXwGrrpyDS7/MieYoHGCdLZNvmWAogzsREe/QdX09hgxTDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744462576; c=relaxed/simple;
	bh=e6ALmVXs3dRCfZTxJlIzbzoJqYppBA9zA8EGod9SB0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9tN1twAT7ubpUdKc3ipkFWPyYLBSfMG1YjXyNJGTpfuQT7D/THKo4yQ5cPpmLMIvs0VZl0ulVTIWfTxzdzwbASjTaUv0IjbRXmcLKfPDirkX9iu87sbGLtVCp/SHXlhLnmJxbWUNPFxOvIZvYjQtduJvCe0kv1HdEz7NO7dUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7uyQ48/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7uyQ48/"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac297cbe017so698701966b.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744462572; x=1745067372; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6ALmVXs3dRCfZTxJlIzbzoJqYppBA9zA8EGod9SB0Y=;
        b=W7uyQ48/yTyM3SfNmWqicXubxk7o1LxPlmoGCUlqdF/Un3EGYvwE4DrA1cStjMWifp
         BrkT1FhGwVBAYkvZPSCtqj2p4h2a/PhYytvNInqEEF8JlzZoeZunTcU4zXU9pI90wEUf
         ZLn9pvaDkoPAZF57/Pa15/epqivBtZLPT/Z98IJCprheKjCPo5q3drUXuf1wl2FxJQqo
         4/xfy8OYvPWFUqzbS4CYmD/sqEDFVcUDChhjkAnAvFcbOtNdgnlXgh104SxnCmS2pNiI
         xFzc+kJDsSyc/hIyQMctQT9CJFwM5mAWvwi8GnTtU2OsS130cdOWo8LSrFv9ZJziP4d1
         lM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744462572; x=1745067372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6ALmVXs3dRCfZTxJlIzbzoJqYppBA9zA8EGod9SB0Y=;
        b=vaLoCUJOf49RlNrlJS/jhddC+AAXEwVj8x1NL6uwYhd+0x8raa49Ovm3O96+0voMHK
         3KE6e3Ir43Gt0iKOKna/7bx+5A6X9zNvcObTvNUac4/QzCYJRyi7WcpgrecJwjjxpi2j
         VfpCVC1voDSJbH3VTDxnKyVGz3372Eutpd6CB6U4sQ13HyXRP1CMqfgyyuU0p1mn9Xas
         ZQZs+eGo4Yj8vswbLGr8K2yPkZBtiQb9u9ZMnXjvIEO0MVNhRi2eU1c3emp2xr7uSL7d
         oIDDfplXVySGDLTcwnTl7lhrUFie6zBfG9s/v9SJT1BrKKIbh8dqFlkfykBc/bFyKgH9
         dCHw==
X-Forwarded-Encrypted: i=1; AJvYcCUqepflC58rVEgVjXKGVcfu95qceVEXoqSnVnndRC64vSHXYdqsPsloGl3cgtvwqN6SgS7fuhrgOExlOzBr@lists.linux.dev
X-Gm-Message-State: AOJu0YwClm81xRTAn5Fb1IP3f3kJsiY3eyJkj7iWpFPJWpHpxKzW6e0U
	ZUC0O/FuKI2yDk5t3WCNgXd09CiLU4teEZmFLtu3cSjzg+J5PkCVhXRONuTHPWIjHkm4s7Dpjw7
	+vbjVRyRJHE8NkP364zp1xDaA/P4=
X-Gm-Gg: ASbGncvPMoN7dXmKBr0cML+KQjaV1ar6CXZga7meViwcvmofEuunIuxSJIVrwkmiN+J
	7gWrzAS62cMtwhatAtJF9zsxQ30RRIrfYPIPi2yBbgca0u+T3mjm+Ax8pZ+r7uAQ4S1uXfdBLW4
	18CazQNcKiQ5J3BmBrIA/PkQ==
X-Google-Smtp-Source: AGHT+IFMV3c/itAhZMzgVcBzOSMPT/Nx2JEUkLQ0az6enKAPX6J5POv79lL3g6YHPYu4rFFIUoJtFa1vTLscwjb9pBc=
X-Received: by 2002:a17:907:9281:b0:ac1:791c:153a with SMTP id
 a640c23a62f3a-acad193e9d3mr499437166b.27.1744462572253; Sat, 12 Apr 2025
 05:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411-iio-sentinel-normalization-v1-1-d293de3e3d93@baylibre.com>
In-Reply-To: <20250411-iio-sentinel-normalization-v1-1-d293de3e3d93@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 15:55:35 +0300
X-Gm-Features: ATxdqUF3o76DXfTWlQBqRAnEllXdv-mSiXdscMBSIoE5Jyr5rlKb-JPEcZ2kvSc
Message-ID: <CAHp75VcdpPC2faWNMupXL-RaEM3QsSYEyfSC+A7KEsmD24U=+Q@mail.gmail.com>
Subject: Re: [PATCH] iio: normalize array sentinel style
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 11:50=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> Use `\t(\{ ?\},|\{\}|\{\s*/\*.*\*/\s*\},?)$` regex to find and replace
> the array sentinel in all IIO drivers to the same style.
>
> For some time, we've been trying to consistently use `{ }` (no trailing
> comma, no comment, one space between braces) for array sentinels in the
> IIO subsystem. Still nearly 50% of existing code uses a different style.
> To save reviewers from having to request this trivial change as
> frequently, let's normalize the style in all existing IIO drivers.
> At least when code is copy/pasted to new drivers, the style will be
> consistent.

With or without iiner space, but same style. What is important is that
you removed the trailing commas.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
