Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934833FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 07:48:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id lc21so11967972ejc.7
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nvlJRJ69OUHyrUACrpo8F1miQw6oE5JdvcD3B6H2x0I=;
        b=EdkjD9fOb5h5Ac1wZ/RtDTPYlj3ywQ4mTl2SlK13ldBoX5PXCuYIHWzSzXI06I0I5E
         3PgDPD5f8NYmERz01Zrllyff90aH75QLhEyz66a4X2cHsjj48Vo5I6JXPbcceMXDLMTt
         Gn+oGbziJkTdCKqLL0ua/bdqrS1bqgFFoVFwkkYZ9iYm5D8hVwvYCRydPPbAeOHsxbJN
         O1zPn9uoU6jl1TuqqHS92lkFe6KUGa9YjqUROV9zgE5RVrhAyXY9Q7d8+CtKlMN4BxXp
         M3XzIH4MtUi8IL/e1li7qLnf4S7lUzB3Y3AIzjw2WeuTeyyXQxiyoKLU7hYZYsbwFrGB
         P29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nvlJRJ69OUHyrUACrpo8F1miQw6oE5JdvcD3B6H2x0I=;
        b=dyZnJpYAMgzlxpIQC+gu8mdNxjSaqtZmPIH8iuvSOKgs3MzC59+BcTbbD6FdJYw17u
         wixWA8hFNLvL2aD5b0fnaqwfa2YTnMEoZo96/SO4O3Zb+SH61mq3rqI0ro6tMn/iYWDR
         t47XSlCIxQVWTNEj7U4SLpjgGIgZ4V2DuNjx1bWQqFn+tdapZCV4DPM6mYFph/LGVKfb
         vmcdtougPjfQLC4pd2upxcrLrEajuZC6vF0XWJ/GTdet2vncMd7gyNi+5IG75yU29bxx
         prXGgOfdEEGB9bESp7mPTbDttIqCspv6hZpedTHsBU6JmBkhrXB8IfJjUD1loZboR7xZ
         OjrA==
X-Gm-Message-State: AOAM533QUaTO7mF/BngD/QMrq34rghL+MhFXZMPCX50sQEEF0XgfCR0V
	EubNUxDqFdPdmBfj+gH80P3QMlveT9w=
X-Google-Smtp-Source: ABdhPJz1hENYoMgYVJUa8R++pXsrzwduwwG5a9ZRP/Dl53A78/ZI7aeUUkc7eC8ZjOED3EGm+qxCBA==
X-Received: by 2002:a17:906:bfe3:: with SMTP id vr3mr8637018ejb.521.1630050485714;
        Fri, 27 Aug 2021 00:48:05 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id y20sm385604eje.113.2021.08.27.00.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 00:48:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-staging@lists.linux.dev, Krish Jain <krishjain02939@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Declare the file_operations struct as const
Date: Fri, 27 Aug 2021 09:48:04 +0200
Message-ID: <1742120.GgyQvu0Ciu@localhost.localdomain>
In-Reply-To: <3634721.RBzQ2xsved@localhost.localdomain>
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com> <3634721.RBzQ2xsved@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Friday, August 27, 2021 8:49:30 AM CEST Fabio M. De Francesco wrote:
> On Friday, August 27, 2021 3:59:28 AM CEST Krish Jain wrote:
> >  From: Krish Jain <krishjain02939@gmail.com>
> > 
> > Declare the file_operations struct as const as done elsewhere in the
> > kernel, as there are no modifications to its fields.
> > 
> > Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> > ---
> > []
> Are you sure that it works? I wouldn't be.
> You didn't build this file. Please build your changes before submitting patches.
> 
> Furthermore, please always rebase to the current version of the staging tree.
> 
> Finally, please use the class modifier "static" as the first keyword of a declaration/definition
> as it is done everywhere in the kernel (see "grep -rn "static const" drivers/staging/" and
> then switch to "const static" and read the output).

Please don't misunderstand me: as far as I can see this is your first patch and 
(I'm pretty sure I can speak for everyone else about this) you are very welcome 
to staging and to kernel hacking :)

However, before posting further works, you'd better read at least the following 
documents:

https://www.kernel.org/doc/html/latest/process/4.Coding.html
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

And please don't forget to always CC linux-kernel@vger.kernel.org.

Have a nice time with kernel hacking.

Thanks,

Fabio


