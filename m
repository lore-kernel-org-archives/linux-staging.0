Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294E8292B2E
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776146371; cv=none; b=nxAVZ/U8PZmjIPHSuTJKC+5r0W9zrWYFFEbv3Mwwh4nwp1RQa54JfOQbJw9+xDUcMRMewQmaf1oU2Ug0QMpmsLwvsYbecMbeZLymRJjKTHc3ahwwoIvlaklawuUNkz4Az8+0KEd5+0n3sQIFZVPrpIgGsl+kPZv/9P0AhCWpUt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776146371; c=relaxed/simple;
	bh=h7gBN58EjRQQMvn8M+1ZSRiH8tjQFGCYIVSdJFxvbXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDgN4hEvjtMfMkbuq7ABdWkeLRLn28XBB1tnBCeXJ6A+0F2b+nBHAOym2W+3TKQBBIUbX+Rko0X0oGSSbKh3y1OnnbLr8XBxChsSOkncM2kGqhwgk21FV2/JFFDNrtXZEqNx7KCYOy7PCyiM5SLwbjAG3VO75Tijj0v88g9+74M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuZ/jWmM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuZ/jWmM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so3089928f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 22:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776146368; x=1776751168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nV9NMG+kVLWQ/8CwHF5xK3P1P78smFNGOF9gK7QyE8=;
        b=WuZ/jWmMp2j/orDfJaF64iGIWLVMnBFUULVOiLPawQXLuyrP8UjnjIWoKBBWhTuuAC
         XTtUGGzEXmZla39Hh8qEcz/+m+IJB3v88LQaJMFTebFrxkOxsAIfRyI8IgstJc4zZoLz
         REWH0HTXYGRux82Iq/ycplImh+4gWjYjI0z/KydhpdH81OGkhkNO/1vlz8s6eZtAdSk6
         YVutfYErtLkk2YrmO9Kkkdc1OA/D2CLCQMPUglkQmJVpZDjKK4pi5YI+EgB3a/M/rM+e
         5/3HjRraVNA9m4c4zQ3aShWeXEdsojbiSKUVJkChVqkQR4K5nkXUYwqCnccWnsLsSbe7
         EuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776146368; x=1776751168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nV9NMG+kVLWQ/8CwHF5xK3P1P78smFNGOF9gK7QyE8=;
        b=Nt6D2sEtxhrV/7SeCS0Kce+qjyLTXDzMowLzfO1GTSrZXLoYtpEvDtVLhFsUw+kqJx
         F9bL2C36bFGjijK7mPMWl3U4zyqfd/fi+1YTOLAjJOd6FXh3qjThScDk5LJn0m6O5IDy
         9daRCjVJIJZF/M8J0JFeQbURgjcpPcsDaugVY9WTrIZuohV68hP+RcIUSX5FEnYDd20V
         KWFTTinWwSb6GLVDxDDeY/FQ3x9VGdcqLgJDZ53ZPjEZ9B9tq9CCPmW2HyaR1xlFXglt
         2kApBs1R/M5XHl6zaCLrQgN5r3DZl7iiT/JADtOS00L0/Jj0qr2dj5XDqdZQbziOZl0l
         JTSA==
X-Forwarded-Encrypted: i=1; AFNElJ+g5SE6IbPfffZP1MjHpayKDPcWbg0hNueVnMIyKIlcpYgd+NgM+N7W4ndJjFj4tiEG4QLRyLm61Nb0qlz/@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhrfj4FsRhru9Di/x8GhynkodvAFtWMjGtxzwlWQ0rpOawoEt1
	6FKYfy9/AFEJvZaQ4zLg3fT0YFJBXD4ITGXQ5ykqRhXbOUAmh0uVfbX4
X-Gm-Gg: AeBDieshAkh5i/koUHVZEVM0/hQ9EnvIi+MC2NzINTggentFIL0vlVT08SDf1LiIjfh
	vy49GaBcLBAdz+La06Tv4sdNa7MLjscYAYdll4hQKe1ZCIP5t2KA2YXnEkmYTdOE38LUpE0rSg+
	PBzGl87TmkZfYqUsgVGd/M4Ld+zPHuFD3WLxx9M6Z9Og+0+kucPKZB+Pz6q2X8HlbnAs3zIZGVN
	lsBXEG3SJER3OLgn5HWxdV6+H/kMD67Ti0DZcIqLJhpKyqrxOYOsTbicd1DVRimENwO3S8VtJSq
	EyfQntWNZ5Iw407dvxFH3VoeQNMWOtpaOpa2Q+oTBIZEqUcYj2gvUKdkSV1xtYz2eZu9asb9T8Z
	zA8PdjrkKjHjAGgYWxKafR4tmc/eEEs1YOC4qlc+aLbFPfCAWCu+JH2n6hojFm8lSDmKPduUIPN
	zrnWmwviaHm7Si/fSW
X-Received: by 2002:a05:6000:2305:b0:43d:7946:badd with SMTP id ffacd0b85a97d-43d7946bb95mr8982083f8f.35.1776146368461;
        Mon, 13 Apr 2026 22:59:28 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7794cce5sm15967410f8f.9.2026.04.13.22.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:59:27 -0700 (PDT)
Date: Tue, 14 Apr 2026 08:59:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: gregkh@linuxfoundation.org, --to=ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com,
	andriy.shevchenko@intel.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3XuZrHwaUiPTIM@stanley.mountain>
References: <DHSBOBFQ3HZK.39HN9XAYE4BT1@gmail.com>
 <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>

On Tue, Apr 14, 2026 at 04:14:17AM +0530, Shyam Sunder Reddy Padira wrote:
> The return value of kzalloc_flex() is used without
> ensuring that the allocation succeeded, and the
> pointer is dereferenced unconditionally.
> 
> Guard the access to the allocated structure to
> avoid a potential NULL pointer dereference if the
> allocation fails.
> 
> Fixes: 980cd426a25747daf8ed25e2a1904b2d26ffbb3d ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ---
> changes in v2:
> -Fixed spelling mistakes(dereference, potential)
> -Added Fixes tag

It should be a 12 char hash:
Fixes: 980cd426a257 ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")

Remove the blank line between the Fixes tag and the Signed-off-by line.

regards,
dan carpenter

