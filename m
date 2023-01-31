Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222908C04
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 15:20:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o18so5069813wrj.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wGKPLwRk8RXj83Eiaa9f6FtkLMBApZXZ0126DZ9EkYk=;
        b=kDhqV0PA6ZQ19yC4zwz8D1Dzd8eZ0JiZY0KTNAo8B1aJNHn050qh9VRxGDNPq8KETA
         tUxU1kUND2dxy5liEKQoLRCjMCfDIrrKMKUEVFRvjg0PzUnUmGQB+oipA66rbDDpZP41
         6QmiFLkk7FtzeAzeWuqz4RqhoUfpZlh1YtmZhl5lzcDt1JE4cMwHV0n7A9nzSqCkDkW0
         vq8E6paT0UGKnAt+i5Kx9/Fv/iId0cF1Z3QxVylo+OJgNDWseBOfvZTPg3uW5fPORBS4
         E9j4Kv6IZDkCx4rIjy2E3QTQEzLgVcbpXRo/ja6feKR5DYylOY5IOyzZNzLExmME5Pul
         VNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGKPLwRk8RXj83Eiaa9f6FtkLMBApZXZ0126DZ9EkYk=;
        b=K5yNmBaqApg/zV2g4MDigAyYo9uxer7i+iXVkliMJdhkRP2WDwFLWmXMofhbT0Jtve
         oRZ1mHE0VocYe7xDO7HDAvegiOzIYKKfnhYm1YdnwERF96a4y6RuHi6BuesdKZZeXhwD
         vsTuw8WqSf5GyOZhMBi8uCxjdqfKST9mh8VcbFpLNqfHqMrPjywPkKkL1aYkBnNlOYDv
         BiVL0kApRgw75Knp/uxcIwBXszZb9eGt0Ra+cxoRj8war/QhJduF/wpGAo7gmM7cCOUT
         gWq/2Q2Ymhr4k707Oftgvh0bDYvj1eWJiKne5VbXdEE9zJ9+gZ8p0Ishk3qob6mMQThE
         fnuw==
X-Gm-Message-State: AO0yUKXNQ5kQPH9mxkxvjw9MjWyE4YIITRsY6NjYi4jyyrcwJaWGPF1n
	/8XB9XnO9i1UDZGgeaC29xyDMHH9YLs=
X-Google-Smtp-Source: AK7set/wLZfrdqTUNhf9cTdfSVO3G4OtEtcjnB9LvY4qu+iiWusAStIg7QSbHXLIuYEytCNjKrgtEw==
X-Received: by 2002:a5d:5588:0:b0:2bf:cfb4:2e2 with SMTP id i8-20020a5d5588000000b002bfcfb402e2mr15934086wrv.17.1675178415145;
        Tue, 31 Jan 2023 07:20:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d53d1000000b0024cb961b6aesm14697616wrw.104.2023.01.31.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 07:20:14 -0800 (PST)
Date: Tue, 31 Jan 2023 18:19:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix NULL check for rcu pointer
Message-ID: <Y9kxkhmS+yEs85s1@kadam>
References: <20230131090057.241779-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131090057.241779-1-martin@kaiser.cx>

[ Resending because my email setup is crap and silently eats my out
  going mail. ]

On Tue, Jan 31, 2023 at 10:00:57AM +0100, Martin Kaiser wrote:
> Fix the NULL check for padapter->pnetdev->rx_handler_data.
> 
> The current code calls rcu_dereference while it holds the rcu read lock
> and checks the pointer after releasing the lock. An rcu pointer may only be
> used between calls to rcu_read_lock and rcu_read_unlock.
> 
> Replace the check with rcu_access_pointer. My understanding is that this
> function returns the value of the pointer and needs no locking. We can
> then check the pointer but we must not dereference it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

This patch is fine but it's a clean up and not a fix.  The original code
doesn't dereference "br_port".  I guess the new code is faster and
especially if you have lockdep enabled, so maybe in that sense it is a
fix.

regards,
dan carpenter

