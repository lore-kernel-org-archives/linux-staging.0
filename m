Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275521A931;
	Tue,  8 Apr 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146252; cv=none; b=B8oy9F8bLAIDvZByceutipK4boEVUZ9QqizJfIN9E9CRwnr0fE5ywrmvCLWziZ/BrywrMwSTXkRJ6IaazXQQTYUtcSurf70gKHBxcX29Gdn4bTW0GDGaOudCGOehbTK7MqCsBJh4vujIZGlRmv+qRvPM/Fv+LGL/DN5Q4Ux1lMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146252; c=relaxed/simple;
	bh=nOhZRNfUVpq/cNGVu6ihTvvzz0Z/Et5J7mOf/q5xEtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oet69Y4kHPUdonKWq3H+Yv6LRssretysNcChSIgYS851xwAa7fjWWJjKP0fMB4OgC84LGXqLBmqyR2KuMGHHWb3EaH1PUCbmXbYvdsbnA/ORUTgYDfywwg4xx/ce+axtcTZA73pB1eAjcsJtMOGQ3Byu1TySu4o544MS0IC5XYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv2lILCL; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv2lILCL"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-525b44ec88aso3026541e0c.3;
        Tue, 08 Apr 2025 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744146250; x=1744751050; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOhZRNfUVpq/cNGVu6ihTvvzz0Z/Et5J7mOf/q5xEtE=;
        b=gv2lILCLzJzlTkHbt0qck8kMVovBdyjlRsF83PhnlRPXnypuEIy+xRmmCZGKqxfcl3
         H4D1AvMcKCD57+xVSo/dj1UjDyS7GxEK3feZfA8fSQhnf62iZLqn+Q5Pf0+iRaU0zoWX
         N7cLT/IIpSKJLr8ppKcIRjX76lZRd5urlUe3jsdrCEqkEPuYNuuA8Q6eM+UcVjZsAkmC
         AJ5JNY0VxYuT7CnZ6lHecQAbrZQ07DIKOsD4O9njTgBQl9MiZ4SRZsQ2AaJT5KBrkYyl
         fksGh5yCttlmpYlmhkMCG0Nkr1g5I6AUlUv0jaZ8kdw3WP33qs9QjV/Q9JPcFselXSGj
         j6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146250; x=1744751050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOhZRNfUVpq/cNGVu6ihTvvzz0Z/Et5J7mOf/q5xEtE=;
        b=hFZFYVsqANKddBlY7pzmr5FH3Sju+61gsIzd0pdwa2FN203KXaOM/eyUuVzKQ5103I
         qpPLqvBpmHLHXsTYsJQZyMK3S9KV9x9VnAa3wNUiKQ9mjNondn4tRq5U/ehepeUjaXrF
         NoY24N0qEgKc7+It/1QEO07GqTm7v9V2oGSSeYVtAKZ6GNw9E77cN5VfN0iFmVMnpfab
         EYax/MfLFtKb9/cVnZ8OINpUMg4vWz/hnOpGcmPEhRRTZ527Fli2JZ4mYig3rxKNVXtH
         bxKTm87OSmPuGIsnEmSG1HD3BOURB5QwXe8/42XTGUbyBoH49x7uA/9i8Nz8QpWDhg/M
         Axvw==
X-Forwarded-Encrypted: i=1; AJvYcCW4AVNCyVi7vJMIf2/+U3WpNkCz8zc8zwD2fmEaBGB3MFP/7I9BrNNSbfL81RuNR9/vyn4JxTElPhk03Bxu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6HGC3atBjL7ZzQEqXIN/3xCZ/gca//qKZ64vwz99pOL7jCstC
	9E8XyqzR5m5jZETNBK1A0c9WJvevsQQtmolMu4QohnSGQvc27DC9xzz+iTLeFGhj1b0VD1SkKQN
	tdTrB08bC7mpKMpbjLuoOzLHXoLU=
X-Gm-Gg: ASbGnctnlkH04wlieLGxIs8G67DexvV/mmx3sT/WzeauL+WklCI3USalmLffn6lz3fm
	JOM6+pUoG7tU9IkoxZmtMtRP/NEwNsULQyT6nFd+vcSxaC3CFLEJTNQE7OwX/LKN9rBrSq+V6MQ
	6x4duwQPqY+cjrgRWCyiMsLHkEXvbi
X-Google-Smtp-Source: AGHT+IHSwCXizLtZV7QBBRd6X77VS19hoGOvi5qIAzv/QDy/1emcTcxElomM2yXG9r1ooAIJaTHNcizEJMwtjdGLeXg=
X-Received: by 2002:a05:6122:2205:b0:525:bf40:e628 with SMTP id
 71dfb90a1353d-527a9232b93mr428632e0c.6.1744146250128; Tue, 08 Apr 2025
 14:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744126058.git.abrahamadekunle50@gmail.com> <Z_V70-9Bk-aZ914y@smile.fi.intel.com>
In-Reply-To: <Z_V70-9Bk-aZ914y@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 22:04:01 +0100
X-Gm-Features: ATxdqUFTqyzlTPM_qJevaC8MWGaUfHE0Wx7A07-A09KjJRRiYbrTf-cHJieKNAI
Message-ID: <CADYq+fanYZR1UNJVR0iapynQeXTVEe1xPMMJHXHHCGc-Sc3B_Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:41=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Tue, Apr 08, 2025 at 03:41:55PM +0000, Abraham Samuel Adekunle wrote:
> > The patchset adds spaces around binary operators, breaks long lines to =
enhance readability
> > and provides clarity on sequence number wrapping by using a modulo oper=
ation % 4096u, in
> > place of the bitwise AND(&) operation & 0xfff.
> > The patches are required to be applied in sequence.
>
> You missed my tags I gave in a previous review round.

Oh, I'm sorry I do not know how that works, please.
Am I supposed to add them to the commit message?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
