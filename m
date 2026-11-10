Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313144;
	b=SIMFJAq3zGA3avSTC7UWmzKWkS+VcQKUfTTWa92WogIGpKcIJtCmYP/EoA1sgNDkyyQ3
	 HqvkZ7SzcIS9uontoZIdszwaWcTlcGk0ldfJcQ0jk445uMkmeFsBriqaibU5xxZQAmD0e
	 36oIJDTxSkIjU4D0Z95hY+mx75eb1XHZSa7WSUZjh5rBgKpIFbL+jhFPItgzmSbXJ+YHP
	 5BW1LvUKRqWPaTsY46YxjaNyVb7WCRqJE75gmF0fvkzMwoCnlbxvm2VdCDZTnoJ8o45H+
	 5oeiMCqxYaWFbTASw83e3VoeDb4U07w4DrEFKzKMn2rxfi/1DApskTsvg9FRoTHucAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313144;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=DJoXiCBdlUX6P7F/sHPq9wTeXk/IjATyg4uv4A6oh/s=;
	b=wMrjpL6kuupHhY1JrZpFQQUPUNB9d3vUulp4snm/lwXpuGSFN2TjW/tj6OHbjUzCBJRE
	 T+Cd9Pdqrk2Tga2q/jJaV14HknGpG3Z2SgL9E2COeI7i9gIGPTVv2KHmPr1eY3xMXPyqc
	 8SOjIINAc91rU+0VAALuqag+0CrajTpaDD25L57eTxQsvK/j3Mm0G+KOgm9sRlLcKGexr
	 XbDta2a8Psa/XK88RlUb2NmDtaG82QxZ2ay4Q38/euqPm39I9fJAOJcwatkMjX7H7s8sk
	 QTbu4RwnUC5FGXfl8/q7tRv3DeBX0BlrLQHNfWoX4urF4nLONlZj8jfO/IK96ML7wfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4357606A321
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 12:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4357606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so1234556f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 04:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313142; x=1794917942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DJoXiCBdlUX6P7F/sHPq9wTeXk/IjATyg4uv4A6oh/s=;
        b=VaqoQiAE0mxCD4E9RjFb35vfv4ncs/Zdbcrv7dNOu2hYDZpokyfSYvvy0bVSQpGRdw
         TdpeyHgy8ov8ING7u1f5h9ErgPA3L3PMCDEJtrN6BSyB3Pqc9uDe5xZZXGLpWMnM/93d
         OjafrNW1A/c+TTsVG+NpY25BdDpbEjKXHIZOHmqWPNGfO471GlqIMLRUh6Z+k3gQZ9KL
         eY+esXYh/Ux6v+dcW2LabDxVB9MRvTdkfVx4NR+r4fyw/v4x31XSvA3A3dkI0gvKvMNJ
         e/yqtyZBuYIfYsswb2kCo/yKY+R5Tj+zhiKMDbT+gjg6hVWHCBRYwZSTpNUYWwJEFn2Z
         Cb3w==
X-Forwarded-Encrypted: i=1; AL+hErGWJuFVzvTjgOLdUYCTCaFKjsvyKfUcaEEzVPkdgkbAypR2QPLafuD/k1OzB8KyDcIoEKYUQhLS1GKQgHmU@lists.linux.dev
X-Gm-Message-State: APuU4Z+10SnKlzTE3bX47Q2dL3ayjoltKoGS+FSXptLYqvJZ7uGmZtp7
	QDH2clV8HM3K3G9iN/V42OGUjSYp0VkLTxky317t6M/mIJvF9Bf0j1S8
X-Gm-Gg: AYBFou2sVcaZVJ0R+qMkQzu0w4F2M7Da/0n0Z91ZxPxjNiI8gd+bTYxG1O4go3BJci9
	JspUB/u3x64DVhgO4HFFRMOypALvbkd383LGElFlioANE4U7MIFuANXOzaYLKy9xBzr4A2nvcHz
	f3wJZmQyTAdAEKS29gXgqG8/SuaSaCJo1NIXjHpVX/wYT4Ty7/RWkme2K4c2sH/2yo1c+RXA1aM
	VBzKq0X8UszjDPg/yAhrRqO4FsFObdtEFbufwVBUkr96vg12aSdLeSMkuDaipdoHvHuPJIztP4S
	XVptmjRImhwP9LnndDX1ciSQFP7GxWZzAT2toGGzuBpOuv5rytqKdbXCrXDhSpiX3AxR0CBGvh+
	kUkTCS49tWcfHKf/XsVN31RCvGzUaTImK/t0D19vA+hsED3PXEWh8eO1Hjd8m0sBISHCK1kGi7W
	wdAQubEhoYN5HzfQmM0UTB10jTBVQfQbwuSjsr49kHfmZDJGdvmrgkhTQ6IvB+BLsNo0hS6yV1s
	i5L8U2JOlhSJxx5lwMCgwCdghhaNMTITAp18Di5y3euurhX4CXwakwra4GkX0CXNH2s7o5QWZxs
	1z4LPOWscqo+YtgmUxJnHEEfwfV2oj/aLwszLJrnGPBgBpm4ObFKleaMVosb34KMwpMp0E1ao1D
	Zkt1OUtPTH+WhczsJxYRER2snJ56tlfkQYrEQ4DePQTfR6CafrfOBmll17p6NLu8TgdLLtvVM70
	7pWfiNKcIWWe4=
X-Received: by 2002:a05:6000:2511:b0:492:20e0:f200 with SMTP id ffacd0b85a97d-49842870943mr4544422f8f.14.1794313141971;
        Tue, 10 Nov 2026 04:19:01 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c2793sm4715458f8f.45.2026.11.10.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:19:01 -0800 (PST)
Date: Tue, 10 Nov 2026 15:18:57 +0300
From: Dan Carpenter <dan@cryspen.com>
To: aleszlucero@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: octeon: remove unnecessary parentheses
Message-ID: <avMLsZaC_AywFjUs@stanley.mountain>
References: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>

On Tue, Nov 10, 2026 at 03:37:24AM -0600, Oscar Alejandro Sánchez Lucero via B4 Relay wrote:
> From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> 
> Fix checkpatch.pl warnings by removing redundant parentheses around
> conditional checks.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---

Search for this on lore.

https://lore.kernel.org/all/?q=cvm_oct_common_change_mtu

I don't even know how you are seeing these warnings because I
changed checkpatch to not warn about it.

dcarpenter@stanley:~/progs/kernel/devel$ ./scripts/checkpatch.pl -f --strict drivers/staging/octeon/ethernet.c
total: 0 errors, 0 warnings, 0 checks, 1037 lines checked

drivers/staging/octeon/ethernet.c has no obvious style problems and is ready for submission.

regards,
dan carpenter



