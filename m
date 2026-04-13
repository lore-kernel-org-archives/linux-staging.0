Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D0397686
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066601; cv=none; b=oCcUfdpmCDIVQ6Ua9XN1/B0VNFkTTke+8u286ngLP/uC8IyKtFeB6OQiRaNuThiL+l7a1lzp/jCVQWTAZI3EK3cz/KSO84J9Z4xmQ9L4duYifA2GFDkjQDIu26VpsGYiareIcvumZZckTesfsIHPNx0QfAgFfbBgyJUfeUHcCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066601; c=relaxed/simple;
	bh=p1JIwpiE8WyS1G2umPT/FSZ8Zr/GEnNXT20hxvR/ly4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEtvfQm6MvlsXouN2RveyenKtymVhB2miwmmnISiKtF50W2EYgDC79BUqIYwia33ukMSTXo2aHySRbgt2ThFgwOnHTt1naKwS259xszhxcZHwa+wHm92nfK1bfi1IQTykNCwqFy6yBxiL6GfeQSJeJLF70JRErfLtwsnV1C/z3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4/sqkrh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4/sqkrh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so2923769f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066599; x=1776671399; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HC7LQ8RAmg7bI/yzALEW4YdRB8hh0C/jyOgOuDqTf+o=;
        b=Q4/sqkrhY9MOp+MXfGUJR2vcttF+kdLH4g3orASyMNrlpl+owW48J6oQwVZDwgp+vF
         7CeiWAK7P4NYJkFd3j9z2LnEpMCRgM3xIhtvEa0reHyXUdsffqMLNbtaqKPYsuy8hl8v
         Xe0419vFUbuek8GZ9zZEzNCi0eQ33gmw3ZZEjPg8FvZEC/dDgATNXw+i24HbBiUaAWQh
         D46An+XyvncY83G9GyjLrntfhycCwwEYV4R+hB7CExBzHel2pi6kM3bT+ju+loyRGMyo
         KL5qlSn+3voCSO6kFmiyV8Kx25LVRMljOQhpn0uHdPc53ow6jONRA5pVazYmFTlTVoQV
         bUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066599; x=1776671399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HC7LQ8RAmg7bI/yzALEW4YdRB8hh0C/jyOgOuDqTf+o=;
        b=R6JgFM5/Wx7SvH+eSlDaYqUQoG4+z2Uou4lNfFM3pBv6kg1RWHAbbCU6MTARatwJhM
         Ad6GciDrRL0ne1NFB59HKHyobHJieOTj1nxLlZ5e556HVPRZYDHSCMU7/H8oKBpJuG6I
         XPFW5c/QArOKnNILhGFsuY21sEanF2jlgL7leTJ6vNLNVfYMXOd4Q7WCu5XE2PdEDVJp
         3+ZhcAx14XDYumIqBbv3uop/nw5FFHOVJrGyhBlIc346D+1w9vFmEqaX+qu1+WboFnSb
         WDDHxaavmD73gPi9bIlDEuHNCbAUlSO0WJlFfBshXGprRZ13407R/k5nOZJ56iO8MXD4
         39Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8/ubZCe66Z3aWTD8AeOpVxt32X/QnlNp9Jw/X/TW51BtYWwcdXGKee2v9HwotJ39MpREidf+suJT7QTp2w@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/K8v27hoJ91Z9CWw+136rpQfszCCxOmSoIIPiJ6zq8c3l1bDR
	15MOQWHhAejbSR3zRlFvhxqvw5RlFzuqLTnawVwQ62QNHUY59euDW2dy
X-Gm-Gg: AeBDietiHBLF9cxJ/76/As8ujhIHOkdqZhZqThQGki72l0guwAOmx31DkxjmzOPNoFQ
	q496gAw3wLFk6SEeLY6wrp0isa2BbRTefsCoCrwAwdtMUXLZ5HmaiKC6CelWPG/N4uv+ObtthXn
	EJmzJ855WnS4ogqyiGJ3nji9/Cfe+1JIFIY7FY7g+DjurMSA0g4VFj2tZNTZOtrMnEVr+Gvdgms
	q1czZyO+/Yl/dH5VlQahov+exe2HLNy+S5FWmHKdSE9wjSn62urxalkBrYKPR/3l5gJV38c5yjV
	/lKJ6jN0quRnVo3k/XHUmnUejjOi2jtCzEd7bc+Z3f0EXBUl2rOgUiEyhpjuJl2nObrUsE7EdVg
	k0tNLuPT2i1CV1TMWHd+znpby1hL3YBhuqp79/ewCNAv9kT3qhMlX5t9AHACVfi88LvvSEZofvW
	dKasT1WPvjv0wqi5qefFo=
X-Received: by 2002:a05:6000:2212:b0:43d:795d:5dda with SMTP id ffacd0b85a97d-43d795d5eb4mr2951035f8f.2.1776066598511;
        Mon, 13 Apr 2026 00:49:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5062fsm29721599f8f.31.2026.04.13.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:49:57 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:49:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Use %pe format specifier for error
 pointers
Message-ID: <adygIkRhnsGv-LwM@stanley.mountain>
References: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
 <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com>

On Mon, Apr 13, 2026 at 10:03:58AM +0300, Andy Shevchenko wrote:
> On Sun, Apr 12, 2026 at 5:46 PM Mahad Ibrahim
> <mahad.ibrahim.dev@gmail.com> wrote:
> >
> > The %pe format specifier resolves error pointers to their symbolic
> > representation. Previously %ld with PTR_ERR() was being used, %pe is a
> > better alternative.
> >
> > Fixes the following coccinelle warnings reported by coccicheck:
> > WARNING: Consider using %pe to print PTR_ERR()
> >
> > Testing: I do not own the hardware, therefore I could not perform
> > hardware testing. Compile tested only.
> 
> I don't think it makes any difference for this driver. But I am not
> objecting to the change. Up to Greg if he wants to apply or not.

I always like these changes.  I wish that there were an equivalent
%e which printed error codes that weren't stored in an error pointer.

KTODO: introduce a %e type format thing which prints error codes

regards,
dan carpenter
