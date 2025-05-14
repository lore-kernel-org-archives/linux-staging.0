Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCAB298250;
	Wed, 14 May 2025 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253977; cv=none; b=qUqpvubAdPpr79WOx7jwTNj2vXjshWINv16//Qo5aEVrujSR9TmQ+gB9G1Ahl8M61Ij7FVCteUvEpHvdp89yFVRMB2GYwa+c6SOg6vlwcNowDo/CiYRjEd8UZwFjxR+7uiUylkWpQWiWDeO2tHXqEq8nmKxuy4O5WVVU0OD8Etw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253977; c=relaxed/simple;
	bh=bT9yarjWt4tVIFw8YTecHghmXuOoxUPOnBv6bMf16Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRhnczO+42kPFXiKHDGQJ2G4/9vnuNA31nLQnmbLx7yT+ou/IDUY1C8BSLsKNeyw5uB1fz1ndA8qNsKeE3oGERQBKFhtOWKDXfMZPj+JqzteX3Ml2YIaCloIfwLcfXHZ6JVdcOo4Sur3yYSUzvp8GIJmqteO77RuNgMUyiJAFfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlkYRY8N; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlkYRY8N"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52c85c0d473so53891e0c.2;
        Wed, 14 May 2025 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253974; x=1747858774; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bT9yarjWt4tVIFw8YTecHghmXuOoxUPOnBv6bMf16Q8=;
        b=IlkYRY8Nrn2q3DEz0E/5e1bYz9Q0mLFolMp0s3zUcuiNYwPv5cqvOauORmiOMKbowT
         twklZffCI9Y9Ijt7516dFYT7cUinIDFWnrJjAfnKPumptJX8aIgLxvGWacNTptgZYCVM
         1BedgA8Vpzb4/85vy3GQnBdJM+Z70I6GNWG+dqyB7jQBN8ERXfktNAqga6X+twV4oy1s
         Ma29dc3HMUq3RoORO5mqhUpuKzKYmJXCMRyOM5nmVwWyxT46JDbGRhPWmoPot/FKOxJM
         EMH5z5181LpUIgFqXprj9A1M7E85T0fBcbBBloap8tgbbo9izeGLbHQBxE3i5kA+/R/u
         Jx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253974; x=1747858774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT9yarjWt4tVIFw8YTecHghmXuOoxUPOnBv6bMf16Q8=;
        b=D2zVDa/6HgbhUv1wnxzoo3FdCCGF0IRtDDgLbhRaOVEWbqHTb69gH0sioQ+UMe4gEZ
         56azbhe8PCKOvFv4+NPSkDDD1XgHzjqFMFX6OovbaYc+FcXzQLiGalWyHtKOEWpjihVR
         i8PJgTIcvg9MnQCbJgTAs5sgX9Yhybj0uw4hgCJgJOJ6pEgdZSzb9PsQObNO3IrHK9JC
         X9wlSOUfnG+iMRzS/ckIvYJFzejUggRyBInacC+pHnXFmLitrl0tJxm/tRUsybDCvmmZ
         nGqrmqSQJq0rDSxPw+nSGXaBzGboJifx+Ix5FK1QAGB0BfZLimdQxnZV1luPKWWZX5PF
         6IFw==
X-Forwarded-Encrypted: i=1; AJvYcCVXzP15jzl3NSXOgYVw0jiB+DxMzoIX+PHSiaPfYHMEljgyT1ITTx4JZkfTW8g5EdpbS6G4NqZzTavYRpOc5w==@lists.linux.dev, AJvYcCVv3xLq5u3hB1NQmxtMZkFGLpbE0DByKZEXXnA+raJc8owDBbaLruaYO2Tokok97XJ2FhXcOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8rOLHkSbW9OKtLC9Dfe1dvEZHuAD8zJfqK06k7cl9nIld+Svc
	HVLyFAy6K96kPzoC2z1aWVmgSGpSNyaZMr3pOOVshLHgzDj7UNbV
X-Gm-Gg: ASbGnctWfH2UzZzKx5a4K2R5twgb443AdeKLuP+gJzzUZraZlb34F6douLadTtavlVl
	nkQUw/dOwYYgdVa0DTqA8wXsPy9hD1rfivebRK+maU5YqOddM6526qL7s7fq40QnJ4aJZVSDkL+
	L/uYw2YOVzMU/adwLgyq+zJI6U+ry8grEo5kLgfIcyc/KudxCiJzbF7dfqGzkJe26Mch5zH/wKB
	hZFX2lL3PrvoTwWPglSzYeVv8/tfh8ey1UusfbZGsmbReFRXgrJzYDo55+mmVOFJDY5nqlckpdk
	TQRBTGusA4UnUHI9w2hRcmaRz6aTtrLIjijrHbv5QWOzu288oIl9w+kkkZ01
X-Google-Smtp-Source: AGHT+IEklNn5lxG4rs8q6Ni35Nn2GfrBBAk6umuSy0UZjtOYTCWtiNdraurxKWb0d3N/zhyCFL9RhA==
X-Received: by 2002:a05:6122:2013:b0:52a:79fd:d05e with SMTP id 71dfb90a1353d-52d9c57a600mr4775615e0c.2.1747253974118;
        Wed, 14 May 2025 13:19:34 -0700 (PDT)
Received: from eaf ([2802:8010:d51f:e600:9f56:2539:a02b:bd00])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c537264dfsm10133700e0c.13.2025.05.14.13.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:19:33 -0700 (PDT)
Date: Wed, 14 May 2025 17:19:25 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Yangtao Li <frank.li@vivo.com>, ethan@ethancedwards.com,
	asahi@lists.linux.dev, brauner@kernel.org, dan.carpenter@linaro.org,
	ernesto@corellium.com, gargaditya08@live.com,
	gregkh@linuxfoundation.org, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, sven@svenpeter.dev, tytso@mit.edu,
	viro@zeniv.linux.org.uk, willy@infradead.org, slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de
Subject: Re: Subject: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem
 support
Message-ID: <20250514201925.GA8597@eaf>
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
 <20250512101122.569476-1-frank.li@vivo.com>
 <20250512234024.GA19326@eaf>
 <63eb2228-dcec-40a6-ba02-b4f3a6e13809@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63eb2228-dcec-40a6-ba02-b4f3a6e13809@gmail.com>

Hi Nick,

On Tue, May 13, 2025 at 12:13:23PM +0800, Nick Chan wrote:
> 2. When running Linux on iPhone, iPad, iPod touch, Apple TV (currently there are Apple A7-A11 SoC support in
> upstream), resizing the main APFS volume is not feasible especially on A11 due to shenanigans with the encrypted
> data volume. So the safe ish way to store a file system on the disk becomes a using linux-apfs-rw on a (possibly
> fixed size) volume that only has one file and that file is used as a loopback device.

That's very interesting. Fragmentation will be brutal after a while though.
Unless you are patching away the copy-on-write somehow?

> 3. Obviously, accessing Mac files from Linux too, not sure how big of a use case that is but apparently it is
> big enough for hfsplus to continue receive patches here and there.

True, but the hfsplus driver is already merged and people may be relying on
it. Still, there was some push to get rid of it recently. I don't expect
much support for picking up a whole new driver.

Ernesto
