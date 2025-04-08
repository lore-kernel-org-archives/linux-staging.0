Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14473264F88;
	Tue,  8 Apr 2025 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104528; cv=none; b=P7NL2XQ10AB4hBoY375xYcOxuMAy5BarcRKXsKagESVZcMDJDNr+GFGoS8qtKVb7c7QgN3nB7Pms7Ux5ZgALY+DdsHI89+AKr6EunYovkHsFh4KlSIwI9usap4uQ/mTGDjakohEUqj3AptMkQt6SW9RAok2SzUocNfO9sdGyoDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104528; c=relaxed/simple;
	bh=7QREvVegGtLVwMmCogS+RQMa5V8VJDGpsljqMOl9/II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tlpch3DTIJ9d2Dd04geenhZphI9+JIROHo8DNgRfIh7V8mRQ8zaGLfcAfaBEfGHmbLTc+MbUhmxCcV07+LmzyOTNWxOWoEgq14IrjeMVLdzydL7EtSlMGP6mtztgHnEFuHFinrtPwVDAOTICfmRZbktgpBooMEyfawTlOczW70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU+gybiA; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU+gybiA"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-523f670ca99so2404061e0c.1;
        Tue, 08 Apr 2025 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104526; x=1744709326; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QREvVegGtLVwMmCogS+RQMa5V8VJDGpsljqMOl9/II=;
        b=FU+gybiAMQKYF1ULiPGnU2znLWAKU9S3N8th9/ipi5rzD8PbiCGO3TJOd4Qp9H+WoQ
         cO4aWMq80wswmV/dxkrm58QyZJ2tqsY52FQewSkJwrJr8lGhGo7ZhLu2q8tmrK7N+CWO
         ums3ZRNGqDY22gFfTZi139vbFE63rvrxBrFlWRAFcjeEcNGAFoOgSTbExaoe/qXJMJtf
         kL3JKrUxBsCG2hPdfVYgk2ohxzagCngL3aw8JrAeFmnOLoBTQ6ZOyLW2DNqLYG6Zb/tZ
         TqdyYdvlPbAwjqci/r8fJJdP137Bqrjy4hJP10/h7TrUSY5trsVATHyLF8ooIITScEuD
         r4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104526; x=1744709326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QREvVegGtLVwMmCogS+RQMa5V8VJDGpsljqMOl9/II=;
        b=HsOyozL6klIHQrFIOy9xpeHXimWo5VK3EnU3IO4UbsLD12YWgiksAWhWFNT4zv2gm9
         VCDwcgG2jJznhx+vPywD2zk6KpMjLldO35wkCDXPTWsueWpucS2IhmzAw6vPcg0TDTEy
         MUBh0ICyTwMx694FG8jjPHIkkVnkfh181NWDcriZEjvPE2nNHKwM+NxSYKLbr7qUQL+l
         IeVJE9GKkEGkM+hCoa9URPnwSdBwiS1QslRpy5N/3vuicOSr1cNq4er9XC1ryKvahOAQ
         omZKOocF6dcqiSwPbUMIAJ19KuUd4qdOraombUlk9ZajvTtWAodSvvMs2tlZUFlN1EhW
         Huww==
X-Forwarded-Encrypted: i=1; AJvYcCV6ENtmmlVowKe6LMuguwQdSTAtH2c2IWiaiG8NBTucr7X9zyP48S9ctYuGyGNtI2zn/W5uduMyfqwZyILs@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo/a7RHh+gO4okpo/gZyaX5W0462febE/GSDOxwqhAYIsdhm8j
	cmmL2CC0ncySLtWxqrP8vpFUZqHNA9xPAQ1AccBw6gnCTVY61hN8CV5tLhMK5A1KK/c4I/FgnRZ
	5DsTvgp10JM8ehZKGnMkXURQUuM4=
X-Gm-Gg: ASbGncvZS9nAwXtt3sXcAF94EeWBGK1LX37qIfiWUgY1/D/0tof87Hl1Qse2Xzcs+TF
	aNX9o0y95FtZOMKrBHTlBxyE8i8THu4Bg6lK/tVw2gw5A9Hz01603dX/8AsIYep6ifgH4XaQMWe
	cCj2yQnBUg6IZDpHB6PE3zfymZJPJ6n1CfE8PIrQ==
X-Google-Smtp-Source: AGHT+IE1pMeyij0XousxaMOs5MKTqgFNxflsqi+ScekU2Op5JGsVojJssflaxc9WwJgVeZJ3ws+MQNc/NpODWZidWlI=
X-Received: by 2002:a05:6122:130b:b0:520:af9c:c058 with SMTP id
 71dfb90a1353d-5276447946cmr12219148e0c.5.1744104525916; Tue, 08 Apr 2025
 02:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com> <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
In-Reply-To: <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 10:28:36 +0100
X-Gm-Features: ATxdqUFtuUdz2ArHfLMq3iu-Ctptj3cfrYHWhp-iqzKVcn30xuO40CFlbchF8zM
Message-ID: <CADYq+fYeXCUgXqWu_97gvUBOvTG+H4Q76TSX2M1s5jV7EWcuyA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:21=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > Tha patchset adds spaces around binary operators and also
> > provides clarity on sequence number wrapping by using a modulo operatio=
n
> > % 4096u, in place of the bitwise AND(&) operation & 0xfff.
> > The patches are required to be applied in sequence.
>
> ...
>
> > Changes in v5:
>
> This is v6. Are there any changes in comparison to v5?

I added a cover letter and named it v6 to show it's a continuation
from v5 and to show I added a
new patch for spaces.
I was not sure where would be best to add the change log so I put it
in the cover letter.
But as it concerns the patch for the % operation, there is no change
between v5 and v6

Thanks

Adekunle.
