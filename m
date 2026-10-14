Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31A3806C5
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989477; cv=none; b=hgejLP+ZYqQBwshTDZwdc/2+T9ytpg9SKlX2S8j0hjYl853y8JhXW5D9F+BbV6p7dXYxo7m4XZC89RJSGt1AhbfoDFU/I3BlUr8fE0RECeDU9WOayk8LiDXEwnzKV6u51KRxEVzNMncKLx6FDoo/i4wdgvng8A37SoXHIsTu92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989477; c=relaxed/simple;
	bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+HPjz3TdWxlwlQHBcFSA3vAMGINwe6wZHO+qCxYlHy84oj0CLaqSvgerYWNTd1CA8C/uXI60zNa7QJWSw5MT5NYXDKctqKRzaALOagqgB7diGIzplWqLxX4dfnwpvzINRtocZJCEm2V8DekJ5g+PqkOIP+strJ+2xP/1CjeCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NQ7bBKUA; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NQ7bBKUA"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso618160b6e.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791989474; x=1792594274; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
        b=NQ7bBKUAZqSmJLlLjmkb5sO90pLWsJFBb6lj4lia+PhC1z+ZAftJEO1Mvfje24Rk0V
         S41rqwRrnFDmvH4qsZM407rHrU/6n+GaQ8JIAQGLwncLjU20OEC1XihjifgnSTrDlWOX
         Yd22eWB/xG7BD1/bXnnsIfIUrvrGbJ6RQs3s722JQ99ZB0NIhRuYqkSFvoaz4DIpfVKC
         EYc+UfYSernxznsqGt1Z6my+/Nj3oFN4PTw3v/80f8EXOiPz2eEYDFJL2otJ7ESrHkDP
         z49B+5+F0UrceueEeIavM7pSUK0Kk+sqOSypUQbK3T7xuVO3cFOFBrKtOds391/TRum3
         5qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989474; x=1792594274;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
        b=oTx0RQvYCyqu8bi+RBEGDrrsZrSSNmdYzpQ6mpHy82xWYkQPZLWaIYUkWko+e4wmCz
         05+7EZ4TO7JHddyFerSmH4T4uVXyoV/uk2RTvadVVe8x89D7uznc8+wT3Xvtzmv8AkGm
         w9E1dNfJQ2yBKuuLynhIeJLzFoYtIqiHEfhwPhsyjJ5qLAVNrE1hfGByQbzF1KSB61pp
         Dls3o9zQz362TeUBEC5aLlbfwf1uJZMiAdp+rKl9LM8TmWPGZVx4/qdq7HQEK9XwAogN
         uPhaGRl4/pihVJMMbRy+UbWFfjhEC5Co8ln9h7auf+UOqZbU9J8SnuCIuxI003FLCnnV
         ysbw==
X-Forwarded-Encrypted: i=1; AKwUvBzoQb1UtIl+eos7wlRi3SMs24UKGJGnbDJHvzvCSKBI+4yrQ0ZZI9EuUcs/hLxSGhbyq1peWTSK4TlpgLxo@lists.linux.dev
X-Gm-Message-State: AFq9FYLMWXK4OuUS2hzaRkZmTldBxgQuXKUIHlkOM/v0iMjvsGR/t19A
	0x3wvqJ5MUNQRr5EHwzw9r0DkVTZrU812KyUpFlr+gYgvz0DbIvV6qmjmbp3oohEFZlCQ1x68UJ
	tY7RPtegYKB83K1AavuoHADx91+fDMk2N8g==
X-Received: from oiic12-n1.prod.google.com ([2002:a05:6808:a5cc:10b0:4f2:6bd5:e3a1])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a1b:b0:4d6:9335:d533 with SMTP id 5614622812f47-50c5b17f9b1mr14938839b6e.64.1791989474239;
 Wed, 14 Oct 2026 07:51:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:50:37 +0000
In-Reply-To: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014145045.2369689-1-johnsingleton@google.com>
Subject: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation and
 block comments
From: John Singleton <johnsingleton@google.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	johnsingleton@google.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:20=E2=80=AFAM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Thank you, Andy. Just to confirm from my examination, I think the key iss=
ues are:
> 1) There should be separate patches for the comment-cleanup and the funct=
ion-header cleanup and
> 2) The preference is to do this for all files in a directory, rather than=
 a subset.
>
> Is that a fair summary of the concerns?
>
> On Mon, Oct 12, 2026 at 2:05=E2=80=AFPM Andy Shevchenko <andy.shevchenko@=
gmail.com> wrote:
>>
>> On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@go=
ogle.com> wrote:
>> >
>> > Replace leading spaces with tabs in function parameter lists and
>> > format multi-line comments according to kernel coding style.
>>
>> Please, read the mail archive to understand why this patch is no-go.


Thank you, Andy. Just to confirm from my examination, I think the key issue=
s are:
1) There should be separate patches for the comment-cleanup and the functio=
n-header cleanup and
2) The preference is to do this for all files in a directory, rather than a=
 subset.

Is that a fair summary of the concerns?

>>
>> --
>> With Best Regards,
>> Andy Shevchenko

