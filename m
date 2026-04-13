Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9935E956
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074573; cv=none; b=hGuuz6BsWg5m+yL2HK1FmOylAJqP/KWOaY4YVnBaEUPO5+voVeiBZiXzPwN3oYWb6KQk+StdbuykSWBTTYOtqAq7c0PcRQWacnA9mb7zOGwayj2tC7P3+vtQ88btXezNAXZ3eKMff46fzTRwvX5kULN1tIvUTb4KK49ejoGB/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074573; c=relaxed/simple;
	bh=/QhB53YIvyMpzYdrzNOUimUEXpIr+DIu/a6bYjSs+Fg=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=nM2s4OwCTvpOE849XJWs1j5jvyRRZzUb+A3GAoz04hAtGEcu3MIIchkFQdZVR/kf9OiVHcbJB02lITUJp9SY3CInqmtoGubFtL3H2BuYQdRnuNdjak0bGZqcEB4cdkcXQohqu5vapSt9rSBlN4bRUIoYq6RcYmAzZLrH1HRxBC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwymMZ3h; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwymMZ3h"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c9d03524cso499185266b.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074570; x=1776679370; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QhB53YIvyMpzYdrzNOUimUEXpIr+DIu/a6bYjSs+Fg=;
        b=XwymMZ3hnLFxx6DRIUbwGeAo7o5wubui0Bu935uw/gVpCneZEEFFLxNyFvTgsev/PY
         fT2KO2hAtzHjvJ5hcVn3/yDwlxEyy0MNUb3K2PSIwwB1GNluXo9dOXYOSvT5kihWO6nO
         tp62uAF36cpBrNRNaCJxHDG/pnhSOQqBO9NM4w8YlAIXfSID5wgvKWfK0M+D+Oyy3sBU
         +sZklUaOla/NpIamKMOuTfzCxQFhsku+1iT0f8Wfw/xDzxlnnkfYZZiMtl1SCqYZ/54Z
         jd+mqAygrorFwTGQzrz39QxjPS4FPJGXr19Ityto9QSwv2jNFHSNDWl/KVXuCL8yupMn
         XOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074570; x=1776679370;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QhB53YIvyMpzYdrzNOUimUEXpIr+DIu/a6bYjSs+Fg=;
        b=kUreRY9viB+BefXcewpE16VFiH2SQabuH9OxTqqdcj7Xz0EUCg9dZoK/7gbhWrDueA
         I2PWb399YdrFNZxpKHB8c5W9eyOKE4X9VDSEU8ZYnxQnyzdBw+kzh9GQ6fLEOfJrhT62
         pOSMdIKN0qK/JtxWSPnrwI7eE1YDPnF2RMBDYCIjUKjfgHcNBgigjSk/WVuI7ICv0Trp
         hFRyhN/pdbVR1/kRap9jHcTI0VXkwuXORxT8UlfxStGKPV5+JEgAQEyVJbYSxCPxZ4eF
         v2HKPLYmUDOxhkzbkpaQvJ3ZKibLbocfC8Jzad08lc4gXDp71HYwY05S+KXEV1CMdS2p
         ljXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Z1Mnt3FzEaQn/3oiABUIuCXWCLly5vSQ3hXEA3d91IO5aW+rJ0PuNanjKapP4ekE43yTTuYzVLYlP/Aiq@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgyc2gVioBsrNnIltBujcv6TNb5RQqQfPkWXtkETtbMDDjY6U8
	eIDMNfvPv+rTZajawYWumQHNx6WzgzZwnanV7O22TxAS+AmwxOuiCT+B
X-Gm-Gg: AeBDietm2A6lGI1Bpt34KAVxpxpQ54WPk5+GUBqP4G0AWH3UHdlCBJw0IyyV8tUTotL
	Oax6TtIjtvEUp+d1HbXnc/gA9V+XFvZ9StsQmJ2ajj8+r0zukXDqBYntLLHQo6eQm7wo0DNTiZ2
	oJOnFqAcygbjP68yryyMLEVmS4uuisaGBdFMc0Q8u5s2hGsXzCWkiGIz00HIkd6nzrO9urERLgm
	rSpcR/rHZsBQZrNIpLbvvfILnvrS0+bPzc5t+q228jdD+2pYBo8y/yi82qEgxRBDRwAKImPKBrC
	jgYWPRyfR3ebKOJdFML1cc846il2EBaKt8HOIehK1VbNR2/ktqzgGDxzNi8vV0tJVb9r8T4V9Hk
	mMl6Iw5VtPfvO6RcamxE3o3dFJT08FCbHfphl3hKrm/fP1GoKdo72cBW7lS/zKlbSHCZvJdT6Z4
	N0LtbbwMsGCbebrb8XgVVqgeGSAofY6HQ5QySY+OsNwu07QuFhFwTuPAPX9VgxeghPM25sraXJw
	vbPI5GRNgZV5azY8PMios3yBhuwbdS7fYkaLAox2lmOOgVv6cgQYGM7UZFxnw==
X-Received: by 2002:a17:906:518a:10b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b9d72793974mr505593866b.20.1776074569608;
        Mon, 13 Apr 2026 03:02:49 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec4fsm2381250a12.6.2026.04.13.03.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:49 -0700 (PDT)
Message-ID: <69dcbf49.a70a0220.194513.9708@mx.google.com>
Date: Mon, 13 Apr 2026 03:02:49 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: nvec: fix use-after-free in nvec_rx_completed()
In-Reply-To: <20260412205057.386856-3-hossu.alexandru@gmail.com>
References: <20260412205057.386856-3-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> Add a Fixes tag.
> Delete this comment. (Obvious).
> Move this declaration to the start of the block.
> Otherwise, it looks good.

Thanks for the review. Will send v2 with:
- Fixes: d6bdcf2e1019 ("staging: nvec: Add battery quirk to ignore incomplete responses")
- Comment removed
- Declaration moved to start of block

Alexandru
