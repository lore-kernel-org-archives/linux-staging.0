Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5540A924
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317473; cv=none; b=BybMNh8jU5B7MC+MeuMeLKz4FVr0ETL0+jTm5g2J/dhUPlIGVg2HbchG4OGxXKH6Qi+ymv7YxKHWRfZetdmx/kXJDZZbUS4zjdlk48t/bled1gOIPapu7SiODmMFCxtvpX80pHPGEqUF+WwI2tBP1ZZ7QSUW3vBC9+t80gvPgKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317473; c=relaxed/simple;
	bh=3LmA6heKN1ElkYBG04Ih+8DkJLzVJ9O6vMkr1DR3eM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki5BRRnTfakK6CVbVc4mgdZ3usLrgwvR/38dhQLT+jMaL8gmMIynNJT1P/dxCaAILqkkg8RqA36Qe3WhHZ9DfgtFkLUi0XvFGO4rYLzqd+MKhy+Jg/FroRwjqN7ICugyuHnAVSiWRwuhYAu+yAUCxScmQm9T49FFOIaMpmcLfZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBCbENJG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBCbENJG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e58034d05so810137a91.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 02:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317471; x=1785922271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iFa3hjtc/A/mGI7IVBxDGwnLNLrHBmZawT2+A6GW2/8=;
        b=PBCbENJGEHYyFpY7L2lWRsFd/JeawACClgfVR+u28WjTqfj6uSIyzMYp+Y+q/LU2/I
         Kxh4KdfqZkjvWHE+51ZXpXkXpUlQMQQ6I4TRx37NMFYuGIXjhw9D5yhaavjIUdY3FPVF
         0+dxJG17OHgRu0oLRpMrZkO0nzFb8jifm8TNxVTwK6JtjWQEdzckldZXtR45pIDEG0QJ
         UYkyHDxqWRKV5RWSwG9k4P9HGJKbdxuMBen8UZVFxbMrqYaDp8tYI4gwOh1izG58ot86
         /yoi4zlQOsMrUP8J5GiaIqgWf+4PWaCbn05+zyYhYMahbCYnb1MX/WdLz6lGj0nJLdbN
         lQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317471; x=1785922271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFa3hjtc/A/mGI7IVBxDGwnLNLrHBmZawT2+A6GW2/8=;
        b=IV2U18pMF88EELuHUYvSN2ZrKNM2PwR28EHEifyYPzJWBS7yEqFqxAWFjggBD9tTDR
         wIQE83/5DAbtaQJkVCK6gWOE7ZUnA5bhk69dElLmIYjjljmUoq3WDF96joDEkmN/Tp9B
         0Bn6R1QxgRlCOyVQktE0B2H9YxToZLVA9JhLupnWVyQOos01qEUJuiIYXoa8wm59O77c
         8TQlqJ4cQ27mw27Khxs5iH2nnaIET66ykh9I/nF3z3hJs2UgqYPMXLrCrLMbSOZl5eAy
         Ztckn3vyB/JPPLNToy0J03JtUr4zuPlQEx/lh5VNusAo/BCeW9CENEJFclImWggj8SOk
         nBLw==
X-Forwarded-Encrypted: i=1; AHgh+RpMO6VrnVx1DZlcmb/WG8c6Le6zuvu6Ani/xixl0yNGas9wX82gB0kCKDlGL54Gbok7/EH3DoxEDHOyKhBz@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx9LlIh1duoJm0nfR1O5/eTVy9iCIXtavDuqOscBrTZ5eCDHEp
	Wf3Nbv9l8oS/aGEqNBInB9k/F987F4noyNZ9FnHZVibsikQy/ASGEYP5
X-Gm-Gg: AR+sD12ZowjbHOfLsxWz0qE/S4eL2YtAJbVAqJMAyQrrPsykNy55mbP8I45LQXnH7Mi
	zeQ6KERRFKHH4yHlVF2kMydUjXaKeRXgHi0nH60S2MB4h2KOx7bZNmEHy/M8f+Vu0fbUkpMKmzw
	o31cpfp9W8nYC83uIZmY3hQ8Z0HPmHSuYcO55IBNlN7VkRzr6xvuzE0ZLKQwnVV2x+cB1Fq2AFb
	gL2TEqEloowu81tW8/VDBDSRGy/nmYK6b09T+zqrBriq1JmdGSr/T98g2B7w+fPBMRLzkECeo9o
	tv2rvq/uCDWXF8JUsMsHWqtit7mJD4VbUNi2GPG2V/pMbJHUEVgVfclD0/N+zztqDOX7CrZRa+d
	cp3vVb9xC65JllAkG2sf8zBDwED6wTsgSl5+lu6cV42jykoGiJmFHc4/JRTe5urQ9KqXGWRGts1
	ilMJk9IUVxLRwiT/KWmAYq1OL+/DMmNC/aWfeIIqmqpxeyjwArjqqk8iY=
X-Received: by 2002:a17:90b:2803:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38f6a4614abmr6041843a91.23.1785317471414;
        Wed, 29 Jul 2026 02:31:11 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm2461027a91.10.2026.07.29.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:31:10 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:31:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bramwel Barack <bramwelbarack89@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix line length warnings in
 os_intfs.c
Message-ID: <amnIWVloVvWjViV5@stanley.mountain>
References: <amm_xjWhiP50C5lG@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amm_xjWhiP50C5lG@fedora>

On Wed, Jul 29, 2026 at 11:54:30AM +0300, Bramwel Barack wrote:
> +/* for enable tx_ampdu:
> + * 0: disable
> + * 0x1:enable (but wifi_spec should be 0)
> + * 0x2: force enable (don't care wifi_spec) 
> + */

Does this really look beautiful to you?

There are a bunch for rules for v2 patches...
staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


