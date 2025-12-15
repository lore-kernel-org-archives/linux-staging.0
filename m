Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D11331224
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784076; cv=none; b=Snu0sZXrhVDhz3znhfYYfk1Rewy78/gGPv3wLxgrCMr9/OUKccpS92qj+A35V4LkLqTJQkWdIOvaDJPisDGoF2Y72kYlNBkN4yO/vonAAxbHkqb9vVSwG0iuwIWRT2lCPrBuJAz55C2NzH2ciNIZ2vvYq7VaCJCMqWcVPurZw50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784076; c=relaxed/simple;
	bh=9SAgV0fUg0hBJJzzUs1DhXBNfQ/Q2ceD6ybYEobkSjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgHL05ClkanaQz+TUEojmhqzA+QBMfaMgbhqq1lkS6YFzHSb2Q0s6NE+7jmi9+BrZpcJDfh4FukGupsgDX2GF7eAo5aDW1M2FS5l7OhwJtqrrf4od3ASME6eVRd11cEMKI6P7zA6zM4X3Yy3s5gvfZabtSioPzezYsnUe9zvbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PiIKD9a2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PiIKD9a2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so32416755e9.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Dec 2025 23:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765784072; x=1766388872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEu7glwMonwQSNNzk21AsH6UmlaG1xweYGiIE3of1Z0=;
        b=PiIKD9a24CwZ89SWC8iwbEFHOE0ILFoPSQWZ5gbZ5bNSmdZY55Zgqhz8GorNd8v6/b
         Gdd6TiwCqUctlxCP1j7CMv//4Z9N8aZ4M5gvB+ArU6YJlEsjsF1AzVGXtOVhXJqBwuBC
         cdDN/xiwf+lp/+KqPhWjU5Wk+TJdud3/JcynBhQPz0Eed4EIxXRerOsk5ke3XALEBT77
         Iox4CzijR1YoDCKNb6PMet8y7GVPjnzlER5xpTrBuwsJBPK0tVGOyYh2EVStb/jaK/Aq
         Uyyt3s0b7yrbQnBqKU6yIL2Dk1y0VgZgp6YqYlD8UXz9piKOv4KleiW3N4AhqKA8ruqS
         8DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765784072; x=1766388872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEu7glwMonwQSNNzk21AsH6UmlaG1xweYGiIE3of1Z0=;
        b=oqyO7F6GZ60BEvIvYRIvY5NmLxFL16spE7wovmBhcPvCblur/GOryWbrQA5kbtMIlO
         2PjIaxQzC6jFeD4CVEFjSvWPdBbCJ0CNH+LS3p5Cd7FVggzIDJcT8YU4MCnwA5IYsg1c
         a0G8wEkq62OgqBE+PMcfLe26A8k8hpxfXEEV1LsXghETGlubZxrpjNP57lBBTaJLJlSa
         a/fNdEOSz17dDSVH2IjTgss3tSIkrlBHRwZGzhqHh29MfL6d4LJoF2R2N8uegYJTix+e
         PtP7JnuE+eg8jkxehZULHXHX0oD7P9vi7+sy3ztWhOFfs0n/muTLdbZLB2iqsakl3Bjo
         0bLw==
X-Forwarded-Encrypted: i=1; AJvYcCUdp3RWt4hG5gS0L3LZI4sgNPdaZlM1C14UttiEEOgoPk8ZOAMJfHsC5noPIIi9I5vGlHjaBPrQefLBj71H@lists.linux.dev
X-Gm-Message-State: AOJu0YynQ8U+dt22NsjArkKlWnF8AwwqF9lSApNM+R8kOTxCWL0ltpqR
	1QdfZxnZRHxzl8mhOsyIacDiR/EBPWOMg7cCIzxT+P8GKNT/cw5Q7YZ6gICtLJrkdBY=
X-Gm-Gg: AY/fxX6QBjHJ02+NxanJraXO6UZufjFO08r3krlvJpyA5/N3/c8LOn6mpw7wKKoDj6X
	izdGx4AEt1Oc2cukxuCABApjg8dy7zkUC13FknOyNUxYE0hMY8OLWT4RP7CPYgnVw6Bg76Jg3xP
	+IWB+PG4fCRSy/EkboIZwPBioG0XIHIqOs0V7tdWkauJHc0Kiq8c2DiUlFaeVce1xWxScmm54nn
	qqE2OAkh9q5hR+e9LuVryCqpJBAmulId8vY3ob2u/dV8a1BEYm9vVe4zVhcWcQ8Vs5A5BtEfS1k
	AEb2ItS3GuF9Ms/caTWUq56X3PR5Pof1SIkeCiZDWVChs4P2mqnU8g5v+OsAgkrGqsSKGVrzIFG
	RretNEzXVUP2Pcxz034tFk12LUCc3/l/Y9RuEb9oOi2GL54YXe+9M5gI8KlrLdVevBjom1ZvYIh
	mg1LabRodFB7qUy+Kl
X-Google-Smtp-Source: AGHT+IFdhiWzma1j1JAXUTNXGUJxYnJu1HaalTbJYRA2KUPC8h/V5JZI9+eThj7VtljIJqRMbEshRQ==
X-Received: by 2002:a05:600c:524e:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-47a8f915c70mr97044355e9.33.1765784072195;
        Sun, 14 Dec 2025 23:34:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b17bsm174687485e9.2.2025.12.14.23.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 23:34:31 -0800 (PST)
Date: Mon, 15 Dec 2025 10:34:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrish Bora <adrishbora@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: remove dead code in os_intfs.c
Message-ID: <aT-6BOl1819eub1E@stanley.mountain>
References: <20251215063102.1836-1-adrishbora@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215063102.1836-1-adrishbora@gmail.com>

On Mon, Dec 15, 2025 at 06:31:02AM +0000, Adrish Bora wrote:
> Remove commented-out dead code in netdev_close().
> The code was previously commented out and is not needed.
> 
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Adrish Bora <adrishbora@gmail.com>
> ---
> Changes in v2:
>   - Removed the dead code entirely instead of fixing the comment style,
>     as suggested by Dan Carpenter.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

