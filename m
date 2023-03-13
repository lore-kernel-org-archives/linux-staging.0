Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643102569;
	Mon, 13 Mar 2023 14:13:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so7578542wms.0;
        Mon, 13 Mar 2023 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678716783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXaW8X+ac0AfXs+wrChmgieQwlcGySHkeR7jml2OA0M=;
        b=f0BFPyRjQxXQtbi4EGq+BuwolnN9PQOD2FCLFshZTCltqYO+wJ+DINIgKDAhH+ob8i
         gu472eu6RjbYAIyRQUKf4RUlxXguonfJtU9ZwEn6nzJg935V4cAf8yQbBgCvTWraAwCc
         WIj8enYbQGG4fEeoJFs0NW4XMgvUMPAPIDz5+KjdspyFvLlXdJg+Wb51vK0CWyZFtiVj
         GBRvkA2WLhI4qxAO20hELh+UBP0GHV+MVp5iu7yv49X9U1IBsj5SRkQhyx4b6Rv8+AgO
         38taThJcBDx4L8xOTSxrLJTKTLSSlM6TgbdMGT8aTi7FpGoNYBVgm6hUAG646wCU77nj
         AMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678716783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXaW8X+ac0AfXs+wrChmgieQwlcGySHkeR7jml2OA0M=;
        b=TB0/NNytvmiypM4gY5lqpG9E6XQdBL4N/2mWjHfFc4htQzxJ2rmKpVv81n/p5O/7M7
         Wt9/VbceGWa3JWIpKslLGYP1Hkw9J73wWYhWAz6zk/p0DnYuFoN9IE9o+Qh6ucYi3E/Z
         KYC+vSyt0lUZgunEFk2XFaaCadG7y8nDszELtCtk+zoUfO//715VZyphM9BQ7/2axYtd
         HLiOuBYi9QQjh5lacqyhcJV2I9VsZZIGMGorRVOKZip6TfaCrv4wImiJmlfHssysRzuN
         j63cFBeTM4QQ6j+TZ3kteT+u0LzGApfvVwNx96YFjo/F1weBKFsCSTeAMnjq3l2gS2nn
         jUIg==
X-Gm-Message-State: AO0yUKXpUp8bgVlROR+eMNUW+YzRykJoJbeJq8oLZjaSAheIEMHbjgmA
	XFRq447KmOkIgyBmZi88v1kHWZ2kKyA5qQ==
X-Google-Smtp-Source: AK7set+rp1NYJgQoTgFazlVqG+Xn5xixjgbICPOdFskd+rd+k0vmsC/M4z4PDnyPp1WLYAYfwMzNyg==
X-Received: by 2002:a05:600c:1c8d:b0:3df:d8c5:ec18 with SMTP id k13-20020a05600c1c8d00b003dfd8c5ec18mr11093367wms.13.1678716783032;
        Mon, 13 Mar 2023 07:13:03 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b003e8dc7a03basm9643310wmo.41.2023.03.13.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 07:13:02 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy@lists.linux.dev, Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4] staging: axis-fifo: initialize read_timeout and write_timeout
 once in probe function
Date: Mon, 13 Mar 2023 15:13:01 +0100
Message-ID: <9938109.ZD9C4EEAuf@suse>
In-Reply-To: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
References: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On domenica 12 marzo 2023 18:33:19 CET Khadija Kamran wrote:
> Module parameter, read_timeout, can only be set at loading time. As it
> can only be modified once, initialize read_timeout once in the probe
> function.
> As a result, only use read_timeout as the last argument in
> wait_event_interruptible_timeout() call.
> 
> Same goes for write_timeout.
> 

Nice idea... But it's not yours :-)

Therefore, you should give credit to Greg with the following tag:

Suggested-by: Greg Kroah-Hartman <...> 

Place the above-mentioned tag a line before the "Signed-off-by:" (which is 
always the last line, whatever other tags you might need to add).

> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---

If this patch was a v4 you should have put a log right here, after the three 
dashes, explaining what changed from one release to another, release after 
release. Please read some other well formatted and accepted patches for real 
world examples of how to write version logs.

However, this patch is _not_ a v4 (so no version log is needed after the three 
dashes). This is your _first_ patch that addresses Greg's suggested 
refactoring. Therefore, just put [PATCH] in the subject line.

That inappropriate "v4" seems to explain the second error showed by the patch-
bot. Thus, read carefully its message and ask for further explanations if 
something is still unclear.

Thanks,

Fabio

P.S.: The code looks good but I could not apply it in mainline tree. I don't 
know whether this patch is somehow broken or the driver's files differ between 
the most recent staging tree and mainline.

However, does it work for you on the most recent staging tree? Did you run 
checkpatch on your own patch? (I'm also asking this question because of the 
first error showed by the patch-bot). Can you git-reset to a previous state 
and reapply your own patches to your local work branch?

>  drivers/staging/axis-fifo/axis-fifo.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)



