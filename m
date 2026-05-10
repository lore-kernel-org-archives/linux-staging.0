Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1429B79B
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778394969; cv=pass; b=ntNM5mQRVaQkMf9wccr55uQztyMqGIDUSuctpqrL6KQkvpL41o0E+GYDwusr1hu3jOUbznXujWAi7tAwsyydi8r5WfLzj6KU7rHtEUyKOUu3HWHDrmLfocVOuxgwzThGMh8FDb8nvP6PB7fYm9zAfh6O8Fk17Q4OHZ4oY6V+kZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778394969; c=relaxed/simple;
	bh=XVPuHVaudv1XRrcrlNGyZ1MparSuw9338ihUKYeXXfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBeGw+gp6aqs8J3CRWPQhumW9agSkkQVZcQ9/58AMbFC8RFSSiHb4hXHAs+j59lpr+UF/NjDMsGorEGOOHK201NuCNgqIZVjg3Ip9OdOiiIcJFkCr4utzh3EBlpypa7RBGCW1gSCwB9o2AedzS8Ytxxa21K2gFasbWfqc5QtGUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNXXBOBX; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNXXBOBX"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bf1433b80cso20319057b3.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 23:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778394967; cv=none;
        d=google.com; s=arc-20240605;
        b=OheoncQ2OynZQ3So4RfXk55CKymslrNyXXATOyanfwwDqBJnZfeGtpvPwTIJCYAAcS
         avB9ciyvDH67c1srqRMav9SJHxkoUNecf7lLei/yzzQRAxMV40gReL/MuStxtPLGwFV8
         I24/is464iV6gHpD9SfSc512Sf1GVqb1he2jZWpHu4vOP8ixmLplSE62ra9WTIhc/bNe
         zAWV2/0siqM6QjeOt7y4BQ/MUQZ6b9nQw8BFWZWDpjytjTM00V5/mhSqncnAe6IYFXJg
         wxFA/7LL+9TbxHEUD2d9KUUQOLFwYmX8Xs8abGZkG3e2NK7XmjoDReJieuPe5AEu92Em
         Rf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XVPuHVaudv1XRrcrlNGyZ1MparSuw9338ihUKYeXXfI=;
        fh=PxFTA6e2T3epNx7dsSFT4204GR356JK+znAVoyua5Cc=;
        b=H6xcqTKjafBtKoo4SYg5B4KYuZn3b5Q2ljYL09hzdnkWLj8OtHXHZwulk8biqVLjEM
         s5jNl1dcl82NvMHIb6Dc9xjx7OHR4ZpNB/ra8Dn25vgwUXiyyoKOFR2HHhDmKcK1JYKd
         2/4n1o+AOsqAVCeKxmfF3gEwxom2QjPw+yXOcCcAg+KcemTcEHNAw1jHddIHOwIvTW6q
         3ZNSXLM/mWhuBGltwWB2lQAyhprEzH2WfK68hLobLuxK8fDeN0mSaFcJJUuDDbfL3Kzh
         hc856ypNBhg+pPqdCFZw1tKhUUjwpqf97mqR7Xy3KxsJ2+do/T0IY2eP/vLcwXWD/2Ff
         YTiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778394967; x=1778999767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVPuHVaudv1XRrcrlNGyZ1MparSuw9338ihUKYeXXfI=;
        b=YNXXBOBXkdnek8zo8QFHIul9sArsAzoIyfrTqr7yU5CRh85MV1KUqcJgWNUNF4Z9NN
         G04Mv64wh4fSBYmGxeJa303QBu4PTqUeI4z1bopwE2oclK3wuzNkoguz8KBjBIA9TWG/
         RT53TxvWLf0Jtte8Rr9zLJkHFdQz1XFEmO9eUZg1FFQb/FvCzhr1S7oUObSME5JiScAT
         +VpynhjybWDxFRQH/NKNcv/7k9JiU67Acsw+/ZA3YFf6bqVYh871vyW5EB6dwtI+rqh3
         9pyICgKSmXmdvzmcCeBwxXsLGby7i5SHckwWAOOUxGB7eDxi7bQ9DZzTMidTdVUIWjnC
         iG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778394967; x=1778999767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVPuHVaudv1XRrcrlNGyZ1MparSuw9338ihUKYeXXfI=;
        b=eQJgsqp4PUqiA3e7tEtzWa7JHdLg6sIAcFq5ZevgdwEf4Aa6vU//L4hNft/Z15dbJ6
         Ge9pWZxmSeQ08ecaypTIU5kRr9xfC7Nq2pd1LqjgPK4JfEorGDe9Q26EEg3JDQIi3q0k
         adRYV1tzDLxl5inoCMeje6SYgl7/uOpNxSTmRjrQs4UnpN5DXAv5tZnTfE1rYIogBhEA
         xCo35e9dfGebbstmgtarjH4Jm+UvBTj1oHZi2daLLzrY1bG+H4Tp/pbyaLGjDK94HmOX
         qX3R2hm0KGQ3Owu4ygyG086l2n2OPGnbXXUtBaRYExKSdaSHwzTkfdHj2aMLRv6qR629
         EFvw==
X-Forwarded-Encrypted: i=1; AFNElJ+AdEO2sUY1ijBHMiUzmq1o13IJwJgMFTOj7XUdY+NErCbpU5r2L4hMkuV7hJprxrb78Fk8zoL4PCwoRoRU@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa5+55W6N8Ncq7CrHqRuruJ+88dQUI5ySkZv/KT0jCe15tl24+
	A/dyrU3rczbhCkxg0lgPqFOEE1wFOzOoQ7P/CpGmPdBfdu6BRHRRBV+nDhF61sDIhdJpquCDSdL
	cITD3Jie3CwqN+7zzuyGppRcaItxovhY=
X-Gm-Gg: Acq92OGtut30APBaXTEKD3ktADHY1OpCTePotsw4r+n5AL7VQ1D12hE91HH0GCCRhd2
	2U/DomXWKRuqL1vD1q2d4zjI29mBe3Hi1eWoG9gIDYPviGy5Mb8wyiHVKVfq9caPjoJlre2j5Zk
	A8McDn8ZRnQLNnikt9XGO5fG6QCookJ5+qmSHMqzlUUITsU7/w7NImglW1cpMX+v037Dz0MywK0
	B3qjaKnayA7Tn5bRG6WBAEYqYvLA5e2M2dpX4cGDjItXCMjBy+HTSL/GWommnxACN2j/uRZ309L
	vVGiuH5YZRJX9z4=
X-Received: by 2002:a05:690c:10c:b0:7ba:e420:7ffc with SMTP id
 00721157ae682-7c104daa119mr49302637b3.25.1778394967174; Sat, 09 May 2026
 23:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509090320.85481-1-dennylin0707@gmail.com> <agAkRBbJiTmWxGtS@ashevche-desk.local>
In-Reply-To: <agAkRBbJiTmWxGtS@ashevche-desk.local>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 10 May 2026 01:35:56 -0500
X-Gm-Features: AVHnY4K1-afpEJc8d_Awt34ZUpRahp8hORh9_ArNAzQniWxelZARb_jFw8-Niu8
Message-ID: <CAKqfh0FkUfAh=O6BdM3mX+koRaQk+RF2732XFESR9utxeeWMJw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: check SPI write errors
 in probe
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hungyu Lin <dennylin0707@gmail.com>, linux-iio@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 1:23=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Sat, May 09, 2026 at 09:03:20AM +0000, Hungyu Lin wrote:
[snip]
>
> There was an attempt in the past to do the same and it was NAKed, so is t=
his now.
> NAK.
>
> Instead, add a better comment, if you wish, with the citing from the data=
sheet
> to explain the magic here and why we don't check for the error codes.
>

Agree with Andy here on the comment, I'm personally not a fan of how
undocumented this "spam data on the bus and see if it works" stuff is.
Make sure to mention:

1. We're in the transitional state between I2C and SPI
2. Facts from the data sheet about why this is what we're doing
3. Why we shouldn't check the return values from the spi_write() calls

best regards,
max




> --
> With Best Regards,
> Andy Shevchenko
>
>
>
