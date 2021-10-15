Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C240C2C81
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 09:15:18 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ec8so35516331edb.6
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MijKcoywXZiJ/TAfeUQvoBq2vYQe9FT8lGZbL7eVuLY=;
        b=jvtwlXyyqaCw9x0aEvTBt7y6s84PRxF46I0emgA39mxfA7bFuDxXxAopNRUhpfbxLl
         EKopmJ6o07eI0CrDG+EKGfo2J7bW4/gfgRccfn6y8UVzgDvBXEJWP8t1ULDwvWWOiWPn
         JjQVEqXi8WNFBvFz8KPKogxnrYl2gpdrcb9BqUc1eUJSvXQzM0FmqYB4oUWTP4UYClec
         2hgwlFvSb6JB0F8o1djx1ixYKVVi7DJENMbE0/4zxtL1X0I8bO5S6aJPE5DPuSuPzKfs
         +aTzTos5uoct8EDjsqmXihpSpvK9OYhxTRCS+irHfdzXBkM2E9WzcyksHm0a6bVdatUU
         sXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MijKcoywXZiJ/TAfeUQvoBq2vYQe9FT8lGZbL7eVuLY=;
        b=c+nnnWCM/V81qi+24s/4+Al4shTO3g8SrJ6i7ItE8JVtJGQQSphM+Pp18c9joMRv/f
         R/JgKz8YO2SaJUAMxwpDuMkgjQyzXPmJvqJ43tJjucd74SfQzKS0W+eoL4XMarNpLbEJ
         H/1tMZoJk1Mtac3QMmuYF1L0M3ZyBD9PXyZT4zGO2x2ZuZuKC6DQsn47hsNgdZixP8ej
         KiZucrJoT+QISFVEwQjbmoBAwol1ehVWfp3Wd6gkrNm28l1kaBJCWIDX/KuLvS/Dip12
         Ke5odMPJut2I0Kaz0fyq8glcgfaoBcHaMnviWFsJrF+EK+OaGixdkwT+aIDQReXUGTQa
         x0dw==
X-Gm-Message-State: AOAM532EszhzZ0k9i3XiNDb0KxlU+coTyus/Y1QpjJ16qjhVW17wdhMX
	PrGp+ZQXJZyjVfqIbz5Horg=
X-Google-Smtp-Source: ABdhPJxsgjWRkOd/eO86fZAyEQf5utZhJf1Qc0pJgU4Nnm6X+m9zGccqf2t6wooVtvvk4+YQPvUq1A==
X-Received: by 2002:a17:907:6e2a:: with SMTP id sd42mr2770842ejc.333.1634289317029;
        Fri, 15 Oct 2021 02:15:17 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id i19sm1205273ejo.101.2021.10.15.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 02:15:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com, saurav.girepunje@gmail.com, insafonov@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: saurav.girepunje@hotmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: simplify the return statement
Date: Fri, 15 Oct 2021 11:15:14 +0200
Message-ID: <13289545.LovHZTAFgE@localhost.localdomain>
In-Reply-To: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
References: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, October 14, 2021 4:40:00 PM CEST Saurav Girepunje wrote:
> Remove goto statement where function simply return value without doing
> any cleanup action.
> 
> Simplify the return using goto label to avoid unneeded 'if' condition
> check.
> 
> Remove the unneeded and redundant check of variable on goto.
> 
> Remove the assignment of NULL on local variable.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
> 
> ChangeLog V3:
> 
> 	-Remove goto statement where function simply return value
> 	 without doing any cleanup action.
> 	-Remove the assignment of NULL on local variable.
> 	-Replace the goto statement added after the memcpy on V2.
> 	 with return 0 statement.
> 
> ChangeLog V2:
> 
> 	-Add goto out after the memcpy for no error case return with
> 	 ret only. On V1 doing free, which was not required for no error
> 	 case.

You still don't explain why you changed v1. You had freed resources on 
success path. That was not allowed because you introduced a change in the 
logic and a huge bug. Therefore, in v2, you are not merely changing something 
that "was not required". Instead you are changing something that is not 
permitted.

Thanks,

Fabio



