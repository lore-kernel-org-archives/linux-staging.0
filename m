Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C7343D7B
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246828; cv=pass; b=KBWM3qChTsY7b6ygO+vZKx/pBLDYb0nwOzvU1hPdjki7ahJ3hEQcVyBlfSxImg76W+lWQxG38eSY8PV5z/xKSZQVhjLNXOgQZx79Ym8d7Snf0UfypNZGKh816jxJ1CIZHICuBw9hHMPLvvhIKCE2OTxCR11POT1nyVWLUdGxvVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246828; c=relaxed/simple;
	bh=64pWA8gqgt0wzz7YiTG8HCy7q3pqFAxMuGk0ywsSwTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O96ux51lKRU2bd/KAYmpAezDGVV/CB6q4a6WIk3ToY3lYqzAp5NkxBRb1K+v+tsGXrkjqv7ChNQjhI5qN9YDKkYrlN9o49Uj31tdh0WAwqoABG1pKFwDUyWHw7bZOf9jDs+MAjqY7hXC3YXcKQLGkmS2BU07iabQb9YAeP1gvLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atSXVuJP; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atSXVuJP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so5057447f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 02:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776246825; cv=none;
        d=google.com; s=arc-20240605;
        b=jWSoYPN4L4RX+gGxUvmvT77tjryGwZFsOJ0YmEomtMesK7sUr+vq+Og2AgwD2SHmde
         bKdvG/CcoUc8dGfhmztiJrIghXVggAxKwEB+94GG6gqKvsLwCvd1oBbnF9lvXFQZVwvL
         cNuQTtgZjrKf1FSk1Q9xvmzuYOPDoD7U5917nv7arR1/UZm8oyZX5SmsuiRVdD8EzUoF
         luZkmXdCAlytEp6MM0OPYVxVVfhEtuu597CyIr1NtryauowK1lZ5UBncfpKM2XlWrImn
         aJynDdqZYIe3txHICSEnsYDPxLXlri2B9wawOF1g2Nrhw43nE6BVNq/4QgoCxgvmALg0
         hT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e8FrQl1GORWoRsVAUx4h50KKCzvWu9t45dZie8lyW6s=;
        fh=jrzRcI55xf3k8uHkOxzOjeVOMNafSYI28B58hoqcjcM=;
        b=PoDwRR/CIHQcVljkSU4hX60CiNza1AgiYeM+UH+Akm1T3w7UlLur+HjThxsCIDZve+
         SQOCCQWuSRhjFEU3ChyLxDUS5WMCKxFnaF3QNHs9nk9PrlPvf2V4VnfDHyBs4h8ZJN0f
         ATgUrTkFoMQQ02rMbKpjLZR11j3mNf/mLwaujwgHcH7K42qOE8fmO5FZ3NYda/Qsv0B8
         i+6qrskWy+F80RurZ4gpLXPfEw52ehSbIbPcSnUnIN7JaJRS1Qc445+G9Obzc8YZYaKq
         T3f40oZBpop4sIN4yj6/HA0Xyg9505v9AL8xQYCfqVkqxy4m+VWpuFE7TaXypePt6EHF
         cdow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776246825; x=1776851625; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e8FrQl1GORWoRsVAUx4h50KKCzvWu9t45dZie8lyW6s=;
        b=atSXVuJPqjDQDvF/WlkRNgiVS2dKSQuqHxhkdwA4PpS4YygntOzWSUSV7ir3aGVp1e
         YsyhrZDSoc+UIxLiSTPJ+/PFZBMowEtftZVklifXZ6Qu6d90YG4J0avW40YWHT5ohvaZ
         xVoOwdsDr2/QGpsT5JJ2NtEp1K2uojyzu/dWVyNCPRfRsf44bbpxDUaY+pSRuPlflgI+
         5TogBRQgOdvCWKqZufDUBccrRaXlcLsVk3sGfRYmcwIutS5QQlXaSLUOMpuy8SyI9jLs
         yqFxT3B8Dth3yLxHs3rds/rQJZT4DPwO3o0wr8NxJpPAfyqoH19VHqQXME6d1KKocjNU
         3fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246825; x=1776851625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8FrQl1GORWoRsVAUx4h50KKCzvWu9t45dZie8lyW6s=;
        b=IuWkx0AoXOwHxQi/SnPfzbWlWXmWJO1jGoAcxHvjl8BDo8ZUbv5BAkilbCwI7Jut7q
         SHushOSYVjLeIxqroe1sFQSY0IWlJfJmnLLa/M6JXJkjXsXIMvQMqlwMcPCoA+hCCaqj
         /v9sYkuKgYITcrx9cI9q6lCyQYGsS2Cc2fSWP+KsxOKnwgHP7POoyUN3O3xTVHwAPsjo
         lVkDCoZns183SaOt/tCjcHGMnaI9mIxw/+wY1iHtnV5eBtmgVPOjojKKiG8m84eyiEXP
         8Nz2pEI3On0UOqWfSXGzhAnPlTcojLTEyQnckttxSzoZLpuSxUAIZPshjxZROx/MDcYP
         C5nA==
X-Forwarded-Encrypted: i=1; AFNElJ/E2WRGhZhh37Kpa9Ejfd77w8Os8VZFDe/x+AHgjFSmn42rO6URDXRZVYsoLWUy+JZBb0yDarVaL4ZCgBC+@lists.linux.dev
X-Gm-Message-State: AOJu0YxnT/oXF9g5/Js1+V/j/zrKySaB9qHo+VFu1jzuRLFnw4T1Uq2y
	LdQW4HkXTqY/nR7ghLgr5aNBllrICxiHzOujDCfa/JPK6nEePqRZxKFp5Q8Z/qSlkBmkRjmUe82
	pTRLzLiKTuX3OrgjXqufsK5eqFMmjluM=
X-Gm-Gg: AeBDieu+ibYjRBQiirf2rPFUD7TAAVxTf67xUEtyzFF4A2hiSkBimxQ3PxRvkxctxOQ
	nA1NGI3Op4TbmJ6i2soyZE2wa9lm1BQAlmHhJYNqTjHZfwqjYYWJx4VAoA6hprPpNOjPmoH2utq
	+XDXgquf97X02pDWCZ71nD7Zq/3Si9TptCLOrMBWwPs0sOiXWyGPO3KuXapfVDlH4LAjvk35bHL
	68ppuqqvto2hscN+hVleuVXduL755SiQFkj3sTjS5SCjRiAxiuXEofB7Z0lz3oy8YMGLoRLaKI1
	rkYc/FfvcYuTlxddP8NczX7fUE57i1hNIyK8R5zy9/pJzDxmA9SEqRUEcOWuUBCMpOlwsl+0hfp
	doUng33CYOYbZuA/2bGiP5UchlANpYuTNrnRSXPVsqYzBXKglIWde3G9AzjChB9oUnbCKznA6Ud
	zLeqtnW7YdHTLuOhRifkqy3NdDVbE=
X-Received: by 2002:a05:6000:25c8:b0:43d:7dcf:ae26 with SMTP id
 ffacd0b85a97d-43d7dcfb1f9mr14007527f8f.34.1776246825171; Wed, 15 Apr 2026
 02:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415080812.1284-1-joshua.crofts1@gmail.com>
 <20260415080812.1284-2-joshua.crofts1@gmail.com> <ad9SzwJDwRNldv_z@ashevche-desk.local>
In-Reply-To: <ad9SzwJDwRNldv_z@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 15 Apr 2026 11:53:44 +0200
X-Gm-Features: AQROBzCFhXFv_nN56n8S4WhxYSp-dtwkJjw5Ad513tzAZnMniuen8n29OrvXZnM
Message-ID: <CALoEA-xy6WApV+ZUavnEipTKiAezYkXMwiE++TjtHuxkVdR1mw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 10:56, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > Checked with IWYU.
>
> We have a (recently new) tag: Assisted-by or so. Can we use it here?

BTW, I thought that the Assisted-by tag only applied to AI coding assistants,
per the documentation.

-- 
Kind regards

CJD
