Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE3C233921
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977733; cv=none; b=ukjbbja5qyoCz7e5qZYaIE6zSreRQ/IlwFohXMPg8tCRwvfuTjfywpca4cGdh6U9R0D0I1Y0K/XvFeOROjecqCWzHHacG4L+6LLAoSUf+TRG5q7RtM48B46bIo/UxlWQip7VqcVZwR4HZDmiHERjzilD/jVyDTIC2aUQYB0Ey1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977733; c=relaxed/simple;
	bh=6962Qk54f9gW1s6ogjP02dV69DIR4TKUycqJSi9UZ3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLlxH1ledq5ZtDDezyyA1o1OcgPLvFBJSb0Ue2Ev5J59uDxMW6Wo0Wf0Scjh+hEaUQr6S9hH3hk9xZBUsbtt24XOA/9aJT6rVyM0nL7mnxCC4tWOQzJNHA5JEwsBMHBzcH/4m+xdP3ZkX0MabhJnTJvTVIxTBNA+GeQn07CQhWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bmz1vHoX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmz1vHoX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490426d72f7so61659795e9.3
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779977731; x=1780582531; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A8/kbdI5Q8i09zmSK+F/62AaBVf+xYaMTdSTospsePU=;
        b=Bmz1vHoXTaFB6BuRg59JYjA/1xSlnK3e6LnWnJLM4ASzFg3MBjrhOJFxSjXs+GhROy
         CMDyeX/0Ka3w9P90md1QbQqk5Bkjczd904HSZi2gbsvWVBQ0xLnD83vFeEcVN1OLiafS
         3jkngdY0Qj/Dk+3VxktF8OPZ2MA3OkhgGU7VAsDpTS23vN/1tEqqVFT6i51MSlwYaW6X
         tj68WUlVgk/o8aN/KsEOnxlX6U9IT0/XOLFrsAHqetdpNToTV3E9MlD0IW+lkbKPNh16
         21ALA1VmotCLnQrmrWCHE4458HaukloB6UczN3TQi96mAtqIJdmbZLjZoPW5/SOFLlZi
         xQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977731; x=1780582531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8/kbdI5Q8i09zmSK+F/62AaBVf+xYaMTdSTospsePU=;
        b=oq2iPWycXv1YLIbTw8XjbpU38Yg6stH9Q6+mDE6ZfkA8hjAJx/rK81TQunfbXMxTbf
         6NLt3K0VR55pJbWCq7jVZ9vetSpP7YEcpjni9Z9s7sxz5HdN4ywuX0WTMFi3dFpCecQ4
         tT65esPXXPfYt9uYE0lENpnA5h0ZhEIAz9WvrqL4kuQoniYVZO4w2DRTms9/paWU47M5
         XBTW04q/U6GRZn6vH0fT97lSIEK0I0b6jDkM+V4HVUM7nbMFVHykMWgnWQXp7cHQbBSA
         4C3rKQ5DLWb8h2uSIOGHm2jsmIOrfvTIfzazQSIV8usbCOCsth3hzOdGfCPuxlHBwLvC
         WJIA==
X-Forwarded-Encrypted: i=1; AFNElJ9uqK6uP5Ljv0Bg+aiVRIT5rxdbJdAAPogAxvVuVPiztr7a7seWOaDBVKxPToQ0cSf2fnLXllckeG3V37g2@lists.linux.dev
X-Gm-Message-State: AOJu0YzxzlsiaiLFRhU8giSfvhtcY3qSoDYE0ivq8G7ML7k+H8U53L6L
	Uj2UAmkAeHyo9RcBhI75V7iuKWa8mLN3dxnlWxnZsrocTumI/P4EeL2O
X-Gm-Gg: Acq92OHopcVa1LbJPVHzfxEQkRPrlNiPN1WhHlNM2rLDyBDSa6i4K9fP6aeC+PObEFT
	O/C9EgUC2X2fEDIb75ncZ1GToagZfsERa13Ha1LbFB/FvJdz57RQwV7RcJearjm4vpmByjxnJaU
	BLAv5jkkH1DIvu3WtZNDgw3Xsa7Py50IbxfLGHaiDEUI1NgLyWRXND0N4fWyXglXC2whmsgJtFa
	/3o7Z4Ssjfw//1leySufttPj7tVmM5v0VSjGku2KkVs6kyOE8o3kp3mWcToQYJmYYJDvifM0CHv
	IQy9K8HL4sxxpnOwjZDoZJuoY0jY2JOE/6eJpcHBI46PF+VONVs8WsZ4OcqFpyM1Q6sz78Zkm0q
	CmmQ9mB94o+px/AWeBkvBzZERjALhFXZIM5riOf8vFs2jD9uPRVoaA+8oYkAzNKwFcEvpqRcxLO
	D+4+4lTP19vtgkpCFA0kxD9EplvctafpTcFw==
X-Received: by 2002:a05:600c:19cb:b0:490:507c:bdb1 with SMTP id 5b1f17b1804b1-490507cbed4mr410417065e9.15.1779977730628;
        Thu, 28 May 2026 07:15:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909294cafasm43958765e9.11.2026.05.28.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:15:29 -0700 (PDT)
Date: Thu, 28 May 2026 17:15:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Onish Sharma <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: sm750fb: rename pvReg to pv_reg
Message-ID: <ahhN_kiSb-yRWfiI@stanley.mountain>
References: <20260528133627.10850-1-neharora23587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528133627.10850-1-neharora23587@gmail.com>

On Thu, May 28, 2026 at 07:06:26PM +0530, Onish Sharma wrote:
> Rename pvReg to pv_reg to comply with kernel coding style (checkpatch.pl)
> and improve readability.
> 
> Signed-off-by: Onish Sharma <neharora23587@gmail.com>

pv stands for pointer void.  It's Hungarian notation and it's not
allowed.

regards,
dan carpenter

