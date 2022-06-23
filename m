Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C923A8
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 21:21:31 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id g26so807244ejb.5
        for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOwhwkA5mmXw3hkTfHa38fc0GYwltKnM7rb5bb5xfwY=;
        b=K6N2zpb6B0fPuw75VVTJv5/Iau7yInQabYZ/WS1X3wrgt+vdkOMKnLtdS1F/b5AfDa
         140WIQmRymqMN3Q5DWpYinTh3T/DzER4L2BidCyIHe3rYDTU5vsJLWrRGg46TkW6E/0n
         thhTOrvDKW5qUCS1Vy7Qg71Lprh1ozNoVAVbPm6ZWDW0IsaD7Px2sO+fafVYr/yGmqhK
         bEZHeIifHM4KZJtWj/BL9IigNmh+Lz8vXVQwnrGaqeqqn84K1FEKAbzZRWE04tMqGFZR
         6odJwWPIegCI8l3F7oqvstsrjS7YLG7VUHcSVWeh3lFzAj1F6Uxaxoplu4M1Q/kgV5WD
         3BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOwhwkA5mmXw3hkTfHa38fc0GYwltKnM7rb5bb5xfwY=;
        b=FOQSX2LXKD6ia2LTCxtfG6wG5W78bytGMWBjwqGKsB2C3AlFgHpb8g/YFH2ZNF0pdd
         Z2hLERq/Jj/ZbNGZQtj37tsmtn0NIP2gFrqGDAt+RJyLW4BIYNRrpo3C5Vj1t+su5iMO
         UC00TAS1UEjyAe9oZH/me+N1Yzq0Jb3jzS7ZpL5xvXYgj80Xzcy6eisokUi70wnN+dVQ
         szq47YeJZrlm2lGs3ec6IDmzC50IJOe+SKFx7VZnKfI6KkJDMUN/HBBv/xd/vVqMK9n+
         01iwrJtGNdybOtBNnRsTe0VFNVdtTVrmb2XQv7Lp42oEptFhdQmQ2ZvXIA+1dSRqDEBn
         pMRw==
X-Gm-Message-State: AJIora+v3Nu8C+n3M/ouGnzD21pcnxelEJ5dagzfVSXyelMV5dH2Xd0Y
	V/Gj4/g8xpp2wmHc0XQXUpf9ckInN5NbJACtzi8=
X-Google-Smtp-Source: AGRyM1uoYqqSYjAVeHYAlR6Uez4eMhH3clKFNosLdDojQKG+unYQyjNftVHnB9lfhiDL6K3fSsG4goeUohnXhQUa8LA=
X-Received: by 2002:a17:907:2d09:b0:722:f0bf:ac26 with SMTP id
 gs9-20020a1709072d0900b00722f0bfac26mr10248592ejc.77.1656019289957; Thu, 23
 Jun 2022 14:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655975970.git.f3sch.git@outlook.com> <13b32131cd00a1f0b8793657a24ada71240a8350.1655975970.git.f3sch.git@outlook.com>
In-Reply-To: <13b32131cd00a1f0b8793657a24ada71240a8350.1655975970.git.f3sch.git@outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 23:20:49 +0200
Message-ID: <CAHp75VcQcKaYUP_JsmTFOY-pbOR39+TMw=5ADbb2BRGoMijCMw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] Staging: rtl8192e: Cleaning up error handling
To: Felix Schlepper <f3sch.git@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 23, 2022 at 10:44 PM Felix Schlepper <f3sch.git@outlook.com> wrote:
>
> Moved error handling to one common block.
> This removes double checking if all txb->fragments[]
> were initialized.
> The original code worked fine, but this is cleaner.

...

> +err_free:
> +       while (--i >= 0)

  while (i--)

will suffice.

> +               dev_kfree_skb_any(txb->fragments[i]);
> +       kfree(txb);
> +
> +       return NULL;

-- 
With Best Regards,
Andy Shevchenko
