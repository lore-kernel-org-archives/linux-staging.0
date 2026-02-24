Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0053E1DF273
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910495; cv=none; b=J2dAVvO62d2hYCUlu2g6RVG6f1xxI/RoxjymAb33XiXMFiidA8lIWmx5uvxqimC9BwYGWtldM7quk0oEQhBLKgOeOMe9VaXp6jsad/ytIA/fDDZmuATE82B5nktVQEhcErTPvoD11KaHj5OT1Wa2kGI4HGUfCZPBgym8hiBAR3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910495; c=relaxed/simple;
	bh=BFMA9tA6/qbUG6yrwD+s0ZeviwxXSJupFoeMZs+bE9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iPpPCjHcZchuQnWIsZX1d6DqzSBPUlT5GKkDFivbEiaD/Zh5BAxU6wvAjmiA2xexGtYq9ayTq1sn0O2lyojnwAKcPjILLKMSobGAHyY+o28USk1YgbAZbY3i4yQz9JtSQDKsUwPOnkPzjZeT1wOVM17zpde5n1/FG/IabbAGhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7Jvxuq6; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7Jvxuq6"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64c9c8f8783so610282d50.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771910493; x=1772515293; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFMA9tA6/qbUG6yrwD+s0ZeviwxXSJupFoeMZs+bE9E=;
        b=k7Jvxuq6VCJI3jZJqJrMfeTLbnZ36TnhE4f9HmKz73T+EUbEMrVeG+CVnkjI53ddvO
         tv/CwV59qpTTzaxpsHu+BTf98Bl0n18abt/j6kLRfOrsUgUNvG3enrVrLBNoM6kAkDbA
         5dn+f/+7typpWyojOWNamnnNeecRUJd6/YleCdiKAfHmlV/4Gm3kT2My1mcg2ra78829
         nnmt6+yU8w7qSM2aglXDFYSmH5y/lTDy6tJe8B1UjjDUtBMKByyrIFXky99TPeZ1n0Sm
         1j3N1hPWaXOe+nsg3RmRy5tI+2RPFwaXd0FtCgEk3r9HFyo0APlYpOzmZVucYYmyyAro
         0jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910493; x=1772515293;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFMA9tA6/qbUG6yrwD+s0ZeviwxXSJupFoeMZs+bE9E=;
        b=jPKxPRwC9K2gqchCw11iE9N0VRwIzu8HZsyJKez/3k0raRgAzraDivSj3yrbvjN8rL
         cA9xMH+PzH2lAVfy30Jo7GVPdMcjUKuwl99su1htt2ROjcBG9G1bD0XJ+lbtmXOPLCdF
         n/FD/hDcXM/OSMZwq1xenbFu6AFl2UsB0IWJL6wIQ3jA8pi0HbE8VG9xyOjVtfM1gbpB
         Dn8lDI9QjyKktPFTHLIcD3gxXZb2e5jXTL9eu/sJvb1lLbvspKSasJ1ZhQ4ULN3lVHtd
         l25kux8byTlnGt9tewgX/e3k9E3vIq8Fb9YYIVcPLPZrtc+tMmzo4BT7U9W3NnOGa4UR
         RyuA==
X-Forwarded-Encrypted: i=1; AJvYcCWNydR5D3p2Q1yYdKpHagOqVr/7U8WTIU5AElsPrr9qFYgWXi5/lKz6mRqPEsS2fzCfW1DkRQLwsXyjH6Qz@lists.linux.dev
X-Gm-Message-State: AOJu0YyqiOgiTz1X1DWrksXz4bjePxLNqwEwbvaJum423K8HSwIjtDv4
	Or+vbKMwTtFlNtdc4SYFlzz2sytSxuNYzx6WYW/nKDHKzzOvtuHnGJKl
X-Gm-Gg: ATEYQzxC7l5TqQfm1GyVz6XLoIosuyV1Vzjuqp88808aoO05IQVwbc+K3BDlssOLSJz
	yr4bfR0eWiveFzZPtm7d2kzbWO+m/mSe63yrwF8y9MZmZgtZLT8p6IJppcj7p5W4AsHF/HetK/H
	vvg+k0H4quSztpkwuIM5ZExCnR7diUCKKml5PWKiQq+8tJQKZBxUQHWMwW1pPQpks1U61FjFZJh
	DZcqt+9TJ5c3pwS28+oxft90JLvaHhETxoDxdNpqQPFzBiUG94A2xwfQj4OcacLhP0vSv8Pc7FW
	tWlpxKs5C1E3q6qyxt+bTi5Ca+DikS94a1+2pcHMpPkP1LtEmYSJGAjRAPa7gofzMbVVKqyOsd6
	qWGK2bd1vnfWfcPjvxX9p2ZBZs0QhKH+fKiAgsdNJbYSVTlCDXvwFcHMn7158OLHvuICiUSl89+
	Tsdvrm/mys6kaBCE9EvggwEb+2GfOksgLWVGV2b0XK6DJ6X+ksL07DPS1nZKNN2o0GntxwaFFd1
	O8HM/0L909AhVfo7Ikz/wBaruycl3Rj
X-Received: by 2002:a05:690e:b43:b0:645:51c9:7f5b with SMTP id 956f58d0204a3-64c794d8aa0mr8761803d50.25.1771910493021;
        Mon, 23 Feb 2026 21:21:33 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c9fc06d2asm232578d50.3.2026.02.23.21.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:21:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:21:13 -0600
Message-Id: <DGMXUA7MV0MK.1PY2AL3PHA7KF@gmail.com>
Cc: <ac100@lists.launchpad.net>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: nvec: fix block comment style in
 nvec_interrupt()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Kibaek Yoo" <psykibaek@gmail.com>, <marvin24@gmx.de>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223143101.76552-1-psykibaek@gmail.com>
 <20260224044946.54022-1-psykibaek@gmail.com>
In-Reply-To: <20260224044946.54022-1-psykibaek@gmail.com>

On Mon Feb 23, 2026 at 10:49 PM CST, Kibaek Yoo wrote:
> Fix multi-line block comment to use the preferred kernel comment style
> with leading asterisks on each line and a trailing */ on a separate
> line, as reported by checkpatch.pl.
>
> Signed-off-by: Kibaek Yoo <psykibaek@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
