Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191AD68
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 10:08:23 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e3so21796848edu.4
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V64/wZ8a1879T6XBHH3mfVC1ZWrAquNogb8L4Y71CGY=;
        b=mPgoaTnCXxSN1ptEeJS2G7KPNJZHAfxN4zcsJUc5pTIsMOTa1mo2IDTB0GH/D9w8+L
         h9gJUncHDLadJU+diOPKdBuHmWb4BYbaDh563UdUnWVgyow19LNlNF74ub2ijfeQnmdj
         KcKMjBJcbgGPQwEsWcpchU+gEiRcVeHbUFRRagbko5BB90LVSJnY4ru9VgVe75sbH0qZ
         FNCl5cFX3Gvg21Efs3ppSwNcXptD7QG23izfKRigiJLw4B22TnduIFuBARz8XaCMQt39
         vDb5aK2/CRuOHRmjmbH18+ZspqjczsopXALpQNrb1qI2F020z9golHkQx/ZU3Z4RQhv+
         m0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V64/wZ8a1879T6XBHH3mfVC1ZWrAquNogb8L4Y71CGY=;
        b=FzeS++B8Tx84+ynWiUyvGV1JkYQeWvWPeNUrXTiagwTEW6paY2i7XtaTH+eaYG9s6F
         BDmQgFuHXjoRGC4KAU/QInayZgrHhOZEkhhrMVXBNtDOZgFfr6hbTsRw7OGLvyH8TV8R
         ORROKGCoImMUhDIRSUn3/132f/XzlLypKIM3PQc+LFiHW8AU44IZbkjE5URagU9xWAXe
         W4dP3tazuKXGuuvSnzXEdbiZhUZ8rJXmTyQsbu4UdcyGPOx7TBn2UmM4LVvnY2SDmkO7
         WugYxlC4g8z9b6qs3WfUrEwTQx6yuLsLXIh7O6F8sF3HbRskzYuLeswf88WRFbrS98JD
         FIsQ==
X-Gm-Message-State: AOAM531uEMTodcghKzZlhVnRxL89PQwX2XY76LP7BY2M2zYGNuAvBIKJ
	mr0H49Q+W99Tg6k0a8lL5wE=
X-Google-Smtp-Source: ABdhPJxobamFx+qBe+YrntNytqfyvQCK/MGCfKVHCoO9fxgm36kmv4nHizu7hIGAUI+7+DJWn+OQlQ==
X-Received: by 2002:a50:e18e:: with SMTP id k14mr34560858edl.147.1638612502449;
        Sat, 04 Dec 2021 02:08:22 -0800 (PST)
Received: from bulldog (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id sb19sm3558918ejc.120.2021.12.04.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 02:08:22 -0800 (PST)
Date: Sat, 4 Dec 2021 11:08:20 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Message-ID: <20211204100820.GA3887246@bulldog>
References: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
 <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>
 <20211204090941.GA3805206@bulldog>
 <a10f1013-069e-7f56-8a5b-80621af8a158@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a10f1013-069e-7f56-8a5b-80621af8a158@gmail.com>

> I think, it should be up to maintainers to decide, but them can be removed
> now and if somebody will need them later, he can bring them back without any
> pain. For now it's just useless memory usage.
Cool! I agree with you.

> I skimmed through priv fields usage and looks like many of them are just
> set, but never used. I guess, some kind of evolution removed all uses of
We can work on it.

Regards,
Alberto
