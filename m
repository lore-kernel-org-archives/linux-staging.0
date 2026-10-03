Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E22BD09
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027862; cv=none; b=SGZq+Jq8rUTc5f0cOgnxGcDoBBZ5026HXKXzAHmkr0rg6oEzFG1dnp2QyCqCKusRA1Ek0WM9axLgZb7rLZWe66OaHEWV7Zpux5W5VMymxVcu+KnOKcintQt+45xIjW2ovKrKZiwD9mInJF8pHXzzfQZ3yMXJp5tbKnoBlOWJv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027862; c=relaxed/simple;
	bh=SPJgS5kgGCdrjB21D2xL695GmuQTeeXXhSII78zybpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKnKLbMmNv6sjLUMf5mXC/P3iODmZWjX1OoO5sWQMS5dMG+LzAX4zIZ2ox6s9aZl+/dHPmmjQKpMLrqPMDy0+PmppciIchXjI9CHS+BU0Bj6NL3++Lna8USAIXct7gYg9iGBxJ0jzCA2hq59huSFGLHPBong3hlPYGrHFslMRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlUVFOs8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlUVFOs8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b06bb6e40so262063f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Oct 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791027859; x=1791632659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZ4ULGKSm/cG8v6BlyRVVFCk/EzNYVJ7PtZl9aubdS0=;
        b=NlUVFOs8076r5bi6L0ekQv4EEPBChOUoYmZ/G0L84hkFElc2fafsq/eZwv8krVnURO
         kc/vK3BszluSGNnCFzO2GKKHML0L+1AFEO9eCYHyamJPWJVaNrpaQCRFjGeFBauTN17v
         +McxrRj0QiG0nE1DOwzZU7/Mr+5Mcyn4kNDndtC4QuvF9TNiV6FTyWM2RAQRbPjk/tNw
         iwaD/RlRQfMUzZJAN9jb44IA8QHCTQ5+15DF/+Gpok+k7g8LclTNYjBlwpvmxtsD2VAm
         JHa9bMDIKi/DXdXfxgnT3jikmJ1QVM9V0C2eEVXshV3MPDaQVniXaD460pKIogIbHbiD
         rlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791027859; x=1791632659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ4ULGKSm/cG8v6BlyRVVFCk/EzNYVJ7PtZl9aubdS0=;
        b=ll319rXe82JQDag+wnEMrkATBlyc57Bp41/BkpnLdbXsFSg6YAeT3/5EwB+8NenpxH
         O4uJJ2jueJm9Qm0bWjVf8i0sX43h8xS5lgw/h2iAxDluka8WH6YWlbcs59lAhkGtVnSX
         dOZp5COCDttt6ERO79NAWiKBVcyijkNxSUyICxCJRdv6I0obMa+FUHOHpNPpVTJcf+xj
         w4ZZjpg4z5rbWYfQvewo4lMVlh1zPO8xd2qSDgd+kgfLLzSUuCS4PIWU9lVRVLB5KfBW
         oVT79YAYoH2WzGYvJFhSV+9TfTy5kU9Y7hU70AL+/eYinpNvfFGEzTyEmj9jiCgat6tB
         sceA==
X-Gm-Message-State: AFq9FYJcBe49z/Xfgk5ODN5o630gM7AGvMCNgy8HVDPaaNtuAA3bKcHu
	7p94n64LlmIsNvSx65Dzg1oHZZcmZfqMfCi2ATD4GgDWJSTZY4MfMxv4AAvFcWiwXWymBw==
X-Gm-Gg: AYBFou14sNaRLcCWp55wtHj9VT6a3VecdpBxSxBo0hosyIQf9oQqP6LDDH1NXh3YQyw
	uD3/pdb1pTX9acZEItnPox5fLB4QZWIxcQ+zqbfew3vZx/Bt9RhOMXE/IDxVuJ7IpTaTAHnWXkp
	V1hVU/mhQFvUBr+77raC1NoMwfXbVf7p4CPSvJOQvWQc0BsVVxRaJMqnVQDKanyUTJdrKvc//mJ
	wBij6WdQHw0rEtoMmRKOWkNCLE9CeWLfFRvBwY14kvJpZvjgP5g8/k0czvokYGBRUFQ1RA2aEuP
	O8G3gmhTf4hwmN9q6e8MGHOQEYjn+/GcAWFd8Lk/L4YlCnBuM5an6q+X6n4bGNZvsj8x5FM/Q6o
	huznfrfP1uuNNQ0KraPhRQIOmHVt9AgvcVICfkDBnHuy4YhpD7s0suvE9QuvYLzaOr0gTL+09qw
	slSeMUFAMPAAqdOflg4HYXqMx1sO23guLksrQ/YYtYHlLbNs4tO0jSkx/u4pJKdwDX7h+G0tAf0
	QbRi2/El5i4xnCfnsDGM60T
X-Received: by 2002:a05:6000:400f:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48c47fc5fabmr3888867f8f.14.1791027859341;
        Sat, 03 Oct 2026 04:44:19 -0700 (PDT)
Received: from fedora ([2a06:5904:28f:7600:961a:ef3c:e30a:fb0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm11982800f8f.16.2026.10.03.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:44:18 -0700 (PDT)
Date: Sat, 3 Oct 2026 12:44:16 +0100
From: Luca Hernandez <lucay202@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
 around list pointers
Message-ID: <asDqkCac9Si2EPEe@fedora>
References: <20261002215746.81683-1-lucay202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002215746.81683-1-lucay202@gmail.com>

Hi Greg,

Please disregard this patch. I just realized you have previously 
rejected similar parenthesis-removal cleanups in this subsystem. 
Apologies for the noise.

Best,
Luca
