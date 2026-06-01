Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C539A7FA
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312285; cv=none; b=t8t1otRyXkmLiTDsibYj9sSlN3syUqHZ/1x7NN3H1U56v/7tKXFrbewdZ9Ih/bIxaVm5DHGC1/29hQLVmns4/FSLCEMW6m51vVf81OaeD45uDqpdPedSlC+HETPIoSA5Eulfzga1p8Ebf+CpjriXnBG1RBE6UEbHzrZ9LqWAsLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312285; c=relaxed/simple;
	bh=WIRZz17IPbf7U0DDxKSld6m/921piQU4debaTckBA4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0LQoLzITI/d2+CXW1oZzuSEc9yeFRkahm6CCr9ACPApYsTj4RgdOkn4gWKPPBt8reBkzna4xW+KM2xJ+1pWdgrX08GOG/3ijfDNV3IR2B+W8aMYb/gKc/AtOXxc0y/8htlfI3OauYt0M+NAvl8YlkgXajxcjlzbda6oxReXXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jttSDmTY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jttSDmTY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso351417566b.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312283; x=1780917083; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loANV6xVkC4/ZyB+WLRWNeFq+CyQ6ZupDl+jJ+YjH4s=;
        b=jttSDmTYLaGnwXkqdmqD0wcmFJjb3eCbtelCl37fecUuBbW0BhK6+FAH8bZuBwj6EF
         pVneqgLvyNkjsZVyBh5H2Yii1KZ8ciW9KGuHcUVTAJ+hr4IQiQKPhvCrhhPYm4Qkdz15
         ZIejUMqJtr/GjWG4FdxrfQIWad/wlYy8CbJduq4/tRvcKma7GNAWRAAMezRgj7f/Plmz
         5mwh49L0bxjwawLgom9w29xnDEnTOnsOb0FAZ0cxsEQw7qWpkfXuVzue0rCubC1zEc8j
         dL+8tWGSwDEZWmYNFGXKs1JRixiROHd4Uuw71EQMifOP0LuMprrJW9TYjX8GSUO7JIRi
         zM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312283; x=1780917083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loANV6xVkC4/ZyB+WLRWNeFq+CyQ6ZupDl+jJ+YjH4s=;
        b=LStx7lV+nAIw4aHhKCuvKPAMy9KnDj4+1MIrDh1BwK+A13tmfCVSG0QHsxuh6tIiUo
         w4KXKnXL3R1GH4/0Thp14iREKt1EHAUIBnl+L9SKbR821sSX/ETuZv+r9meEmqLnBxtZ
         M060RtFvyDia8i/VUMp1sVz+luE1ci5lQbreH8qhAVrkl/dz1vz06EhcdPfpdS8c8jw/
         DhLQwrGj3SmjZNvtAN2eEqPAuHEkDPrS8m95hz8dwycct1+Wuxx0RqFu4uL8GeZc8DjI
         91KTrcgNffj5YrQ6Bi4C8p8Bk0i8AdG0zaHeYLI98ae6oKNcH4Vs7HB6pnzIAgzE7jQS
         o05Q==
X-Forwarded-Encrypted: i=1; AFNElJ8yhgaG8A3K7CuqPBYUnSEKcuiW/sqJ1gOyylCLmiS0+Idr2ZSeN+4KjoHJuwrZwfnPKK6DBb5gBSCbQAFf@lists.linux.dev
X-Gm-Message-State: AOJu0YyBDKu6AoqmrqycZeTPlhT8yH+BGuyGUaT7CmQEyUH4WtJsFb2l
	m+qRtet0wTxK7oUlzqfSN+F+JOYGxBLOVBZ558GSkaBp+M34lwONr5mXe/N0wA==
X-Gm-Gg: Acq92OG017PkI53UaFeQvG0BMOg8rPar2kk+cnW7/C6RBj9DWyL5iaNsLUOw0/txd6B
	29OFItCxbVtJOOco03ox+G0XDoq6pPp8pmaJdIXZqsOdZLoeXyLDXlnel8m2vLTZsWOodvSTJ4o
	ccdrAGVMfmYBX9WbHEqpPOdPU7r+4ILWoz5MNQZhqEW+4ABGxsHzFLVighmqcxR9ok83rqSdYSN
	6Can14Kp+6KCcJCWfphg/05Onb9oqvkX8NzQJi+Fa1xPu16+9rzahRCTNJliX1WJ6gOdbVW4B2x
	0h+ErXNvheYPytol1XuQszEN1IqIvVaeaKZlZntE7/oWNyi73WKdXZKshKFR/+4yAyd9lpe76Fy
	k9tJjAjXDRenU9MUWERp8xa5j/JjZWhsnbdw9sI/UTELqJViUaf84LKY7brA+VLeai64UcLL9mU
	ig+PWF6Yjpu2RGE0hwd14hfDJoQlPlyFwfQQ==
X-Received: by 2002:a17:906:ef08:b0:bd5:7c2:70ca with SMTP id a640c23a62f3a-beab3e3a038mr575952666b.48.1780312282762;
        Mon, 01 Jun 2026 04:11:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beb05fe1687sm221880466b.48.2026.06.01.04.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:11:22 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:11:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ben O'Bryan <obryanbw@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant parentheses
Message-ID: <ah1o1r_4uEuTbLFV@stanley.mountain>
References: <20260531004140.99743-1-obryanbw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531004140.99743-1-obryanbw@gmail.com>

On Sat, May 30, 2026 at 07:41:03PM -0500, Ben O'Bryan wrote:
> Remove redundant parentheses around type checks
> and align conditional lines to improve readability
> 
> Signed-off-by: Ben O'Bryan <obryanbw@gmail.com>
> ---
> 
> This is my first patch to the kernel so please let me know if
> I've done anything wrong.
> 
> This patch is mostly for me to verify my environment. Assuming
> everything goes smoothly, I hope to continue to contribute
> more formatting patches as I get more comfortable contributing.
> 

We don't mind the extra parentheses in staging so we disabled
that checkpatch warning.

regards,
dan carpenter

