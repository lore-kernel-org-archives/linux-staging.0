Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241133E8C62
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935375; cv=none; b=RdcTysrHxL9jYShjDuMM1kTL95MopoB8w00HGn8pcGInCmVUi4QpTa7pvOyUABC9KC/N7+Gmgl9mGep7TOb97Gczjy9uqedxvan6by3NB5GPgjIKREswBo7PI9P3vEelWXvXLnGkDjkZK4WL1iiJ3xFY09Q2HS3M8JYI3Q/cnrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935375; c=relaxed/simple;
	bh=Lhy7nT8i1Vns4v+z0g3j/P9O2EN0ixqxwjwqT4F3Zd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db6hkEuuSFs957TIZoMvNu5b7D1ZIa/QTnIEjiFasLhxL7VM2oVyiABbuUtOtIMeb1dV5TLObTuY+K8QeUkIfrH2rPY2SM2N+63DUVpVzwmyL5mGwLZp91FV3Dop1xTg0dXvJKBCF6hV0YTfBI6+1o72/XAlfkkSa0UxdoGXP+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ISs9vwfa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISs9vwfa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48538c5956bso9843755e9.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773935372; x=1774540172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WOygSq0gymlMWHm64ER/xpeBmO60xp2f19A5m9z4Lno=;
        b=ISs9vwfaY0TMpYaN1cb55S2xRGjcD+PhhtliYydmkhNbrauBlL3GGu61z58KimyVXi
         M3GphCb5pTD6Mr8qfSyq+0SWR8vngXiHUBhQOmI8snAG7Pu8Vhi5Vv7KFDDb2BsfS+X+
         Tw2sPeoKeImJSpbAtWr4i3eBEgndxDRTb4IbeafFMZm6jrnVkGdBC78NeS3OoVFM5DhM
         jn5UHcCQdQeQXnIJTHFCXo89qqQ7i9B9WagcFyf5YuFDioiT8zRag1rc7V6wnhvPVZEK
         uOMTvSJ4NoJzM+wK2zZPufPVzHiDpWKNcs0yWMUuCB9EbLNT8Sx+sp1sV5LQ7SECPvS6
         5L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935372; x=1774540172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOygSq0gymlMWHm64ER/xpeBmO60xp2f19A5m9z4Lno=;
        b=VZJiMQ7BaUWz73/adYXtYj1C86gRhOUYN8cWkyF5gDsxKwCl8PeU+tS/vKN+NM1aLC
         NrgOHrePPvujHZ7GiplMbCaycfhSQ08aVpvxzsfklsvXyPdGZuKEjnySK37xpPVESUZ0
         yLePKXkJVFEitLsB8k1I8OmLTMAwGNU/Z6Z6InpjH5QVgqnH0csnp4xU7UGxrMczAenx
         8se5urjuduUBG9dCoYzVCEjoFA4wl2DGnBqTID36Crne9CEklKkogT+qQKK4qOHuyh4m
         s3W8P2vj2ZgWpwHSaN2lnvnB0ol4fc+i3cwJYxrfdgbsSJ9A2gAuLoMZhHKsIHmhtp8/
         bHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcUm4xMMMnYhtmIVAZYdN2XvpbS1FL3RuWaa2PXFehwXGOASQ+cf2GHtDz9+Xc7n8AStRJq/pA9ezePkW9@lists.linux.dev
X-Gm-Message-State: AOJu0YzF0868dvmiRnlk0ktSc5K2gJm3qeGGna9ikz3fGdsUMiMBCQM+
	xw6BXg5UJA93p8AmgsWwaOspSzhh2/exPpMuXrXMCgNOgU9kiEOk0O9OX1AlRfh1cPo=
X-Gm-Gg: ATEYQzwJev7hZKYcy7MkK8KT5Q/gpGjmYQ3RfjiEqidlFoIebpOcc7gAMpTuexlqc2Y
	hjqlL45V6MZYxeQ+48/+hF+Yyhu+Dq3/66V9KvQoA8j5ZDJ08YcJzrODZzoROUpuolwAqoxk5fl
	kYTR2TeARyhnDR0+XUlm7h1jcymXEu+j66T550D0E/xIhzM3qeFdFL655YZldb1AZu7gL4O4gIh
	qnYHQ8rxtQHWyy+gCA0V2XGAh3vfMvTbe5K0ew4MCI6eRT8odZ4/8r44VuTh9C986RLIXPIkA0u
	4Z2HgFlejzM9Qne7Av77KpNxq23gmvAlHa6VxxtUptRqcecNruXIml+IPnFXAfIMy7zRY2yCtMi
	swITanMCyqLhepIu1PjdTUt2puw2S6lWoQtp8izfBGuaDCtdybpkUqxtoNKcOkamMiztA6FpVV3
	iy9J23GC7Dmd5FYNJk5XNE9bnoit2zAP2XytzWJCY=
X-Received: by 2002:a05:600c:55d7:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-486f8b80e07mr53687185e9.15.1773935372486;
        Thu, 19 Mar 2026 08:49:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518522d7sm14543730f8f.13.2026.03.19.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:49:30 -0700 (PDT)
Date: Thu, 19 Mar 2026 18:49:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Rondon <grondon@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: use sysfs_emit() in show
 functions
Message-ID: <abwbB3KGkkTh4bYU@stanley.mountain>
References: <20260319120201.25210-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319120201.25210-1-grondon@gmail.com>

Doesn't apply for me.

On Thu, Mar 19, 2026 at 12:02:01PM +0000, Gabriel Rondon wrote:
> Replace sprintf() with sysfs_emit() in all sysfs attribute show
> functions. sysfs_emit() is aware of the sysfs buffer page size limit
> and should be used instead of sprintf() for sysfs show callbacks to
> prevent potential buffer overflows.

Please clearly state that there are no buffer overflows in the current
code.

> 
> Also add the missing trailing newline to each output, which is the
> standard convention for sysfs attributes.
> 

This changes the user space API so it could potentially break
a script.

regards,
dan carpenter

