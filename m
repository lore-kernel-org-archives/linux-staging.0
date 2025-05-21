Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AC16DC28;
	Wed, 21 May 2025 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844887; cv=none; b=sZ0cZqturs8jVlQ289zM/Q9FoKpAoUUncaZYs8mbsNFHEHIeCVrmXayLm33LMvtSD7pu7j3tFd8HnzSnRJMzmD0FD/o9veAgbY7R7LJx4aCOls+rDgILey7Y8s2thKlrK6n0SWCaFajIkkiVKdOV98C+QbJUeq8IgySqO1JRlLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844887; c=relaxed/simple;
	bh=hkYsZjTKh8+Lp6DlZpq/TDRKDHkOiRiet7Xu0/jptts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4kBhrfsy5ZDSmswE1vI0M4LQMvfKCwfhLc7nCS1ud90gX9iuIe4VapnIv4LlQ7RQ24cGw6ANaZEL4P69XYptJBu6ytqbevK+IX+MLTI8NxVmpi9HjGVtn6QpxFhmrUjoE95dKqwshso084YH2MLdvWIarXeAFhVy4f/rXshSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjId7ZN7; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjId7ZN7"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so4486397a12.0;
        Wed, 21 May 2025 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747844884; x=1748449684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkYsZjTKh8+Lp6DlZpq/TDRKDHkOiRiet7Xu0/jptts=;
        b=AjId7ZN7t1KScu/aiF1R8OHHbvht8QOdiGe6ZewJWkOoU3SGWGue3BE7CUBmvxJbsp
         MWy+dA7lwk0lAqt+OMAzv5Z9hZSBeSeThFQsh+8EzBoFuUFkv50DBufXLOzssJpSWUlt
         hX4xPB1ZYkqCnv7JT2izui8wbqMtW3suRMhqr+BThARTPU6qLPA8u1NroWIrM03nSmxi
         G+E4wqGTGI0vZFYME9+HsHvgiOPzD8aXTtdRrm/Peywd5EdHLH+SaejsstNr2+6l4Mx0
         kk90gaGFRgQGBJDu50o1kI7tBTV4xkjKhy2n/F4Q8LBehCLb86ipD2rSIk9J+YUr1n0z
         BDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844884; x=1748449684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkYsZjTKh8+Lp6DlZpq/TDRKDHkOiRiet7Xu0/jptts=;
        b=NIO5N+sG8hHp31eA5/Kw7BnM0PSLqLKGIrX+cGfMYvF7WRPUSZ4ZjJcv5mkFzPmXvW
         xZPNWObenMy6DAcP/VUlxvfjb7mduuvjHulcZhABFknZxNoID1zUlaJsZ0XAlRelnWD1
         Ba82JVM14AHGgXNZJQHHlzjo0cT0z6KqKFH+GYlpZkJSRRrLAwT2ZUO92INoR1ogXRVU
         pjVNYGjqob1SGZcPRqPK/HT9AJOYCRrDwVmrz/GXwhghZuczhan6+HAq8W1ZV1PCg+ym
         hwbnhxB1jaEjW2yrvT3Kryvdaugba/5SEaF+8GQ9AGKTfo0aFpr+vF44DLP2F3yOqnw1
         sTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjfY3gk6/lhmHawGBliCDQh/dQNaBY/zQdl/sAXavVjLou2gfbo7VJBgqVIwXkGZEM/Wjof3vcdbSghYBTzw==@lists.linux.dev, AJvYcCXYpHHDzcowtAYMMxWm5ma5Kj5KLbz0AB3YZjEcTGWIXjemBbocLvGpZxP+iSYHA0274cDmxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx49b3AkC49dz9DPHGaCUQAn49RTABp8iD3U28DFD01G6mbye6E
	PKp8JCkXWFdz3U7PS9/Wpni6GVKN3yaWWyqzmupjuJkQrTDSnLQk7/Xt
X-Gm-Gg: ASbGnculj5G1GqjBlbGPuBwf2Ybdr/071Srwomx7ROoUZfadfj8FZ2j7y2oiv+neetN
	Fw6csXTfTeEbZ2+n/IF9r6K4NJPOU0ZbJuRL8yfnLh9Lt2XpH/qOjO17JqQoiFvG6A0C5Fe3aSe
	EN3XnjQ3Zr/b0qYgH/+WAPXPwBt+dk91oLty3iMTCa3YLVXuBJ2FeRZul+43zf5Bx3cTBGUqv7x
	lHW5+UgxQq/n4z7hiPAkZGjJNuv/hXlcuGNqyBhqeQ0rPNov7NBZHbJLJiRCqv+kJ389CPdG5UB
	qPmLnkMgsNoriS9eSlhZTWBhn1WUMiGN88LsbkJeye5Q48RW8RqJKB++
X-Google-Smtp-Source: AGHT+IGDFAfADczlykPv5P2upLGOWFwo2LuRz6MNJKlIPSGrAoz3aDFMma+mezPuKEYNdVrgr78y1w==
X-Received: by 2002:a17:902:d484:b0:231:e413:986c with SMTP id d9443c01a7336-231e4139adamr268386555ad.11.1747844884384;
        Wed, 21 May 2025 09:28:04 -0700 (PDT)
Received: from eaf ([168.226.86.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eba368sm95212305ad.200.2025.05.21.09.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:28:03 -0700 (PDT)
Date: Wed, 21 May 2025 13:27:53 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Yangtao Li <frank.li@vivo.com>, ethan@ethancedwards.com,
	asahi@lists.linux.dev, brauner@kernel.org, dan.carpenter@linaro.org,
	ernesto@corellium.com, gargaditya08@live.com,
	gregkh@linuxfoundation.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	sven@svenpeter.dev, tytso@mit.edu, viro@zeniv.linux.org.uk,
	willy@infradead.org, slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de
Subject: Re: Subject: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem
 support
Message-ID: <20250521162753.GA6112@eaf>
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
 <20250512101122.569476-1-frank.li@vivo.com>
 <20250512234024.GA19326@eaf>
 <226043d9-068c-496a-a72c-f3503da2f8f7@vivo.com>
 <20250520185939.GA7885@eaf>
 <n7kkoptktdvldadvymcfmnaw3yqbk6bfmzpxvgdkpsvvpc3p7i@ilqcgz7wur7i>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n7kkoptktdvldadvymcfmnaw3yqbk6bfmzpxvgdkpsvvpc3p7i@ilqcgz7wur7i>

Hi,
just one nitpick:

On Wed, May 21, 2025 at 12:14:53PM +0200, Jan Kara wrote:
> We already carry
> quite a few filesystem drivers used by very few people and since few people
> are interested it them it's difficult to find people to get these drivers
> converted to new mount API, iomap infrastructure, new page cache APIs etc.
> which forces us to keep carring the old interfaces. This gets particularly
> painful for filesystems where we don't have full specification so usually
> the mkfs and fsck tooling is not as comprehensive which makes testing
> changes harder.

For the record, my fsck [1] is far more thorough than the official one, I
don't take data corruption lightly. It's only for testing though, it doesn't
actually fix anything. And of course it could have mistakes since the
specification is incomplete and buggy.

[1] https://github.com/linux-apfs/apfsprogs
