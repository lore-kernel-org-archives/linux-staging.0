Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9177D23372C
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372520; cv=none; b=CisJxAARZK6o09foporRGfhu1KZRgxi+/l4BGi9Nk4unfe51CkbhXqfr9l70b4BQDxDs2E/Hqk4G73Z8yvJ5xfXjDeVUfOqQtNChevM7TgNkWhQ6ny1TVpranG7uOh4lzHHx2VIfa+sdQ2Q2Qm/ywZK1LUYGCPElKGw0cKB6Wxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372520; c=relaxed/simple;
	bh=R9+WIH3wYXS84/BbqamyGdntDz+CuAbNdiG3gFB8eJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKRfI6P39qlyqEfdJNzuF4NvSyjkYDWIpFbDKdO46UyaqyBogB4S6CE1npBdU6qsHfBXfqG6SFRhaw7dz3gcOMSHRniqfNcq0sg/f+4xd9zVY5KqOPUl3y62QSK6pvttC4B8aGIE377bEwUVBLZ9e7XarThLMutdcCLT0CGZomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv8wg6xm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv8wg6xm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso72915735e9.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779372517; x=1779977317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9+WIH3wYXS84/BbqamyGdntDz+CuAbNdiG3gFB8eJc=;
        b=gv8wg6xmwFwTFLjYW+tib7pXh8Z/BY3X/06jXS0GsrrBCb13qP0AmnrMaSfXpa/2QG
         5Nui7mgf/jGTEAki7Eho5N6z5rs3FmWWiOsefdoa5FandLI1PwQOpVfdS68JRgYhVAe3
         x3aj4WHUdrMmOQYUn73AGigQVt4SQvt10jEHAfKU6iuAFwnzh4+Dmyu18RqIK2O0VZjI
         Wt4vDRNdQaZ5lANIAt+jO0DWryBRwFI3bzPIP3GFfd25APCufeQMq7ZSfEPIEKFHOO9o
         CYE5Cv3z3N1hqCBTmHUcjgfUvSP4GLiP/vTRFmMmnLqlHw/Mx2KoBwCKyoTi8ciJAK9j
         3UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372517; x=1779977317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9+WIH3wYXS84/BbqamyGdntDz+CuAbNdiG3gFB8eJc=;
        b=oay4R/e4k5A0UxeeUW9FYNQMNya/756kZhxJtMcZS6eyZrDFFVCawsH1VMae9h3Qma
         cl4NRYagB89euRQd8YC8GNeA8L9anqrYPClFzzDGxLnTJTk83Ac4z8ppD6Y4S98BojMc
         KvCWAnka0vjFmO7fDXr7JYvu+k7ygDp0s1403bpIWym9wNQeUpV4BdGU2hNAbr/RXrIh
         l1nCC4YZZFo1e0Wpqd2T4r6OssY18HMiGMpMLA7Dpr9l6bvtDc4m7+PBXRbkDiSsOENZ
         oyxMbO6S59eneXjTYFvLBBnCV8ic/wwzxdj0gAEryOqJcwnAqmn/i9CelZIqG1FofyTQ
         ORfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rxVu/0aTzrWIAx5R6mnJlNgdhiyH/O3vNn/XZy+HAsPcbxFyVY+IhCo7NVyOoyXxymX8MbGVoHu1LHUsv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2UlAWhF47bme4SoO1OCKFJaTwte8LmZ+kZauY3GBRNDNFo3Ex
	5aupKQryfKIxrB8hCpBQAJBstJ/4dUnzruglC3dRrdEBx+Hmqe8z7l1Jx88pHw==
X-Gm-Gg: Acq92OF8NH0MibaUNNwNqPiWjfdNWQuskda0NYpAJuqmBoXORe+PkXK4gwBHjqcLl9m
	VlknqqcK4THkza9nM1O+b8aALkIIvdFsZ3XEbxMFsPtzava0ITE5Kv4vk6LyJBF1luzoTeoaB3+
	qt276US/XWlGeCbuKgwkpX69Wms1DTZSIZR8DxE5u5nVWLOjIDRNlf/2v3C2sQ41rExMlzXO+hM
	57/yTa8TfzGgXnxetfBfPSFJa7nWKiSUVkb9XCd+ouz8jJ91uvvWh/+yqLRgm1C/k94aTQj4PeK
	ZwuQDDh0GU1EBR5Zc6claS4lO6ESHc3F1mQF+XBkmFoOXVrb8YTUCG7G8lKdPbnr+GFZRD6WVWu
	8sSbNYo6KPZwG1Fj7HlncbmunwM8rQjbHhihf4muQnTCpDYgR+sbrPLwgJ4Zr0AJUa9KsJTxp+G
	g9BiHF2e3sa17Z2FqFy5cZ1Hc4GSFAH2Td8MXbTTUtFCot
X-Received: by 2002:a05:600c:350d:b0:490:3cd6:1936 with SMTP id 5b1f17b1804b1-4903cd61a1bmr26058775e9.2.1779372516710;
        Thu, 21 May 2026 07:08:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d52a0bsm62564765e9.7.2026.05.21.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:08:36 -0700 (PDT)
Date: Thu, 21 May 2026 17:08:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Artur Ugnivenko <artur.ugnivenko@gmx.de>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ahmet@sezginduran.net
Subject: Re: [PATCH v6 0/4] staging: rtl8723bs: fix several style issues in
 hal/sdio_halinit.c
Message-ID: <ag8R4WTnqRFrVj09@stanley.mountain>
References: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521134756.24546-1-artur.ugnivenko@gmx.de>

Please wait a day between resends...

regards,
dan carpenter

