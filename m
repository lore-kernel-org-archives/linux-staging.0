Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E33451DA
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 06:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184651; cv=none; b=FPR0LvuJIPldWwxLGiey8oU6ytqyRpOac0EGZ3bNANKpD0eYufHhQTuL1a38Z6AuhqPGgcvbkV4pAI+MyQUa68lKlJW0gkQXg/cSFzQhpFl5tvDGUChXE5FKnMwwAtigcWRbqXMDFu1lx+D5DMOf5XvG7lsW9y037jlMNdarYHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184651; c=relaxed/simple;
	bh=S2+UmLd7+56Nwrcn/l9s7QdHIUB8AVPzkvjJSkeBQL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUZvpOZhzsSYU1KXvWab434GP7JbJ5f1z8xxPdaxYRRLN/HdK+mYbYfBWCYu8R8ibl3C+QSbA/vPD93D8YeghGwob8RC92V9IMsDPsfy3avW1erNYR4x7f7osNQVDpfgOtbxWgqi940dU6pKm22oFQsavEQ1LLOzRjqVO8lLzGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V647th1k; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V647th1k"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-448b0ff4a57so1809756fac.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784184649; x=1784789449; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bb6iTH6F8sM/oel0QgeTYdzLN8Vx0owcy51AZQ0/ieE=;
        b=V647th1k+OCOyvwv+pqSfi+f2OKTsY4/3v9+qqFQS4HdKlSb1Mz6G4LWdlvXpdcUEl
         ay2MRiKhrsuJo+NTb/KpIAKCCWDIlBe5eynZGnrKNLX1DY+CNfd/fedNGDc0G7DFDe7E
         3CtOzlHFWDuLg2QmEN8UvLcNYNcjCIoSz51kEgXS2fxqTyXVLg/JgU22ZPBhGqTCeJ9a
         NwsrFUAd/pGgVQAMHwuui+aO7KM3YWSHTjDmZgFdihouHE82j7G0qfbQdgPNAjifx6ZY
         IofSxonFRqoOG2lKmUWYuJOZfMdVleCq2Vkakcitd13ToQKCNjEu0ZHoM3VZe4uEEmo7
         TYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184649; x=1784789449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb6iTH6F8sM/oel0QgeTYdzLN8Vx0owcy51AZQ0/ieE=;
        b=BADVqSM4nTgNiW7zhYBLr5HaWgXw9n8FNovnPSvKvIIB5nLdzWNhDYcC57WZ+zzzF3
         TUN6wp6yEVJpcJCZ00AYjw4hasXv1tQHO49qzWBOFqhKYJYLNw6Z/Jv4/epuzqOS1+Kn
         VOJLJiiH2fTgd61+GoIOn/Xsk12URhi9przroBheZq817yDiT1vJbCNHqSt3lYTLPLI+
         1SY/CT3pBh1mCjLEUNUzZzyBXMzOhBMmlaCSh14hPha+0buBlI5XkJmt6me/or5m6e4O
         LGkpv1x+xbEcvAybXuSBXNexO4BhHD9H0CRK7QEaRM8TnWCc6RsjsgAVLehb18RcjNIp
         K2BA==
X-Forwarded-Encrypted: i=1; AHgh+RoDQheItv9HNl+rBzJfM3UN9aAU879prWKp9uVRHJaZCU0hUmeMv29CzmRlRMrB59ztNUF0U4wMk7DZ5hJd@lists.linux.dev
X-Gm-Message-State: AOJu0YyZsi4ydje2ygSy0JZKgYAap87JeQKQW2arW5+57m5sgM43uNhF
	iM10020HQIE9WMv8VKGvL3c3Q1mocuYBbvjxEsk1t12lGc1FUpk64jO0
X-Gm-Gg: AfdE7clhmUtBC8Rc+T50HI4EN/nt44iErdJEAIjQAO9hFvgxcoa0MRsG2hhg8irXdU/
	qgdwZpTe3qupQackSd/VipY520JO5TmX6fEB98myPItCQ1VasYP1AeloELfvZQDCIkoFLKksNo8
	9/d/3QKAiQeAvVBo22uzZwGptpKtQ67VVbblpnqHLHLlj1kPg3wRbYE2Hxzaa6N/C3RqRw/9kb2
	kh/v6H1CFbjLZyjSuYdsAtUH1xPB4Z+EUsCjNR3/LitBYSgvWtM0SU09fHrKRzIoRxGQ5xSrwlM
	0AfZkjvTyyUo6PCOiVrLIr3cjr+5LKsv3LsX5Dx0HSjMNpwl+DQkcnA5gPhCcMpcy+sS07MSWF4
	4PX2gfjg+iKKQHwTy0cvtkC+sT+Yyi0eTLfa0Y5YtOVTmohPqrQQnvkF0lgzB9n4/BCOsfA==
X-Received: by 2002:a05:6870:b1d0:b0:455:ae1a:c443 with SMTP id 586e51a60fabf-455ae1b9322mr6276848fac.42.1784184649252;
        Wed, 15 Jul 2026 23:50:49 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45200b7b4c5sm15321701fac.10.2026.07.15.23.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:50:47 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:50:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key
 material
Message-ID: <alh_Qcrp0gwIR8TN@stanley.mountain>
References: <20260713233401.48262-1-skunkolee@gmail.com>
 <20260715235511.7357-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715235511.7357-1-skunkolee@gmail.com>

On Wed, Jul 15, 2026 at 05:55:11PM -0600, Ivy Lopez wrote:
> The set_stakey_parm struct contains a 16-byte encryption key.
> Use kfree_sensitive() instead of kfree() to ensure the key
> material is zeroed before the memory is freed, preventing
> potential information leaks.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
> Changes in v2/v3:
> - Remove unrelated ftmac100 changes accidentally included in v1

Needs a Fixes tag.

regards,
dan carpenter

