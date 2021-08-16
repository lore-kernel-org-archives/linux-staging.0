Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E562F80
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 06:55:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b7so24874544edu.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VfKkgUk+Apjti+wmBqAANKJPESjaM1t1n6XEwFETrrk=;
        b=KmfHxFn+cx223iBTzA1hrU3nLvjqcvAicFzcsZX6JyL4vlmUeMIseF0R9c6nP9eiPg
         pojJCScSzIdFPF5F8+LW4CcOUXuURYMtf1Clo05GitDYSsANzygqTm7xS/HuTnS1JQtL
         o+m4KqXI/BMW3A9TOty84yskSVvahd4oi2QC8TGyX93nIlQ3JJ4k1p4muMy4ezc2tETa
         0QWsiBDULJHrSCieSdCwHludI6tww49x8elnNKkQvj6ThDJacY2AkhGZnK5KMfrayIyR
         tiQofnd4qoMV6eTL7UvEZ8NcPcwhxgdsrUFrey/JGTE/rQiuAnER1AG2KRCSRr4MpvEu
         bsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VfKkgUk+Apjti+wmBqAANKJPESjaM1t1n6XEwFETrrk=;
        b=bYHEtGlvoJCE9QUCLDdYbDDU6IDq6sISNLpDUnM8C1/Qnz/djxutkljTJlFJ37aFbU
         ituqlTJbxIJiM59hUSU+pFkw9BMSgv9UQ6Cc7uAkCey9ffLVIoYqIdp/9RXUY2AJuE6E
         +0rnCJxrVa2qAUKiBjiHz6RsElF8q4NcvZU8Qd0mnHqlvJOidb921yBlN2+mq1lAUQ8N
         iMOBE2x7/1pMkHEkGPmE4o8ZkE/RVADyynyp7LctT3q+zTe1L1qUredPEKlXEn7hkPgF
         8TNeosxowJBlbXZ/QuIPKla3fKVgmxKthViFgVxsl6/FdRaER4L0I0LO4/ydWIUJbbOS
         4ACA==
X-Gm-Message-State: AOAM531ucKuEDZFrHpzRO5ySA/AY7+HK5yAFEpF+uAgxLKqjUeeZHVxK
	cygfxZag6mVYH0ZdYJbsi9U=
X-Google-Smtp-Source: ABdhPJxRypmhaluD8ShSffomEQ0+aN2E5PH1fccvvWG3s21MWDizGeekMb7OsvJyRcfodW/GmFhjhA==
X-Received: by 2002:a05:6402:2936:: with SMTP id ee54mr18057284edb.70.1629096908868;
        Sun, 15 Aug 2021 23:55:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id i10sm4347636edf.12.2021.08.15.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 23:55:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unused variable and DBG_88E in hal/rtl8188e_cmd.c
Date: Mon, 16 Aug 2021 08:55:06 +0200
Message-ID: <11475165.p2zfeMNkXv@localhost.localdomain>
In-Reply-To: <20210815230518.91656-1-phil@philpotter.co.uk>
References: <20210815230518.91656-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 1:05:18 AM CEST Phillip Potter wrote:
> Remove set but unused variable init_rate from rtl8188e_Add_RateATid
> function in hal/rtl8188e_cmd.c, as it fixes a kernel test robot warning.
> Removing the call to get_highest_rate_idx has no side effects here so is
> safe.
> 
> Also remove the DBG_88E macro call in this function, as it is not
> particularly clear in my opinion. Additionally, rename variable
> shortGIrate to short_gi_rate to conform to kernel camel case rules,
> and improve general spacing around operators, some of which triggers
> checkpatch 'CHECK' messages. These are not related to the test robot
> warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
Dear Philip,

I'm sorry but, although every change here is fine, I cannot ack your patch as-
is. It shouldn't address so many different issues all at once, according to 
the best practices in patching and the kernel development rules.

I understand that you think that, while you are at the removal of "init_rate", 
why shouldn't I address all other trivial issues at once? 

Even if the patch is short and it probably doesn't require particular hard 
effort to review it, that mix-up of different works shouldn't be done, mainly 
because this attitude could potentially lead you to add more and more 
different work in future patches. Where is the limit? Why not add some more 
different works next time you find some more problems into the same file/
directory?

If I were you I'd, at least, prepare a series of two or three patches:

1/3 - Remove init_rate as reported by KTR;
2/3 - Remove unneeded DBG_88E macro;
3/3 - Do some clean-up of rtl8188e_cmd.c;

Perhaps patches 2/3 and 3/3 could be merged into one, but I'm not really sure.

Thanks,

Fabio


