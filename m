Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5552C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 13:12:55 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r18so12889459edv.12
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C51Lh41WoBpmX5ebPui+TVxwhH8ZqyDbgZK9znUvKYU=;
        b=iJ2VeR0tYteIn3RLl/KzJUoYJI5TVGEyyJN0AdZFGDFPieNfAkC+3VzS+gc0J8An35
         ikAy8SFTrevYcV9NPLhr0qe4lio7Q+PxJlPjbliVJ/ZX0B5NL4RQc1djqNlfwkr/Q/Ba
         NgkiQA0dakNdVNuQsxvbjFOPppXtWTkoVVX4wn6ZL0UTHvmWkUQ6/gBlPk6ngTyw9LSs
         ocnaKxjN5J27MBGKRbHHGEVDfqrWP5e2UorJkJ55xx0JAaB0cOY3R3hI/ehsgBk/5EGp
         M8NXl5TxMESLLVJik9t+7nzd4lFT1vLZI2Cno3fx7IIRXuv1bWC1RnnrD+CK7hQUH9IA
         /vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C51Lh41WoBpmX5ebPui+TVxwhH8ZqyDbgZK9znUvKYU=;
        b=Y2ek/EhHEEk/F6BEJsj5a4vqaYBD/sMqnXhH9d6AkjQSvON5JzA77LpG46zkMS+vev
         x4mxDarFqbTtTw7R0t3ZTpN11klpZ4ypi8///+HdaXgHwdSuZOqIqvIvkjE0T9FZAI5s
         ME6E5ivK9bSbiIV8iUbA/2MHoczglezYveNmfA5uS0qUoU5vhve+m9eLMawliuOdkXdW
         qYIz1Bnx9mPusAvWE5oZQBoGLbdaIQfVj/4ATwwHMWIYFh+En8rzTxVmcJyTw7IFU00+
         mBUWR7rBknupD/VVJMopCZx/p/csCouCf2EsGMYVCtryiPcWSV/KgTyuVV8kn4REF04j
         GQBw==
X-Gm-Message-State: AOAM533IH5LsnwVBTdZzIoQW1ib/3vOs88yhORWH7Sn9+PqEXL9fTHZf
	OrCh6hrfxh8sVwf+G2bSk7c=
X-Google-Smtp-Source: ABdhPJxsINe2KSf73o5DhZVu5wrNvDYPYK8vz1rURG2vB/nBNJa/zJ0wq6njRkrRDOUssLSxpFMwGg==
X-Received: by 2002:a17:907:2d12:: with SMTP id gs18mr33605414ejc.353.1634649169144;
        Tue, 19 Oct 2021 06:12:49 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id h11sm10131010eji.96.2021.10.19.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:12:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Karolina Drobnik <karolinadrobnik@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [Outreachy kernel] Re: [PATCH] staging: vt6655: Fix line wrapping in rf.c file
Date: Tue, 19 Oct 2021 15:12:47 +0200
Message-ID: <2001042.7W5oOxFLzk@localhost.localdomain>
In-Reply-To: <4c6a85a4934ef977eee07fb7e38b07b8061bfce4.camel@perches.com>
References: <20211018150526.9718-1-karolinadrobnik@gmail.com> <810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel@gmail.com> <4c6a85a4934ef977eee07fb7e38b07b8061bfce4.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Tuesday, October 19, 2021 2:26:05 PM CEST Joe Perches wrote:
> On Tue, 2021-10-19 at 11:59 +0100, Karolina Drobnik wrote:
> > Hi,
> > 
> > Thank you very much for your comments.
> > 
> > On Mon, 2021-10-18 at 17:12 +0200, Greg KH wrote:
> > > Also, these are all just fine as-is for now.  A better way to make
> > > these lines smaller is to use better variable and function names 
> > > that are shorter and make sense :)
> > 
> > I have v2 ready but I'm not sure, given the Joe's patch, if my solution
> > is a satisfactory one. I didn't jump on such refactoring as I'm still
> > learning about the codebase/process and didn't want to muddle the
> > waters (...more than I do already).
> > 
> > Greg, what would you prefer? Should I back up with my patch, pick
> > something else and let Joe's patch be merged?
> 
> What I suggested is not a patch it's just an example.

Sorry, Joe. I sent a message trying to explain what you were showing to 
Karolina with your previous email. Soon after sending my reply, I noticed 
that you had already elaborated a bit more.

I hope that you don't mind. If I wrote something that contradicts your 
thoughts and intentions please accept my apologies.

Regards,

Fabio



