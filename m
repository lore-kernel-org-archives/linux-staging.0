Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3DA18A930
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794978; cv=none; b=AoU3cat2w4YVI7/+i5j4yzG2pghSJcO81xcRuwA5Ebx+onWszTvwsgEj4lYqPBw4aB66VILnyTJnETqCJ4Xdez8TPpfjDEFVCii1vTEs/MGqOnVUZ8hg9AEBjNbMYB8h12xZRBUxytCLmKxuxd+Yxl3SpYGbMOPiT0eN1sd9aA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794978; c=relaxed/simple;
	bh=pDWRVTIIVd539bJF3xnYypJRZFABqCixIOL8uAG/ZbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCRJUh/2Bb1n/GAu+FO2JkTafeQTfyrlVY5zvuys9RUdM5pXLyDTR1t+DnLiZPcn0YDdFdsYZbtoro/+/kggbh+vhYQv14vPaCMPsmWnwrt1G5NQ17zdKTj4o7nGsOSgvOi2JChXG+OuDv4lHtHe8wC0wZnY3+htYrSlu4ATHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAzbCxcq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAzbCxcq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43152b79d25so43955415e9.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Nov 2024 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730794975; x=1731399775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5G5P4ojeaiWao+UaxuX3ijXfztM6+oSFmGiVcnC80I=;
        b=aAzbCxcqkBZfX0bG/fRs27sP6WQnVSYoxCCpBqd6o2Vczz/pQssUhu1t0pzo/V/h8Q
         We6bqRCsUeKvMZUr0Bci3+tOE5QhEmzCrJwbzm4oyQBhdkzU0plt+iFvXZhjekoxF1ef
         5BOjnLTe3Tk3h6aVtvXkp8z9H2zFSjDFkBoqJpmPTMIFMdaut1vkeRQT/Lgupj2jtS+T
         muWfL80/ArzH6gaBIpAFMZhDLjxoAzkYK7EmPX4Fw8UEkC0Ell9+dfkbdYXoKW3yAmB/
         urB0u5uJTZP3fBBjcI4lapPHZsltXlSpxDwJevr6DiE9viCMcH1skBR2J4MYX0p+M1NH
         gCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794975; x=1731399775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5G5P4ojeaiWao+UaxuX3ijXfztM6+oSFmGiVcnC80I=;
        b=pqSzGhUAYIDos4RKr+mgjlDXsFOkz5DM8cI1Yftkf6Xj9+en5fk2aHNVt+sMyxS9bK
         XEHLNLOusbrYP4wYLG4KROS7DjBjgeRR1aZGFSTrQzdN/q7FSkuA+8aE99RZQlY9yWMP
         LASvWdwKSkf+ukhAtoasSqRTMXvzzjJZ7OEPH0D9TFH2K9B755Lg4+p2xNWPF4HjNwD7
         O62Go8ZRJ/REPp6sISLCrGrN3NpV1WSFunXhJp2MBWNSlRWLbt+MDCvkZPI547+yTOfv
         ZhkN8D0BIUHoDgOqHEhP6StYXMx+QyyjIDyjQ3pHmGo7u9Hpk2X3AVR8T2IURchoMEHN
         GDAw==
X-Forwarded-Encrypted: i=1; AJvYcCXyPtIfS/EUAbihGKKkyqEPapmA+vGEBfno5KH95ERC45iaXN2mWr7eAWR+Wecv+8uIZPW45/u84wE9rtxC@lists.linux.dev
X-Gm-Message-State: AOJu0YyJvOCZQOWP1qmmEy5EaU7FiO0vFvd5VtC3hNVFXCagzsOy+jHW
	3YfC+Y7Kx4SyoH2eMpeQB+P/tVxMNuIN0U933cNn4CvH72IHBU1t
X-Google-Smtp-Source: AGHT+IEcMXQw8/WHDQdJxmE7WsNgC0l0q22WI6nuU2q9XsbmYSnuJG8GoAjWORpJgiqXCycmpYuQ+g==
X-Received: by 2002:a05:600c:3b91:b0:431:57d2:d7b4 with SMTP id 5b1f17b1804b1-4327b7ea7c6mr173442175e9.26.1730794975007;
        Tue, 05 Nov 2024 00:22:55 -0800 (PST)
Received: from egonzo ([82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8471sm215004125e9.4.2024.11.05.00.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:22:54 -0800 (PST)
Date: Tue, 5 Nov 2024 09:22:50 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH v3 00/12] staging: gpib: Patch set for gpib staging
 drivers
Message-ID: <ZynV2jm7vaI7xiMj@egonzo>
References: <20241104175014.12317-1-dpenkler@gmail.com>
 <d0c4c59f-dbaa-403f-ae39-4ee0476ed9e7@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0c4c59f-dbaa-403f-ae39-4ee0476ed9e7@suswa.mountain>

On Tue, Nov 05, 2024 at 09:33:32AM +0300, Dan Carpenter wrote:
> Thank you!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter
> 
Thank you!
cheers,
-dave penkler
