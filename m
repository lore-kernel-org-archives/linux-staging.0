Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057201AC89C
	for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078664; cv=none; b=bdXHsPdWOxdwQiWvxLtgyLSMD+MWo0jjKyMcOQllr8fhm0VJXV6FS8c0tdO+RnK1d49zece2+tQvAkHzb/Me9tkP9WtKnfjahN8A9jH4IfaDr8yHRzQLEKgR3khNsB3y1fMFpz3AHUb/xnjWbZfVxNN/1lYpwf2IDyE5ElUy574=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078664; c=relaxed/simple;
	bh=z857oVhOO9Ge5wn4k4nabsLRCg+zyT2pPs33TkWJQgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpWG9vSJVN5bbvHErKXd/U49cbd/NUE6eYFQo2MuLaSNAVWTEJB+cm4yCnK2Xen2VldZ3z1900FZDUPBJrrhxUngWcI+Zp2eCTkzEBU5xJtylD+QHYwuogDf1sdi76m7f+ZAYArJ6L+mE9PFizwFRVGeut+Y0JX+n+P8HnSDYeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U/+lHdlV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U/+lHdlV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d4979b843so17558966b.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726078660; x=1726683460; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXiJI/L0vchgadKCOX7xJsbzxv2AfJtb8fmGhILgPNI=;
        b=U/+lHdlVHyR/9FW2RHGm3U+UNgO0dZTiFYQ6ftP8lsTTKw5hXQ9JlODcgE3YvWQ2Vx
         ZCdbrdolU14sGEkQpfF7WaxFmRod77G7I7A0FNZvmfCSYrQKAfxBmrvxW6I6/Gscb39f
         /ffQ9334RLj700ZVmlpsHUC3wdrkTtiv07jSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726078660; x=1726683460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXiJI/L0vchgadKCOX7xJsbzxv2AfJtb8fmGhILgPNI=;
        b=jFGs6I7KJiZFPoPrRcf8m1xN8idbuNuO2SSTx+Nal3bU2op8fa1eVjg6msWi4x+RhS
         qegU0a04qE0XXT2GObXD2DIU6Ka7y6jfhhHWUjBzbYj3RwDm7wzskfvOfETlTBPQZuPS
         mGFSSSSco/N11ZuF5Lfil2mdmsKlRZDlYzZdpk9TFkc4f+ZPOFQQt3o3rDpdQnF9bid+
         7+pswtfK1dyKI2Xou2L/TQNqo92V0YG6OBLjNfSj1LTVwb1m39rRKw9lFSL6yaQRA3VN
         TTaGNGegXM2LhKNiTu1oB7uiMQXiRZwf0DWYLeOSY25xCItOzaqeq/scFjyJo+lIbCTP
         RbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf5NUT+0nU9wPrK7L98Wr+RBNdIvRD8x1Dn7DUpB4pjt+Z/OA+pX7W6fELyoMi4geJRSEp9VLVoTjqBSA8@lists.linux.dev
X-Gm-Message-State: AOJu0YzT4OlTodeainfZCuVjNLJpJ870PINcegVbSY6v3zk5zrPc4b4H
	rrGFcMMQ1DLzrZXfy/rN6CLK7DzmWBvhvgT4dtSROkT4kQgXOxPTKBPpvT6LYqCMP3z5Ho6gCBC
	XJ3iDpQ==
X-Google-Smtp-Source: AGHT+IGVwFgZxzJoqFSDOsYhBmnZN+o2hSJH8AMV6JKxXq1MUhWCnoABXWuEnfGVcsGiQSH7fQvx+Q==
X-Received: by 2002:a17:907:e6d0:b0:a7a:8e98:890d with SMTP id a640c23a62f3a-a902947f910mr29080166b.16.1726078660019;
        Wed, 11 Sep 2024 11:17:40 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c7286esm634308966b.138.2024.09.11.11.17.39
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:17:39 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374ba78f192so105310f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 11:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUChIjkXwAoTQWzjjRq0AhU8D5oixWPCeeTCsfJTpJp1FE5Lt7cCRG2ULJWRUsmqed0w6Uvrs06q9uQR3ey@lists.linux.dev
X-Received: by 2002:a05:6402:33d5:b0:5c2:5620:f70 with SMTP id
 4fb4d7f45d1cf-5c413e4fbd6mr215370a12.28.1726078302536; Wed, 11 Sep 2024
 11:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1726074904.git.lorenzo.stoakes@oracle.com> <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 11 Sep 2024 11:11:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWJmQJSWz_5S8ZqEpDs1t3Abym9DPZfUzWu+OCNM3igw@mail.gmail.com>
Message-ID: <CAHk-=wgWJmQJSWz_5S8ZqEpDs1t3Abym9DPZfUzWu+OCNM3igw@mail.gmail.com>
Subject: Re: [PATCH hotfix 6.11 v2 3/3] minmax: reduce min/max macro expansion
 in atomisp driver
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Narron <richard@aaazen.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Arnd Bergmann <arnd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-mm@kvack.org, Andrew Lunn <andrew@lunn.ch>, 
	Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Sept 2024 at 10:51, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Avoid unnecessary nested min()/max() which results in egregious macro
> expansion. Use clamp_t() as this introduces the least possible expansion.

I took this (single) patch directly, since that's the one that
actually causes build problems in limited environments (admittedly not
in current git with the more invasive min/max cleanups, but in order
to be back-ported).

Plus it cleans up the code with more legible inline functions, rather
than just doing some minimal syntactic changes. I expanded on the
commit message to say that.

The two others I'll leave for now and see what maintainers of their
respective areas think.

            Linus
