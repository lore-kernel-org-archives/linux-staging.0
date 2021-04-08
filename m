Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E76D0D
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 06:47:26 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id f8so1015565edd.11
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eEMG+quC1tEexFmdg2ovTE5avx1YqEXkN0uVd1QBehA=;
        b=rFE+UkPyGFvebDufiBQLobp12xwMIBjhS9/FzqNoWvSUBpXxRepEofAoQUN0hJLKIX
         RQbrvbTD2v87/xTEDzhdNUsADb6D6FvnDXFkMp/9qsHWtER4oTzfY5DlO4NEzHHaacuM
         kY43Yp0/3t7kBAKkGpOvRVMnQb+JflNmptmhNA5rH3Rx+39HXUeKx7mQTPi2F1uKGiLY
         KAVY+cJwA2QBqwT7F6XnuAkd9XCqLzjgAYi6ruI2A6TNBLHuvtZ7VxB5Ua++L8atXnSm
         HgzXsqvt5rMaBljfw5xBRrYwT62CficZrcsBjOLYyYRP/WVB3AoVRmSfZYTZso3ihTU2
         7Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eEMG+quC1tEexFmdg2ovTE5avx1YqEXkN0uVd1QBehA=;
        b=lR1mm5iNxbVHEhJNLzG8ECYCeCPbSKr5ed4MUcRDrA55SWbR8rEW4iBgUbwrHlUBQ3
         6cytozPxGkKZzqJ62E8p8xqVCewgXZlrtCQAq+XVA1j5Mi1TdRFvpVgwCotHJ9nD77F5
         275PCma4apBw1fxZJrJXIELVtdiUO4Z9VhxcCEDQi2NrIE5bA6bdFJ7ygiEV+kwQc5gD
         MHe6SlHQCcu+OtFn3ajCyyW1Qj17Lie27wCxNkI3e1jag7xcZbSRgddt9n+Jc41mTfde
         2fYW7l2ibej/OjQqcFye4fgPhhVFWzRMtf7wAU/1kIuIvFjw3jSZ6jEZcP8ZdpDGrfqN
         +csg==
X-Gm-Message-State: AOAM530Qes83MLhqSWwK4L7Qzz+gXF0Yscgr4HSQAQcNH8OFQWWg66Ob
	VNBUSRm8BQIu4J9u+OoGw+Y=
X-Google-Smtp-Source: ABdhPJw7LHzQhaZo08cmoZgbty/zDZFqVTEi2zswHvc26002BUm+57Da0wjO8KoGx+zRifxI/sj42w==
X-Received: by 2002:a05:6402:3092:: with SMTP id de18mr9089033edb.96.1617864444634;
        Wed, 07 Apr 2021 23:47:24 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id w1sm9087622edt.89.2021.04.07.23.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:47:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v3] staging: rtl8723bs: hal: Remove camelcase in sdio_ops.c
Date: Thu, 08 Apr 2021 08:47:22 +0200
Message-ID: <18387208.g0g5C3WDPH@localhost.localdomain>
In-Reply-To: <YG6hsvA54ieV6ujj@kroah.com>
References: <20210407181914.7079-1-fmdefrancesco@gmail.com> <YG6hsvA54ieV6ujj@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, April 8, 2021 8:24:50 AM CEST Greg KH wrote:
> On Wed, Apr 07, 2021 at 08:19:14PM +0200, Fabio M. De Francesco wrote:
> > Changes from v2: Remove unnecessary comment. Shortened a function name.
> > Changes from v1: No changes to the code but only to the subject for the
> > purpose to differentiate this patch because other removes of camelcase
> > have been made in other files of the same directory.
> 
> The "changes" need to go below the --- line, not here in the changelog
> text.
>
Sorry, I knew that. I had already done this in other patches
but this time I got distracted. I am about to send a v4 patch.

Thanks,

Fabio
>
> thanks,
> 
> greg k-h
> 





