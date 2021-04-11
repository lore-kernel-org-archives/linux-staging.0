Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FCD70
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 07:11:46 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id w23so11250474edx.7
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2qQvGefAL3tZBLWIdiPaSRZ11kwhfAk0FTUmJJmz+7E=;
        b=RQSnQoALgoCXIk9RjZ5W3aFKQkerS55uQa2t2nGSLXNLhsvtKU15ibjXcPJ2N73cE1
         H4xqS37sdGcIK3wJgyqBfhHOc/C2KiD6qM8XCM8k3NthZPRgwpbKBBKEFR+PfkYKtwfl
         uzokBoRcFQZ2ObHxxZ081SOQxCj2Qsa0exxnRyBJvuwc8Gn6PBJwzxKvWCIAsaxpohwB
         l7n6WvJOYtnRmTqWRou5dNvTSMB4QOvuwb5WMaEWvY9RdMs+NORtpLGF2XIq9VEmHkJF
         VML3hwHAedqqNKKW0md8GtGK1TiY9zllV0DHbXAYl57qNXQPU/DeHZyvnIEKeG7nXOda
         h0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2qQvGefAL3tZBLWIdiPaSRZ11kwhfAk0FTUmJJmz+7E=;
        b=tRHbCE2ukpb+WdBhGybr/NC5XQIwKKNaoQWZjWsy6SW91yYwrKEvaiDx2Z3wXNQI3z
         BCID8P7bFFWHbe2LzNRytVs5G5CuSNZngvRZ97AQdiF/MV5NN37JaXpWtlOFAu0tFVbv
         QZevbwxJm3mW4yPEhZ0NGp6DbJFG9ik05CthMZqnEXHaHZSrCirSKo491LjJF36fOY5j
         UqdGGTjcGtayxAgaL1NxYmoS17Sed9d+7Ssu3Z0KhZ5iowdH451G072hgO19dtLDAe86
         oZU6JKPEKREaOzmEDJMIZzvXzewQKwnJmOv7UchZVOqqWcJOqpjlJvChARZRq8pS6AgY
         Zwpg==
X-Gm-Message-State: AOAM533QfWvY0l1SZT00INC2hvk/iLPIgh49SWuA+wePx2kDETzlERWc
	l+RXwMXdZOwKykYFy/t02Q0=
X-Google-Smtp-Source: ABdhPJyWGwQrhQF+znYNqCKR9hqmLGuMtoC2zDPwDf2yUKiG8RbahoPV516gqsXIvvb1RIzDbHzqkg==
X-Received: by 2002:a50:eb8f:: with SMTP id y15mr24682645edr.115.1618125105440;
        Sun, 11 Apr 2021 00:11:45 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id j7sm4199225edv.40.2021.04.11.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 00:11:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2 0/5] staging: rtl8723bs: Change
Date: Sun, 11 Apr 2021 09:11:43 +0200
Message-ID: <3154849.IkRRYng9eG@localhost.localdomain>
In-Reply-To: <YHKZlqFy15QC9Mzz@kroah.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com> <YHKZlqFy15QC9Mzz@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, April 11, 2021 8:39:18 AM CEST Greg KH wrote:
> On Sat, Apr 10, 2021 at 05:00:03PM +0200, Fabio M. De Francesco wrote:
> > Remove camelcase, correct misspelled words in comments, remove an
> > unused
> > variable, change the type of a variable and its use, change comparisons
> > with 'true' in controlling expressions.
> > 
> > Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.
> 
> The subject line above is very odd :(
>
True. I've just read the output of git format in /tmp and noticed that the 
line with the "subject" was broken in two different one. I think I had 
pressed return while editing.

I'm about to send that series again with v3.

In the while I noticed you sent a note to let me know that the you have  
added the patch titled "staging: rtl8723bs: core: Remove an unused 
variable" to your staging git tree. 

I think this could be a potential issue because the same patch is in the 
series that I have to send anew. I put that patch in the series because 
yesterday you wrote that the message with subject "Outreachy patches caught 
up on.", asking to rebase and resend.

However, I'm about to send v3 of this patchset. I have no idea whether or 
not you will have problems in applying that. If you have problems with it, 
please let me know.

Thanks,

Fabio



