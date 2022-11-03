Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0FDA23;
	Thu,  3 Nov 2022 09:07:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so685580wmb.3;
        Thu, 03 Nov 2022 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unhrFH8KkVkYlmG3d9VK30QU1SnWcx+DMPZZ8t33VeA=;
        b=eykOshLZdPwVg7kNj2/XjdMRrqvJkNU2bgqUC9a+A5HpkNo3uuBk7vPRWpVI1UFp0O
         YTbUfywaA13ctdXDWldEXngFVGXBqrt8FU5ce22InQL3upticmCA0bBnU+8cyFMkMeXZ
         jH1jM/3laZX10babJyFreeG3USWkmyMyK0TsBUzBrMS0tTcBCtsDdMyfI++QJ9Kdlr/P
         OeQhiOYPYwc7v6dPGU846JuNYcVAPDQyesCcuQYah02qyAxqXw7JC6HyHgTHwRkfAcdP
         vkUZQhudw+H22y3GxsBCx2WOG2PTpCAzZcOvBRKrDy1XcQ5+xNJp/lH7ZpUlN+QI0yuN
         S+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unhrFH8KkVkYlmG3d9VK30QU1SnWcx+DMPZZ8t33VeA=;
        b=fn57Vljw3DMo6jDzhovGdLPflVX+VLd0ohbotNWQWQfnE1JzxIUG5LXdiUclKqgjLv
         Nk3yeXrVbNyuVK2Kilx5oXJVbUoeUkNprDkI1G/uKYt6K4HI2ga3wRmASzwC1NFUPQYM
         /evC4mBLZvpHdMatxGN6Kg6cRGM+plQklHVOCdFy1vLLMdYpLFzKaa6IBACcx2qGSpcX
         jHNeXVCxHvsJOkrnBK4NNf/Hh94n9p2nd5qCb5pA9c7+qqUV+4H3GNUJUiB3888OG+ll
         UziqI+eNsT8x3Jli1KxaKDwECpuz8fJaUyAPApykPXAwoJS1szsjRrCH8k4uv1BR5W4O
         pikA==
X-Gm-Message-State: ACrzQf3CQzk80s9aw+nYdQs1111S5r4fCSIj6qaCrzGch8ohcgadn79j
	84AnS/24vAjOheyE7aUGgl8=
X-Google-Smtp-Source: AMsMyM6tEzB+kbe8MQ/mknrRYprzWgtORJ1OsuSoeRTCssvfoDnIJYk9BRxr94lnj4gpUSTVpQELww==
X-Received: by 2002:a1c:5454:0:b0:3cf:7521:3543 with SMTP id p20-20020a1c5454000000b003cf75213543mr12390334wmi.172.1667466443864;
        Thu, 03 Nov 2022 02:07:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y10-20020a056000108a00b0022cd96b3ba6sm296326wrw.90.2022.11.03.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:07:22 -0700 (PDT)
Date: Thu, 3 Nov 2022 12:07:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
Cc: Joe Perches <joe@perches.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH V4 1/2] staging: vt6655: change the function name
 s_vFillRTSHead
Message-ID: <Y2OExzH0QJqHEfNf@kadam>
References: <cover.1667397591.git.tanjubrunostar0@gmail.com>
 <5a0649c6019f1717cb2e2e8fc4e262f3747d73a5.1667397591.git.tanjubrunostar0@gmail.com>
 <bfc8e714fbe80a16428a447768def5764083526d.camel@perches.com>
 <CAHJEyKV75q90E1OU2YOGK70EBLm8dQe181m_nS_qmPRsPaB8TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHJEyKV75q90E1OU2YOGK70EBLm8dQe181m_nS_qmPRsPaB8TQ@mail.gmail.com>

On Thu, Nov 03, 2022 at 09:48:59AM +0100, Tanju Brunostar wrote:
> The second commit under this patchset resolves this. please take a
> look at it and let me know if I should change anything
> 

Please don't top post on email.
http://www.catb.org/jargon/html/T/top-post.html

Don't break the kernel and then fix it in a later patch.  Just fix it
without first breaking it.

regards,
dan carpenter

