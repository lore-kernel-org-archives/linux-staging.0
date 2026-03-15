Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8378F2F
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 01:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773537511; cv=none; b=Sa4HIgdp5ovbK5MVe6QquKWNy8yd0GJ+7Zawzip6ZXVxcTAoEqWoLLM5mydCA80ez4PcXVucERgUoyblekQ1x4Vu2yT9lrLsGPGhgchkYLGU30A11IxlOydpdYN45SUU52u8MYC/K2IEaQ9i6hBpZ9IXh1R9F30iv16DFAF3+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773537511; c=relaxed/simple;
	bh=hCPQRYBuGyHtgXJywlC+gJeOkckUHxFWuCPu9NfOAaI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tf6jwZQTT2PTZhzSHmll0zjC3wFjd+ZpTifwSGeprk75yvfulHR5G6HJHLCv906MEP9f5WFpBeMMxWWthksXWfbUSyLq91SBD1RY+6U+HltPrUOUtW5eD0AfAD++4DduRGNzU6MHUY8ndrdmdBqDZPG2pZjvsafed6i4vdGqRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVFfVdHZ; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVFfVdHZ"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ae222d978so3721007d50.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773537509; x=1774142309; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCPQRYBuGyHtgXJywlC+gJeOkckUHxFWuCPu9NfOAaI=;
        b=WVFfVdHZDcz0ViPh3zPtFL6D9QLqvscGkWlzobwvnERiNar4SkcBwfdl5oES/v39C6
         kTqo9YC9rVms7a26Lw+2elpTAa1C8VpgSWJcc5wbAwan9k4q0eIhL8h+xD6ax+ycHOQP
         Z8F+E/f+jb3L5CB72B1A2XhPpTuBZJOetVlYvG4tNoge4TxYSCHa2lNIGH2P9XMORvmN
         6zj2Qnm7UqaX1uTRBwbGHDMan+Y2N3cLkcODrrNwBlOkO2dPjCdRdHKa90wvWKXDr82A
         9owh1L+gYqwlsmtoF1HYd4lzk39OzXFdKDspzWNk0beVhVaEI3FE9IZRlwcz16XRQmGA
         lbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773537509; x=1774142309;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCPQRYBuGyHtgXJywlC+gJeOkckUHxFWuCPu9NfOAaI=;
        b=EdVYNfv74dmSOr3XYJhRn5+npS9Z5wcywD1FHdfOnbgjOx3ZlNjzch8hp0ODxZUsBd
         hv+0w2OOaWsQUSIk83+T3OOLDLoDj58M/4DLh22uHnnJG6cSwbvzt19bI2L6l+KkU/Mh
         YPVeXBIDJQPe20uNsIUMPbBokpCA35v8nK4DZoR1cse7n86E1lnfl7O0UFHa79wAkjTE
         yyqKnmcgFH+tLUV+mfFPpLSIZntQpOe0YXtZRNkYe1GJy2KeAOsbqZNPdKWolRK83bKf
         W5z+HZ2QUKk7AZfaedV5Iu+GfMhJvLBE0dQn6p3MMSw4TR2UNPkxlInBtBafl0KCMq3o
         Wu+A==
X-Gm-Message-State: AOJu0YwMlikknxsFhAICbIUVXeq3yNEyvMNtL3MMyb7vNlWEvIYuGG4J
	7xf1ZulU4w/i8TyQbxMQJWJ8JMT230F3vmVXb4agApTPHlo8VHsuWCRI
X-Gm-Gg: ATEYQzygsY9in/RclnPEAVTNzrYwQ+Mamuhp0cXB6rLfosuqqxv17gbT/tbVsS4SXFu
	RUvCmJccYf0FYm5AwIklmZlkCxWTwzdO0GnI6/PkChvmeNkjJwykq8xeCUbgsev3CoU+P8ydp7o
	PCZXOcAM6uIdLOG0WnI6XOf+GUq7cfeFeSzrUI/j+vHTFoLKGZF2Uj1ugfhvv0leY79VoBXtqrK
	rDBaBdCG5XqiM4r8vBMmx6wwJgmF3DwW+0BzwUGFQhgQV5hGZ+p537VrQN5GZhJGde6BMcB1/Oq
	byIeLFZH1lpCJjS631VgN2DL3nN3ku4vXGDvHcH0EfSG4TtN9EBmzCJ7xdC27NlSC/zIS+OsEtF
	JDdDHyGosai2g/YRaEIGA/QxKHiMbPfLpZdq2Nc+tlP4mJcvGgTv00RjbpUqbCfHfdmr/LQ+jdH
	H59isUSHRJYL4IHC/4L0gvRWa4QWgqT3vH6zCZI0tsPwcj7M7f1AjHHX9H++JEN3LAp3snmOlqE
	KrkxQw/ZemUYzuj7/wYJGvCBaG7YBD04kAmW9va4VY=
X-Received: by 2002:a05:690e:43ce:b0:64c:b44e:dfdf with SMTP id 956f58d0204a3-64e62efba0amr5690232d50.11.1773537509270;
        Sat, 14 Mar 2026 18:18:29 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65ba7b31sm3419482d50.20.2026.03.14.18.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 18:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:18:08 -0500
Message-Id: <DH2YKIAOS6TE.19PFDSFOU7NYO@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <ethantidmore06@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace msleep() with fsleep()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314215444.46899-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260314215444.46899-1-marcosandrade95963@gmail.com>

On Sat Mar 14, 2026 at 4:54 PM CDT, Marcos Andrade wrote:
> Replace msleep(10) with fsleep(10 * USEC_PER_MSEC) in _rtw_init_xmit_priv=
().
> fsleep() is the new standard API for delays, as it automatically chooses
> the best sleep method based on the duration.
>
> Suggested-by: Ethan Tidmore <ethantidmore06@gmail.com>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---

Since this patch requires the other patch this needs to be a patch
series. Because since you submitted them as just single patches this one
will not apply on its own.=20

A patch series typically has a cover letter explaining what the patches
do and you link them together using git send-email.

Thanks,

ET
