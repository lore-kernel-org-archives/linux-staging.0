Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD653B2FC8
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155612; cv=none; b=g5sAK2Q6Qajs0/kJ2sfe8lWZTJAq4pUgqRmHMCc5x1aGFGuYl6kKxDw/Dk1iPho1O9j4DKROtXOy0SCXgMy/3CmGD2xw2DsrDptNos7Bd2TtjN2uuEqtmNelVsstFp0B94vZ2pfO6g6hRl0rPpG/LwaPF3dNt5NMyNFeupWQPBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155612; c=relaxed/simple;
	bh=T23ocOb3hJrpEyXeDyzy+yRX+M3NaqeBUnlq2hnGA6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaK5sHfIXZJFNgFC4Gbu35tswvQixPxNcNBD9dRQVl3BuJcJCPpE0/wIAobtVev72oBIk5Y/6ZdMV60tDUTTm4tgu5mqkFAYIyKe6Dab6UstkXfWoQTl5BBlnpaxelTyw4Q6aTAPWhhKYK0rx6dETchvyDSU0BDiuybMXHfd9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4fNHr+7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4fNHr+7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so5297614f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776155610; x=1776760410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T23ocOb3hJrpEyXeDyzy+yRX+M3NaqeBUnlq2hnGA6U=;
        b=X4fNHr+7ZdfbEO9ehovaI7/h6/Zjg5WNpB7aMAMkywiRRiO9b9yOA50iKiWty87T7Q
         aAapWd7vZpY2cCOUdC8UUvODV90Px3ZBksU+GdRmJLQDrIxpJ2c1hTxiPxJW1uQFXInl
         tAS7kMucHdKAjqnbEvbX/8J7YTMAgBg7hfKnV/HXlMtALs554DPW3LRkGn1NrbmyQT/w
         b4Wt7g4qLOEPA8nTAB64F6DQnDMoUJE7DmxZXEFGM1kgMTBT0ItFgrEdAeKmt6MisTlC
         HVJEJuNyC+6UeJI6QrLdVhZfJeTNha9azzIq31hMxWTspmd7UzfKT/wSXh9ULdtxNnfB
         NI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155610; x=1776760410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T23ocOb3hJrpEyXeDyzy+yRX+M3NaqeBUnlq2hnGA6U=;
        b=TXYY8MbtHxvgh/EFpwQ6oXbraqjGSAIieuwd/W82ChNyxCjA7XqakbhRYreOlXTBEq
         Owscgc+BqeK4kC+cdBQQPH92q/aLTc+H+Kf+5yoqajGFs9BuAIxas3CjaamFbnkTbVm9
         DkgGjckY7Z+hzEM/uuH4K37zKl2FDC0JzykQ7zTpVxlhNb36SMfKUvaF4o+R+J5K1O8U
         rrkWZ/u+AM3YpE96e7O4ieCt+NHnlHnPDqBEr5ax5yKqBk3cHwO4PNEgS6k7W768P5Zv
         0ZlS16eajCgw6T2CZKBO3jxA/8AtHduYocoCz2l3K/JEutaIrs1fS8wqMlFpTeUKxG7P
         L5Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+YNto+tL0zLNZxWgWodGF9P//IJiSfQ0+J6JgZV2Qytrw95UqLlgMDqldXbhHoBTks61zwielpfI5vxWOw@lists.linux.dev
X-Gm-Message-State: AOJu0YwGhMv0qnvcqydghf8C6AOW07XuY3lvtWBD0FtMQe1NWYEE6Qxj
	tNSE+LaSfwtuyw/4dniA1ONN4BzocjC9XTHkIdYzh5lv+SArC91AD9iy
X-Gm-Gg: AeBDieuLNsvsv6VPreGVluuY/z7MUYKgSRRHVVsmGgbVfx4EXp7xTwkqm4zsOF/AdYS
	uBYhioEAF9qWyT97zTBeA1C3ZVeYj+ekmF0N9QLIT/GnxZ2DWC+j2vZ95Ch0gYgEaD5k30lFGJQ
	cKOmtZmW3fi0uqk9M1yKQFsj+zpHFmaRoT8kJiur4iAs8h0bgRk66KG1zV2CL+IhLbuKkGExM9b
	SBWHqUrD8rQ4aTUhcGv60lhhRKhWY0pcaUUmj/JiChNKMiyNRHglsIzeoc/lB43+Hp6ajNy8NEG
	pkTKG+xXbhZTwZmEpn2P2QLtygtOXH1DOWNUvSeTyltGvfYBbQwBfl4C0yMjDKN2VQn8BbYdvwc
	kCnsfCPpZ+jKt4m3GRHYjPG5zXB7bulwl64euqV24vijUxLep18IW7CFSLpwKhHPj4JCUPgCwXH
	9IL5uMTN4iPNX8csX8
X-Received: by 2002:a05:6000:4021:b0:43d:7854:32ec with SMTP id ffacd0b85a97d-43d785433bcmr10582621f8f.17.1776155609520;
        Tue, 14 Apr 2026 01:33:29 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm9175539f8f.32.2026.04.14.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:33:28 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:33:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad370g5G9eUWSX_E@stanley.mountain>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
 <ad3zDOhTjfwy_vj9@stanley.mountain>
 <ad30An8Oi_D-UTB2@stanley.mountain>
 <ad34vKH8FhDIWijv@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad34vKH8FhDIWijv@ashevche-desk.local>

Really _obj() can't be ZERO_SIZE_PTR either, or if they are then it's
very difficult to dereference them since they don't have any struct
members.

The main way that ZERO_SIZE_PTR bugs show up is with strings and NUL
terminators.

regards,
dan carpenter

