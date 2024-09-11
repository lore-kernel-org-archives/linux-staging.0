Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D337F1B4C26
	for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726075542; cv=none; b=q9nV+es5kFmQFJBFGn/uip+gHrPG0UgWKLbb/vfDxS1K57w3oyE/mV4mcuAagWtfhOy3jfE5XOgFR/pXgfKmUgmaOTOtYB1c0RNS7BuvyXQaSNC8atnYDl6k2IJKz2pIm6qfgF/RjTou/MsYOQPoP9Ah//1+PmRPbDed0OPhqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726075542; c=relaxed/simple;
	bh=2CXGVg6NEhqLRKhGUyW5174lZyw87X6GSvdQUeR5MmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7iL+WzN3hjePKA/C3vlKjoTMwAxztbvIgUywfEZSM+wHratp+XpeZjwRmqOVEfaaBZgm+qqBIWYIHE8zLnsmyXLRzEN70crVmVZyj4i3JbILvtx8cVyg78E1ZwGhZXEUX+25v5pazzKSTxPNod0qQi4BSaSegJw3bV6pRXhJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKjfZg3S; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKjfZg3S"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-375e5c12042so51711f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726075538; x=1726680338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xmCKuyw0DapJvOtbSWzmF0OL2IUWJWDlS7+rw4t0ojA=;
        b=pKjfZg3SRh0f7e2POED9DRMzxq7tRlyJ5cFeEUaj9XohEA+Zn1Ezopku8B+gq8YgtG
         ZWGt7h7xxGZoTT8x64hMdsDD+15hgd/DmDfaM6WZTqzCwOXpDgkaL5NlYj8mKk6kMkBp
         wukkPy7Ld1VCNhK2JKbkSbOBZ64Q2E+vt1eRj5J3wVu/niXbm+asfaSN7gv+Bm9on+V6
         k0I5WsSl4iZPj9GZZWAPwg+F8DoPHtKvpZF/9gbF5BZyVPsIdmzETagRPwjlWqEFz+az
         WqeGoBb8s2QqSvmlW8VHPhygv5TILgxfQVGDMC/sRcX//4qV77rfgZadtF6zjdwuiBR8
         YgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726075538; x=1726680338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmCKuyw0DapJvOtbSWzmF0OL2IUWJWDlS7+rw4t0ojA=;
        b=nCHqP1xLS7WrRpJIS/xBhFb3pcmJ8JBaULFg1GVvfs7hLG0n2b+ub8TMSLYJ5HVg6K
         7D3N7f2dNniOvm+QmGrV+xNvuJEWgWojHhAgyaNHDOS6RNWJuy4XWuNgMWDFwdpf8Agw
         g8R8A6w4qGqWBXoJW0gfkQpM5topsM90bGTMUsVmgbS30JIhDjFY5OUVuLtJXQT9lPHH
         4GbHuCy2/4jVDhh8pjoWnJX/NR40WFdDAK2dEQ6W7JYaWN6B4Aa2x1uG5hMPv/tkDXqh
         3vd86h7fvj9wTWgnufsmRfZQOh1cu6427+aS3gQcqquyN7uf3n9XCeBXTsagiLU6Y+j4
         ZhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9tkxgyDmwLfKLvCD3zxNVrLdLXwGOifvWjPEDmBiHgg/N+55HtAtTSw+XiVNOyzYr+eyvV0nBfLI+ssrd@lists.linux.dev
X-Gm-Message-State: AOJu0YynU1dvrdqhRCja8WSc7Yd8kzfkEKVfcbxc+9Ajhd6ke2c8bvT+
	gYe87KPjsubHGcvWdl5F4zOVLhbl915+rYRHSfHUn+obg+XV1VEi9FFNXrXQOKc=
X-Google-Smtp-Source: AGHT+IHwgouVHhx28DMTt5PoacyStj3TzOC4jjzt7G5qL8rZ2fYGdKla/4VYhBMKB9fgtOsriRz47g==
X-Received: by 2002:a5d:6111:0:b0:374:93c4:2f61 with SMTP id ffacd0b85a97d-378b07966dbmr2405056f8f.5.1726075538049;
        Wed, 11 Sep 2024 10:25:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a18asm12049442f8f.15.2024.09.11.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 10:25:37 -0700 (PDT)
Date: Wed, 11 Sep 2024 20:25:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Richard Narron <richard@aaazen.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH hotfix 6.11] minmax: reduce egregious min/max macro
 expansion
Message-ID: <cd6e01fb-4605-4f5f-835e-592ca70ebe03@stanley.mountain>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
 <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>

On Wed, Sep 11, 2024 at 06:24:54PM +0200, Hans de Goede wrote:
> Hi Lorenzo,
> 
> On 9/11/24 5:34 PM, Lorenzo Stoakes wrote:
> > Avoid nested min()/max() which results in egregious macro expansion.
> > 
> > This issue was introduced by commit 867046cc7027 ("minmax: relax check to
> > allow comparison between unsigned arguments and signed constants") [2].
> > 
> > Work has been done to address the issue of egregious min()/max() macro
> > expansion in commit 22f546873149 ("minmax: improve macro expansion and type
> > checking") and related, however it appears that some issues remain on more
> > tightly constrained systems.
> > 
> > Adjust a few known-bad cases of deeply nested macros to avoid doing so to
> > mitigate this. Porting the patch first proposed in [1] to Linus's tree.
> > 
> > Running an allmodconfig build using the methodology described in [2] we
> > observe a 35 MiB reduction in generated code.
> > 
> > The difference is much more significant prior to recent minmax fixes which
> > were not backported. As per [1] prior these the reduction is more like 200
> > MiB.
> > 
> > This resolves an issue with slackware 15.0 32-bit compilation as reported
> > by Richard Narron.
> > 
> > Presumably the min/max fixups would be difficult to backport, this patch
> > should be easier and fix's Richard's problem in 5.15.
> > 
> > [0]:https://lore.kernel.org/all/b97faef60ad24922b530241c5d7c933c@AcuMS.aculab.com/
> > [1]:https://lore.kernel.org/lkml/5882b96e-1287-4390-8174-3316d39038ef@lucifer.local/
> > [2]:https://lore.kernel.org/linux-mm/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/
> > 
> > Reported-by: Richard Narron <richard@aaazen.com>
> > Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
> > Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Thank you for your patch.
> 
> I must say that I'm not a fan of that this is patching 3 totally
> unrelated files here in a single patch.
> 
> This is e.g. going to be a problem if we need to revert one of
> the changes because of regressions...

These kinds of thing also complicates backporting to stable.  The stable kernel
developers like whole, unmodified patches.  So if we have to fix something in
sDIGIT_FITTING() then we'd want to pull this back instead of re-writing the fix
on top of the original define (unmodified patches).  But now we have to backport
the chunk which changes mvpp2 as well (whole patches).

regards,
dan carpenter

