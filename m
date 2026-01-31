Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB303542DC
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867833; cv=none; b=oLcMSfluSQKmHxteni20vYXS8ST+cHJoFUEvWja3jKa+7gVC61WrWcUcD+ZY6HDhBU7+BNEaxe5zefzVl7pzBpX6qhn/Qxfecs0jWs4XXThBmMkgIa18ANFypjoaDakULXjGWY40+hPzOXSp71kvXHPQNStyldME/xep4AxTlwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867833; c=relaxed/simple;
	bh=Q8auxrH6zMuvl0IankdGn9+Xm1B5+3T6Hvl/6luDxCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9JEARl9/EGC0njGn0NOC6MHLfa6IvqN+U1xUjXOwaaw8/3s2xWidj3NEEHcd3O5UFtAonA0vKYtaB/r5xv51+40qC3bFMemCXKhcGuiDiQh2wniYxYbyNyua2zOchut3x+0E/2RHACxa2PsCyfcJrQuK71j+/0uO1rZsHtnsEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NtCr7XcB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NtCr7XcB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso17785125e9.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 05:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769867830; x=1770472630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SiH7rs4/zmq4QG18pazODjXcOqGN+UAs5j7elvtzMC8=;
        b=NtCr7XcBsdKy3wIJBnXxr8sgyHSmnLCQF4eJo7ztad2O2Sn1x44KRnkK16n/PE+ZLy
         hUu119+Z5qqsaNpTU3qAeTZJgjic+nFzkdRKg1f0fAd6fKV+17StCPu8sUtLDfffkoqa
         QVBKxMM3tN80gol3+TA6kdev1CyANbBrrt5TtLDca6MtmRoA2vJNxVeJda5DrdFlzAE3
         x/zPWRNNXpunzUYdelyrl2bpQrAMOPs9bC8WgDbJ3e8mlVo6R4B7wWrWqHasxqNGDr+c
         LnVY3XnIov4QBkSeU8fF+aCceesWFCWd1cbyt23b71GnYmHsiq8AOE1mTFkTGaMl4vf7
         Aurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867830; x=1770472630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiH7rs4/zmq4QG18pazODjXcOqGN+UAs5j7elvtzMC8=;
        b=uggi4vpY1EaUVAqXrHQIl5RFCBvMSWGc0+Bh8/obuhVMUfI0zHJmQKs9TfJ8YjIoql
         Sx3fkZOTpYd/yqOQAw7DdMr+dz2BPYS2/TE855veVrr/ECNY4NGON0xEUfAJForKNEEy
         rF70aEvpUyvyjC3TwxvBUD/jBy7PKnsjK7/buuW0Uqs1/X468fRi3ltXZB6zoFXOIwj0
         GIJY99vHMfJ8bLedyLSohMHT8Nas+xonOw9sXG4TU4rly4T0CEprP+b6wLORHEMrNFHg
         k73mFoub3pPAZi69wqv7Yh7UTG/TGP0SGoN6eADOtWcvC8IOc3hdaMQWxyeeZ6Xuk0DU
         Cv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8zVLDDyONezWskO9i1Q5dPzvmAEAq2vEdDPlfwedCAB5tCgx0GBchB1fZzZwJqwBrjuAd1CFXbo+oTNB1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6VZWxsJNv64GqGRYWABwZbAuHeVxKUGN9Cb3WYqRRyagVibep
	er4wU7frYij2EzCQCZl1ehdZa0bRXHpptp65htc9/CAdmWx02tAyxtjYQKCA+k7bXiU=
X-Gm-Gg: AZuq6aL9abq06F9x5pL+DlflIjS/76v0ptUflaMmxquuaer07f2nLkw+Hm0RtFAW77N
	pVBXMxWwdHPCaPiZzaxrwJci35Xze9ZRBIRDcfuN4FZYO50xQVz2QLzmNCeDwVXzqLhzvJ63/RT
	QoJ4LhuEjNj5XVn3cxJPTYD9rdI4fG1pz0ZvmAua7zo6oEXqvbgJtwTzpQCe4VARehTVbR7tkag
	idSHJgyQm5HR+eow1ZqtuSMrT4Qsc+3+pDlZlS6WjH8/tR2FeVK8lccoD8pdh4k422LZPbbOHjG
	1/2SqmQgKrIp2QJ7WFaZW7JK9jJ58FL7l7ORqTA9QA9A4ilcEQrYK+PrCWJC4sTc8nIWsdhYROL
	bseF4mtmZYMqpr5SyRPQWRJK/wUNTIkfy8u93JuCY4hl4BExlRKQ87lQNTyC0OzRq+QpjBp4MAU
	fZxdJ5/WCgjiHckrcB
X-Received: by 2002:a05:600c:1e24:b0:480:6a46:3616 with SMTP id 5b1f17b1804b1-482db448890mr80283615e9.4.1769867830348;
        Sat, 31 Jan 2026 05:57:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cd8fadfsm268298805e9.0.2026.01.31.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:57:09 -0800 (PST)
Date: Sat, 31 Jan 2026 16:57:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] staging: rtl8723bs: fix OOB read and perform
Message-ID: <aX4KMi5SKkFwBPtR@stanley.mountain>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
 <aX3-9zMnUBVUKP1L@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aX3-9zMnUBVUKP1L@stanley.mountain>

On Sat, Jan 31, 2026 at 04:09:11PM +0300, Dan Carpenter wrote:
> On Fri, Jan 30, 2026 at 07:16:15PM +0100, Luka Gejak wrote:
> > Changes in v5:
> > - Corrected commit message line wrapping to 72 characters.
> > - Removed blank lines between tags in the Signed-off-by block.
> > - Removed "Security:" prefix from subject lines.
> 
> Looks okay.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 

Or we could apply v6 with the tweaked subjects.

regards,
dan carpenter
