Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09D3B776C
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074575; cv=none; b=fZjbuPaEyUEuddh3sPLutH9pYr6BHY7TcHNgj55e6IQYpkY+T24h8agOoLOSpPxk9/JAoN/le4WFGaWknszOc3XnK0cFGgwVb5aRlbAfKF24j3INopVtn1utYdvB72+DxrS/PSIOitT46FpCOpqX0yRmVwX0U33hnO4VErrL8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074575; c=relaxed/simple;
	bh=jCS1ocvAKv8JD6gmGKMlriFZJ5S9rhifA0MxGTZuyqU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=en7kYTe3wJMmRlegLwvhnh19RHQtXhWNpITyCtOooHMy06CMy5F8OLonLyrwPGJIeE3LDulUjqqfx9yDL5iXSg3quQmXrRwoU/8kOeIccpxUd6jzG2ejVdQRdSz/AIXNbX5Bx+hwZGxjDx4D7jF52xMDms3k+qzoxTcYG+jHKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ah1vGCxg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ah1vGCxg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso5448988a12.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074572; x=1776679372; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCS1ocvAKv8JD6gmGKMlriFZJ5S9rhifA0MxGTZuyqU=;
        b=ah1vGCxgDxIoSdkrN8Xaq0hDBcZbJt3APoQpcvPoLoC4rKBuMnnNiqMo+lkCix3BK8
         v8E1n2NszKoWtgI70iuQMd0L4e/+1eNmTow5Y5X0GRbCi8eYPKZBc1wCCvPfrsU43Qk5
         PNf0zegwYBynU8dxpQbLHCbZPhKPecIniGad9u3jXBgeeUrvpsHyxzLOAPIjd9b1nh02
         hFufguiRrHJbRqI+79fva60mSqI/TW3jW11c7TcsF7ICTyy71qHLoav3VVFPHLgGmc+W
         XJb3utPfIbIlLJa4H0fgWHDNnD0m1P87Bkwh9nWCUaDFetXlxWKuaBDWSwo+HiidaVGU
         hm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074572; x=1776679372;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCS1ocvAKv8JD6gmGKMlriFZJ5S9rhifA0MxGTZuyqU=;
        b=o42VcVhVSCXRbohR8YmnlhhcqHmagnbYZ/0hzDstLYIWtY8+JTCtw3CLH78ArQtn88
         hjM4oigP+EmgZ9/MoYPuHikBw9DiZKA6LJt5xNdqrYSqZwam6UIm5+4GsN89xwcl54LA
         b4Q7hWSOdNCxDgbeARgVp3UTLhmbpASxfFXGkJU3H/QaRSpUw+DVT5ZHTs345QkSxeht
         N+D/Q3brXLCEg4Qe9VqiuM1aTH04ItXDNjPRn18q72UzYDpZdUYP08dJE5JaIpmPh3Ta
         DRfM3pacyGQt+u95l+SgawzhJL1aWTxrIQ0xl1f51tsnPZEqymD22b5yw828ygYoK8fh
         3FdA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ve9BW2gbh9cGSiOtbf8s2I7slWk9oNL+974ru6t4X4ifzSaazvEPjhnLhzOjb+KFnMfju2rNVOfcxXvlN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/gPzagzNhyKdTcnCq+ua8hhIuMHmBIHEsXI12g6uCbKTJBXLW
	OodGM4L63gRY13jVa/Le9MMzMbx0jOpyHqulAoN/BmLnBRZVwzEk3erg
X-Gm-Gg: AeBDievKMUXwtLVizbzBJdnzKNO0UFrl+jRZvwFIfbW6lLkfhmhJlrta8+dseNY2C/p
	SlpGhNab/tH7EwwIVjrv6333JsdPKy563GG86ltbRzTPwMgW/aDf4iN6s1aHHnxauI/LvzKvOLh
	FixkTcrOlHQdVJ5DbNyyvRkkUw9QoBPlP9EKNaYxfoZUPlKCvnW7mzMuK5xiO20fkOLnOcUYwzh
	ytrpCSoAOJXZjJvH6SmmW7T/unGjX6n3stoU7yglskEhJjqKHuxG5xOV1fDvFE1qh6MgptwdDfQ
	wIz08fCeqUIG0fC9pN7PyMUDgk2eOtcfeGQfW5aj/4xccrUv8x5x+HFgWLW6h9OOXNXyorZwI1N
	Ur/nTrOrPFJh4hWXizbgNN/G/h5kIZFUL3Z6xvss3+HdqGH5IDSmKp1OjdHQNZCs26JwbfxXMfg
	ysfjGuez/MV8yZkxfaMzh3FLnVmnmyQEOGSzdGb+lT4sUbbHIVQWuIQGSSD6YFBXBjZmUBR7/oG
	hKHgGcifvolY+CK6KjRaueRnCfFj+gHfZUUBA1hmiJ6dfNqVbCZjolLWztjcMKVT53D+5o9
X-Received: by 2002:a05:6402:50c9:b0:670:8b7b:5004 with SMTP id 4fb4d7f45d1cf-6708b7b512amr5945847a12.25.1776074571883;
        Mon, 13 Apr 2026 03:02:51 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702f071dsm2193723a12.4.2026.04.13.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:50 -0700 (PDT)
Message-ID: <69dcbf4a.050a0220.1d6d81.c4df@mx.google.com>
Date: Mon, 13 Apr 2026 03:02:50 -0700 (PDT)
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
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in tegra_nvec_remove()
In-Reply-To: <20260412205057.386856-4-hossu.alexandru@gmail.com>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> At this point, we're unloading the driver so nvec_power_handle is
> about to be freed. Is there any benefit to setting it to NULL?

nvec_power_off() dereferences nvec_power_handle to send the power-off
command to the EC. If pm_power_off somehow gets reassigned to
nvec_power_off after our driver unloads (e.g. by a re-probe), the stale
nvec_power_handle would point to freed memory.

Setting it to NULL makes the potential failure mode explicit rather than
a silent use-after-free. Since we are already inside the if() guard,
the cost is a single pointer store.

Alexandru
