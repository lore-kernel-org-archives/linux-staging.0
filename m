Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FA04B04B7
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786174644; cv=none; b=eG4LprGvclYAm2lgnfRJEZISZ8pBKerTsx0T4og0slbBhl/TneCjuPmYmQ24i9MRzr1ocTpvPTdrve/dR3Ro8XVzP3FABEMi4LG+SyaKciYCJZ5+OxQF5gXR4HTB5qfnbRKelRjUbRHaTcjtbrJnNmkODmGNvWQkWErCAg4FWNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786174644; c=relaxed/simple;
	bh=39NOZjY5jdkTwXTmsIU80g8ytrkeW7R5BAcp2XcskRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZvRW6NMz4FOYwHNzhvxOt9BT13GYLqWVUqhy0GkX1kZB8aFZj5e/pxFZq6XK7fO1kZ9A2Tpz+jCflLooJVHdGza5czykPzau9+6Pp2Pwl2JAbY9t/gmNNWzVXbzvcuJ+2BN6+S9Fsv/WRf6fmOX6GN0MLsUG+GpyPXDKDaO8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKIGZ6kI; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKIGZ6kI"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ee88fce572so2338076d6.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 00:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786174642; x=1786779442; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMq9IVceHSFtOfxmxRcqUVjciDxSmcJwMVjsRr15Crk=;
        b=nKIGZ6kIJqvkIxv7OGAQohmuLfCbGtI2x5ECHZ2cLbehluGNSRSXOYRBa8VbSzc9GP
         vDpla1ZedCMuQC82o8icftnnBbBpL6V+rMxVIIRtWnx6bzr25j68iYhRbUCmoLCIAaNU
         WZ6iLZs7gnlrJHCpsWWI0n5SKrWNFrd4v4jWbOlzooWHT7B5NlQOt578n9CNBvVAl0Nf
         rWHhWa3XNwySS3hs2tLIa7aE/0htgmDXXxhgtK5groyn1NaoSJCptpicprf54pjzhNte
         mwozP4Ks2oFazllgAMhpvqI/LdSUHijSBDDmdmkqRo2mAvjUZXYiv9MaRKAgs8INQ9HP
         tVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786174642; x=1786779442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMq9IVceHSFtOfxmxRcqUVjciDxSmcJwMVjsRr15Crk=;
        b=VxK15PYJpRdYyYkqkPG7ilh7vSYFsyKN9wJn5ktNqkjoG9+rFNwMl8CN6Uw9qBjrgT
         yEC7kyb2kXhkFMI2VIc4Nk5E5lIC78N/1sbCQbMdOZ1hnps4WJUtsV+0K+6DQyes72lH
         GljaAq8RBrhFrqvu08yky+vED88f9tTQNr45vzt5sevlFMmyWNFJTmVa0yV4QWRXXCJa
         XhzRiCd4EdJdY5DLSqJ9vOPIAGIXh7/uBrOr+clqVsqNpbkjAm9qxlo7F56/Fn1441Je
         XLVzPK0+piaonEduLF5heDcvNdFsmWwsPgu4y3kM7OBB1uL6pgolusfvgRofY59iZ8vn
         qiaw==
X-Forwarded-Encrypted: i=1; AHgh+RrtJHNo43lNFIaGndXhwyz5DGca7qQJisD/1d5mUeKzsIAhX02+gRa3D3SngZsnw78aEjD8Qlcu53aaWPb/@lists.linux.dev
X-Gm-Message-State: AOJu0YwspVI30VmOdUHl3zfuhPhGhguecgTd1omjfmOOjrYaVnY8tYbS
	bvnvcL5zjVU4PxC77yBKeTDnyZ9z8YI6n0eKnWDpGNul3ZfHcbdv1iyZ
X-Gm-Gg: AR+sD13TA7imw0XPRlZ62SaecmgPw85pbigJq1s4IRJcUcRgQA6oIqRekkM7qvntf+c
	vZR1UFAkp8N7fs8yGx+Z+sCY6Uq2LAVGJf7luEU8bhxCaliCimuICCMUp6VUS0wDTZfqfmLj7GO
	Yhrw0kzVz3/sXRGCrVTjVFLfnkYp1QcguI5cBbgZrbllZJKJ4pvqVCvHBuM4I6ypnS69PP8P+Bl
	jGaoChQhitIPs0JYfo/IrspuAidfflkUGAV8EoQuyezvJGNh9YNbWtuEkVrZ7m1n9nW1qzZ8cTV
	2J76j1T87h89rfcq+LEZeIz0s+9MSN+/WuQJCzJDV2SUwEQg/qgSM5Okjjk/Eaqcj+XOThOhSbo
	nViMTrKO0aAovhNSa5yIZuck76wvy/ng2LHPo2Jz+zsgp4QdxSG6dgvwgkIJzcKgVhSSAmkDBjW
	mkjGF/9z6ipvY3ND8lTTLr/7VOCgTpZypC0tNCgYg9vq9w//joaRZnCAs=
X-Received: by 2002:a05:6214:33c2:b0:8f1:e1ba:cdfc with SMTP id 6a1803df08f44-9089b603d7cmr207330076d6.16.1786174642080;
        Sat, 08 Aug 2026 00:37:22 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a918dd24sm26021596d6.8.2026.08.08.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 00:37:20 -0700 (PDT)
Date: Sat, 8 Aug 2026 10:37:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: Add comments for lock definitions
Message-ID: <anbcqQxPM8CP14HN@stanley.mountain>
References: <20260803021857.989-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803021857.989-1-noahtechoueyres@gmail.com>

On Sun, Aug 02, 2026 at 10:18:57PM -0400, Noah Techoueyres wrote:
>  Add comments to spinlock and mutex fields explaining what they
>  protect, as required by kernel coding style for lock definitions.
> 
> Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
> ---

To be honest, I don't love this checkpatch warning.  It seems like
a really easy task but it's actually difficult so it tricks people
into sending patches that they shouldn't.

We really want a proper analysis of the locking and not a three word
guess.  What I *really* want is for people to check for bugs as they are
doing this analysis.  If you can't find the bugs then this task is too
difficult at this stage.

regards,
dan carpenter

