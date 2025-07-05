Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BD1AC88A
	for <linux-staging@lists.linux.dev>; Sat,  5 Jul 2025 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738894; cv=none; b=FgEOD+R3o613z3ncmInlenrz02H+wFo3OlKvCrqPzT88x7pIqmmmXGV/LrdsXHzpMBaYMcFcOIDS+hJD4n+rt1ubnqGWWOVywEvTuMHt5VEiZfezuyvK6bdrSycK41ggHzuSGW8uPLRNAITnOhPdBscM04ZmIZFU9ietxZetwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738894; c=relaxed/simple;
	bh=sGKGIQHy+zTRytEmBftvQHpzONQDr6+oZMPB/S63mos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhfPndKLrMKQSNXR784dz6nuN/StB3lfkLLbfbKD11ipxLG6xg728zKJWfn637iU0mkAAzolfYI1yykjQYiXKedE4nEEJXPVTg4xH0lxnWCjvXRrsef1V3ljODOTeljnXmeVErK1+ROoHOwtm4HlBMNjAlhNEIBTDVxQ1uJI/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=as1caEam; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="as1caEam"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0de1c378fso276029466b.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Jul 2025 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751738890; x=1752343690; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6bLCeGDQeQZMQiRFxTeizi9tOxgkfo7gLog5AhFDiY=;
        b=as1caEam4RRYvmsORH8HrmpjlPWanqeKwOw2s/L5lbkdVFPUR+Iq+bLpefa2Y7PIFT
         dEL3O1tF05SLNHCOpk6zVRmw/+Nx94/++NwN4P6naazXoDD3ZU2nHl3oRfKUxKIVAKwU
         sTPMzJjnbjf8q4D7W1hwmg6s5cmzVx4AzONXx1g8Kz6NaRYBSW6noE6BqJYaEfPV1IQw
         kMz9YaOeSSmxgiIkhJaxk8GZwKSnv1TSrBQ/IFLDWOeWMpkIEuWpSevuXMI6Q/O4jj5v
         Rp62CN04LHFhNACl5rtm/rFDGKA23+w8X6Q9dpBnjJPaVbXK3ta/XusuS4XTyJAkQgvn
         tqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738890; x=1752343690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6bLCeGDQeQZMQiRFxTeizi9tOxgkfo7gLog5AhFDiY=;
        b=vLAgtWyv0QmyMHIOux1Mt2M3L/4+s+qvFC+p/Weslkrpbj/UaoWm+8vx2N3ToRvcGz
         ywKKKjhwXws3Kf4BfsG/E+FwqcR7Ynn1P8XqJOtRkWjXaB24kVgZcqyw5Eo/QihoxQtX
         4JY8hygDH9xdHEM6vKMtXr6ZSInSIQrprMAJCKl5dbCDBbu2VFOBOniGzcoDn3z17fNe
         OUndnXiKiqtExG/0WXBAZPWpCFj0A9yoiCVE584ZJ2inQPWkQkWDmC06fuVaOJtCGECQ
         6r7cur6fEa7fo4WVTWk6+cKsSYOZ1JwZUUn3jWFPbDlh9Hrefp2Uj45lyAT87JNMD2f7
         0UHg==
X-Forwarded-Encrypted: i=1; AJvYcCWLO88jLNHpXZgDJdHXNwj0vRIRQGN3IFrYOI1QkQ2ilkZJJtkOWtptwxZ/u8VQDNPAKJ+2mjTgxXetXaOT@lists.linux.dev
X-Gm-Message-State: AOJu0YxjAuwZwXrkbPmKq6yTSC09JKdeZlzpyvk17ZYNSRHRzBcRpzfG
	4sNfwDDk3sJ81JZUaPNg415VIc5UxkjRd8sVO2Jh2SRqH4r/rs8GIQAzQxmxaw0I7JxmRco3d3N
	hn3mNotHcykvSOPX5n8IF+1JR+xnW3GE=
X-Gm-Gg: ASbGncvjLtDS9UleKdsme2rhSyuCmg75g2PFvxP3oDB/qG3tjU6oei/V8JWbJsgi3xr
	vxYxYdGqFm/4Kpsorf+qfGbc29/Dfus1Lt3nW+oD3gFnP63EjwzS+OejOuDbAOzM8O9JXTTkl0A
	/uoNt7e/eDglOL7SN6bISvncUWnRlSVUQJEsp72Rx+9N4=
X-Google-Smtp-Source: AGHT+IE1Cq9p7cSRPwynzodWAgvfMOthEeUmfHLyjt0H+yN/aOpw20qnU0FfZWE0no1RyRBUbeVhXfrrZRL8oMEpcxc=
X-Received: by 2002:a17:907:3f0d:b0:ae0:db23:e3e3 with SMTP id
 a640c23a62f3a-ae3fbc56f54mr719319366b.16.1751738889527; Sat, 05 Jul 2025
 11:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com> <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:07:33 +0300
X-Gm-Features: Ac12FXy8HqGDde4LXMXnmNirVLlHn-id43g2N4hLH2kwDt3orbiLIxl4Rxixl0c
Message-ID: <CAHp75Vfc7QsENHsaYMKau_4DU3-LmW2XaUxd=oHqTS3F3R85eg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] staging: media: atomisp: fix indentation in aa
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 6:41=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com>=
 wrote:
>
> This patch fixes tab/space indentation issues in aa
> following kernel coding style guidelines.
>
> No functional logic changes were made.

...

>   *     ISP2: BAA2 is used.
>   */
>  struct ia_css_aa_config {
> -       u16 strength;   /** Strength of the filter.
> +       u16 strength; /** Strength of the filter.
>                                         u0.13, [0,8191],
>                                         default/ineffective 0 */
>  };

This seems to be a kernel-doc format. Instead of fixing this, move the
description of the field to the top comment and make sure it follows
kernel-doc. In such case the change will be much more useful.

--=20
With Best Regards,
Andy Shevchenko
