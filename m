Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C617133B97A
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614144; cv=none; b=c0pAubTfdwp//t23rLmBNk80DW9a13Bm5OFe/3AiigD7VBGDZMnq35qIhULmkRnLuteULlZgEoL6k98OgxXL0tXaiPAojqrMqDpfFsOCo/tQ1srHVQkutr2nvIZeFtpUCLeCJ//j5/mptDAi3qJ7BZ8ME1TLT9A+0lBwkP2/sjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614144; c=relaxed/simple;
	bh=qzT0WyMC3+/O0JGDyyA2XKdYTGdPUbv01oj1YhQJ6Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHNPceymtuSe/xiiOQTR9XR+kHU7PDE6PMYP4UsL3e3eS88Uf+sutpZSgbl5JhmbQK5GWYlD8X+yS/nxSEB6PUuoGmZy8te5Q/zMC0e6Eoqjq9zeq7d0CE+ORz08Zd+H9VrFKIrGWqmcP0/I0GXABhH6ZYFmYDfy3qbLkK87tEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Is1tutEV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Is1tutEV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso6926990f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767614141; x=1768218941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGx3PdQLTEGTA/+kl6GC7HNe3VAOwtg1+M0c6+I7tTc=;
        b=Is1tutEVTsh0yPX2RL3RxW83MaHM5k/Bgur63cyvWRGI/41So0IHG/nxydqi81PMiG
         E+8lCzWZrkoZfIytvF5MwJpwrm9jputtD8awGHvQVfLkcJEZcMdWZbzasHqVOWrp1S95
         MLVEnPZC6wc4wA5lHIcnAyrvADfckhaZqZJcqolaRhVUmE+/6ItGLfCkOlFb4yl7OhuI
         UgZiZKtnbZ88o8dSKLniAweta/sW1U1+WVQGDL8ckwhZsLK4rcEiW2PzmX0J2IZHH6hi
         V7oxCNmNQ7NIVqkMEmJJXSEEILMWPkl7xwJnTSKLf5jjSpm/p9ZETtG2QAbazWCkYMat
         OCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614141; x=1768218941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGx3PdQLTEGTA/+kl6GC7HNe3VAOwtg1+M0c6+I7tTc=;
        b=BlSgqmFlHUICr83Rx8uf2OsaIv9GJBrc2MJnjDshxLJzqZSCqF6EuXm1AilDonGh3u
         rC9cO04TWg28etWVE4wjXxLUr/3XfYX4jrk5dt8ioF5UmQIgaeySbiO1tmx6216XuczH
         BbK0yXoUk+vZSxywZDzglsCT3vPrKqBOb20NjTxLk7W9k/AIxDMWjPPZ9crNUjop2RJY
         QvRo9PBsv2QugY+zuPhJ0oQDMO2Jo7sVpRIK4HaWSCwBeoxXnVk8Cd6wyqjiPDcBffPI
         3P2GLzilW1KLOht3+U1yfWK/ZSMebeVws5dmpY0jdsWKZC7WsnRvFm513EcH33/eypUl
         uPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUABMBGpZxyE58xuA097WZncyhfJ4Uerb3cFOf2lCAslBwS8w7ChE/Frzf2H2Zmdj429sITG+pa86/GPXfc@lists.linux.dev
X-Gm-Message-State: AOJu0YwqLt1Gof0W0m3CeOtmhUUmTo1llYCpZ0mkLbXYiiJBLgkTqSJj
	fDOOXdD584ymD4Jqs5sDNanT2Gp0yILB6G+CVfPZUEN3XhTaTCYrF0wXTouwrGR3tZs=
X-Gm-Gg: AY/fxX51Nd185aaeXFH+0so0F3lkUPjoi4FLh11I3zgPeh8VhgDqDCQQcgHaqFWFzcC
	CNLdCGolIFuw1YDlGxCtaT/HqA3rw4PHwBYEwAPvSo3UKJqvRM3eWqIslXHMUPzrfGdzto0MOJY
	aNeyd7a2Xiiv4zetwjizFKKiXzXbN+pfzqip84F+i1eWrko7GNiexzqh1IF4q3QfQGUqQ7gmVOr
	wFSPw2lriKEZbTfz6Rk5LNX3Q/Dw7A8abxmxC42R1rNQ4OUT0xyjksI4qc58TrTWH7OIvWa04UY
	mFL3ezmPWAEFT/0KxAzkBCn57+l4rP2SRo1j0gAK32kHaXokmMxf/p/wkADVGZaByE2KrdUr0CJ
	lexMnq71XofnkkWtqrdKYhNOe3dJuoGYJq3wxqVGO+lMipVNc8RKFzRIdPfRObsvFEYjp8rMSzO
	xuRFVAbIYpRvoTWwKX
X-Google-Smtp-Source: AGHT+IGunfGijTnOFIiOYIQluYX+LWFj6c3mZY/ErVVGlm6oAL7B2TzSZFepMA4HDe8vleoKeXePyQ==
X-Received: by 2002:a05:6000:230c:b0:430:fd9f:e705 with SMTP id ffacd0b85a97d-4324e4d3e9dmr71274562f8f.27.1767614141040;
        Mon, 05 Jan 2026 03:55:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm100876495f8f.29.2026.01.05.03.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:55:40 -0800 (PST)
Date: Mon, 5 Jan 2026 14:55:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Johan Hovold <johan@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation
 warnings
Message-ID: <aVumucN_RFQwfgj9@stanley.mountain>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251230012908.214959-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230012908.214959-1-sun.jian.kdev@gmail.com>

This W=1 string truncation warnings always seems like a pointless thing.
dmesg output is really only intended for developers.  I don't even know
how to look at the dmesg on my phone or kindle.  Who cares if the last
character in a really long device name is missing?  I have looked at a
lot of stack traces and I have never once been stymied because one
character was missing in a really long device name.

And also these are 90% false positives.  We just add bounds checking all
of our output to prevent memory corruption and not because we think that
we'll actually hit the boundaries.  And the GCC is not able to analyze
these in a sensible way, it's just going based on the variable types.

This patch makes the code worse (more complicated).

To recap:
1: It's warning about a non-issue.  No one cares about truncated output.
2: The warning is implemented poorly.  High false positive ratio.
3: The fix makes the code worse

Just fix the tool instead of making the code worse for no reason.

regards,
dan carpenter
