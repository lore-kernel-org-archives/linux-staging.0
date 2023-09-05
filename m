Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF5DDAF
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 19:40:09 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-26fc5a218daso1760139a91.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 12:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693942809; x=1694547609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3JoIdLXtum5k3l+D+Jgfb75PDibqNu9cKpZO/53M1U=;
        b=OcXMesw+ovvtAGS69TAQhpl9egRToZ8BSu0hwNHyd8OqQQi0QW/IUiRkUdBxTKoz2b
         STeFGtGR/+Dfqp4xjTO/eTSkV+hajcViqE44Nhqtlq4A9rQqWTy4A5iNwGf7Nsmhbtbx
         anVrGszjs0tHJ3mNXEg0ZRr0fA53ygTiZYg3BokBs9j2JWpwthG2wt6fNeLmq3nNc0qa
         4mhnvHz2qaqp37sVOpF030EaU2GLzb7kc7sLFwxyz2xHEKvkbJDRTJutYVex0SqtRcZP
         d6FAi3Nz5oWIpj6T1/DqY6ElgBD+c45n/ZruEQYY88XpisvUSKPsw+RwS13ALvLeMXLh
         4lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693942809; x=1694547609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3JoIdLXtum5k3l+D+Jgfb75PDibqNu9cKpZO/53M1U=;
        b=MhCim8jdHplYxauJXAQiyauYiyfY4fVOi8OpuwskqZM5r1JoaiJYYA+yuXUAKtmQ5L
         UJMp8AvPcSujFzGcOzTmDKACoRnxAWAFkIrYOAhd+9l2dZnPeOR/MS2WJgDtLDLu+Lwh
         mnpFDtMoPkCjyTCBVvWC8Ns29c8RYJ/FetAkUdS5WviwZYrxNPvIxgDhNAWns+XobA7R
         F0Jy0nf6Iu/ns81BQFp/uSmXgFtunkJdxeRXuuJ7JZ2ILCMnourmf0eRvIv9HxH6NFzy
         fI2G8jyV38/gSIdSMwX4JnC3xapi3vUm5GER1AfsN4NuhJ3IAeuhMBEHG1dm/0Vpd4Xg
         vcOw==
X-Gm-Message-State: AOJu0Yzp/m0K9jBP9rjd2rsz2XxUliO56rMDuVm7wvZ/CgplIanDT/aS
	dx+NqtJmk3HGuj5yz1W8693h7mPxwm95Vzt/rBI=
X-Google-Smtp-Source: AGHT+IEPJxcZundO63bCDqfIc8khpXnGiihMK5NjNiHBG2uKgIfOrZ55TyG073a8ocRfpvxcE2WLPeKoDDT2jY1IASg=
X-Received: by 2002:a17:90a:6e0d:b0:26c:f6d2:2694 with SMTP id
 b13-20020a17090a6e0d00b0026cf6d22694mr11717461pjk.12.1693942808650; Tue, 05
 Sep 2023 12:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230903203732.585378-1-bergh.jonathan@gmail.com> <8ab11a98-5631-4ff2-93d7-dd0a7d72dd6a@kadam.mountain>
In-Reply-To: <8ab11a98-5631-4ff2-93d7-dd0a7d72dd6a@kadam.mountain>
From: Jonathan Bergh <bergh.jonathan@gmail.com>
Date: Tue, 5 Sep 2023 21:39:56 +0200
Message-ID: <CA+MPq=W-HX0t2=PqzbrSX900RQ4Su2+Gf+X968KeXBKmq5xACw@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: Fix block comments where '*' on each
 line should be aligned
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok

On Tue, Sep 5, 2023 at 1:28=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Sun, Sep 03, 2023 at 10:37:32PM +0200, Jonathan Bergh wrote:
> > Fixed checkpatch warnings where lines with '*' in block comments should
> > be aligned and were not as well as incorrect tab spacings at the start =
of
> > comment lines. Also removed spurious newlines between define statements
> > in define blocks
>
> Do this in two patches.
>
> patch 1: delete blank lines
> patch 2: change comments
>
> regards,
> dan carpenter
>
