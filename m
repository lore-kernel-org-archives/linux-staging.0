Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0BC72
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 17:01:56 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lg14so5700513ejb.9
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=;
        b=DAGiCJN/B0AuQYxR2YMS1YdLG7E04XbNnAThdGjmBoPVyWeVm0Vt63bTbv2eoScYRQ
         SvAEYLrzwnmzOR5wp1CC3RKN4hyBnHKWJQKmPAax8xiYeQN0kxz2jQJP+F4Eg3PnYmne
         1tPqS44UJ6bIQx53XCLEzkUDSA0PKYzdiJ1Bm8Ux9G1YFwdM/2HDZfALKNqSjTCpM2/w
         /Rh5WhkPS0VtYInMu//A4ZE4YYK/MTrUiFkFfqoKnAk9XrjylD1xFHqznvRukMuPJ097
         ZgkrbbJ358Ttx/9WXCUX4sI2HnbgR0YAj0ln5t6NUysuwZ90LddsWhtadieg1uDXWzMv
         XHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=;
        b=eUyjDL81Z/6SXLGMILs2EkQrfbvn+DbtOxyeDftxF8GxIX1CAFraIl1o4giG/a0/cN
         rMzvWtTskJLwMCBmANZJPIEUTfVusrcnSAFsGXpGrvc7s6G1NmLORwwnGTtly0OqQtKr
         UusVrQFh1Xl7gzVKjnk+bM+HtnRPlUsYuxpqZLEiWkBuqlA5dhVu3peWi0o5snv2simi
         ABZzclfDZ0+2Qik35Yncj3POGAyKbDjs2ZrbhqRlTIqDs8SqkDCuDKY8368PCUSsVofO
         sOD82XSzgz7+cRBZQ9CIPk6KPK7O9pmynZth3453LfOjnYM98IeC336UNw+yqAiqklbg
         m3MA==
X-Gm-Message-State: AOAM533Tbzjm9NXiAN0kcmuzdAHFuzqxTiIKt8Gg9fQwHaDV/ACFAziu
	hR+MBza2JytQ96itYBUCwayCc8ZOyVEWeYeCypw=
X-Google-Smtp-Source: ABdhPJxElTHfIzHywbG8S+ZiNXqSjJEqGZe2D3CIdGakxelu3WUAQhIbf0zHelLeFVb7YO60doX8+J/CEmulNZITgNg=
X-Received: by 2002:a17:906:57c3:: with SMTP id u3mr59329306ejr.162.1621184515178;
 Sun, 16 May 2021 10:01:55 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210513220317.137090-1-colin.king@canonical.com>
In-Reply-To: <20210513220317.137090-1-colin.king@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 May 2021 19:01:44 +0200
Message-ID: <CAFBinCDde0+QzDOYF2EAkjmbdd80Emu3YuFV3jOCMaZuT+FNmQ@mail.gmail.com>
Subject: Re: [PATCH] media: meson: vdec: remove redundant initialization of
 variable reg_cur
To: Colin King <colin.king@canonical.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media <linux-media@vger.kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 12:03 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable reg_cur is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
