Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297D72
	for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 14:02:22 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id u13so5394750edy.10
        for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pNnwWnuwrLOVqUkrEh+5XrEi1C+z0qSzmyNUa+s0Tss=;
        b=Oqgom2CJv0B1fceWK1TvkDsUiJa5R9adYeofvWgpCtsOoqMS0cmCoNhau5XZmlWhOm
         9YSctFmQJYCWnlbvLZwGgugdjapNWgp9u9hyJmr4GiqI7u/j7Xm63Uqn7hw3hNazAts9
         VdzYjS6NOKYwCAVmYXKRmErJpWZktkqtuf7asS8zMXMwSdRFKXudFO4ngl8+qflX0MyW
         /49QLft1c6052rRrsB1vE1GVdHKbqQal7Vs5Sg9bIL+Hj/B2itYq5Vz5zAYoFmXUV174
         13zrekq3q3hXobz84d7Ydx8PaEQi8mTLPhnpzilKrbqn3UQDuX9RLsnGW+/nfAyR+7g0
         iuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pNnwWnuwrLOVqUkrEh+5XrEi1C+z0qSzmyNUa+s0Tss=;
        b=vc2PeY/qocWeHkZqqaC/zW/NcKO2mgRc4oG9PgjslXp+dZrTCwIc/Nm+iqBhMOy4zJ
         a0DrkPJV9aSAPZlTby1p8379KqnkyqA6qBRx+aEAtA5anM3O8GklHPf2I9KeJw4QuxB4
         mXAaSMG/LzZTVCDK7buzXvlLmQJPtZQAGmKEKZOc/bPQ7uLIuiw26ZKwR/ZIb96QGBgH
         hK1aJ2A8BDcZtxxlA4ksxS5EHri1vwjncerw+p31kIhWNm1sYHnnDEf3eQ/mdMCgkDP9
         Rj0maNexCH7rptZDQi54WyTE/uedA/Di8WBByMLPa1dO4oLtu8TJwCMw2/xiAq0rjsG/
         pb0Q==
X-Gm-Message-State: AOAM531lSLV/kP0Su41o3aU7X9REfqyns1fgzB1l8CciH2ix1aZcAjxF
	LgBn/EwG+2x7HY2U5X8i4kY=
X-Google-Smtp-Source: ABdhPJwuas/l1kE2wF0WQKBsFQMP0Ixel8AhXKyob3u7hYlDgYEQIlkRLChk2RLvH+tL6I1jUbsOKA==
X-Received: by 2002:a17:906:c301:: with SMTP id s1mr7522232ejz.56.1634997737853;
        Sat, 23 Oct 2021 07:02:17 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.pool80181.interbusiness.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id f3sm5144629ejl.77.2021.10.23.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 07:02:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH] staging: r8188eu: Use a Mutex instead of a binary Semaphore
Date: Sat, 23 Oct 2021 16:02:16 +0200
Message-ID: <3394965.k4CYVUhDiD@localhost.localdomain>
In-Reply-To: <0e327ca3-7caa-e904-c3f7-45ae28dea367@lwfinger.net>
References: <20211022171917.24363-1-fmdefrancesco@gmail.com> <0e327ca3-7caa-e904-c3f7-45ae28dea367@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Friday, October 22, 2021 7:52:33 PM CEST Larry Finger wrote:
> On 10/22/21 12:19, Fabio M. De Francesco wrote:
> > Use a Mutex instead of a binary Semaphore for the purpose of enforcing
> > mutual exclusive access to the "pwrctrl_priv" structure.
> > 
> > Mutexes are sleeping locks similar to Semaphores with a 'count' of one
> > (like binary Semaphores), however they have a simpler interface, more
> > efficient performance, and additional constraints.
> > 
> > There is no change in the logic of the new code; however it is more
> > simple because it gets rid of four unnecessary wrappers:
> > _init_pwrlock(), _enter_pwrlock(),_exit_pwrlock(), _rtw_down_sema().
> > 
> > Actually, there is a change in the state in which the code waits for
> > acquiring locks, because it makes it in an uninterruptible state
> > (instead the old code used down_interruptible()). Interruptible
> > waits are neither required nor wanted in this driver.
> > 
> > Tested with ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano].
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Well done.
> 
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>
> 
Hi Larry, 

Thank you very much for giving your "Acked-by" tag, and, above all, for the 
"Well done".

Best regards,

Fabio



