Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E112C99
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 11:43:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id o8so50738221edc.3
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 03:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=50Soiq3WEOeOybtuOq6WlDjJGXBsxR//U/Oh1dfjGCU=;
        b=adp6bYt0EZU+RH4YpNCvDLuW7gdNxTdgKZJqGc+daBuy1Q7hFQZYck0btWdxOK/2Ez
         jIr8iUKU95yWSXuYImoRxcvMTDskn36e9OUbx5xmI0icWsnaEzWBQHYHeVduNXl9I7Mr
         vUdaTKhn3k/vJ5DuW8Ym7IMHdHxMOWbo773bnvtL8Nk+LNBv+bLp+VZivGYniITlUbwO
         cxd+IMsY+IJnvo7ODTyHC53mpyE0QrQbfAZ1sA5968m2QO7cZtBDuWa7Ak3cseqlnrDK
         /LhvR3Gh4RxWJOALNOZbtlJQ2SE33sNr086rep6OGO1UeLpF/V8fW0E9Wp5b/oVH6Yw+
         tXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=50Soiq3WEOeOybtuOq6WlDjJGXBsxR//U/Oh1dfjGCU=;
        b=tTWCAIAaUn1hLb1PqSHTLM9o4NAwi8KsKhKE2Epcytf8cGIR58+d8QpjhDEEGQx0kp
         l/gHT13EoWAMnv5ie/f4OLYiOItsYPGc8yIomc0XvCT4R9x2WPmg8UhjQmXILONTjxOb
         VqanfoNtmta+HvdisqLCw8SL9rIoZpLtBoqesAooiwJ4kMih414/dlh1ZQEYaT70rHss
         IObrDRJR/j5gTBMF5nD2XFZDtO/ddZw5LECAV2y77bLIBiBuDypzgQvvx34tIUy6tD1O
         PgEzSEix8ZKoVqofnXZkFYeylkJJ4ZoEm5W2FqLQcWvy+PUBbEB5vLCqGl54NYQiA6ZY
         Ib7A==
X-Gm-Message-State: AOAM533e30iq30/eiB+vg9wOFv1/UKFEZ6WUQu6GRMHPvRhVaILbvMa1
	YdjOJ/WJpS4hchalRTRpyq5brDqOEfo=
X-Google-Smtp-Source: ABdhPJzmmYxqw3r568g0TavATRuEAtcQy04qcstjy29cKGw5WNQGpVte6eo0ZhXfC2ZpUmxMt2JWZQ==
X-Received: by 2002:a17:907:6d82:: with SMTP id sb2mr70287541ejc.440.1636285434930;
        Sun, 07 Nov 2021 03:43:54 -0800 (PST)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id hd15sm6907701ejc.69.2021.11.07.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 03:43:54 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Sun, 07 Nov 2021 12:43:51 +0100
Message-ID: <2389191.WthrnW1hFq@localhost.localdomain>
In-Reply-To: <20211101191847.6749-1-fmdefrancesco@gmail.com>
References: <20211101191847.6749-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, November 1, 2021 8:18:47 PM CET Fabio M. De Francesco wrote:
> Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
> report_del_sta_event(). This function is called while holding spinlocks,
> therefore it is not allowed to sleep. With the GFP_ATOMIC type flag, the
> allocation is high priority and must not sleep.
> 
> This issue is detected by Smatch which emits the following warning:
> "drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 report_del_sta_event()
> warn: sleeping in atomic context".
> 
> After the change, the post-commit hook output the following message:
> "CHECK: Prefer kzalloc(sizeof(*pcmd_obj)...) over
> kzalloc(sizeof(struct cmd_obj)...)".
> 
> According to the above "CHECK", use the preferred style in the first
> kzalloc().
> 
> Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and 
kzalloc()")
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v2->v3: Add the "Fixes:" tag, as requested by Greg Kroah-Hartman.
> 
> v1->v2: Fix an error that I introduced with an incorrect copy-paste
>         of the sizeof() operator.
> 
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hello Greg,

I've noticed that you have already applied recent changes to drivers/staging  
up to the patches of November 6th, but my patch is not among them. 

This patch has already been acked by Larry and I'm not sure if I should send 
a v4 with his "Acked-by" tag or if you can add it by yourself when applying 
to your tree.

Please let me know if there is something that prevents this patch to be 
applied. I have no problem in changing / adding whatever it is needed.

Thanks,

Fabio M. De Francesco


