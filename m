Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102C390600
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 18:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251701; cv=none; b=bQWifCeDqgTHRgxY52ok6ywoRIDaeRN4K1nwq1OLO+OgunpZVdEBcrCIJ1Qn0yV9RQ3th7txkQuNnf9X2WVEhx5/GktsMTjDP+YHXDLe4SBcxoFS+x+6HPEkmUmMIw3d1rlfUs3jRwkzX45nCaLqlJro1zi4fO9xpJ2Nb3Z9xd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251701; c=relaxed/simple;
	bh=DagOCJfxBXNwljrYC665sUjHBiesPxZrZUo+2adcKXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=briG1x25D8FncC8X/9fpWL8NBCe1OCTkd/Nh4Qp5e3hfzCuKd71VDTuacH9VH1KzRzgaX5AyOzpP5aXruphHSWTzSDZDLy+LmKQxzX6PJShteUPXQpd0s8mTC41PELIDhHAVVTAc9Co6rxdrSg/OIK2/FomjoP39F7MDKY+KZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYinYpRp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYinYpRp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f633e6058so239024f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251698; x=1787856498; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VHzC+rmY032qjqVbZyRDQwA9P9FdJrsCi8GUAUfuieY=;
        b=TYinYpRpcNa3I7KGolR24MLi8EtOWFVVxGCwUO9cxWl8Gth3XZ650srwGm3Pqy7/dN
         kHx40s+T2rUyH2xpi87zFWrWpoyMco3AfblD/UGfqgscIwrhZdvPy29DP5zS9PdKqjKz
         H2I0hkKuBShwZ74KwcJLntdJxgy5usmq2QeUmOtbkDheldzdpSAZx2yB1bB6apIPFYeR
         L26MIvFQCzQgBw6v5p8Nx6F3pUkl5mwldLMiV95ubHqh6NCU9u45NPbvFWmxjMkpmHR4
         np06DEUBvpasBES0Ohr3sPSXI43BnzQaXBDB+jTl38nutCDNt/J+WAsXFoYYhmxL7jsj
         tSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251698; x=1787856498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHzC+rmY032qjqVbZyRDQwA9P9FdJrsCi8GUAUfuieY=;
        b=NtglLrtR/prVsHeAySzkjKkWjViydny3MrUBzYNgyh7C1hbDZmWt+0BDyVH0t8a60h
         UaQDk+CVe6ruRRk+LubDfZ6ZacUPSzNuiTDQDKssg7Ssjb0p/+hqp1F4tP7sQXIxXKD0
         85pjVb2Oy6Aw4iHwwfMaNSERIG9MssETS1Zx5Ladi2Dx9GpYlkcVY8JZF1aOoZcbccod
         VIF97/9SkkPQdNh9tZr40LmQVdYJ1vWlkEv9SPAY4LiZ5wJNk0hRghHMIk1q6QqJKytv
         uNmMYvDRi9Anlejijwa9sWpoSmC7bCdq+lo5RLFcQddVc6uYJWCcVVQndnNF93apwG3S
         pzfw==
X-Forwarded-Encrypted: i=1; AHgh+RrRHbzJfQAqdpyMyNlPZ1zlKWGVsZKmgk2LBWejJwev71OeaMi6xs5eQ/LMv6ul6HUJZIrSGrRLiG/Gpfbk@lists.linux.dev
X-Gm-Message-State: AFuF++nuM/nRRCnVWTM2dZs8POk3KpqEkGIuMzYPmqeiBGOhHYhzQ592
	oz8nRW70fbNGUracxfk3CKRsKFtyS4jvWg5QoQb0w6jSInYEar4uNykwDBK6C7OucGKcJzmx
X-Gm-Gg: AR+sD133bkLmGD91d6GFg+3sQSIQEnG2MIXch4cqafi2/f8xZm4nRhDkxlCeW2vqG+8
	Vv5eqRkF3q2i2BasaJEDfg2F22zPHtYeRYEC3csGTVBsC+bVe9UZNGHJcu+NkL3xe2ZPwfJ6snp
	5/Y8WTju4Ve62JJAPKWBWuc0uzet2Lmr7le+rBTW7qwosr30mL9/6mvC4gSbYwtym+qcx1u8geK
	PAf7ZOT0Uh7c48SNuPwL7CXYRhfYMUGKN7MPzqCFsf/e2qSd+UMjomuO+2ziv0nyb9cp+YFzKrW
	05H0BpthURsG4bnOcI4Xx00hdHjbxN1f7DiG9/NYo0KiO84psn5Nvkllhm8PjD1SUUkompWVUYB
	Ywc1kMMZ+7GTWgtEdu9/P9wmmbtvVjbrxWccHo8F8OLKi+DMtIqvKl2/0u4YSPF1qvH6MIY33fl
	5wTL9S61IEFyfRfuIrWElBmLWv6O44nF2HEMVYfR3NG+nONgGh8xlZrUD2LtXvYvqKjXo=
X-Received: by 2002:a05:6000:22c6:b0:481:5021:33cd with SMTP id ffacd0b85a97d-482c0b5482cmr1235545f8f.3.1787251698182;
        Thu, 20 Aug 2026 11:48:18 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm15912182f8f.35.2026.08.20.11.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:48:17 -0700 (PDT)
Date: Thu, 20 Aug 2026 21:48:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: schedule the TX cleanup tasklet every
 1024th packet
Message-ID: <aodL7aKfBYqNQig4@stanley.mountain>
References: <20260820113239.8169-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820113239.8169-1-orgads@gmail.com>

On Thu, Aug 20, 2026 at 02:32:39PM +0300, Orgad Shaneh wrote:
> cvm_oct_xmit() means to schedule the cleanup tasklet once every 1024
> packets, as its comment says, to cover the pathological case of heavy
> traffic on one port delaying the cleanup of another port blocked
> waiting for it.
> 
> The test is inverted: total_to_clean & 0x3ff is true for 1023 of every
> 1024 values, and false only on the multiples of 1024. So the tasklet is
> scheduled on nearly every packet, and skipped on exactly the packet the
> comment wants. That costs one TASKLET softirq per transmitted packet,
> each walking every port and doing an FAU fetch-and-add per non-empty
> queue, and it buys nothing for this port, which already frees its
> completed skbs inline from the skb_to_free value it reads out of the
> FAU.
> 
> Test the mask against zero. On a CN50XX board (2 cores at 300MHz)
> carrying ~6.9k transmitted packets/s, TASKLET softirqs drop from 7133/s
> to 597/s with no throughput change; the freeing work is conserved, so
> this removes softirq entries, not work.
> 
> Fixes: 4898c560103f ("Staging: Octeon: Free transmit SKBs in a timely manner")
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

