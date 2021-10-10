Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF12C81
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 09:21:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id d3so27227435edp.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T3MxSq9PyEnBzubNp90tEY6VW9o/sj2nQltYCb3Vxdk=;
        b=X+LseXPwi7tD9pD5z9kY1Ty/bpRiJ4/ajSY2ApnpJKc/UG344aGc5utr8e1H+/MJqj
         i9qJ8hgCbHgMahltKPhjyxf8DAKDc9EJuPgjKZirJdj06QP31Yj3qIzpKaWil/QHQwGP
         +/ly9YkJ2uR48Cb18tO0+2kY9BUm1VxnSfyfjsl2F+p2UgFGdgg7cNb9Vu0BHRx89xdG
         ocqwWKZee8DN3LQv7pawJVz/A77Cb4aqSHuMTJegU+JnP39OtLtOhqb/UUqjBhz66z1O
         09wTot7gDz0ne1UG135JkO+XSx5zqLv4Yee8gdba3MkhjkR23G3He9L3fMYHTCN9u7VT
         jgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T3MxSq9PyEnBzubNp90tEY6VW9o/sj2nQltYCb3Vxdk=;
        b=00U5KQtJ/PUy45ki9JixnII71i5eLqpy6SgEJYdR7/CrEr/LyaqYwnL6aPEVNbWpGU
         KmbnCORA4bSjhMNdJgFZw2nfH9/RIWm164VJ814AlVYejWrQpn392kxVXc0tuqCwcgRk
         bRiLmCcqoGu6IBTqPOlnJtNE53TUaU99YuK6II1N8DhwbU1crtYmKFR0ikYIGpBHiSMc
         fvw4id7TkogKpJgWjQ7goK2KrUlJ8r/9Iv6QEFj6PHx/MTecmCxd8JV05Ct+HqlNSxmT
         +C3E47X3hii6bZH5MyQxZLLzrzflTBsWL6MuF7KwWPwrQX79uKKZ4M68RrY/JqrGeIZy
         SQBQ==
X-Gm-Message-State: AOAM5308uMRelnv21q4pKVejIps6mXhjswuY4lQF9eaick/3tIFu8fyc
	q4UZL2qLmSddMJwjuEjbTVk=
X-Google-Smtp-Source: ABdhPJz4e4xLiL77QlmhCNDpjEM6AV5Qn1UUBt2b3S4t3u9PTxKQqdn11YauXVLEneET2HgHoZOLvw==
X-Received: by 2002:a05:6402:4d1:: with SMTP id n17mr31630560edw.337.1633857711915;
        Sun, 10 Oct 2021 02:21:51 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-109-12.retail.telecomitalia.it. [79.43.109.12])
        by smtp.gmail.com with ESMTPSA id ay7sm1610392ejb.116.2021.10.10.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 02:21:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: Provide a TODO file for this driver
Date: Sun, 10 Oct 2021 11:21:49 +0200
Message-ID: <2664974.42EkL7omyK@localhost.localdomain>
In-Reply-To: <6435467.SEsBC3EFVD@localhost.localdomain>
References: <20210826130342.9552-1-fmdefrancesco@gmail.com> <20210826135413.GA1931@kadam> <6435467.SEsBC3EFVD@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 9, 2021 6:31:12 PM CEST Fabio M. De Francesco wrote:
> On Thursday, August 26, 2021 3:54:13 PM CEST Dan Carpenter wrote:
> > Another thing to fix are some of the sleeping in atomic bugs.
> > 
> > drivers/staging/r8188eu/core/rtw_ap.c:139 update_BCNTIM() warn: sleeping
> > in atomic context
> > drivers/staging/r8188eu/core/rtw_ap.c:1296 update_bcn_wps_ie() warn: 
> > sleeping in atomic context
> >
> > [...]
> >
> Hello Dan,
> 
> I'd like to address these kind of bugs, but I have a couple of questions 
> about them.
> 
> 1) You've listed what looks like the output of a compiler or static
> analyzer. 
> How did you get the warnings you copy-pasted above?
> 
> 2) I know that both the execution of interrupt handlers (ISRs) as well as
> any 
> code blocks that are executed holding spinlocks are "atomic contexts". In 
> these cases, "sleeping" is not allowed (for obvious reasons). Besides the
> two 
> mentioned above, are there any further cases of "atomic contexts" in the 
> kernel?

After some research, I've found that Softirqs and Tasklets are also executed 
in "atomic context", as hardware interrupt service routines are.

Furthermore, I've also found a .config option named DEBUG_ATOMIC_SLEEP
that should warn if some code is sleeping in "atomic context". However, the 
documentation of that option does not explain where the output of these 
checks can be read.

I would appreciate any help on this matter.

Thanks,

Fabio
 
> 
> Thank you in advance,
> 
> Fabio
> 
> 
> 
> 




