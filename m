Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9EA14F92
	for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUPg9hUc"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed5d1ffb0so4572838276.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704972273; x=1705577073; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aojgwYUr2QZguAnX8qCVqtq4dlhf98Fk0ICKv6JZtAA=;
        b=aUPg9hUcpTf+4M1rCPWx7uv3wYpN20gRgkP8EvNfRNkPUs+OO7AVfn2bQQoNf1VHCb
         8yKakRFwY6m5D+IYAydMeq/lAkWvNamHXMyW5LuNQKamB01B9iATJ2cT5QoevEvpCRg8
         w7ousfZFF6RMg52ck4m3cEPLkkIW4Q7z+YkwGGVEXNj/xMxAIKpKs3pVWuNrZvEXE3Bl
         h0o60f7BnlIR1yGwH2hPVqYc1PBmu3sij4ZLqfys1VM565IJVlE+yL3C+nD4yKf1BU7r
         hwqsNcQ2yJewod6v0rINqbbfCaxJpvm2CRUFVh/0tKSyGtI+BCptgv4LdA129qY70tvH
         /Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704972273; x=1705577073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aojgwYUr2QZguAnX8qCVqtq4dlhf98Fk0ICKv6JZtAA=;
        b=aCjaCxGLAIPKX5VGJKhn8Bxj+doUhAbG2QTbBwOl12BtcHciii6DHfy+YvWPgwB14J
         f9jRV9iWbZ1mZbgJzNBBpPPYqm9tIQpur0YCdXYP4crp0yAI6iWHE2kRdRx3zCAxdXSm
         n2fKxOY38gmgmnI/DQKuQC6WmwgxUeBK4/GUULB7arceZK0ebZ0f68fc9WHNidiH5h3j
         zQjpgPThlcLhMKtRkUJ23ULyUSsm18rLQT7whfgH7IQZCMRfjlyGfYM6qyrsg8UIi9SB
         R1EcA2/0Nih+G4VEZKehiaEjhF2bcn9HYyWSRXnLFPYlQ/uddYQRw9JYbAs/Zj8Jn8Fo
         j5fg==
X-Gm-Message-State: AOJu0Yw+ZDDmC+tS6OQMip96PpoXcINUEDlnODsKHhWwi92Jg3HPz9M/
	d5gVmQS04x+Mw3gypjTSDe+X2/L+FttR0JhqzUI=
X-Google-Smtp-Source: AGHT+IFx/bMfT4kDTm4bgkWCoYa3rLRG+k7Kmh2mgpdeVBjV2rOa+hvE8gKeoOVOnexdTpKD/cM7RjMgcYULBo13E8A=
X-Received: by 2002:a25:fc1c:0:b0:dbd:b46c:c1e2 with SMTP id
 v28-20020a25fc1c000000b00dbdb46cc1e2mr837247ybd.110.1704972273260; Thu, 11
 Jan 2024 03:24:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240111070652.71717-1-pranavsubbu@gmail.com> <2024011144-silica-viral-9e79@gregkh>
 <CAP1Lp88vEZJtd69Njf9uZ5VXypwZ-5vLdBHf2xoLSpqmeyEQiA@mail.gmail.com>
 <CAP1Lp8-CP-uELVam=18oADOEvL_13wXkTyDLHKbjQe1ZyxiG9g@mail.gmail.com>
 <2024011144-sinister-baking-952d@gregkh> <CAP1Lp89zshQW_s0eLJjekr5tyc3XLaPnh2VGFrNDHTA7GT51ZQ@mail.gmail.com>
 <8988f86a-f850-49a4-b7ac-ae363a7898d4@moroto.mountain>
In-Reply-To: <8988f86a-f850-49a4-b7ac-ae363a7898d4@moroto.mountain>
From: Pranav Athreya <pranavsubbu@gmail.com>
Date: Thu, 11 Jan 2024 16:54:22 +0530
Message-ID: <CAP1Lp8_6MRu8DJOqfvOEWVzA9wPhFB16iw=i2jOQX4RWELj=kA@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: Remove extra blank lines between code blocks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Forest Bond <forest@alittletooquiet.net>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 4:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> I have a blog about how to send a v2 patch.  (v3 patch now I guess).
>
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
Thanks Dan, I will take a look at this! Also, why do you say it is a
v3 patch now?

Yours Sincerely,

Pranav.
