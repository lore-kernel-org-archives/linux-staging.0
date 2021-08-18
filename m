Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD632173
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 22:36:34 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g14so3660102pfm.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2sMII5G/YrPb+0dkZspyZPS9+RZRKOtmg2+pJ+lOQh8=;
        b=zCeTW3J0K5np3tXoG1IVSEAaPhRTsp6E7FG40JMxEKemO8ZOHARazqIQmpKFIcs6Sd
         N+GcdWyWkTcutczTnN4sOyyVCxvFWCYptMFPsGfhg09eZke8WGMWE7X323gqAUdPsHGt
         GJI+Q1n5sJHSiu6jvMoqplSND0vhS0iaBcT4D21x/nhiQ6MHkY+ruWt2EXdQpfM96zjC
         hi5+qOD40TDeOvrQRR206d0ujvibZUy7wKb/uB+gerRXWqa6ZBPhLTAUkWQOL5fPGNzE
         UiSjQoQgCCbD822O9dBlOBwzl+Vg8GmLowbUkm3Fma27sj5ipvOpNTGfxjNlZImQucyY
         2hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2sMII5G/YrPb+0dkZspyZPS9+RZRKOtmg2+pJ+lOQh8=;
        b=d0TA1/mN9bpTOG7LMK7vQ3S7m5S5/Ofs9wh/KloIHPSRbqX7ul5fADSqkcGq9GNPfU
         0KLOwqkSX4iRBfnEYRqJ/wp0RytmgOFh28bkdEiuS9pAgPNztzCd/8Ry3VvUIhDv5Qbv
         mlnsHyHqPAGkZJ3K/+EsshSMW35ZmJg6m/3BORtVBpdUaw19gF8vJBLD9uAZLR0/AWMw
         BPYY6r6jSf2tRPTl5xpFwvipxiLtwzhx3e4HkS+8kbthqIYnuVzJDgbUl/j/BlwFCJZR
         EdmkfGHulVP+yvLNejFWOfGUGNxi1kde2P1JKyLwH10HONuHCnL7taD/0206a77BWAYx
         S8hg==
X-Gm-Message-State: AOAM533Oga+AKt5+anNKsxDH+hOBvFAA30NhKoEy9QhLbhU3g8oHrxdm
	kVWfXoEi+gKyvbOyvdQ2HKREpEPVu5UgKmqVUYczZg==
X-Google-Smtp-Source: ABdhPJx62hXsE0+fSTYrXfKzc8DzxmmvkPKOdI5TBxPP7euaOB9l5vqd5XytOvYvOyAB9vVojNAO4JW+D+jXmEpzsAs=
X-Received: by 2002:a63:dd0e:: with SMTP id t14mr9405083pgg.279.1629326194463;
 Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org> <20210818060533.3569517-7-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-7-keescook@chromium.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 18 Aug 2021 15:36:23 -0700
Message-ID: <CAPcyv4hZUOENLxUgqXrzpv0rhHp-TP_EkTaBKjvrsFLjy3-1Vw@mail.gmail.com>
Subject: Re: [PATCH v2 06/63] cxl/core: Replace unions with struct_group()
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Ben Widawsky <ben.widawsky@intel.com>, linux-cxl@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Wireless List <linux-wireless@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev, 
	linux-block@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 11:06 PM Kees Cook <keescook@chromium.org> wrote:
>
> Use the newly introduced struct_group_typed() macro to clean up the
> declaration of struct cxl_regs.
>
> Cc: Alison Schofield <alison.schofield@intel.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Ben Widawsky <ben.widawsky@intel.com>
> Cc: linux-cxl@vger.kernel.org
> Suggested-by: Dan Williams <dan.j.williams@intel.com>

Looks good and tests ok here:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
