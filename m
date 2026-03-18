Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F63C3C1E
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833646; cv=none; b=QO4XFOeH4wBfpc026LfQkjKfurf0zVnECD4MI3iq0nXXAnPA+5tasBxOtAaKe5JfATMNgt0mfGSZl1bZwkRzFPWF/6btCkWSEd7kZ9JBHQhLhfssMLLMnlwtvuUJF73ZXj73K25HRx3e060jNJO3CglJSr9Jwk/wMVKGNoxpK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833646; c=relaxed/simple;
	bh=kdknD7S1Wa/kH0COqcqsT4+BSXG3arhV1YtJjkrLx0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S41hN3S3UP+geBtm79sdu3JMhqV7wBXXSEBS0/UMO21PHBeykMUpEv/GodOypQixO3RPskA03Z+2z/0JyUZ6Fs4IOizZ01yNiYFeJv3ZGh+zZt729OX0tnzA3pGnZKdVPU3oFkn0zoTGpwfhaJ2yx4t6FPDN7qMiFNruplE18UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWEq3bJk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWEq3bJk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso57571555e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773833643; x=1774438443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHLUexF4lneyzM7zmTateSGTa362+OfyNu+myFVzahU=;
        b=SWEq3bJkEu3pVkkUAoIzjaG+YyAmbGeYTGTF4ybKRp9/pTtP4Xyfz3XvxDNOIF+aVQ
         0/jYC28Kl+bSXTVfpNreDJP8auyWjQSoZ8OqBZ6qGbqfFwm96t3b8MhSLXrH1HARWQM4
         gPI9KZ92iaRbpeLNp2KByRW4PNo6FCa1mzHFWBu2hLRgKWVs8/75HgPNgXm5Faamm+vN
         bdDrvax3GzlkWcYiOG0u/QRZEvJP4DwYgbKh59o0Cr3XAW0a793P4RUXuXRnQzbv241z
         mMBC5jAZFFPDh64sJSju7OTw6ue7ia3Gpa80qOVdjHZqtyYe2tHV1JcgtuTxKDmSZUrB
         IqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833643; x=1774438443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHLUexF4lneyzM7zmTateSGTa362+OfyNu+myFVzahU=;
        b=H+0T8hwd1EJhUCM/POPiulpL1WD5Ch6C1BcKqYJV1VLm2OkneGo386bseuYr6E7k2S
         TudmuOPFgAHmpAEg3aSgIt1zg7hNLY5O5nD8eBpMJ4opm3TlcHhywxnjzgKiWCGj5rky
         U67MzrKMSsjbw5eQMdkddUv3A6HHAeLUik29WcCdD4JuCO3LLxdCyASfz3tx9mtRTNmq
         Bn7hlG9hsWwafnKs03lbcUylmsmfmA5bSXI6CcBLVpdg+DkEo12PT2wFjqai7/Ky4n8q
         wBYyP8npMAB5BYmcaJ1yFRMh5XzTEVH2Sg429jnF4jLEGQHo25RYmUfmcar/ToXU7vO2
         lCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0YEWSq8gR989H8UpeTml/2qwKZwcIWXPLJ/1XFd/YDLGokO3qip6aRYA2yuhM8qOleR/fdszgqjFA8LB@lists.linux.dev
X-Gm-Message-State: AOJu0YxINrAddcgvj4uWc0saepTPPifCdC/Sh8CPVUMtnMvR06pBVk2K
	P8wbAJVaSIUJcvHagXY0Xlo/85pNA1fjohoTPCp7mFvN5hZCO6NDvFDe2/uRWnNP3Vo=
X-Gm-Gg: ATEYQzwNUYUOwtU3JLnmBMZ1mHOMVsWFj69kfix1Sebt/03n3Of/r1F3KK0pulzrTKu
	UzK7Ov9O5chlvIYYRNsl4HpOuMJ+HUIaU6K0ImAHg0fahgpenRvU8SqGUf47MZ2ftSexNJhAJK6
	FX7coVsY6/X5yo4b34wabGGtmr0R5Yu2Hg6kcjgFgOfctanka9ppUHXL/tsGgjIXxJ1CHEKqACj
	1uIxEDb/C38qHN94wH/RJxfzxQrjQNTIGeEQNNMGtdIb4DqK6Ytcwfav+gjJBJkyKN5dPkbtmJr
	IMZlyjX1NtaSX0mXzuZDPwzarktHcOliXc2+AF2nUV2ZjKehIa+ru5xrmX3sxzCavdWRgViEgux
	fHXY6ER2JZbG/gqi1gN97DL1KUd09BwBrWw6pmIvqO4rlpmLMK4HnwkUfgcJKHWNLO8+2IC0S0I
	D3WXONHP3vB9UHnygP48OI80CHCzew
X-Received: by 2002:a05:600c:3b28:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486f441bc51mr51719525e9.7.1773833643426;
        Wed, 18 Mar 2026 04:34:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm128585175e9.6.2026.03.18.04.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:34:02 -0700 (PDT)
Date: Wed, 18 Mar 2026 14:33:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev,
	ethantidmore06@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: remove dead code
Message-ID: <abqNp0ALqEZTbgi9@stanley.mountain>
References: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
 <20260318104332.32093-1-aadarshmandal9354@gmail.com>
 <abqJ5kdM_OsgJohA@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abqJ5kdM_OsgJohA@stanley.mountain>

On Wed, Mar 18, 2026 at 02:17:58PM +0300, Dan Carpenter wrote:
> On Wed, Mar 18, 2026 at 04:13:31PM +0530, Aadarsh Mandal wrote:
> > remove unused and commented code 
> > no changes in functionality
> 
> Line wrap at 74 characters.  Add a period to the end of the sentence.
> 

Also use capital letters at the start of a sentence.

Remove unused and commented code. No changes in functionality.

Probably saying "No changes in functionality." is not really necessary
because it's obvious.  Where it's more important is with things like
changing strcpy() to strcpy() which could look like a bugfix.  But it's
fine to add that.  We would have accepted it either way.

Wait a day between resends.

regards,
dan carpenter

