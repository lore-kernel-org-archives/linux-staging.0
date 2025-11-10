Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ABE2EB86C
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762763567; cv=none; b=bUCkrKiGyjou3Yp99x3DtAI8eEiSMU15ImOROYS6iA2qEiV3e2PhclnK9582TKuiWjCKrWIKNXm0MfFsic8mfXnbVhuJm2pthXFJbzoN4FniQ04n4VFgUKp/NTCdgQpAY3Ny8mmbZ4jVkvNGa2cLHuKrCHGJVUWgWLtm98wt7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762763567; c=relaxed/simple;
	bh=Kk1WJL5OvO8Dk0a049qkF4L/FOOdQuOXnHdfhx4ehaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiJQqPeJMMIMChsz00RY8aAmaAEhiOAdu1CtCcEyhFmfK9rHbGPKkhcpaSQ7KtE1hXxSbXTeftUOEbhBIqMiDhRuUXVUKEKEtDcrUNvZgpJSmollf4nJW+ECLGi7z9UXJZ/+RpL3FRRUDuIKQLbF39QpxRun9kJdvVdNFXaSo7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVtjJBrR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVtjJBrR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47755de027eso18368805e9.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 00:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762763563; x=1763368363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/w7B3riPQ5vl5Qmlqum2iiqORAdpBKrl5g+Ab18w8+4=;
        b=PVtjJBrRBm4uoT4sApP0u/jlaLUpV3zITTLkat0h655oM9C/ywE/RqzonPR3yPk4G6
         euNRKkJiPoIn9wEZ1eyYEHkpyai7+JfM/DxIc4Uhx0YPQ1kEZ6OSahKkupvv6haOvYaG
         yEh9ZBFASl8XtsXC414NFn5LxISH5xQshVZRcD1kDCFeGTqgPHFJMtmvB46a0Q/tEnwb
         Hf0CrG9yG7FHF4+vpJPSPrFjiOZdOgS4c5kRhYITMSmiewKBDeW+CSlmoUBGCwE5gWyI
         pvTpxdkO09baRxantHJ3NYYic9hsvWdy0H8DYeWW8vqzeCz9lnfBSvark0mO4agH+Wjg
         1B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762763563; x=1763368363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w7B3riPQ5vl5Qmlqum2iiqORAdpBKrl5g+Ab18w8+4=;
        b=YM2Lpz8jmIebgPo2N0zJnFuN+aYBzEqcFb521Vk3NMpBBwc7b2pPjWHYkgak7vj9F+
         IOCgGuT4lQ/Pco9nPqDkk7qlH3mE6V2u6R2ydIxdTCY8ZarJ1OdqaeKpBGUvaBYe6SfB
         ftRpFg1qft4kBzyvWibHV8PACSDm790iA4aMy+R+7WXGzjOh47k8jaAIgDKwWms/Y+y+
         M3J5vML6Gtk5RA+6ShPrN6o6GonFlDl8pcsjQ9zKXCpp7zF6nFyh712kJHWGb9c4dQs9
         SNgivISsML9xER4wO7VMMDxMnsN0ZFzwIZX7vwHojylOZaDLuLgJkXegpZyNPRyBgTbo
         6rXA==
X-Forwarded-Encrypted: i=1; AJvYcCWlgsnxweHzFEqAl8I/ofLQtkth9PGSAQMClL6DkwfkFu29DlmfiytfV0mEiZ1Hf8kHbRhd993lvkLIO8NQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyW7Luqb+JsOmBn1kgs2+Ha35JXBVvbZk4SiXKuzrJsKVgxTJQp
	OMtpZj9ffnwJYz5C00815EYAZogKakCvPm7uQIC7k3W29qPFiOJB5cFI
X-Gm-Gg: ASbGnctQDL1TJradOiW5cxcyLZt0MgBzN+xz7IIhA81XWVQmHi7v2rEUe+n9W1j8FCq
	UhFuJIdWqhWrNdBRb67TSKn10HkJTGeXpK5yql0PQhkdiVyT/ssOnbq/MNoMGpT7F6ruSOUA+6O
	3e1vkLx/baPff4ItRlkOx9Tej3uJjkzySwRZx6zLVnlwYFL0yafsdmmJYodkJBZ321R5PH7Iif9
	8GFj8VUUrZyS7KZXnbEVFgszqc2qIkdwecN5zQD/F1w2/wMs5fwBQvf+yaS+hqlXQ1qQieGmp+r
	u0vm4qUOa9lDTUFvdwdxyBG3EyG+kwBSoamz/NhD4L/6GLFXtStRadENkdI/FylBLVv9+0BxzvJ
	S8bLpFCGj5sHRn4j1DaeI7uOtE822xgXddBvjfYnaTj5wTIlEwv3d6WWWhlVrfOgIb7ECnD+uUV
	XMQng6WGfKK8v5iGtU
X-Google-Smtp-Source: AGHT+IGhuQxvdIPqXmeyml0g9xi1//VxE7hSufLSKRdx3skhW6foVF8bcmEFQM/y9SQegjaQJUtq6w==
X-Received: by 2002:a05:600c:4ecc:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47773224fd3mr68310335e9.7.1762763562445;
        Mon, 10 Nov 2025 00:32:42 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf40sm20385624f8f.9.2025.11.10.00.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:32:42 -0800 (PST)
Date: Mon, 10 Nov 2025 09:32:40 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michail Tatas <michail.tatas@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: gpib: converted // to /**/ comments
Message-ID: <aRGjKOJmbiFYua24@egonzo>
References: <aRDo9UtYTwcoFCFm@michalis-linux>
 <2025111014-arguable-antelope-1d9b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025111014-arguable-antelope-1d9b@gregkh>

On Mon, Nov 10, 2025 at 09:56:00AM +0900, Greg KH wrote:
> On Sun, Nov 09, 2025 at 09:18:13PM +0200, Michail Tatas wrote:
> > This patch converts comments from // to /**/ to make them
> > consistent across the file as suggested by the TODO file in
> > drivers/staging/gpib/todo
> > 
> > Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> 
> That todo file is a bit out of date, we now allow single-line //
> comments, so this really isn't needed, unless the maintainer wants me to
> take it?
>

No, I am fine with the // comments.
I have a patch for the TODO in the pipeline.
cheers,
-dave

> thanks,
> 
> greg k-h
