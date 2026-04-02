Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB22E265A
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135845; cv=none; b=UgWP/hhgZz0oo1sm8tZDxO/ah1fVblm5sqPxiEYEOxtceWS/utYKPJbTOcR7VaI//U2POQFxfvex8TEubVabb58HYmkXuIXSO6S8WaQ4RCdZCLJF0tdh8xVrJllnBT/i4ZxMISm1yY7jI3r1kR0dFNH13Wi19vM5onreuqDSmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135845; c=relaxed/simple;
	bh=la+elEOTF6ZQXKpbrOG+kdchvRMVuB6AcEou2F0y1vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAanwOzHOrnEKg8qOGWWPBNdNt00kbtbmlBFyNDVYUs07Ffp1F2EttRXA1THbhhOqWoqUWyJRmWP1nzaRTi87jAdC7NyqUwKDnaLNExz2Smsvikzt8V28M9cfgHEhBLKa4efE4VAyIKG+kykp5gI7br4ojhoEXcH+RwzBtKoX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnm4PdVx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnm4PdVx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf5d14d6eso700166f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135843; x=1775740643; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=la+elEOTF6ZQXKpbrOG+kdchvRMVuB6AcEou2F0y1vE=;
        b=rnm4PdVx1BA5BmbPQP0rndvohBnmRLWG3nmcIDRO2eTM+rrBLW58w41jTtvNgnw5DP
         juNcDxDy/RcbrmLq3mHHsoudBpShR8732sh/kkuwkX7VGnLv3JOeCL48PmQQmmtAdTLB
         uOZP2aP6ENjw2bi9CtG6uqwCY7dKMVqO6lFO4I+D6QuePF3UGhFMmi0i9OO5AG0qCWj+
         oWNHsvxa38Var7w7hccrc4JtTfIzc2SZLPSTAv71MFVNv1twhGBCzylyQTqWZSelmeeq
         mIhQ5Cr5THtwys6EnKw/j0RsxJR9fII6RUUcGWeSmvL8dWK8+8MPLBXj2yfieWn14KYa
         xjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135843; x=1775740643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la+elEOTF6ZQXKpbrOG+kdchvRMVuB6AcEou2F0y1vE=;
        b=rQKyK3TggeKwr6oYfTx42Vm6HNoMGLg7iuuuLschfoqgnjGXxoE3Ve9Hg3oxAEBKkd
         7uDtqtynvwFGn5J5xXlGqWE7ERT5IZn7bfZgkCnS51+Z/1vKzN/Oosut2b0lnKBoP4hY
         1+wydko7suX616zzTPkBG/ep7zvj1jfcMLeN7P6hGo+NPbghyJxZnjgQIaVQZoJVUcnK
         CvCJE9gZeGeau18u5ucOIcKBHoS1zD/E2xIYe0a05TFkcw+81wH9ovUdw4l3Bdr1fzpe
         voMRjwtssElca8BiyDB64ZG+mr74DH2fk98SIKZAC31LVrI8Ztmn0MiI2Su6QxPTACcS
         mRwg==
X-Forwarded-Encrypted: i=1; AJvYcCU+0rBS1RuRGBAuGcJMQoAcH3bMOlxXrLsUG/L2Phs1sxm0RhZ7bw45T97h1qbOVM0VNoX0taEKbtHW3LwE@lists.linux.dev
X-Gm-Message-State: AOJu0YxMYvu49K74GPkOW24yPbLK8yXPD8RqnOvgebvn7/MZKLJ6siPW
	PjH4pR75M+9fHKyMdJykV6CUotEh8XVljpAvhsUbaQodC/btfXl9dhtE
X-Gm-Gg: AeBDievxaqn9lpmFyQqF00Wx3gEZqHjZEQdJegi9Em0ZiQ3j/f7SJfqo808QUwZCHDI
	Gl4gazqMkvSsstcEwxjPtrdcjvA2xhu/D+D1WcJ1a5nuFWXrZyKnYRvTUj6DcVi2NZOv3HTuxqD
	55E3k75bWvR9TWFrpLAATuYiuLjkb46zM3+42hQy/9LAZUl6OAJ8F0F25FRcHkBZPhiCK4K1E3L
	AL3F1L7QL49TpN6pYunLkgGwlhGm0KfrcQSyTHt9H5z4UOttODnERvxaWHtZq+L9ekpHKNrbMzP
	K5SN24H18uclZGaumoNDVJG6ggS4E+BRifOcnC7UtZ/LLhuvYBLSIDNVrcVeH8HJe4xhnazQkCA
	0BYdyKopSbziPWgVhioWyIp93GoVL5boIFqJWW6MCk9/e4E844mTJMXiGRn10hw8UiX2Ggxm7mP
	r/TlPiD1V/TGK/XW6aQZM=
X-Received: by 2002:a05:6000:430a:b0:43b:4ec7:f90c with SMTP id ffacd0b85a97d-43d150c1503mr14753225f8f.26.1775135842750;
        Thu, 02 Apr 2026 06:17:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d28a5sm6825341f8f.20.2026.04.02.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:17:22 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:17:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: octeon: replace pr_* with dev_* and
 netdev_*
Message-ID: <ac5sXpd6lqnyoWlX@stanley.mountain>
References: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402114242.57411-1-ayushmukkanwar@gmail.com>

Last week I spent some time reviewing how bugs are introduced in staging
and the number one cause is complicated changes from the maintainers.
It's hard to avoid that because the kernel is complicated and complicated
things are hard.

But another major cause of bugs was pr_warn() to dev_warn() transitions.
I'm not sure what to do about that either really...

Anyway, I'm glad I don't have to review this patch until v4.

regards,
dan carpenter
