Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB8423A562
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522621; cv=none; b=bAI58hhL660kPVZMxfxuRlQ+D33+G+6XKmlIhYrn4Qh4vpQ2fVSWv3QVd2U6S4kflX30Dpjjt0DcBzdXzv7LVqXNTxayy9bmph6ueK95i1uA91XA0fHtg5wxRUYrWlQKxzMFG6cxL5xDR+iVu+qW2Kn9ycqJTIuR/TUxJ5jkiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522621; c=relaxed/simple;
	bh=lWyLh77I0o96ILR9keITTNyVMmkPyZwpaBKQXP/k//E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=F6tmC+G1WCD5oulSlOXw2sLwLI0YLzV4wPr2z9onCsSTeCOHtUw9+urnuR2L0UOB4DJpXTGsBYiFu/ZLxVHnR6TNVvUVYNHiHzMj0B/yX8uW1mmgP9kGtM4mU/R3vh/O7V3cNJuuxTmnbTqKGNvtjgcoleJToblf3dqrwMTdrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF1NrX3D; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF1NrX3D"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so3243373d50.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773522620; x=1774127420; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWyLh77I0o96ILR9keITTNyVMmkPyZwpaBKQXP/k//E=;
        b=JF1NrX3DYtxCk+SJ7eLz1hCe1cqE2SnDuQq7VhKl1KdYvCwWKo43KKfk//8KixcKLi
         4zCBUkoa9hu2CiTjf+qxnyOLeoho1ZMtDxM9eSxj+hZ+nAEdiKo9/II2Fc/2+7M2913k
         0nYkYVohurbfrZkfssydfgaNTYkQGBa4WrO1vq3TwX0UdHa3QD1k+e5HPRC3AjjLqxaT
         ZHY+Tt1OVW0c4Uhl5WHx7A/4XCs52GVKS8HLPq1uVYMoMiRLdMwP4iRu3nuQVDkNuVPv
         HEOnGg9BrAH+QnXIrK+qwH06mX3a/SM34TdrKAC5J9ABiVvpl8KbmD0MVTby7yZS6yj8
         5rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522620; x=1774127420;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWyLh77I0o96ILR9keITTNyVMmkPyZwpaBKQXP/k//E=;
        b=prlnw8WWXzGdI42j8JYHXjsx410sG/7wY+bGv7qdTH6gJEfBNqYUF4ivWltRjK6TUs
         jfFcLN9XNgO6DnnluSP8ORIgD9HncS3MqDfCY2Di7xWhBA4KsM/Tk1b5MAXfvg2pxnxz
         SE4V9niXofCX0eYeltiI94iHXZYR3wp2NCZ35DcbrGHduN/Kug97b9poEazZsaxMArUZ
         9DLXmZ9o+Inx7MK4lU+xdlvKrIaMbmgUko7QJ1yFp8ByYPuNeNpBT9ZvkQKDhitDr/Aq
         pFeb4KmkB7jP17EdCf7jB/IWEycQwyWF+hTVinorsS7XyNPnJ7bZaBnCKMP33/SPBZZl
         3dvg==
X-Gm-Message-State: AOJu0YwCT0k2FssANL5buKnyHz7we+LoLIz62+cvf/h0uXeRxh/lXsPb
	2EPwOWXAKprW/XB9DUZ5fsuJgeoTUdV/q1ID7wgF8V8pJ1+peNhTToeI
X-Gm-Gg: ATEYQzwL7jPnP6LOl9kfL2Oi0MWeOuNm1yciWX1RnQyafRA2O9cHFQNQ5YbpEuj4UzB
	wW2zsaxiKkmrUgX5XmFJQvI0EbzwJdiSXrBx/mOolRfjYEVp9XdIgrZp++fbwV5uewoDRdgL1KO
	glW5FRg9gX6escCatgvf9ab2Z3YeyKAS8oiTiO6Nu9LLWNGx0l8ww9dnqgaP/Oho332JfQ8HERj
	hC/gW/V+vVpQ86eBm+px5xq6QMZmzHavRxg7AzSASOT6Po4aEV368fifwcN+KTqqE6i1D0Twy8C
	YcQUC6zIstBzXilriLEmv86AthDm+FAp/PMr0rffdJklg8Fs+bR7nk9Li707kayUZZp9e0lqRol
	XQifu3HLDU3o8osrcWHjPS1yHbxeKMjrWVUSlakF4nPhlRWNcusopVWB7MAz5waMimxT+vnJJUe
	6A7WhMT0dtCH1/bVo1pCHTh+h8dsyTIxaVXkGg2d3F3bZBfmw1tseWVO0EXWupJxcqRuMGFVUKe
	4a3p1q0mru57ZaYm+lUrndeajOdYswy8wFLoPpmcL0tE8PbOjUgQ0hjaQVHK5MH4DQ=
X-Received: by 2002:a53:cf46:0:b0:64c:e8c6:a80b with SMTP id 956f58d0204a3-64e63065565mr5999401d50.51.1773522619662;
        Sat, 14 Mar 2026 14:10:19 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65ba7b31sm3175377d50.20.2026.03.14.14.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 14:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 16:10:18 -0500
Message-Id: <DH2TARFESMBC.G7MZRHY06R9U@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace kmalloc + memcpy with
 kmemdup in sdio_ops.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260314-rtl8723bs-kmemdup-sdio-v1-1-b551f87eff8b.ref@yahoo.pl>
 <20260314-rtl8723bs-kmemdup-sdio-v1-1-b551f87eff8b@yahoo.pl>
In-Reply-To: <20260314-rtl8723bs-kmemdup-sdio-v1-1-b551f87eff8b@yahoo.pl>

On Sat Mar 14, 2026 at 8:30 AM CDT, Tomasz Unger wrote:
> Replace kmalloc() followed by memcpy() with kmemdup() which combines
> both operations into a single call, making the code cleaner and more
> readable.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

This doesn't apply against staging-next.

Thanks,

ET
