Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0E2C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 06:59:31 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w19so46757404edd.2
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SHQt8hFsjogNRuVz15k6SyLo2IuU73v5DLEEAwJxV5s=;
        b=hJ/gEuwoFNPehp4JyaaX4DCYodDGwPIxXYA4x6erZQ3yeWC3gcjlFFWvUDjSQYdZMR
         LbNZlhA5M9+eYnH3h5VvdYEBx/dBRD77nnOoNdgWKgNQCxQF0ZMD0dignNrQiSrhT0nr
         eWgx6q8hVhXE/6DTBnUyeFRVZJdwI1oez0/VUtNbXgiasb/vA4HjNwfNBw9Qm6Wg5ioz
         8XfM+aCTPUdsrTa6RTU5lGl8vDQeo0gybEw3ZyzWtBcunCq91OA+UrYB5XTpXbus1wUR
         GEMfwObZdC8EzS2q7rZieQOMYL1mWHQDrV8AhLRiBmBCYckVAoOPeNBLVQ0jrlbNjkFw
         wjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SHQt8hFsjogNRuVz15k6SyLo2IuU73v5DLEEAwJxV5s=;
        b=y6PVsdlsqdam8Z2hid2uVN9FaUt0xk9IfskWQX03it3Swi62JyE35qRUdHsY+iWEaA
         LtRISMi9vhnc886kB89JaCI41FNODCOzXbIaDRy+v8lNCtbmBnsfNpRLd56MCQulyJa0
         TDxUHazt3nBNZQprLHrf1HA2Fo3/KO0sC4QWZhKziJjZDKtRxGXBXOk9dENbgFFHd8xN
         i+J8sAhEeaqXwXy3KFJoNCM2qzJ8W/vpS6a5CaDKYNmhBcqHnRWgjWZ4rLVChR3g8ezv
         G6M85PxrKeRY99zUVDeHTOIWnc5ebpYc3RKThwWhPJQBju0TGJsS3HD8nSouIcCTg2jr
         w6HQ==
X-Gm-Message-State: AOAM531eFe6ko7MRL7Mv7uOf8YO/7H2CP/seTuXWJj9FPib6PzDtnbEw
	SSJ8O1dJl5rL+/Rb1rfLizE=
X-Google-Smtp-Source: ABdhPJyTf+7FlIGuWX1Y4Obapq+FYi7LW0FkAHLAe2uM5KX/tbivyWlBPzL3OGvjtHgQ6DfVJ9SkaA==
X-Received: by 2002:a50:ee85:: with SMTP id f5mr21477313edr.302.1634367569839;
        Fri, 15 Oct 2021 23:59:29 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id rv25sm5703063ejb.21.2021.10.15.23.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:59:29 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, dan.carpenter@oracle.com
Subject: Re: [RFC PATCH] staging: r8188eu: Use completions instead of semaphores
Date: Sat, 16 Oct 2021 08:59:27 +0200
Message-ID: <5414235.RPW7nLbG7U@localhost.localdomain>
In-Reply-To: <YWm/x56aX+rNOlE0@equinox>
References: <20211015110238.1819-1-fmdefrancesco@gmail.com> <YWm/x56aX+rNOlE0@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, October 15, 2021 7:52:07 PM CEST Phillip Potter wrote:
> 
> Dear Fabio,
> 
> Sounds like a good approach to me, nice work.

Dear Phil,

Thanks for the "good job". These words always sound very rewarding :)

Please read my reply to Dan's message. I have decided to go through a 
different approach and make two patches for the semaphores => condition 
variables and a third for removing a duplicate 'if' statement in that  
rtw_cmd_thread() where now we have the semaphores.

As I wrote in that reply, I hope that you and Dan agree with me on this 
different approach to fix rtw_cmd_thread().

Thanks,

Fabio 

> I agree with Dan's
> feedback also - will wait for the final patchset then give it a test for
> you :-) Apologies I've been a little on the quiet side as of late.

P.S.: No need to apologize at all :)

I had noticed that you haven't been around for a while. I would have 
appreciated a review from you (and Larry) on the series of 32 patches that 
Pavel Skripkin and I co-developed and submitted some weeks ago.

However, I am 100% sure that you really had some important reasons for not 
being here.

> 
> Regards,
> Phil
> 




