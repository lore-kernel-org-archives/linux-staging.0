Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C33221F34
	for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753733370; cv=none; b=soJUbJYWvSNtuTyGKzKEPgPwugDY9fdMcRKiufHRrhcRtdJIjXEpTFzyetAHwWlySOPgRU+972wuIvOpn12C76T4VR954oz3Y65OXXjM90NrNzkaOzV0Cqzp96XnTu/2VYNV2gPxNk1xTwhb4LUQocdblu5Qlr/ezRsbyId+gG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753733370; c=relaxed/simple;
	bh=APtd3kTQXAJk0QuE3cLH0BeSZCoz60EisivX+3a4tZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QC3s8oJKNlVgZrDZ7xsKQAhMlofxGWpUK812g2oRN5tF3X1jT1NKFg7+0ShZQ+Uwy2TT7yLRJ6niqDlFIlrMqGj02x/3HNGbvkPFs7H05J9zAx0CeDgyek/GO3iEivfNpDcz1htINQLqtERFFnOrBS2D779Xwy/3qbYgGza0yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUHmgcAb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUHmgcAb"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so800131066b.2
        for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753733367; x=1754338167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h19YZ7i6VuY1JYv02ffvxhmwPqdofuDuT9g60bNKiH4=;
        b=kUHmgcAb/kdhY+wiX8BOql6hOD2ei0N3YjGIPHXA6PgKbrcFAWuAHpmwMEkOVG1fak
         evTDq4SIcLHSGhY0RjRA7kLxQAE8EGNqXbQUf5C2/B5rPaRChkm5t67j9oTnEEa/Uvtt
         czHCnEA1llAWZkHv0bnGOmTJ9KbPkOP0j4L+/Q88RaosJRUo+1QjZ9Je6Hb4OihleNSg
         9xHT7uu2nuTmKzbtSy9KodLxmaZomMO/1Q8fVZ4tOc+AfUW3myxDJW+h2ENWA1xhgGNQ
         bOAn/M7mpbEpQq+LFBrCDWwx5ppe0pVO3L56NEJJjvlCZzS9k15wBz8iy2wpXNqKDgZ5
         fglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733367; x=1754338167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h19YZ7i6VuY1JYv02ffvxhmwPqdofuDuT9g60bNKiH4=;
        b=B6xPNozQ9NLbq4ve7p050DN8JzY5hEHbcyPqTUrAX/0CIDAbGJR6tJMMuxKZvXDacl
         rMTsCR7wPlLdmyW0HPUZKo/qTFQ5szqqlkSyVNrtflts+O94jBdtXhNDqdEyyjpfzxbV
         4KF3MN5X0Un1i4l3usSb7QyfeHHdKH6C+DWQMBOIosGklxgRkGantFGl5qPDt2teLyFs
         5hE9aJ6qpxtZNh/Gc935r2HLrxtROnJT4VNxKPXaEWLuLEGFPRHxk3FcIu8WQ2F+USa1
         UkhlLLcAdIq/Y/a0uGZHw8vEMniLvQV+PAP+eD8d6sYDkCZhVZxljKue/otDE+I+qePK
         45UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHL2s3UnNJGSGfolXnvsNdQsU/ePDbE5o0X2wp1/dXWEqYGOfrJUOT8piQWBKBO9xPeeWVvc1fFkXO5m3M@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfdp7Oi6AAmUepcHDKWNK8uaEFZQ1hMrDznQXCVanJbrGJwFML
	nPnpPKt4+UDp56EUBgW+1fkJdQN/zy6VUtMOM9z2m5FHvNIlFIHCuPZQdqi8mYZCwSINr3bQyYs
	FAQle3XBvru5u/HSkY/OWwQ3cM/q7z5g=
X-Gm-Gg: ASbGnctJ22cPF7wxQgH2JbqkVBV0xOSdqrahQJ4RfOBKMXxgpoXndRBGh1lqqlJwf7M
	T1DSDdI9U1ra5xWnIXhRXZFFmxMm3dRvUYLIFio3LcTYcxRFTjdM3m61t6vvd5kKyxhKeW6au61
	f25q1i+91d6NN5TZsdRr6FWKlm4wf9+OLlQqUkf+ohb/1dhTDE2j/wIjkiEEs7ounkH6Y635k+a
	jGW+hUvhA==
X-Google-Smtp-Source: AGHT+IFbO9sqJWgcseGeOHZ2itDqSDcsjIrdkqBzGDxuivhOWHSiTVp2htNNxFs1OxKvHTTD0faE/xZJWFxIav4hOn0=
X-Received: by 2002:a17:906:7315:b0:aec:4f33:e7db with SMTP id
 a640c23a62f3a-af61a0ef054mr1461259666b.56.1753733366938; Mon, 28 Jul 2025
 13:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728072822.10730-1-rathod.darshan.0896@gmail.com>
In-Reply-To: <20250728072822.10730-1-rathod.darshan.0896@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Jul 2025 22:08:50 +0200
X-Gm-Features: Ac12FXyR5_fJCzTizE1t7DPU3upxgKlztb0zyNf7_BTJ9k5ADWfY6vVrLSSd-N4
Message-ID: <CAHp75Vfq6P2osMc5A5TZ5Usgyc7mFGNme6TmCQugTE1=8c1zAg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix indentation and styling in
 output kernel code
To: "Darshan R." <rathod.darshan.0896@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	jogidishank503@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 9:27=E2=80=AFAM Darshan R.
<rathod.darshan.0896@gmail.com> wrote:
>
> Updated the formatting of function definitions and if statements to match
> kernel coding standards. This helps with readability and consistency acro=
ss
> the codebase.
>
> These are non-functional changes aimed at preparing the driver for eventu=
al
> mainline readiness by addressing common checkpatch warnings.

...

>  void
>  ia_css_output_encode(

And what is about the above?

> -    struct sh_css_isp_output_params *to,
> -    const struct ia_css_output_config *from,
> -    unsigned int size)
> +       struct sh_css_isp_output_params *to,
> +       const struct ia_css_output_config *from,
> +       unsigned int size)

...

>  int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,

Seems too much space between _config and *to.

> -                         const struct ia_css_output1_configuration *from=
,
> +                         const struct ia_css_output1_configuration *from=
,
>                           unsigned int size)

...

>  int ia_css_output0_configure(const struct ia_css_binary    *binary,

Ditto.

> -                           const struct ia_css_frame_info *info)
> +                            const struct ia_css_frame_info *info)

...

The rest of the code is also subject to the above comments.

...

Btw, somebody else already submitted the similar changes.


--=20
With Best Regards,
Andy Shevchenko
