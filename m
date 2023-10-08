Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D515B1
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwk6KQNh"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f6e6b206fso42638087b3.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Oct 2023 19:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696731214; x=1697336014; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G3HEwMN8wJykQ1F/Gq5CdsdfPgK1Mar6fjfy0CS0bo=;
        b=Iwk6KQNhHCIY9h0FHieREpxqRTHEGkWF08OJfJghRCS1XF9IDhnbxMNrgkqALWMUFv
         xhorbPLSP7JocJZilPO2/P1ZQ5cwwenbwpk0/oQzN9p6bYmjkSr+wWxumcc0kNhQWBU8
         xdbhn8pN9qm4vBSN5boeZW169p2dC6sNnIh7N7faDv4TR+I2cN2XLPy4E+xb4zT+qu14
         sVWaQ2VciXNP2mr4MZR18SBHR1/6UICeY2AL6ser8QFN/QgxrCfbFoK7TW+oKmVeqjHA
         q+yP6axgFnpa3+DM5ed0c0upa2KZdrvqnVGAEkxhgLRJVBCp2kL0kj0wnDGEGnjTPHBo
         bZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696731214; x=1697336014;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1G3HEwMN8wJykQ1F/Gq5CdsdfPgK1Mar6fjfy0CS0bo=;
        b=c/rzfSeCzeV+g4Lh7SsRRRJcwT5VPmpX63bgyTia+0XKut+Y1e+X2D309mF2Sr8KTZ
         qEE625RFhOpJXa40o8HEFkbz/wa1jaU9A0aia8E8u7mybF1oWjNkJePpWD+glkTuovqA
         v+kcuJ+Ky8ZCb5xAr3pRZRMEDzNZudQMTgyGt+kKFtnsba78azEuufztKcXdIRjgCkRE
         vENLfe6f7UWR2x3yJznKQGWunUSI01+10V5LgCoj6gW/TbKsid08pXBlOMNdRaZrQMt3
         QAaIZkooEMHFf51a0T138vmufPtAAE7BWXmJdHh6P81OQ1MtyucHrkfJwnNdowii+rJx
         z/fQ==
X-Gm-Message-State: AOJu0YzHmA6jtfGCZbwH9uESRXsFTvueFJQ1vQbdz1lMdXKVEX0zZcMe
	sV0ePtNKRVNcbuDyx/S4NlVrl3sDnKFl0eEb3a4=
X-Google-Smtp-Source: AGHT+IGfEU0gfelgssEBProloBp/sg8LqhxAolgQa0d+cuONC3lsnnQqBsCbP3I8P8eFY/e8UBkhn+Jn/6SOi5w5YD8=
X-Received: by 2002:a81:dd0d:0:b0:59b:ec85:54ee with SMTP id
 e13-20020a81dd0d000000b0059bec8554eemr13452442ywn.39.1696731214106; Sat, 07
 Oct 2023 19:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1696729776.git.opensource206@gmail.com>
In-Reply-To: <cover.1696729776.git.opensource206@gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Sun, 8 Oct 2023 07:43:21 +0530
Message-ID: <CAKPKb8-rhLt3u2-8utmPLqSkLHQ0mMoP3MaHN6GSYGCsCF4bkQ@mail.gmail.com>
Subject: Re: [PATCH
To: Pavan Bobba <pavanbobba206@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore all of the below patches. I will send it again. this is
a test mail i sent to my own id..but by mistake i sent to all of you

On Sun, Oct 8, 2023 at 7:41=E2=80=AFAM Pavan Bobba <opensource206@gmail.com=
> wrote:
>
> *** BLURB HERE ***
>
> Pavan Bobba (3):
>   staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
>   staging: vt6655: Type encoding info dropped from variable name
>     "byBBVGACurrent"
>   staging: vt6655: Type encoding info dropped from variable name
>     "byBBVGANew"
>
>  drivers/staging/vt6655/baseband.c    | 40 ++++++++++++++--------------
>  drivers/staging/vt6655/channel.c     |  6 ++---
>  drivers/staging/vt6655/device.h      |  6 ++---
>  drivers/staging/vt6655/device_main.c | 24 ++++++++---------
>  4 files changed, 38 insertions(+), 38 deletions(-)
>
> --
> 2.34.1
>
