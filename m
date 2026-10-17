Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D023E1692
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235065; cv=none; b=tSXAg/vQ0GvPfnNVFJH4G35qSBf+tUP//lg0mIMTPu9xbTjL5vHSbUGe3sEX6Hxmxry6OtrJ09Qdohg7o2xCJYyLg3csU2HKwVU9sUVm+FTsrA4tbUvMw0MC2U/gWVxdgUOXIm7+uZP+czUMLYLFSrj5Uqn+lmZkzYW49WM88JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235065; c=relaxed/simple;
	bh=2PkaU5TbFTI8MHj7BOso2/r4YBu8nhLgzXo03LSlapk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmvtFYcXB+nUcLFtiitb4ShnKJ6fORWVW7mVShmTaG6UM9akFVIMHFMjNB2ynYl7pkFzj/UiOnLB1slx4O4pMzuYEtmf0cdu234Q0PA7hZGmymzbSUNx1Dl6YHHFulz7MZJBoOLexL5Focs5uVTivyjAKov98dI1SWys8uFxVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsJ7uN/w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsJ7uN/w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a061a13884so5147595e9.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235062; x=1792839862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2G9ZJTSg0XhBrGZT3d3dKn6X4ZPYelm2j926k8i4T0=;
        b=HsJ7uN/w6Oz7SPaQWXE3Eydb3KWqsvpyyLUOCALXrnolmMcML5RgfDMExJBHKgPx1O
         6Q4P64w9dcCfDeC5bq0jRRuOK/n5QVbzWr6ypJ0Cf4FmOKg3U9W3Culrdgx+Jhvegbrl
         BCqWA8UG9OGVkguHUJgLhcvJpWQpBSBfF6hoAxi+BFpynQDjYlJgNxCiBDMGVfQi3ric
         c1CB+PKn9vz0fF7I7dNpnkZhlszzzBomVHLN1adX3uV/ymyPnRzFWoHnTRw6EStMj1lK
         HeX5aUPmhlhDvHUasnaxHrYSQFbyuEhwjXdcjcD8JuNTOxSGHL0vDrNA+xOGCuaPK/7T
         2Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235062; x=1792839862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2G9ZJTSg0XhBrGZT3d3dKn6X4ZPYelm2j926k8i4T0=;
        b=yKl23tIWKV1/wIyLQKjmqrnbNM9Duz81pm6SHsWU4fvR+kYASVHvdmgD/u8qZfkwq0
         rxgYZUM9wJBCtgZRQy8Ibck2ON8oqwQwAQh2QnP6Jkuo38sEhGuYJInyCyQWek4BxVCa
         0pqSWZDd7WQzIsEGhG1AqANWNRi6GM8A0AW1/6efJY06ElEMnFq5F1eSeeL+oopphufa
         N4io7lzD3RC09WOhHjqM1sxR8yqxmSFqZA5DDcCro+cd7sPQPHDBjZbwumJHUu7J+iWt
         fd/Oy6OWnWVhvToKno0EB4JnnqoUwJ/bR7YHxwlWupKe8EwWNOdtlzJGnsoF+gRjCX6v
         TPrw==
X-Forwarded-Encrypted: i=1; AKwUvBwrEGvfctPvWkJBO1/TIGHvLah5cu/26bkF65zpX+HvSO8zUywW6SAeqgFth/qXgjJNweZ7WQkVU2+3C3PS@lists.linux.dev
X-Gm-Message-State: AFq9FYI+DxY4pG7bfLrVWozxoQ9slq9AHNqrlUrZn8mN2CwwBFzJqC3M
	e9lL8OilVCdm1adeY3yjJEPuyC/qfpx8o46f6aTcVRyH5dbPlYyBsYP6
X-Gm-Gg: AYBFou2LcdLlOqQuLxNi4Rwk8nJ+2HeAQ5SVAb+QfY5zkODpHFfMaGCOyjNOdA1Lvrn
	GwrIFpS7MR6/ps4lWS+UUMD+er8MND5YMLnyN60LF8imu1+7WprjJS+hxSkQdOofWrK3bR1WGdz
	OpSjYpJY3LC280FZbsFIxcR93kvMxjSPRqXq9gP5aqTkipYCQ5NcXltX2a0edaD2M2HpA5S09+s
	7fPMsB5I1y6lw6+TnJAy7fQ9U+Bae5NiP0JfgcT/b5a6PWTbWl2z4pSbAqYreU4mMzOxekT3Kfr
	W3HME60t4oOtWp1lFI0gGb8GrFFP9DiXpQxDJ8+nTn0cBc1xBQ2ZgsoF5EsA3NP6SQfC3sFcY4e
	hNdUSmRFp1tsLIseQRKiaxGEk79/JIhLovL9GhqmxL0vNAGfS2RYZh1ZGukz7aBWpSZO+N+qEGp
	WMnyXwf4mI1+xGbk9WeNZlKpqcoe3FUV4ggs1yGde3v8ET2/f2chT6SO+U5Tvdb3PbhzXS0/5qx
	dDyNQ==
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1d75f987dmr67689495e9.12.1792235061513;
        Sat, 17 Oct 2026 04:04:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm245158245e9.1.2026.10.17.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:04:20 -0700 (PDT)
Date: Sat, 17 Oct 2026 14:04:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Feiyu Wang <wangfeiyu_mc_code@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove multiple blank lines
Message-ID: <atNWMLAznJJqABRA@stanley.mountain>
References: <20261007104610.128178-1-wangfeiyu_mc_code@163.com>
 <20261017103549.6555-1-wangfeiyu_mc_code@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017103549.6555-1-wangfeiyu_mc_code@163.com>

On Sat, Oct 17, 2026 at 06:35:45PM +0800, Feiyu Wang wrote:
> Hi Greg,
> 
> A gentle ping on this patch. Please let me know if there is
> anything that needs to be changed.
> 

Same driver.  It's still there in staging-next, I think, but it's gone
in linux-next.

regards,
dan carpenter
