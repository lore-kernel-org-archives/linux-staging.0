Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DB38424D
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858551; cv=none; b=KmvWumwwlcejXjVpBFAOweKrDImTZ5VFYVfSDM5lFmrYvJXYp81GsZhRfgWn0YaQFzCfz0gA8weBiITUYvEOECKJmmojZPTNCAbCDpWQiByrvsJWgeC5T9+4uz4ASNYRLlcc05IFKnd/XMMqc85PBb3xYxnwFDN/40IA5K5HayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858551; c=relaxed/simple;
	bh=kjg+38iCSByaRo34kn5wsyzmdJWny+AggoAcqWbRdlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3WcPDGN95gOVe4GjEzhQNUnn5B+rROwdOrAYDz3aVUwRhQFcc85iYhDZJvJxlQQJ8s5Q6fWVuyOg4zzZ+Kd1TF15qi6LW0TgPhZrldW+0pshvbG2vt7HwdfP+jc/D/ShmR0Azuq36EMG9AoskOPNEznubPDe5PViqUT7tB4VYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANpSRz+i; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANpSRz+i"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8453427d3f4so5213432b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785858550; x=1786463350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzMwvtEwgGSVyfvYiwwHgVJl92Ao8wpYn5k0O1nO0gY=;
        b=ANpSRz+iAfd11inoognEOJQTMmLVSOCe2dMX3KWIPHx6K34T1Jl2hEJGDj/IKpxZO/
         YLHaPl0PpybdQycUXES4ZW/H8t9z1r1VlDWAK41zk/eZ1l0QE27xwKRhafzynVfXTuS4
         i+lXRNbSOgS4aePYpAms2WuxmL5I2lhmPG+5Iobbaqb5mU874B44yWVAsATmrfweWpiX
         NcGsoNcKLdBBWAvEIKkv6IJWpEcRkVf9tqsII/5fKI8FnicvwLyaq4RI0OXn/hWkFuFj
         kg+64MC0XQ7bscwST8z+z2wLEKqlrNYFli3OlapgoD2wY3voKqHHo1YZlWiYH+VIceZ5
         rvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858550; x=1786463350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzMwvtEwgGSVyfvYiwwHgVJl92Ao8wpYn5k0O1nO0gY=;
        b=NoUueLao4f93DELonxNVSSV2k92P74IMHS7OvhkXD7KVLwLH+/pdNBrqY9bYUfJeyV
         lhPcuGSnI3+8bCVuVxtVE0D3urugyyfwMAkK1P4M/igfuptIH/1PKvufksvSPnPBcQGQ
         qVa5LpBnQIbJ+psVH3XNqthEecOE//Zy9LhG+m4RuFq8sr5tGmdvamF5mC1jf4aTV6u7
         BYSb1QtyvN9lM2ZudJ0xb5cA/r22wR+/R54l+9zccinnULteuyF6slFHrhk0gFu3CrCa
         92FRLtijJzr9HI7DH6CYt9F4TYiDyCUV+wYT51mW2MeqPg6d83jOg4qSkjwwz/PAqd/Z
         5Asw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn6SIEFaTymYdoy2F15bhLgRGKoPi2YyQIQau2bMJFZqxBZzYY5vuVorMWyMulRE46pgfuhR8zgmM9xqDb@lists.linux.dev
X-Gm-Message-State: AOJu0YwY9PThj8ZsurDuTG6i4qubT6E88pZ1dstzawobxvEA4DuQFJBx
	wxjGlOaHpARSCSqGkvZ7Z7pBUXpO/+gnsYcDaNvstM0D/piY/7EQWJlh
X-Gm-Gg: AR+sD13pcJMpf9RG0aek0vtzrnwi+xgvg2IKoI8g/CKYUDqPQEZdRNZZf6U09AfuLio
	73k92ax9HiBg/dkjoxWRzk+9fQFSr0GsHB+EERZWOg6jfNibmHsTbzXeqiMYQ8kfBgmyju/p/A7
	LPIPa0EvsM11aAEZKoySMDiUzHTJ6iD707gg8GcPJRZjFhsBw/nKKrgLoOHaK/g8hHuMoWfeEKI
	UZ2DdkkYmPrU7P4ZMjMbZuxotM0kbvhkFUIsx1WqBBmS5JG6fU8DowT7bcRtO1b//LCHHw6Zk+7
	KgiizmRFA2HWOFUhIQtqCTOGrxuVNrwK2dSTFoom3Pv+L32CZ/4cp9Lbel/twK+0NiseyYDr1p+
	B3dK3wdQ+5KydHvvgEiI29+9xFST+7ULzmxFoULOpMzr1X5d2fkQ4wBx889c6FGr6KBgEyngbl0
	WYkG+U3Xa0TEZjZaKoEHMTTVhLc+bOKhNz4TYZoqr2D8fRx+KErbPKSw==
X-Received: by 2002:a05:6a00:2e19:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84ee490920dmr13977268b3a.35.1785858549815;
        Tue, 04 Aug 2026 08:49:09 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31585sm5507807b3a.3.2026.08.04.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:49:08 -0700 (PDT)
Date: Tue, 4 Aug 2026 18:49:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: axis-fifo: align arguments to match open
 parenthesis
Message-ID: <anIJ7ln8wEO0Tq2-@stanley.mountain>
References: <20260804111352.21257-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804111352.21257-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 11:13:52AM +0000, Ashmit Kumar wrote:
> Fixes a checkpatch warning for alignment matching open parenthesis.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
> Changes in v3:
> - Fixed DOS line endings.
> - Shortened the Subject line to comply with checkpatch.

I think you are working off an old tree instead of staging-next.

regards,
dan carpenter

