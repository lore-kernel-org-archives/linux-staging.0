Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966EC33BBA4
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176372; cv=none; b=rqY/3aPJx4kweQyoIN+h9z/o6CN2gRYY3m298nx98ncSBjj/VQk17wb6yr6lbH+gLBCHqAcuceouEEsXw5LEMXR9GFFFxCc7/Vis6q/1uXbq6i+qEDxp9n68WP7b51YhI1e53A87Fpt4lENx5wyZJ4AOoP5ohGvZxzpJPsI/1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176372; c=relaxed/simple;
	bh=Te2ETwPe8CTD46q3uzO+m962OmKAm9X4ezXV9BbOCdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfcwGQw0ONTsMDN6fqYVeQMM9rd4q11zGj9i2xCSE/p2tcjRxk1kHHW6a+av8JqGK6x8wVXQKipqnUVVJ/O/UdQ6i3+V1uFPHXgC0fq43QQZ2tR4poAfRNaxM7LLeKxGalvy99p4Ph8OslNBo3zssBTWpSGQujhSC29VMngPiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wzGN2lxo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wzGN2lxo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483a2338616so10319935e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 23:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772176370; x=1772781170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BLodLJsKkEVRBTm6dIfGWy/9mRbAh2N811+5cjpyuYk=;
        b=wzGN2lxols8ssM6gXqW25vVtbWxcoDEoUCypQy9LJD9XYkob5t5PnZjJGPtTgeNGPQ
         04uynoAaQXUW3Aw/AWUMiBYrbN6K4IXxCNCJ1Nl22DXfHxE7Xg7uD+R4LpHQRb4NH51F
         ugwiC7bxtdNI7ljPTClQhxxqCoSwvQ27aPa1KalDEPzJ2m2+CQ9U+kL43qZQ0acKjth5
         oJupW9jEZGXPpakr5fWa4Jo6ZHKkmlEYziPKiqka5qsr6TYKiZ7a/FsrTZCX44KRr4VC
         WS0Fa1UhDmlrkkZhUHGd4TubEJM+6+hkLOWxsK+qOd7ABKp1LWBYleOf1Jv5yBgzFBeK
         4Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176370; x=1772781170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLodLJsKkEVRBTm6dIfGWy/9mRbAh2N811+5cjpyuYk=;
        b=vkRlqw8Bel7vSH366UGpULiGgapaxAUlpEgeI6VThwUmxi46dhJ+lVxQQAxCzFpgjl
         UjCGTn2aGGPQNpUaHD3OQj+7fWz9OJbTvEmLD5CZQBiHa7oSFpg0rBd77AQfWMHp2oOH
         aCNelquTq6I/iy4sq9Ph29akYg17s3KAxKf+0tU0vAa9EkOG+WByyIQXaTL3UdT5tLAs
         lG9SfzG59iOoAcdmkqCkK5olWfoftm8jDRXneZMp+9z7Kjm7TVTO0FJ5QOE33rEeBM8T
         S3Vmf/5SsYlSHgNQkWvvHUrLc3G0NEAif/9BObvr/5vtRwvn885ZVByMNzvYsFgrYSYp
         jXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqZQeyZTZR7fQEdfQlIchGnhUeJqcGq96AolQ1H6ia0PT8Z1PhTyv7kQqaGgkY1wHbmp4SjhNIh47YDXkk@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz9F+ntwz28ll1fAs0T9V7iousPBQpZa5rTJl9tAP+0YXpRj93
	PRhqrNfWA8LyeWD/SHUwHXI4CdlLKktVEI6fO4lhXormDatWTRWwTEj00aL+uSs8NI4=
X-Gm-Gg: ATEYQzxkKCIHOqsn6I3vYA1zAsuBsrEZwsoaLaZq0bflGFgya6Ue8ESI/zEYqI6DaP2
	KcX/1MnDlgFvQ0F5WoCZNP0r9Hg3CIBbnfx3LpRu/PDZVbsCe9QB20Z8OQjCHUrufofiKxZXtqG
	CmgMHhOy7LX56+hfYEMx/7caKZ0x6zzzpBeRUpWT3xC1Nt+630sdY5AC4W+I4s6mYdlC28nWI2w
	jKpRx0BxuY+zauJeQntZbytAIsR1OJHsk5KHeHD4IRisc/7GPAiiLBmMzE0tkXGWyw/UnY1TDoY
	ehubPlk1SEyHgCMon4s7PXyk/4hGkN2gmOV/gXMmhrJckUjGwbZVbtvos1OJH5oUuhnC/9A/y9Q
	5Yi83NrvkrjAC7k36TMl5i2/fL/kO1xhBZEsYABiZOAMH50MXBVN0c/ThMcCqYKe68aQvp9GkpC
	NEJpEFAdiKlKhF9B47L9NBJNCcK/o3
X-Received: by 2002:a05:600c:4591:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-483c9bf0b3cmr22333205e9.22.1772176369643;
        Thu, 26 Feb 2026 23:12:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm210823865e9.3.2026.02.26.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:12:49 -0800 (PST)
Date: Fri, 27 Feb 2026 10:12:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Mariyam Shahid <mariyam.shahid135@gmail.com>,
	gregkh@linuxfoundation.org, ethan.tidmore@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix logical continuation placement
Message-ID: <aaFD7mluUSq9PfWE@stanley.mountain>
References: <20260226093811.30659-1-mariyam.shahid135@gmail.com>
 <DGPCU2QHDJOL.3NM7ITZRM1O1W@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGPCU2QHDJOL.3NM7ITZRM1O1W@gmail.com>

On Thu, Feb 26, 2026 at 07:31:34PM -0600, Ethan Tidmore wrote:
> On Thu Feb 26, 2026 at 3:38 AM CST, Mariyam Shahid wrote:
> > Move logical operators to the end of the previous line
> > to fix checkpatch warnings.
> >
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
> 
> ...
> 
> 
> > -	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
> > -	    && pmlmepriv->num_sta_ht_no_gf) {
> > +	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
> > +	      pmlmepriv->num_sta_ht_no_gf) {
> 
> This should be:
> 
> 	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
> 		pmlmepriv->num_sta_ht_no_gf) {

Ideally, it would be aligned.

	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
	    pmlmepriv->num_sta_ht_no_gf) {

[tab][space * 4]pmlmepriv->num_sta_ht_no_gf) {

regards,
dan carpenter


