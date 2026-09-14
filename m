Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2CF497B70
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407177; cv=pass; b=M/QYEvMspBV4sMncXu9EyQUKFrrMw81O+rKHoon1cvo26AWdJRhuiKPJEKPEze7ZJUsM7ffb5EV5fLZYRlF+6B7/aDKqvMYOZyb7+JAN03go2a+QB3sedHMPdiTN8ArNtv8ztjtoIm0P9kV+dDLCXXMiJVbgaIoIqGEJTwPlHLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407177; c=relaxed/simple;
	bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8vq2wJzEBE9VwY9r03S68BuK3dxuy6YXOdHvS1nVCwYrI4zPgGDmV7Mc5XEpfFCXzU1pe1n84GNnfLrlYCn5zXANrodkfSkfjxx7Dk7jJUbpRqwXWjFD4NJvmUe4Z2ZDmKvNJJHJaPue/7ybEdZ9hfZiOLROTDpq7Jcs6Irwic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWOQH6o1; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWOQH6o1"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso391721966b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 10:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789407168; cv=none;
        d=google.com; s=arc-20260327;
        b=OP+Ymz2Hy0Tk8vQ11NFtB+SlLzt0JDtqLboqxFBsfY6t7o3S3su5Oe5XNwQyPl+J0b
         LDV7i/yUATEldWEe0kkL5CA7rh9OqKs7YarUzfxyWtx4wsizBLahKAgHHNyPUQdBM0a0
         mKLPc24uLLj3HDdhnV7l38uB9RfQNfNwpD1sQEoJCAAMEX1e8zG+NqNBF84ADvIR2JV8
         I0tzg7fxjlpMKqsKRHrAyDiBL3musvU7wJURq+bOuAn5ELrjqC1zTaIho22S/JEIi7b9
         WLPvgK+yb+8UbpZ0GNqt46PCBawzEjQ5g+ElBV8plz4oCD0drhjFSQAoZJxRGJcsTzI8
         OeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
        fh=HAuXB++n7KrKaKaKFolQ9Dzb3wRach8diV5nZE1Kk4A=;
        b=sP8OFLrGYlstNb4dR6I5xNS/vtKbpNdybAG7AhldLUjp2pjfIJk5Iq/YBQE7UAiopE
         DzpVg4bQG90gRTNfSV6ZFWeZyHwBL3+6MeIrHeUeW+dCdjuBl9zzoGCUGTOu/LqCnkf7
         vPWAyL3ZGI7nzb+TNK5CHe65EYNJp4vT4s4d8N/B3v7ye+wPW07nTyUACLlYX2E2VoKf
         z9bLgF7hyJzcGWNbZb3/eWZFWoryFepQdKbWCEQCTq8wQaT6fMDvJCYzkpCl90dWMMM2
         yUjdx3hA+d6DNFDLIVszHQxOm/AurvVywCvixkvsnGVuIR+9q0WwRPRi9kfHd8Nz43PG
         n5qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407168; x=1790011968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
        b=WWOQH6o1xbGNpL6gDoAw4LW4Z4Ec6XlEBNWP5nphrg0/SRkg1ygvPoke9XbMzvIvOY
         Ek7rD1ojhueOY+yk7Cwgds/FcKkFAIKtj9/uapcm0o785iDdp6TAcvPLbQtsAjx5iefQ
         dyQ8Pw41Iw3RRNuFRBkma/XvzogqrR6igOe/VE5nb3Zy9pizG7sbd0OJrmARwSOE/Cgm
         Q/oz4oxKHj9uJTk/OvXVn86zL9IYZ8Z/u8kwy/wPSvBD2yAHByz/fhZ93XHgH0DUzhVL
         Q7Ja6eQb4OpygoOJ1f/NE0a9wxL/JX19rzfyISgYQdtFiBUQVujqJpMV1HdIBhEwW6fx
         Ji8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407168; x=1790011968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
        b=cB5GOhLU+xVSEt0ZrZ/EmXdWfNyEJoF9YXCAYiRxInST/PZ2xlyvzIc2lEvnwxlm7M
         Aq5lxHbl1QKa3K9H5pAPkMXrj0/bXI+xzzaUG2+H6eQn9gmi5VydxJ22/m6sdVVVoIxT
         vtD5aFpBmopTB2Kjzh0R5v0Olg9LEBAP/f0qqlKMIWltR3kWdlSU6xqsUzSowyVcaJ0H
         SnaE9AhVQ6BXdvj+CPlAxbXuIEcj3hm1kvdztAr6W5crb3nhBw4xir3Z5lLXb6b+POhy
         ube1lsJ5y/dv06PCKV16zo3gug6SwBPtwi/UPU/8cKaFUGpCk9Q/vPzR6DBYiepAqIwZ
         pf3A==
X-Forwarded-Encrypted: i=1; AKwUvBx9ZnHyeSHoj04ywA/Oe9GFWyfPIt/gmzUT3TbL5Hw5iaVrw628fidzuq/ztNI8BcoxAYmXlga+PGFhxPIa@lists.linux.dev
X-Gm-Message-State: AFuF++kfeONxMyQAIsEPgAh+d2XWc0ljHhgBBhiNCS62BK7/NhQV4DlW
	EtcTnvyqmX3dgHtmFf/JtMbvghYZsTFaFQzI3o7RLkEWxPj8zWps0cu3NkedLT8QGL/EberLuNN
	peuqrWJ/xkDc85Ty6+bQ2rQokF+xODiM=
X-Gm-Gg: AYBFou1D7NsdgBG7mTeQDl9wVGrjKQHknxCxuyLrTDDclEoLrVUNzfUctB/80whmwjq
	DnDpnne6x6bkCvtUhx7XpXiUhqHcxPWmWQEODmKkLWg2WHMRrp9nb3gh32OjcZsHlGgQfr+tCRK
	mRkn3kjECol4emRb/XAblZJHi8wwUy8odlfvdvUzlrdigMDT4xQraSV+7D0LPDMJucnY22q6OCy
	gs1ptb9pkhApmNNa9JyHHtDyeKnclim/C/5+UdeCohOJwYoO/c6iQdlKcX5brpK1aK9O6cJOWH5
	KiFDFsjEMzqUVjpWTHF2B9526ZXbuKAjVY6YaVh3wK2zhpBFxzWSji1FsTGNzoMGfo4uR8E20KL
	iT9kdg5anrGAjQ133gfaaRfG3PHKACmWAY85DImY=
X-Received: by 2002:a05:6402:24d3:b0:6a9:a281:ca8a with SMTP id
 4fb4d7f45d1cf-6a9f6379705mr4277384a12.20.1789407168020; Mon, 14 Sep 2026
 10:32:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:32:46 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:32:45 -0500
In-Reply-To: <aqe2K0nVppBFSidV@stanley.mountain>
References: <20260913040140.4517-1-gaberashawn@gmail.com> <20260913040140.4517-2-gaberashawn@gmail.com>
 <aqe2K0nVppBFSidV@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gabriel Changamire <gaberashawn@gmail.com>
Date: Mon, 14 Sep 2026 12:32:45 -0500
X-Gm-Features: AcwNN1WpByfxKhF0aBLisXpqJcCGb5hY09UxTHQsDO2h2LA-o97HI9q9YhD-9kw
Message-ID: <CACKJOpCHzkwX3G=mrbe0i8Xj79RK7648EoD7BXuKqLM9JuPe3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: sm750fb: remove unused definitions from ddk750_reg.h
To: error27@gmail.com
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the Acked-by and for the feedback on patch 2. That makes
sense =E2=80=94 I=E2=80=99ll drop patch 2 and leave those register definiti=
ons in
place.

Regards,
Gabriel

On Mon, 14 Sep 2026 11:54:03 +0300, Dan Carpenter <error27@gmail.com> wrote=
:
> On Sun, Sep 13, 2026 at 04:01:40AM +0000, Gabriel Changamire wrote:
> > The sm750fb TODO asks for unused code to be removed. Of the 1203
> > register and field definitions in ddk750_reg.h, 1046 are referenced
> > neither by the rest of the driver nor, transitively, by any definition
> > that is referenced.
> >
> > Remove them, together with section comments that are left with no
> > content beneath them. The include guard and all VALIDATION_CHIP
> > conditional blocks are preserved.
> >
> > Build-tested: all driver objects are byte-identical before and after
> > the change. No functional change.
> >
> > Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
> > ---
>
> These macros are just documentation and they don't hurt readability.
> They probably improve readability.
>
> regards,
> dan carpenter
