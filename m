Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EE418E20
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 21:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872716; cv=none; b=QB0nPjQ7q+UiZfkXuQXGzhAL4oXRFsDDehEetimZKxiBvJxBYgQkbfKymsaMcDMd4uNgBX/KU7XhyR/rMHVxVFxBTdiQ9VXpaZelPdx0xUtz/3CCsewAq3ORYWm0dKdUPtN2tKSB5CqjN0Ya4lR5o9u8XAKMko0P5hke4bmhu3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872716; c=relaxed/simple;
	bh=UIDY4eNffZd6VU4WcqmYHwOy+XkRBoPC0tEQIobAF1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9Go/2N1Y3RyPyz4qaMOtu2qzHzMhwdfW7oAqLECGu/v51OYoMhiJrLjLdzXTehhp01z5TpKjGXOqMdxSf9s3Kmu6c0uPdWa+wCs66yz7UVXj1FQRRF6J/nILvqn51KhD2BbMrJItuQeHF03DijGihOcaj6q1ekQuF+za7rFexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sVKzXtC4; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sVKzXtC4"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73e88bc3796so340248a34.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752872714; x=1753477514; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVaMLZuQ3F36ySxiRVFdwYKeo/o3u/qT80a9cWmFQmw=;
        b=sVKzXtC4P+469rnMeKa70N+Emls//AvBi+B4OCGyErqstUwRxPA9qCUZUIbuaLRDGn
         bMzTjtFea40cx6UgvRNeQQ9jtZaY/i+ZKZZz1CCqb28Tm0fPhLIAAmhGFN/XcZach8Fw
         imcixIdKRge2op2pnE8DMMbX0c8Zt1aQLA6XXvC9P8Bb5lDnjU3lZkoLNcaYFvZKxZ9G
         quZ+ED3IZMe0W8FLwXHSjpCV68XNklWbgJqScKyTxGnxrOaBPUbY+2rNb93rB0szh2AS
         CuNqRVxqEtC29Uk08KtfM5EOx4wSbkzWLBLJHs/OeKWuTfDrBOC57W2hWf3F2aeidIFc
         kxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752872714; x=1753477514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVaMLZuQ3F36ySxiRVFdwYKeo/o3u/qT80a9cWmFQmw=;
        b=HBO+Fn0KcAgOaq8VNukZUZpdlIIXyuNjX68rDSf2JT9K/0s0D4VT7Su170K+zcRA8n
         wId5z2uMnu4wDUhiOk317SIN8CFCDj9H1zLXnLgP1QE+WUEAk56ktXm+Fm5VjNOX4Drl
         nFAQu+54nmHdUIWyKkUed5h+LKehSrJRneKwO12zDr27Uz7sEsSou83oIHdrMJxeuQeC
         55Ri/ooT9WkmmuVJdxAIZpmWXceQUD2qj2xdxqXcy0F/Xw6ODudJCUNwAW/oeqKBsGDT
         zo9ynJZXDQbRXUBsUWFwS+dRfHxt9QSZ2nkcUgwK+ucEPcadciJHdgnT4KJZstjbHJR9
         0Z/A==
X-Gm-Message-State: AOJu0YxPkYj6KFWTtj9nXX95Dmdl3MIwvdYaCcK9x/cpK00L10AutnHO
	kMIgXpNKPVRpBhBNA48ipx3noRUMJWIZtH8LGDT//vdgqec9kdNXbhFby5HyOmtXuKfJjwq186l
	Xo3BS
X-Gm-Gg: ASbGncvapzYEeagqhR4YRmQIsj/JqtHxRWOswEc0sD95Yqe2aGMbmXXCgxujwhN3I/Q
	WFzDhKvaJFV+GDBGYp7o4Eqcv2kwc1h1uW1x/TvW/BcbtubVAw/YyCl4WauWgovGqJ08FYiH2le
	KcZ/FhfswNLT+u0Ur5b6puMiePdvMzH1GJV+5H8RfC+diVv3XB7UJf1L0YoZYjZk4qpH49oyX8+
	eT9znRMJiABO3XuXcbsAkCPAgOgnIhaR+fa9CHGcRStfNkgZou9pQOiMckQqn30FJdmJWkeUMlG
	EPJGDHcTPwd/uoTn8berh9oy3W+Q9fntCPCkbCatIJ/uxgPAVZTsnxjpYBIuECR/D9yDOvJGK1V
	SR5NvldHkfLxsRkReAn0EV+Z/EYXRFg==
X-Google-Smtp-Source: AGHT+IHyKyyRfyG0vkcajqrNmJysRKCXt5k1/jIfO+NgCDq8mB6f6leaEYa0oz0/6PlEVCiroKsYNg==
X-Received: by 2002:a05:6830:3494:b0:727:3303:7ea8 with SMTP id 46e09a7af769-73e64b12bb2mr9843337a34.25.1752872713789;
        Fri, 18 Jul 2025 14:05:13 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8369bf60sm931373a34.28.2025.07.18.14.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:05:13 -0700 (PDT)
Date: Sat, 19 Jul 2025 00:05:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tony Bronzo <abronzo@mac.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/1] staging: fbtft: fbtft-bus: replace blank modifier
 with identity() macro
Message-ID: <ea5ebd9d-1c3d-47f5-90b9-ad0121df0466@suswa.mountain>
References: <20250718191935.5918-1-abronzo@mac.com>
 <20250718191935.5918-2-abronzo@mac.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718191935.5918-2-abronzo@mac.com>

On Fri, Jul 18, 2025 at 03:19:35PM -0400, Tony Bronzo wrote:
> The previous blank 3rd parameter in two define_fbtft_write_reg() calls
> created a trailing ', )' and triggered:
> 
>   ERROR: space prohibited before that '('
>   ERROR: space required after that ','
> 
> Introduce a local identity() macro and pass it instead.

This is a very creative solution and so far as I can see this doesn't
break anything.  But it does make the code more confusing, so a better
solution is to just ignore the checkpatch warning.

Like another solution would be to just say:

#define empty_define /* checkpatch doesn't like macros which end in comma */

Less creative.  Slightly simpler.  But still no good.  Just ignore
checkpatch when it is wrong.

regards,
dan carpenter

