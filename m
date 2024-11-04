Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682CF1B81DC
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723448; cv=none; b=XKiiP1zFfzF8B8c068198nogoB5q19Jp0Nk5sm8WJ+wOpEHoHLj6VKP3/Tg85xTg1bdMjy5D/mfVlpke31jCP5GXAyCpYunYoybSvCoS5JBSUVloMDxQkeu90CuwXjNEBY8N+18VAP1aZx10wpFJzH4pgH/MpOLxE3xEPOFBMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723448; c=relaxed/simple;
	bh=+1pwXJjkDZruvn5Q37+5AIlc7Gon+baz3RnyTJMSWMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rADAm/5YerQtvpOjVt2noH+y/UrhEfti13CpPwCJcd8Hgc2teqg8TxHl7C5Pb6KvRpJZRzoIyJ7/Ir5EFFOyv7xSglTsl7rXUKJ8P6vsUzr/g2M8Whcj5Qb1TWtqdoNOkJwgvkKjUy6DvWYttaclqtK+x0PsqKL1x40Yl6qYULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnGemYHb; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnGemYHb"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso5363635a12.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730723446; x=1731328246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1pwXJjkDZruvn5Q37+5AIlc7Gon+baz3RnyTJMSWMo=;
        b=PnGemYHbfWNJnC8n5gCa44HO73aRo0+44HQ3S0nVoPfx3Xyl7xgEsEo97hvsLuIDI2
         u2pOHpRyGecntENk/DylRzEyqVfcA+pCKNlyOzqCAe6rqZSof3Gg8mnYf53osKAPyW1H
         XiX5aiUE4OmFw6Y6hkjkDqrSM89miqtBjT95oZVNy8nxhZWyMdwCaGD2ln9Ov7oGj9N9
         1Bi+a9XMFeVRvRv7vw22dSY4RbGza/aSLV64REpOse5cNd/x1h0LumvmUGkUJYv8PFTy
         0Nyj/7TBtvHhENgKxlERv0pYtRZU8PKdSJL49RgYwsURH10x6/L7q6JeaYKnS7e4nmao
         36/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723446; x=1731328246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1pwXJjkDZruvn5Q37+5AIlc7Gon+baz3RnyTJMSWMo=;
        b=Ji9Ek8daXCFKF6H9ALGI8cazNqrIER4B/yvZ3nHpcy8KS2rvFqquDrcd4/e3mLfj8y
         JoQPncawe461dl0ReF4hvxFPJA9O8XSCwvK7FDTebdF8M5tOjs16zzQwoqmzEPhygD6+
         MGvOlWaUNAx/R95GeC7Oi1UmUo/wbcHvRY7fwCUrPhYHuYmsu8sN+nKhk7ma77VgOayJ
         xe2DVIL8defJLs76BW9Mf750FQ8yFVAKgJFvhvF/D9+ihj1s6cnMMqduGhf3A5aNR7eP
         4cGXIH4fE4ZCb9x0N/ONlklniQXYSn0O9+CThOLt3SU5LGsFWhKiaZi4TwZqAE8b4WC/
         X2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXu8daPVBlPZuyGN5GCKhKxJyJ0wHpLZ+y6xK5fZLdYy+8tbVpilp7WdZ8I7cVa3rhJJhxe2nT/ZGHl40KJ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb/EWuh/bGWqMqAvzsiXRHQIvrpWbmd+aEn94ftI/uH+r3MEvb
	htguG30kXfzNqksnLuxFKj7ztckr4vy4lICjFsiXcejh+Cc34AbpmVrO+o8elkMXZp9JetFs85Z
	cnTrLq20swljW6INHA6coJ4uZMzw=
X-Google-Smtp-Source: AGHT+IEShXixc8kpjb5phOvkzq0l3fuUH4YReu8ywuTqRrBUzx5Nyz7vJc+3JDwOca7Pwgn6G6QcRC4P5M36beuY5x4=
X-Received: by 2002:a17:907:2dac:b0:a99:6791:5449 with SMTP id
 a640c23a62f3a-a9e6587df7fmr1354587266b.52.1730723445505; Mon, 04 Nov 2024
 04:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com> <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
In-Reply-To: <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Nov 2024 14:30:09 +0200
Message-ID: <CAHp75VdscXFTB+mfUgKBnut3_idT88mas20ZsohSd6nrcVOnFA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information boilerplate
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jonathan Bergh <bergh.jonathan@gmail.com>, Roshan Khatri <topofeverest8848@gmail.com>, 
	Dipendra Khadka <kdipendra88@gmail.com>, 
	Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kartik Kulkarni <kartik.koolks@gmail.com>, Kathara Sasikumar <katharasasikumar007@gmail.com>, 
	Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 1:57=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 23-Sep-24 12:53 PM, Andy Shevchenko wrote:
> > We have the respective SPDX identifiers that are already being applied
> > to the files in question. Remove the License information boilerplate.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Thank you for your patch(es).

Thank you!

There is one patch (marked rft) left in the queue. Can you, please,
apply it locally to your branches which you use to test AtomISP with?
I'm talking about 20240923085652.3457117-1-andriy.shevchenko@linux.intel.co=
m.

--=20
With Best Regards,
Andy Shevchenko
