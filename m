Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6363D8B
	for <linux-staging@lists.linux.dev>; Wed, 19 Jul 2023 06:55:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so1015009a12.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 23:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689749756; x=1692341756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idS0iCzx7eFGMTV38VDkZYqyRsHIoOKLdTk6ADUO6Wk=;
        b=TXj7JYK829kTN42IX87oR+dv1Bhmi/Ytn/BfMsZB/TIzFVzr3ocgR48UlYdmGAfh5V
         gLNDMxuxt+kzJbK+XJ+sF+TGHGlDUjbpANtPNOIA654j8FI0gkOjrG/vVWC5CbiXCfpz
         P7MsvLUxqAA9KZJOwGyT4IcHJ7MUXrhF5uO8sr0B/Vo9rdESAs6tdLVeGVEuHujq+EE6
         WZ3vbGlApM/43BmsAIF56h7zrLF3HvMwEHNoG2/L/8YiTBugtkzsYvFU5H3gG9kXzXxs
         5XEVRyLqXV4JD19Pbrbmdy+AHs+9g4R4ifMRt5Es95eAsQeePO8CM+VtncGVDtK3Z7vu
         M+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689749756; x=1692341756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idS0iCzx7eFGMTV38VDkZYqyRsHIoOKLdTk6ADUO6Wk=;
        b=V1xsuXkep2V0DmIjpjD647RTw9P7fwYL40ZQhw60EqkSVLcvncA3vMxs2LdUI3w2MJ
         3WBCVRUS3rwl1Oq8KutJ29Qt0eS3zt8tYHn5lyIO50QGb7qfDd5IY3yUigaAF03hyfBz
         2Ku3NwYiEqAHQr9Mit492eB6zqNYRtTt7OD23+dGpx924JtSCR8sqj4Qu5lDW6UNgZhE
         J6kj5Ra2RL36WTiBz/djxSF6VoB3FLmv+Jnjp+26x6DVxduMv3/nxG0HtVCTy5kJ2zJr
         2KbGcwI3gsM5VjxA7newfzxiibexGTZiGb4EUPQM83TGpHm+Lc3eLzgcHxuW4oRzvR5a
         CNsw==
X-Gm-Message-State: ABy/qLYm55GH1ytBIrFsXpnSTseHETZJUjaf1WrbdhkgCKEYJzpd5zqC
	opFfIKGKPBY4OxDn//RZOdg=
X-Google-Smtp-Source: APBJJlHZi5Ev24UIeyWRbnLbNs4tsiNaZj7bd6/BgxkuOC0d9xKcix3IISSeP9rN4kw5CCIC8fzvUw==
X-Received: by 2002:a05:6402:3c5:b0:51d:e185:a211 with SMTP id t5-20020a05640203c500b0051de185a211mr1304894edw.21.1689749755735;
        Tue, 18 Jul 2023 23:55:55 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id d18-20020a056402079200b0051ddfb4385asm2266405edy.45.2023.07.18.23.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 23:55:55 -0700 (PDT)
Date: Wed, 19 Jul 2023 08:55:53 +0200
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8712: Fix memory leak in
 _r8712_init_xmit_priv()
Message-ID: <ZLeI+b3oXP3hstdg@nam-dell>
References: <20230714175417.18578-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714175417.18578-1-Larry.Finger@lwfinger.net>

On Fri, Jul 14, 2023 at 12:54:17PM -0500, Larry Finger wrote:
> In the above mentioned routine, memory is allocated in several places.
> If the first succeeds and a later one fails, the routine will leak memory.
> This patch fixes commit 2865d42c78a9 ("staging: r8712u: Add the new driver
> to the mainline kernel"). A potential memory leak in
> r8712_xmit_resource_alloc() is also addressed.
> 
> Fixes: 2865d42c78a9 ("staging: r8712u: Add the new driver to the mainline kernel")
> Reported-by: syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/x/log.txt?x=11ac3fa0a80000
> Cc: stable@vger.kernel.org
> Cc: Nam Cao <namcaov@gmail.com>
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>

I am not qualified to make comments on the code style, but it looks functionally
correct to me. So:

Reviewed-by: Nam Cao <namcaov@gmail.com>

Best regards,
Nam
