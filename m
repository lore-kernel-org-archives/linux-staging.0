Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F619ABC3;
	Thu,  3 Apr 2025 05:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658058; cv=none; b=O+5xVNDjTpWg6eiOCKuVkOkaefES0MZIxGoB6g4RG/yY3JoknzM261j9SoBTW5JAI1lABrWHd1Gp8sy4dyGYWy6Uz1F7Qqokm25+bZ1zFODPF2R0chRtMoz6269E/3r0Bg+3vmyL9h/nDgKJTOB3f240sk+/zS5+g0Tu7a5Wmew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658058; c=relaxed/simple;
	bh=hvjrlvSg+m0lBDCJ6n1/h9y/sAEsNJ7+njvAq0qiFHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etXr8GBKPsNm5OJ7XjYq7gn+PON2N6r53PrSB7XStA1njYRgXX2TFqd+Kvhn8VvC7H2J9yJHsr8Ez9kNxMRsKIzxn2bGM4zMwRSlbV3zH7nVmXspYJ2oV3mY1VxRqc7INnhOcHn0nUCRRBnozw9efE801lyyo1Rb8GgNbhtk0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiiMDKza; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiiMDKza"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3b12e8518so96736566b.0;
        Wed, 02 Apr 2025 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743658055; x=1744262855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyMY2OXjejHMpppLC+gFLxGr7yisUTx8VU7zvak3fTk=;
        b=iiiMDKzaBuAORS/m1Qs7OTRLEo1MfKJjMY5rjrWZmIvwm/Bh/x7YNy0PvXn60GM9EP
         OezniDGIBp6BZGd3htIdUlrnUqhhWhFyQ6jKGfHKZlTetUGJurcbv5cQeBJx/jg0Mw/C
         qxHb6J8jj8SNKExVEmfrG9N0cGKIGzADX9VUUeDWOuerkTbBPsJ9hizNJotwJLsqdMAn
         tmZh0pNV8LXglWkNnZKqKJq9PiZRAL4WTbpxqBVmSfoHEe3MemnuXc0mAinWEz1khuvk
         CpY2DL91BV9jcdQ6P5WxuvtXktVmWRYBzv2pksOxHBc+MRH9lcDzAlcfEY2+gf/dcVQY
         UEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743658055; x=1744262855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IyMY2OXjejHMpppLC+gFLxGr7yisUTx8VU7zvak3fTk=;
        b=xAXDocde4UmBIe7qpryz6/PtTyymtSdZjKHlf9z3cE7cPwqCp/L1CHy09jsBCpeq0D
         yfWnl6E6agvJp/NL5/Hq62S6zsON+IbWRpQce4hAHXN408G9vKjelfESaFMJ3tfDUC0h
         sduC7kWVGBRxcQ4fTYd4bzDNXt3hwG7Y+oA90eE2DVPEpVNLD8o0ZoLD6XxzqryxkbmU
         Fw4p2oKjDn9Q5QQ5sUZ2UNgrGjWzV2rgzIYL02y2WNfvjiIJ6ms6MxUTCJzctcF8WtHf
         Wo6KIhZrkj47fLIwuG/+61YKzvwo18cRQvzx9BuBQzhCfrPtumcPNOKdzViTHpyv9QQU
         R9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAZwPdWdI4fb+iOukaLpFsv8u1DH1BTScvG+VRTumwRgSJjIC11IjbczUL+JML+JRPIdVyo2CAgiQm+KL@lists.linux.dev
X-Gm-Message-State: AOJu0YyoITRKzXzhbTnw/PVs7ppg3tiE4UN6ZKxkAgnkE/WLCGkPsJwV
	xIThEhh0JlTJOUYEw9fdSea8Idu8Kll57WXL3zOFBbj5RGm3acOFKIag7iwjIqbkrxVfE7Hij2Q
	VBGmx4JvloK7gUwX0m/cadu1sEu0=
X-Gm-Gg: ASbGncsK4MBtXSr9gGyAEEbrSEjyey2Nid2kYMe5we9SVwjPbPRE13efUR//5hO0hPO
	AOTsjiWjbU0S2BO3GnoeQyxLvR1tBRCRe/Dk+XFxJNr26ddAkVWOh2b5V4yOyuH+LSGtIycqnld
	+3vF89AC4VqjpXetVxa5eM+tqCqWcEXWKxleif
X-Google-Smtp-Source: AGHT+IGovQXLbbdbCSHS4ydKtET+lc3lBRWB9d7z9Vd5ovg6kbp9eQCovOgD4q8b/xER7kizK7DNlBR10Q4y0o/FQ3c=
X-Received: by 2002:a17:907:3e12:b0:ac7:9937:e259 with SMTP id
 a640c23a62f3a-ac7bbd472cfmr101031366b.0.1743658055294; Wed, 02 Apr 2025
 22:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743635480.git.abrahamadekunle50@gmail.com> <f04b31c428beb6195ad5df5116d1421fc036af16.1743635480.git.abrahamadekunle50@gmail.com>
In-Reply-To: <f04b31c428beb6195ad5df5116d1421fc036af16.1743635480.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 08:26:58 +0300
X-Gm-Features: AQ5f1Jr9q-DMHaDBKn30tVff0dED58LLdPAo3xT3e2KL4Zz_f00nTe-c7-qL80I
Message-ID: <CAHp75VegJ+DgG1g2PJ0WQMUFpMrt1aJOb_NgvzL90NsuD_Oosg@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:30=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
>
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
>
> Found by Coccinelle

...

> -                       if (psta) {
> +                       {
>                                 psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority]++;
>                                 psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
>                                 pattrib->seqnum =3D psta->sta_xmitpriv.tx=
seq_tid[pattrib->priority];

Same comment, shift left and remove pointless {} altogether.


--=20
With Best Regards,
Andy Shevchenko
