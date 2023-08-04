Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C9CA43
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:13:43 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a38953c928so1667887b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691158422; x=1691763222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFUStZjB96altHs1v2dAdA1hEXJW8jJtlfRmt7xhkqU=;
        b=pWEPeiNTNAqQ7lZPPS1zsGsYNIyidcdFW5BMtltCgrU/iQ2Dxmjdj7IqRyElsCki9b
         0vzdliM3ckXVNWpliWxCFUlFyoEvWtYfRGoIgNohlYgQY4J3RRsP9nbCC8/FsfJvCWWB
         OSPH0vzuo7Nt183Ny1MmaHCTk21ONz4CmV5Oe+3wmY/E2IgdY/bJxTvTMQaaB3QQb8Os
         bY9kqvn7EHiPO+m8voX5oN7i4botozjbHETLqAJ+flePUQCGPQtGiVwZCN3i4ru3wpb1
         5aMUzUmsR7Wd+TV+Rqv6+dtqxHEPACwfYkzJs0ckqzqfcsbHC1iRPyrBucTQmeACCjbB
         PWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158422; x=1691763222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFUStZjB96altHs1v2dAdA1hEXJW8jJtlfRmt7xhkqU=;
        b=dtyqJYAXU1xlm9sbt2832bQZOUOugcR46Za2wjqBqzvaeOVaEdbpGuHQvU7AoeW9ZN
         6DYOaih8SWZ3YXZAmFdXyomFhn/g7bzyHi1PIsn2I4ggO6pDvnlBp5ytt0zUYtbm21to
         c0hQACNHomGtB4Y+QD0lmWtmzQ/6X/L95MXMlroluKt+AFZs/brENm7XpyT9tL8P2TtW
         H+WKYUrMv7bQH4u79fKSWUTSarcbhM5orYdthp0hQ/X2lqsI3ra8JFszkCiLRYzv9EQw
         UGgdo0QyOw0y4E5JanyTakLoROzh1y0QYTwC+CcAnEHb3FZqFF+cKCmzsIXqIucxXutJ
         UyxA==
X-Gm-Message-State: AOJu0YzXpizkA3Mm1fh9hEFIUjDEFHcBtPEF0GWhUHxSHFO3nX6Hsf3/
	VaS6kYY5w3adi5+G8qyA1/o=
X-Google-Smtp-Source: AGHT+IFGknPsjQiDdxkcUwuM1qS5DIQ+RYZh7VqheLYGqNza0ciLpZF4q0DO3qfbfZQk3gs6LskZaw==
X-Received: by 2002:a54:4617:0:b0:3a4:38fa:2e08 with SMTP id p23-20020a544617000000b003a438fa2e08mr1748130oip.7.1691158422482;
        Fri, 04 Aug 2023 07:13:42 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id a4-20020a05680804c400b003a4243d034dsm1016829oie.17.2023.08.04.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:13:42 -0700 (PDT)
Date: Fri, 4 Aug 2023 11:13:36 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <ZM0HkHIQWWMZ9uLf@alolivei-thinkpadt480s.gru.csb>
References: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>
 <7159231c-9e87-4a3b-bc0d-a6ade6c04c65@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7159231c-9e87-4a3b-bc0d-a6ade6c04c65@kadam.mountain>

On Fri, Aug 04, 2023 at 04:46:00PM +0300, Dan Carpenter wrote:
> On Tue, Aug 01, 2023 at 01:17:07PM -0300, Alexon Oliveira wrote:
> > First patch was intended to fix all "CHECK: Alignment should match open parenthesis",
> > but added new warnings in the process. This patch is intended to fixed them all,
> > on lines 133, 142, 144, 145 and 173.
> > 
> 
> Since you're going to be re-writing the commit message anyway, please
> leave off the line numbers.  Line numbers are not really useful.  Just
> say:
> 
>     Fix the checkpatch warnings which complain about "CHECK: Alignment
>     should match open parenthesis".
> 

ACK. I was doing exactly that (in the previous message I just sent)
before I saw your message. I'm on my way to a new commit in a few
minutes with this update.

> regards,
> dan carpenter
> 

Thank you.

Alexon Oliveira.
