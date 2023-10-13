Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BD1D69F;
	Fri, 13 Oct 2023 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM/Im5jh"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57be3d8e738so1303320eaf.1;
        Fri, 13 Oct 2023 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697213108; x=1697817908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E2adTq+ZvO86bFiocTbWu1/NJw0Sxi2mxF0K0O3yCI=;
        b=LM/Im5jhroeplNAlPKEIUpPd2xx8SpzZPbjCKLy6Jf7aPVFRGouD1Vmifx+aCcrXZT
         +epFnVzYRhYVMQzdPLuW3A7e1h0XpiqHhFeq4cZ5wE+CG4H6vccdz8Isx3tRsE3eLOqb
         mebBHU+HqnaCBoDqK7EsjMXM+7b6nBATiCLJK3DaO9PIn6/GrYW+2LtCsTcB0trWHz2g
         JU/HDjhsjE6IKuDu/bniavMwQHyfZ2aHP8mjnNMTH2C5Ki9ZTMrrbcflAcERseyFLXS9
         CxhsQc9CeHDOK3LjF+NSTIW2C29G6mKfnk1J84WWWF8PxPwFiG0Q5ckT1kO2YYiJT00G
         wxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213108; x=1697817908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0E2adTq+ZvO86bFiocTbWu1/NJw0Sxi2mxF0K0O3yCI=;
        b=fFbwBrr+XyVjyap5LvdIpdDTvS2lBr2Z4RlTDZmB85YdfPIFKoKwDtAnRN0VL82xZb
         xGIPUK/ZMGwHkKgzgGIouovj72j9coMGad5EGRO9io4Hn5TWzydtDBwYRNpZfQQJdWtX
         o4xAk33IssGFC8gF9lJJk1o/LabdadxcGdMXQi8bYHNB2oRv0XavBTP5uXmyh6JSwefN
         6fUDxVIM6ru9rQWWu1fEMoNlMOLN7I6hbwnMbEKWhQvCQNO4Ekr7Wm73cVLcr0UBgiXn
         inKrHNogrvBCmXoliMQFpNZWOILTDkpKU4XGvCmsh28BNLWS/wrot74ciKIi/s6ie9GS
         fk/A==
X-Gm-Message-State: AOJu0YxLH0arQIVeg/UKwisMeM7yaYxV8+1WJKZsYweve2JS+7qpMjJR
	0td2a/qH1y6PpDU3B7VD+rYuAZtlDKd1Roye7Ag=
X-Google-Smtp-Source: AGHT+IETtWM/w2WA9DKTdQv6dDMKZy6/XPv3txCpzyyRcq09faeMnhs/q9OovphD5y5FtIjEDZUykVEwQt4DOxp6Yu8=
X-Received: by 2002:a4a:9c85:0:b0:567:4e58:6aaf with SMTP id
 z5-20020a4a9c85000000b005674e586aafmr27825009ooj.6.1697213107970; Fri, 13 Oct
 2023 09:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZSkg7y2Y2T3midXB@lab-ubuntu> <67d90726-15b9-4d64-87c6-bfbf662cbe81@kadam.mountain>
In-Reply-To: <67d90726-15b9-4d64-87c6-bfbf662cbe81@kadam.mountain>
From: Calvince Otieno <calvncce@gmail.com>
Date: Fri, 13 Oct 2023 19:04:56 +0300
Message-ID: <CADFX3ORVXcEBzovdbPawW2SLxcMoraKBmmLuOFkMpnHj=T48qQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: wlan-ng: remove helper function prism2sta_inf_handover()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Luke Koch <lu.ale.koch@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 3:12=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Oct 13, 2023 at 01:50:23PM +0300, Calvince Otieno wrote:
> > prism2sta_inf_handover() function basically calls pr_debug() to print
> > a literal string. This can be done by the parent function directly.
> >
> > Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> > ---
> > Patch version v2:
> >       - Replace pr_debug() utility function with the module specific ne=
tdev_dbg()
>
> This isn't a v2 patch, right?  This patch assumes that we applied the
> v1 patch...
>
> This patch is not white space damaged though so that's good.
>
> regards,
> dan carpenter
>
>

Hello Dan,
Does this response mean that the patch was accepted?

--
Kind regards,
Calvince Otieno
