Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C01514F8
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 04:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241241; cv=none; b=SDX1daJy4JJRhj8nzS/A24pk9IDZJOPdW5PTQFhudP4rpZPxnkJx6FV3Mhj7u0qLOJLOwq5y7fZYiU/TT/Z+0q/u6RqvuZ5VNRec1IZBfLcCCOfhWQ7t84c/qxmmQKD3TRYXgelyMwlZxH7UYNccGFmuO6vcpn+QAwRFr+iG5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241241; c=relaxed/simple;
	bh=Z+IPpWAoSw2oWYRiT8Njd5oaZnvVpi0smT3fF9+5wB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=t/LC/WxQQ2ONg1RyIbQUrHeLl0HSn/pV9fuRvh/aXY09XnjU1mLGkLDAQZICLzgjmdNKH07liRlWnUIyRrJ7dq6rsZgDecfvhnZk8xyajdIaPiaEk2QgOZKrwgesiW0zvTG874YLYoPv0LIWhcWfuUeBmuux7vbj8VVFdk8ZLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFVBvQC+; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFVBvQC+"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7947cf097c1so21020537b3.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 21:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774241239; x=1774846039; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+IPpWAoSw2oWYRiT8Njd5oaZnvVpi0smT3fF9+5wB0=;
        b=QFVBvQC+qoHq8VWCyqvVNnUVD1eCWA8+YYXA36lVNEL6Iyw/P8wITp4XPHIvUr0v+v
         BhD4AHx7nCK44zgiNt/HqHaRy9GM6dIvZUcQAs89FC7zF9f0bmOGOY7TN8z6tWYYUNmq
         6qwkPdPHQMxrwBOIpVJNeBu3N52V7fBJzU/by2eJT4inLkOMMdCH0BqhNwLWTakrUGP3
         9jevXRq8FcOAreuYljTefQI/pNukv5q8nyD8s9YyOCvagNTWqqP0nrp/ZM8vYsgC5xsb
         cfA/rqH0sT5sW9gjgKkcHrW2y7u9P7SsMJ3KaN9DwjhJjoiNYEaEK0Y0yP8Ge7rmTLtx
         dvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774241239; x=1774846039;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+IPpWAoSw2oWYRiT8Njd5oaZnvVpi0smT3fF9+5wB0=;
        b=QDvDjQzKRSZ27QabF42Njj4ycbePc9bKqQQF/NgXs18YA20+Ny0X0UIx3LKkb25eJP
         n/H/qyLmlM3Bp8mlvk73CKNADaf8eag01oz7bPpTbHUYzaWmPey6NHyuywL34kVdoOT3
         02TFJPGui8yRZXixGW8rsTPVdNygemQPWrDkyFjmXiRq3EykOV13NIiJZCN+V52+J08k
         JTIilfKj9YSviL80gAkQZ8CRYPv51we1F89OT3KN6uY3Beuq4FG4dQT+oTOGPEW8RDwd
         eB51VPTruaX+vLAxBFsOtZDzKsOMkpq7/Qqv2hObG+nIVZh0rbigoHLSueJtoS4hV0yc
         Comg==
X-Forwarded-Encrypted: i=1; AJvYcCUDEimDRX2Gkh1npt/hczRbGQaPr6M9SboP6pDbTyJB8RjxPA2NOLqm3d+EN6xSZl8eaJGOicVHosf7bvTW@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2i324tPHBgkwVis4EZGUekOy40lcEHI14bcKlRJP0OJJjkHop
	1IFat3osd0Dkk6zVq1roqnZ6GdW12oLldAycnuB/jhEebCO1flPB/XRFj8MOV0kq
X-Gm-Gg: ATEYQzw//Pegzq0Z6jZlmE9zfQ06XwXOR/vk+sW8gdXfq+iCTSHg6bpBZ/QkKBH3ZMb
	5kgVeNoGcGYL8qw67pZfdixzr7AgqY0Qcj/FOylGqAvLzLWT+uIkNGUDTWWK4BMs1gaKW0r1xON
	C5hLrmxJI4ABPd9Ho5Icyc90n4+J3M2je4oH8VOkHMGMh4KPkbiYXz+xZeU/W42lOMR+UZ3djFt
	GMQtFSJyOT8xeNB4n6mAB4pSUfw7IHVvlUGoE2Z2WjAmdBGWUnv9rO7pYdlyVTAlpkyuJ2g+gL/
	dmA35ikTFDfBe1z27seR3Nb0qS0Rn+JwYH/V5WTUoHC6aiMr5v4YODL066/1QqA/PYEUMfnNFBl
	zv9DXkuxh3ezIGfCP6jOzXLmejDVOfdwI0cd6YyrIzmMZRGLDfZm7BqnKNrAy+9Sw/wQHgKF6vy
	04PjOhpugJ02Kq3qNVWhCAYeNK9pObf72GbLEMVTgZcl7XUNCH7L+gNC/DRS/YQdWg75FfdotMa
	UV+7RTY6kz9ZrpwAFfOYt5vkqSprYZc
X-Received: by 2002:a05:690c:11:b0:79a:41e6:b212 with SMTP id 00721157ae682-79a90afeca6mr121710777b3.18.1774241238794;
        Sun, 22 Mar 2026 21:47:18 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9040c2dfsm52207547b3.21.2026.03.22.21.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 23:47:12 -0500
Message-Id: <DH9W0XSC8U6I.3P3AVQT55L4NF@gmail.com>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused function declarations
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260321223347.7054-1-rayfraytech@gmail.com>
In-Reply-To: <20260321223347.7054-1-rayfraytech@gmail.com>

On Sat Mar 21, 2026 at 5:33 PM CDT, Oskar Ray-Frayssinet wrote:
> Remove unused declarations of MRateToHwRate8723B() and
> HwRateToMRate8723B() from rtl8723b_hal.h as they have no
> implementation and are never called.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
