Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B041171B;
	Wed, 18 Oct 2023 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itlIONFw"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5859d13f73dso4184782a12.1;
        Tue, 17 Oct 2023 23:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697610640; x=1698215440; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0Uk18GNbiJSbsmf1R3dcjXeGFJDfuJ+L1EqVZs7JXI=;
        b=itlIONFwt4lUfS+KFW9ZOlj7PtSQB5CV+q5hTq6ytUTjNKRzOAbhCHRqLb1x02ECRc
         d6wml6zp3IUxFg3PKr143hRp+CZnQidCaZ39Jqnl5A0c5Nuh48I6etxBudno76NI+5aV
         2bDYpahsxdsCEMdkhs9ZXw/q9yaauAlda7S4lauFikuZ5gQHJkiAmFpgipHaxM3JyO4E
         chRkiS47Cvx+kbo6umIxaUWK+Tw7yX1X7TG4b1+Yb89b0Mf2wD08piYzgM4XRESOkkg7
         R6dX+8rfLbifPS02NyFK/vLqCXciOdUtbgRyWir4JbQdYNWHl5Y0n9UGMFUZE3AGrGsI
         WsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697610640; x=1698215440;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0Uk18GNbiJSbsmf1R3dcjXeGFJDfuJ+L1EqVZs7JXI=;
        b=XWl4UKhvB/ENXS45z4S9xRzkEfWOCY9TT06WEQRfGOlGD1QbSLF6d5QCP5TMb+IxRG
         V6RIMPyRP0PaGW/eIxsvfuOoiCQVdcM+giCPntr9b0cbUgwUplKp3OwMvUhFQkWBhFti
         fB1dGmmbFAvtnUfdU4IPehbyX7fmqDEn52rkn8YkkF6BfltIZIqDVKE3nW9D8m5On8zO
         klHDNp+NoWQYMvEla3O/RyxhnRjIRBV/JEWVRPOXTX9t5ClpU8V73sdu5CrsV4M1Yi3b
         bXuTEOky+BaA5am6b20tTbS1PxjDqJ6gqLRGXc7jVefiz4+IfVCEGldBHJGqSbfHUGJZ
         5PRA==
X-Gm-Message-State: AOJu0YzdJhcDUQ2ZCxlGxw6SF76/MxH54bNz9HBEkpdj3RPtexqD2qvU
	UGBhiGU0Fh2VSOmgkaI5HI+WkunTGShDjg==
X-Google-Smtp-Source: AGHT+IEHRTHxxYuWjQhGXO+rYJx/8C2/iPdkYvGp9CNXtxGuMUx3SrzTX1xMMwnovfBvViV1PlkFPg==
X-Received: by 2002:a17:90a:d494:b0:27d:669e:5a10 with SMTP id s20-20020a17090ad49400b0027d669e5a10mr4143180pju.13.1697610640267;
        Tue, 17 Oct 2023 23:30:40 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id b2-20020a17090a990200b002774d7e2fefsm546655pjp.36.2023.10.17.23.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 23:30:39 -0700 (PDT)
Date: Tue, 17 Oct 2023 23:30:38 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: vme_user: Replace printk() with
 pr_*(),dev_*()
Message-ID: <20231018063038.GB1868@Negi>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
 <a0579eeda5ce70f69b6bfdcbe534b9d37138096c.1697601942.git.soumya.negi97@gmail.com>
 <19637f96-40bc-a46b-8e7a-fa59e5e9e16@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19637f96-40bc-a46b-8e7a-fa59e5e9e16@inria.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi Julia,

On Wed, Oct 18, 2023 at 07:47:29AM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 17 Oct 2023, Soumya Negi wrote:
> 
> > vme.c uses printk() to log messages. To improve and standardize message
> > formatting, use logging mechanisms pr_err()/pr_warn() and
> > dev_err()/dev_warn() instead. Retain the printk log levels of the
> > messages during replacement.
> 
> It's not possible to use the dev_ functions more often?  The pr_functions
> don't give context information, and the message don't seem to give much
> context information either.
> 
> julia
> 

Yes, I think there can be more dev_*() functions.

Most of the dev_ that can be added are error/warning messages where the bridge's
'struct device' instance is accessible & can be fed to dev_ fns. Although I went
through the VME subsystem docs, I wasn't sure if the bridge's context made sense
to be printed with those messages. So I wrote them as pr_ functions.

Should I add them and send a v2 for review? 

Regards,
Soumya

