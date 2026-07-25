Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF752E7390
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784992184; cv=none; b=neA6bVu6llE0jlb7/PF9vJQ6EK9vvrjFcVRjfIWRlCLzsPOicXIY8vJh0xRrE2LLk0Ueg2dgBDASoTRCW+T8AcgktF+CPzHZELcL6VHQ0khn//imwUoSoYjVkr0+FaUG8gy3KadlibAvlbFBpzocKGjfbvP50GmZHW8hGzfhfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784992184; c=relaxed/simple;
	bh=dJAWqF/go2E982qK42RHOSYXJ02QIi7tjanV6+8seNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwESbJNQXqLQpUdnPY8QrTKhr1/i92FAFpHJdbOKYF0wy5e5qQP76guxCb7Pl1OXs7EZ/nrWLJQNxCJg77BmQYhm3N0nS+Yodko1L5GESMBbpuCbrotyC87Es6psFDY0XiTkSX2Rlqo0CEd4UhqevImX56mIvQwOCZefz3iK6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMp4CBB6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMp4CBB6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1670451a91.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784992183; x=1785596983; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROYJU6UaoX6qKaAVEG8tMgZPL+bcKZcI1lu9EFKpxr8=;
        b=nMp4CBB6pqmO+67u0K+dJfz82RZTdVAd2aiLoEiQ1Y8nVcgiJ/DUMfsKIb1cpHPHSL
         Tnvv4IFvxa62gi7WV8EF8bIoBGaqaXjaNYWhyF7rU4TxyBQYdcSeRFxtgQ0vw3LfXn6X
         eTmMyqINHG9BRniUCcKK0gp16ysSZUmzPffTwitEBT40D9VGpaPIHIwn1W9ZoWeYSZYz
         W1KmmT1vzq1gbJl1oRDa81vVseudbE92uLIxFhOzcoh8eQBUmE9vBlxiOOAPATNAMkP1
         gcX96CrK3VN6eChk1qoFcnp6hr0ioJxma2eFU5KEWiOO2vfRcnOBaYWUszDwakEWvRNC
         AygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784992183; x=1785596983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROYJU6UaoX6qKaAVEG8tMgZPL+bcKZcI1lu9EFKpxr8=;
        b=IMfVOrrtgGVfjrdKGy2mgGRigc0YUu/ZjtX6N4dkeEo8DnnSinygewW9kAJVYRSHBy
         VN447j10jrvFI8jHzbxqwVVBeXf5ge1N5tBruaPKN3Iz39Li24iHfq3VBW+/xG60p8Mj
         x0NPwHbAo7wKbVj0SR3YNzB9DN9RqCiJYFawt1p6O9eXcndsD+odhPFIhEKmSIJ/o1wO
         AJZvrfvRq3Tcyodsv6NrlH+t5Vk3UPqszs4vKyqVjKIONDwLJExq2xI+lmicXGd2sCQG
         QOgpU74GBbx9BPcfQvppOzaIYLwv6Ku4T+0TMCTFoqeJ1aU1tdRjLforwTj1IB1U0lI2
         k2RQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+4SCMJ4/epqFUwkTx1a/uHz2lskuqrSAut4aTULS8YaYRAdZ7cbM0Ll2iV/8HpGIo0LMi5SE+x5xXeeRL@lists.linux.dev
X-Gm-Message-State: AOJu0YxfCOdEQCjgPk/Osc6XqS2TfwGkxHNcwyp8nMZAROnXmJL4rU5x
	J7sBlFpxfZHJxYW57BjLDAtd6YiqN6cTf/RtLANLgdT/t+ypsrlCQHDg
X-Gm-Gg: AR+sD137f+498ZidzVRW3kBCrdaG7+jMqEtoCbhRUE6M20GN2y2NM3uGbAbxWdncySu
	gCiP8ITIbwAalCq6ahYrSQDrN9khoM2MOS2E/OC/RPWj0SuyHoTLHuTDJOxqRIWoQIdZ0NW2jCs
	GwQlCZMOPuhjqPGsiFChusmzqtmM9Ap4dWPVOQp87JXuNrxBTDE8tV3pLFJumMCg0H0sXHlprEj
	RFy6m3QQ+6DQZY/vcGDHdFSC2BjNDKIP6C0qOIoRKfr35cXUIvw3nnlgq9+DL8iDAELntkkTu6j
	vFtiSK9Ql07QMOHWW9MjmKY7vSil+mwL3zzKb7xTGtctrah2OCeN3YIie3ubMdShlvkOu1vKQY6
	sHBuQujXd0JeKsoS59oUyt0496oN0RzV3A9a96YfYDWVnU1hv+1FYTVNa/mmuagEp6ZngqyP8
X-Received: by 2002:a17:90b:1e48:b0:38e:5701:644a with SMTP id 98e67ed59e1d1-38f29656556mr2513470a91.27.1784992182631;
        Sat, 25 Jul 2026 08:09:42 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f05805fb2sm1740147a91.1.2026.07.25.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 08:09:40 -0700 (PDT)
Date: Sat, 25 Jul 2026 18:09:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aditya Chari <adi25charis@gmail.com>
Cc: gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] greybus: audio: Split gb_audio_gb_get_topology() into
 size query and data fetch
Message-ID: <amTRrR1ly_GuV5Vp@stanley.mountain>
References: <20260725143721.5908-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725143721.5908-1-adi25charis@gmail.com>

On Sat, Jul 25, 2026 at 08:07:21PM +0530, Aditya Chari wrote:
> `gb_audio_gb_get_topology()` combined three separate responsibilities into
> a single call: querying the topology size, allocating a buffer for it, and
> fetching the topology data into that buffer. This left callers with no
> way to perform any of these steps independently, and forced the kzalloc()
> allocation to live inside the protocol‑layer driver rather than the
> caller, as already flagged by a FIXME comment at the call site
> in `audio_module.c`.
> 
> Split the function into two:
> - `gb_audio_gb_get_topology_size()` – queries only the topology size
> - `gb_audio_gb_get_topology()`      – fetches topology data into a
>                                       caller‑supplied buffer
> 				      of a given size
> 
> Update the only caller, `gb_audio_probe()` in `audio_module.c`, to
> query the size first, allocate the topology buffer itself,
> then fetch the data into it, freeing the buffer via the existing
> `free_topology` error path on failure. The topology size is now
> stored as `size_t` and validated in the caller before allocation,
> addressing the earlier TODO and FIXME comments.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in `audio_gb.c` and the FIXME comment
> at the call site in `audio_module.c`, both of which are removed
> as part of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Aditya Chari <adi25charis@gmail.com>

These should be in chronological order.

> ---

Why are you sending a v3 of this?  Presumably I missed some
critical stuff when I reviewed it but I can't be bothered to
search my inbox to find out what...

So partially laziness but also I would hate to miss this
opportunity for SEO so it's also greed.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

