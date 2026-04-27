Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD7375ACB
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325981; cv=none; b=k6vgwcYVlDzscd/nP1s6YP6qL0jRSotMYJXokkpecrvNoa6jsDAyrWFp2vw1Rgaxfc9yB5aua59XBIouFHVP2SPjeoTM9zmMYFd0SbRsINM+f6VwfOFxZ4sEmY3jaQu6K1gkCF15TQEKFC9tmnYT4Er2yhKx3nDX/+QuUaHO+Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325981; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zxo8SDobKcoz9jrymzADe68YyqtuH4CKzPQsKQbKee+c2KUpeFmarNCo2YlgKN8WuU//n1WAAmvICaloB6+r9KkfcvCnWe0VQXlCfENyobtpRsfDpDwtSFQw7DZ3YUJcgyjtQNMPdqQTndyesWR+12q8O4gbUqYlJItWKRkH+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gAl8WYeO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gAl8WYeO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so236176966b.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777325978; x=1777930778; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=gAl8WYeO7YOAn2K6+XZFoufpqvu7F7BYHXBctpQ4WUqwCZjz1YP93WFhrhl/xkxMQo
         wCCfONFzn1MGFqXjeGLyGkOhHpWoV+curtDcwSjq/zM+HO491n8H11OfYqQLP2/0wYIY
         j8Gt0JdlPiC44ldDexnk4D9l6egfu0QiqMaRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325978; x=1777930778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Kp7mVa1lLweIgtvM7iRBQZC60yoyNu09sATtvppMWvy3q8Yrynoa+ARUd/PYPxJhh+
         J4IxxR/m9VAqsWaguJz2yzQuHf6d86VK3vLqy8q+a9mQbGRMR/prmwtrnL8baMqJTI/L
         ulGvA+I8iVAGbwkvCM1Jh5506MoS2ZrvEXgJ3DiiO62SnEpa/WqpQSgJsyT7GngjHKLH
         Xsnvs6dJTzREvzNPZfBOBwvRIU08l9LGrr8LNsBlurHsjolqCOqpK300+GQsSnfzBuGl
         a7YSfaP87zJQvNBZlyWyaPxbCorERB7EV+SA7Ff1Dd8fQ9czUzK4hOz1baY9JapnH9i+
         toyw==
X-Forwarded-Encrypted: i=1; AFNElJ+RXw1X2E+vfH+mM+2F4aU8ZoW5Q8FBPdfthssLZveORyOz/wUHm0tuvM0ZikhGkPFdqYe/dPqASOYMdvKc@lists.linux.dev
X-Gm-Message-State: AOJu0YxO6nZJUrg5r6bQmy89mZvlJ6FU2xZBjI0vpfuFoBtdaZ+twEZX
	IzUb9iGxIwjuAwrzoMxU6jAYqw6K+MPtji7OxGaDjWSculzIKNFX36aQM0pp4XEs2Jy77ElzzXD
	oqLunQcXDjQ==
X-Gm-Gg: AeBDiet0pCVqhvFt/+TWPKAjRg4PiAaG6wO8tLlnvMsNNRisDK5b74G1DVpxHwsgQ9n
	12sg8tdVmi8T4NAwls1/b4oH4m+YLcZFLN1YEeNks2o2ddO3Cuni4F6ua0lKmBePgfNmYgtcQUj
	QUDuuMcPDtjVTmflNQVNX6Qu7liBAoDDIyYvysiS8GjqpnYINk/5JcuIwykNX6fNiYeoii9Bi9T
	HYr9HqCYtYM4odOVmIcn2kOBJ1WVJMSaU7Ovr+cmISXEBgW34ZT5pC9Qp+2Uw3CivS/IH3b2FD5
	m1lRkhwD5aROfi9wynYoHmNlBzmwR8TL0mG5D7vbBHwDHVDZWd2kZL+28U8LhnXxKDWMttg66T5
	+Et7ds9/0ScTLnp5Kx7L06WrLK8BQuJli+d39NXDAI6GoRugNVmCgElAh3YeisdCwR+AF8PmX8o
	NKO9hj9XrpSJF/+F0pA45Bq+14Mjk+PR5BgdpccBEadTMn8eZF9IMG6YTpGJhbD9A7efwVoAwLS
	T+8xxGSfXE=
X-Received: by 2002:a17:907:6ea2:b0:bad:d530:dbf7 with SMTP id a640c23a62f3a-bb804727dfemr26911266b.32.1777325978461;
        Mon, 27 Apr 2026 14:39:38 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853e641sm9570066b.10.2026.04.27.14.39.37
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso14716973a12.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9aeq2kwauRmWBGSG75KwEL+lh9CSpJWfNWKqolgT5XoEJktCAyp/+9dAseUZvYd72X7vnZ0ZjeAV6Y+NdO@lists.linux.dev
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
