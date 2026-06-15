Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8BF3C0A11
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514647; cv=none; b=nPR67RCqefGF+OJqv1+LykPuqrcnc0wV5HZM0+K+6gfvL2ipD6RegIcbEbp28B/2f+XOIk7VzF2j2Yie4xMC8BjxDl/zSXx/6/tnbbNIt4+ekR+nld0P2JYV7VSt8C9LryN3Yln/VJRhTsLNXVC1mkRHBma54Vi3yrISlugs8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514647; c=relaxed/simple;
	bh=C61Nk63JjswpbH2JNRjVNNoaYKM311GzvhFjl2oj6GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTWl4NdbD02QjOqjwT81frcmobSwL3ADysQ8urrMlaSlKdP1B1ae/DV0STLjPEB7TwieHbz4l75LXqxZrIgNae8YycJgSdzVraAibDgVeDlDNRbfyVILoaLCXaV9pS1Qi8pEwamfWPl1c1doVRWK6c5ZwftgzXglmPWyvue5lY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/YeOrAh; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/YeOrAh"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ccf7b7d188so38146946d6.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514645; x=1782119445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ulnDM8eeKV61SQBMzpbZyZzQXY9+u4yz3z/HPp2h60=;
        b=D/YeOrAh1kc2jvnGv3JcFPO6O6m59mHHLfjYgcQUJBdVM9qvAuwqa3eFm1QXLl6HGi
         5dan1lxbLJgtaMEpoFDJHjLAQnXM73wkLN/ozz2a42jP8sKa3G0JcAGPNCZZBhxh9tUj
         jLrGKWmVsi94boYFK0QsL0fBmTbl92vOmdxvLwFM0CRKtDujYa7sa/Yny8ctbcDCSbgT
         cJg/8WBYjFgtR6Xw0vxoRLoxuPT+YBWctOxhceWXKFJ9/fJ1nnfCFtgOLTwoFCJou0AU
         L7vBd+Vq5SjIiOlDvitDiCgludGKII1XzO2zC61mRkm6WQ6S7ejVfE+VBjTHXFNk/f/x
         XYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514645; x=1782119445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ulnDM8eeKV61SQBMzpbZyZzQXY9+u4yz3z/HPp2h60=;
        b=TtRQXntGHkFEOJbww/qUYiBMgSnL67nVvoM7LW/AAejJd/aQJ3Gl7Qr1Pt/dnQ89FY
         +GuYOmsve4Vc0BsWw7RUnXh3YTvRD+bvXMO2ZxDu6pA9EwqhFGjQdIGKzP53USHIBNML
         wkDiAAbTxHZ7e0HyEycAXuG+jo5WVv+T/bloHHRxft0rPNofwYsvn9Jxi+Pj1ni0jusq
         1LjBWIC/Drvw8KMJW4WORDoh+2TmDPJbC5bzVj08x4hvdttm5N9oF85xkKmh76CXtxx+
         wUM/SLu7WqEBc19odYMMLDo6qkUSi5kXs0CZ3H7p82leN/JnxSVXCItbPKrkS/W6SUln
         6K5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+3K7K/vH1hUI6to8f8uavZxyQW8UuQvhyhdaPa2yAdnTRSO7a3WNaQPpYxsPKah48aGnHoxAPjYRyNVXFO@lists.linux.dev
X-Gm-Message-State: AOJu0YybDKDFO1IkeICjRzliJFWiJA6L6/jnzp0B5/3DbozdZ7qN3N6L
	RfeK9oHv51Xz6p7C5FtwvfU93JSTQl78E8leEsIreNOqiMhTFsO9b5zX
X-Gm-Gg: Acq92OEaDXzV294hEZO5bSsQw4NW4QA8P7pMaNjoo+dCmvamOzngHhDWMkSlNGPmrqM
	7toMHBDqUPZz0BHsZAXCO29CnL0X1WOEhfaPILROgbeIUOFS92r57Z9Wn/4zgJ10UdKYmfUtWLh
	lCGt5wF09QdsRJdUZG/Vjo0TW57zYOoicUb3CvJQx4ivB4y4ze2dq2cVfNyqGOWf2iiG//PIFgk
	Z0XvbOgx/m0Boy+Vi7ydW+evasgPbtBAchhlzihOMAFifm7dvImn1a64aAB0oSD1ivYbD9kSkz0
	X8QkInVHhRnpxXjCw1chGaYUD1QyNMxMwCJOiB3KCPM4e77DO7u3EW/sy/DsKqGau3tnZGrBCAL
	NtGFZbIYJeslVvWj9jIvrrmyy1FlM2bgokxtiJO7oAGCz2vHZLgEOttJ4GB+SbEiS2FMmPIhGGM
	i+cJRn/IJSbFGvkDQU
X-Received: by 2002:a05:6214:624:b0:8ca:23b1:f4a9 with SMTP id 6a1803df08f44-8d32c012b44mr213414426d6.2.1781514644732;
        Mon, 15 Jun 2026 02:10:44 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b271e7sm110094076d6.14.2026.06.15.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:10:44 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:10:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] staging: octeon: add missing tasklet_kill in
 cvm_oct_tx_shutdown
Message-ID: <ai_BjUJ5sJGJgtyd@stanley.mountain>
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
 <ai-1ZsF3dzqXZcbJ@stanley.mountain>
 <CABJ81biRz2J7AJbo8xZ9TbmwAT8E7x0kdQP4-W2e3XZ729qWRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJ81biRz2J7AJbo8xZ9TbmwAT8E7x0kdQP4-W2e3XZ729qWRQ@mail.gmail.com>

On Mon, Jun 15, 2026 at 02:38:53PM +0530, Ayush Mukkanwar wrote:
> Thanks for the feedback, Dan.
> Sashiko found these existing bugs in the octeon driver when it
> reviewed my older patches on octeon.
> I will include the required details in the next version of the patch.

Thanks, this is really useful information.  In that case, you need
a Reported-by tag an a link to the Sashiko report.

regards,
dan carpenter

