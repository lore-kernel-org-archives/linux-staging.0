Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A412AEE4
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401602; cv=none; b=sGvUz1pb9PzoXrlxf7py71DnPuwQlxvDdh01a9vUfK2Er/ry1QqWkhHLyh2F0hQe1yi0m5ZZ1YkqIKRXyWM8OloW0A0dQC0j7raWe8kHc7wvjuY1VpeqrY6Pb1Fe29OVkwuVtilJeFkb9ptlLzjJcS8BTRtIBGCH/XyY592AqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401602; c=relaxed/simple;
	bh=SAzVrDfwUIGewjrDVkjEr8J9zeEgMjXmDkAs1+MDo6g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ImIhLaEGk1enhhsv9sKCNSHAgH8pN+0/7IuHnR7+BetPdd0euZhy+vg5M2sITg2L/Ajs38HMAgcJGjpLAGAydg+hM73dqQ0qZ0jwQ6p15T1wioNWKifhRoLpR9abFS/0CymXqC3T1UEFp+J4kteEm95fimgGpTN/cXlrCRq4UpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkCJobWC; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkCJobWC"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so3223472d50.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401600; x=1773006400; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4ulOxVmo2bFzgV4F51OFpn+fHFE2uWhzh25V1FCNx8=;
        b=GkCJobWCvqxN0+BpqWre4eULDXWXxxNzu92J+R54mZW5Z/HJ+An3USemAuYclbND4J
         cC1U3H6mJwHuiwScNrL0I5R70zHM/lH82sCryyEMTK0ma3GQ5gaWtnelGPiaBT4dQlls
         YlJ2bd+2xN6MrMMeKukErPE8gSmz/1RhqBTDZtoyJrucORy2ldwDSgQK/QMlQsygYnz/
         EEpdgSXwIUNkQ6yUgznI6WRJMyuXDdSiEL7Fi+zyanbyh8nmAgzMahHcz0YGZhw1/2kP
         F+Vh476k7FzpN8cf5NV7i/m5S1bSgyYBVALrzNOud7UVPDjBhcUrjI9apvK4HPbjMJmt
         k/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401600; x=1773006400;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4ulOxVmo2bFzgV4F51OFpn+fHFE2uWhzh25V1FCNx8=;
        b=qmUrc9XlYu2tt96RbNwmYe5Glm4tsJyiYMjLrg6SDHct1PuuD1CxqMX47vYFEVQzeH
         TSGRjvCFKp+atb9bDg+Y28XmOgmT2ag+Kz2bUZZQU8A8s24os6hODv38kAWbUIVfrs6A
         wX4GbEqpeQYVrfeZ6/iRCuknMBiS0Rm1BtyesRLOUbYWrC5ioFG7ta6/lY4SqLqQ09eK
         /SOrHhEWmSMGLM02y1LRHp7AB97mQryVz15u/ng32/E/Yetxn140c4NLUY2Q7avkLU6l
         BNN6Abje+snZNiYO01yv68LjGT21VFekb4GX5GjnFtJmV5iZsi0zyJKU+8MqzC7WxF5T
         L6XA==
X-Gm-Message-State: AOJu0Yx+OAE/Da+wZDXyssr2QF8rjn+IGdUEOAiZvaPIbM+vFGt7MUQ5
	gqin+6AonPuUc2jWCwEYa8CFlzKMnc3ay5pmbBvRgflvluNLthCQHEw8
X-Gm-Gg: ATEYQzymwaaSLnUO6aW9a3M15mEmQoKsjwtPEw7QeC+Fec21cVWzzWjPmISb/niaVDK
	thbD8ANo+XqlFIYV5PnIyKFeiHy0KAm8vE8DTTY+441o6FxBCwyhQoBIAGWIqRCTu7Q4Qh2Wepz
	F8wfGBLiBhN96Yo2JpWP2vWcblP5KSeiDixFVSRR6GQlVPnxlZb9ucwCFrrMhO3pV1jgLxKbSx8
	5VO5fd7Nm/A0IIIZONZ5ZR3NnGIiMcaZvQrVU+fQLkErJZ8UyJ6DgGDyx5cKzMgULzyS/3n45D9
	4v9YmbzUyBPqMJGR7hQ7v+D5MxZpiDqTjCRHH/P3s8PI9K20qek7p6YNYXLvT4GielWKVvQtjqh
	8BXDaQ05ba0cISQ4bLd5FIDO6Bz6y3oW3GDQPTGb9cpgWx/0Nli1OCsnbauHdz0wFkZuyrMbICC
	MVBxA0p3nAhSSARpuQUQitMAkmodDV10ZFs46m1RLGudLiDQlXRBMYbzTij1x9hh3raCBpGzjpH
	HoxB7dCaMBMgNAIeWGM4tBzOjsk+hDH
X-Received: by 2002:a53:d20e:0:b0:649:b2cd:eb7d with SMTP id 956f58d0204a3-64cc22fe637mr6603743d50.68.1772401600134;
        Sun, 01 Mar 2026 13:46:40 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7650ac4sm4944505d50.21.2026.03.01.13.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:46:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 15:46:22 -0600
Message-Id: <DGRRXA8LOOOQ.2W7O8M9WU6GIM@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: atomisp: remove unnecessary else after return
 in atomisp_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301212047.3649-1-rayfraytech@gmail.com>
In-Reply-To: <20260301212047.3649-1-rayfraytech@gmail.com>

On Sun Mar 1, 2026 at 3:20 PM CST, Oskar Ray-Frayssinet wrote:
> Remove unnecessary else clause after return statement as the else
> branch is not needed when the if branch alsways returns.

Typo alsways.

>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

...


>  	if (from_user)
>  		return copy_from_user(to, (void __user *)from, n);
> -	else
> -		memcpy(to, from, n);

Put blank line here.

> +	memcpy(to, from, n);
>  	return 0;
>  }
> =20

Also from what I can tell your sending a few patches affecting the
same driver, typically you'd make it a patch series with a cover letter.

Thanks,

ET
