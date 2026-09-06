Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9F3BAD81
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788711948; cv=pass; b=YmZB2pRRLGE607tjkLcSGdKsnqosgWNZFFcUKbuO7QWkacLxAs8Tqw6Zef2Uivx2wd6hcxRrFhM5Zg+m+dQeSsojeqochV+rirFftWw+dV6DM4kJIggw3RbRZjbeQBh2V6T0JQP93ylxnfb02Z9hWgbdd79XxGplqQVaonAvTQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788711948; c=relaxed/simple;
	bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqsNK1ZH+Dm/ZtC1bqlSRXDvn5Dlk+L134wL8WrjneZqxDeI4/yHDlxQ+AUF2zBu57hHam/liioJGocirLa21xeLPlM6aD9WRtI9z/d0yS36ZF4MA81ylqYCphzPyp3aZWI5qhRPI2fMyLEaG0O+MJHdOW3VhWWpEjuSPa9/JBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKi2j1br; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKi2j1br"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46aef784ddcso978315fac.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 09:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788711943; cv=none;
        d=google.com; s=arc-20260327;
        b=jaU0TPg86yjfRuLKfw7KQtgrIKch9ql2O4CmG89FWPnQH2eWHdBUwE99FUK2rgAFw6
         UsyRNt4z1LAko/737EWRlliTL+6KYJfpmbV0VQNXiJmSq/4M9zGAorsrgOj975g0uriJ
         G/mSjhJy4l8kSXxXEzGJC+idi2yY8mdJeQGlGa8I3J29cF11mAJyKJVgw5tO7Lw+PpE9
         u/TTVQsd4vFpyrlDexS89boMyg1+8KMpM2/HEzdZUJHNfC3jpfQTQe/Epv8RmN4cBWbf
         mWLBddVoLx4zIeoGHYpkDhpURjKnzcjqGJiD5W66vTNhwEGcSOqteF1B6v+sW9aIWLKP
         GX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
        fh=4f14GSXcmhcYUmHyKblBLOQxcBH0gmd5UB7d3J6X+aA=;
        b=CO0gh2KoBXmoSG6guedcaLi+ufcx3i1+8OlkGH3b8aLw/su3sJZoF27pnwgcyRqlPF
         QI9GleT2Zuj8JV/67i5IYp0ja+8p1d90oj8XJE96lqZfYkfK4v/M122Z5L2YDQzRpk8N
         g7ivsf55OPP3X8F4X+qUvwAa3+E42e43XKEvorLvjoZ+NZ4L7RSDcRpTD8czbnT6Z3iO
         R48ENs5BnXikJkYwE7kqfq+6Aq5SC0xv7HnbPAEUIXt9z+hkD/6WgnCVE+CobH7F2A6b
         9vxLSoewjC/8j67B3uWcT6WNVum9++4B9JC07AHh4bP8KrPDWofD0MIA+YfMSmbANbAB
         g0dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788711943; x=1789316743; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
        b=HKi2j1brWRsMppyRdw7bQyy2E1eAWG2oeWBAvMZqeyrkA3ZVsOiW3vuehypgV7ViMO
         4stdm/vht3byL3aj2NIAFTN2/Q7OQdgdUcJIfnf6xDnX1m8n9Xjo7GpWhg6UdkXpCNCG
         ovgle0tHtXW4htFNBwMTNmC/LMpQ6qwB5/O5c+Sg2Co/NklaGv5I3H/2v5XtvFgS1okp
         YvUQVq3cO8uEW+3QX7T0Q1u4go7JN4q+VMxryIj2V7w4kmJ0dmcLzl4EYt//q0PWBVKK
         ouN4SPA4smE2+a78WUmpTgaxCjEZ4m6KazIhJuGdk+zDMtOD1fwLTfrGrgFAJXihK4yM
         FvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788711943; x=1789316743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
        b=sUChAbNNopSkxTsW63py4WBZCyZ9RX+Nr5SfY/lCjrzT9yjUsPdInjfnz9ou2TnkuU
         mQnb8jcuFQZPSSCg5BDzquXPG2TVPcdxH7J7o4aubq4908+u0uuNAjuT5cKYAeoPaxV5
         PjZYn+/3fahq8dP5bsA01JpeIOWOdG3WdNzyav4v3orllcXLHXrb9XhEDI5bd6z5uItH
         exm6VI+r/ZOaBZf8KPJlcfOAsouzG29mrL7r6g6XmKTVmHfSIdR0Ckyvv4BNngw1COm8
         E97EQPAVJif5eK66oSLF0cmeE1wiz8ocZsz80Ki6+Kvi3FIcJcYzgJCeGi5cwcHwIvuj
         fDZA==
X-Forwarded-Encrypted: i=1; AKwUvByEubDlu0mFkUkrNQoUxm5nPiuhJ+P244SR0SAJWSTDPsD3gAVkpxDOI0X4wcyr9Kdn7BFgmGivoFaUej8L@lists.linux.dev
X-Gm-Message-State: AFuF++m2HOO/U7oB2PlmMJ53OgIj8LbLvJryE693/Kl6SkEY/6quvO2X
	NDa032xI0DtLjvlBZ2I0aLaZms0zih2DtelX6afchVd4nOnVUaqchTZO8LV+9itD9RtrZEUGyIC
	npr684/76QV4xhrbt+xvT2vBR+Saypa0=
X-Gm-Gg: AYBFou0hsLweS2n2/+MQoOVU3laxSxZp8AxK+lWiBRzfZdP4c30w6cfAKNN3s9u96XA
	94wq7FM2iwNO/I2v6QtIhuiS9/ngnCgtJ29N1CmhkMRZNhxrXuF+GoxWdjEmMeeRJuKVxq6OqHN
	HdgIO7vkO7iVT54Z9BerWWKL5st7brDXFQoNxbSucsiXofXPB0k4BFkC5Ffu6RDYDG5LL3Neqrx
	zNbNcmWnGLkkia/kZfDBiW9xX68vbcD7sh0HCnxLasBBWMFFHhPl5FDeEFFeIFfuEh5nFUsDp67
	3KoElKmNaWOknMTVOF6SaulIUMH+qIAuHTXhlDTYBn30hsjAVLVPbxj1
X-Received: by 2002:a05:6870:aa9a:b0:449:bccf:bb67 with SMTP id
 586e51a60fabf-4755157d71amr13380565fac.5.1788711943580; Sun, 06 Sep 2026
 09:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com> <20260906162010.07781ebe@systembl0wer>
In-Reply-To: <20260906162010.07781ebe@systembl0wer>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 6 Sep 2026 19:25:10 +0300
X-Gm-Features: AcwNN1W60xdRW7NqkHxR6ohHNio2xhsVYb3KM6Hg5RkJycqi7OOnjevUnUQBUhM
Message-ID: <CANpqX3aFVx1KgF_THty7ba_DVZf869cto1F=qkikjjSCjkueEQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] staging: iio: adc: ad7816: Fix SPI read operations
 and VMAP_STACK issue
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi Joshua,

Thanks a lot for the detailed review and for catching these issues.
i apologize for the bisectability breakage. I now realize that
removing buf and missing the lock declaration in patch 1 caused the
build errors.
I will fix the commit splitting, adjust the commit message wrapping,
sort the includes correctly, and add a proper cover letter
description.
I will test each commit separately and send v5 shortly.

Thanks,
Abdelnasser
