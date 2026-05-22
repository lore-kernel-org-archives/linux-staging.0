Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D013A5437
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428862; cv=none; b=jM/Q0EBIdMlhTkkfstuwswxkGYkuekrBEZx9/b4s42SOMiHeyXT1N+8lfivfuadjz/1dTKt1DJS8hy3EXvohB1mbIsVOzheUH7E5xjUIFIHfJJs5H9G/hw8IHUWpg27m7DOnx3yyLTYr93Nc1wQ4seGO/pzq8kmI2GASkaUmH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428862; c=relaxed/simple;
	bh=mnaRC7dXDpCu8FhK5/IynEsVP+LzeUHGL0L43FhTL4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Di8eiZuwTv3GKUWIVw9hjrQJle2tlTJcDBRnUJAlM+WkdnMmvi7Rc8mW+rnFc+2A/Z8k2S0lk9CinFgeMrkS+4G5YMgdt7zUHnqLm21sMIYXq/qhpAkgHDlqUgHETw9k5+htPXLt9SOxFtXQ6JaJk1gW6o+bRbbNyacOSw1v5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBxsDJbP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBxsDJbP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso5772418f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428860; x=1780033660; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz5ZOjw3FeL72jk7F+0UPIsdaeQYYOgeeWAhjq0bfBw=;
        b=pBxsDJbPVD/IGnzKPq3VtstH6nr6FUswg/BPHYNjoF5TB5uj7UCtVwg/nIyQyf95/g
         C9dupKCLNLfriT3+2AZ0r3ZMsxN0GrIG/aLFC0cyjnV9u28r/J22TKiy6eOJfJThWE4A
         s86tUpy3V/J5Q1XggIaEID9OiRXn9sbbaaAkuNJjmV1Vm7/IpR8w4YybmFmLn/cDcbTO
         O5bNY7zW0uWkM+HZXCUYqn7ra+4MYLUOqI2K2jcLnaJW868jSgdFPoIq0v9urHzrGUHw
         VFD40EKPqoXB6RYGNjfP+Xja/5IoWU5OVwIYf6Qddz/IpQ8XFj5pQTWtOG0Q5BS5CNch
         7qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428860; x=1780033660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yz5ZOjw3FeL72jk7F+0UPIsdaeQYYOgeeWAhjq0bfBw=;
        b=GYNvsdJcBNp5dOhHewNa55I8yTxvHTP8JqSQB1HZpU/GmZwWquBlU1tl2rabhqQtN/
         AB171kmNj/9oODBQ1eeTFfWgYuolcvA/KSz2qjB02WRTRdiwXgdf2G59gHN2TD0BBSpD
         p0lGUJvG7+om9D1cuh2FYJuvNnjmgCIGrSse0b86KhUKOdhrC+1aUApTCcBQ/kFyRs0n
         c+BvZ+SmzDlUN4M0vf5DY+cBtazH/1rEF/v4dBij8ndRSeYs1mwxmkcNTqx4nNdJQTfY
         wKNiDbeQd+NRaxUHteilF8Q2h4ryj1+RbLPVYt9q7Z3xXGVZ3qnDNwIDH0zbVbSSHfoW
         5YCg==
X-Forwarded-Encrypted: i=1; AFNElJ+3VFWo3m99nvSB5eizKskwu7hMqAA+YwsDinwGyBlMhQ6ng/X4noSARwnHYcowW3tDH2Vb7UbSve1lMo+U@lists.linux.dev
X-Gm-Message-State: AOJu0YxHbPtmEPmDql16B20BnVr65MwRFz7mJ7YMxZVft0+q3zju7bam
	fsSi2B7x3l6V5f5QwyF+51dN0JD45HDFq6rMO5Dyt56llZHHMHwQws/a
X-Gm-Gg: Acq92OEZYtqR20XIvP+vB0rXuVC/lKY0J3ugO67RlZm7jHss+mKjeFbqE825sZW4Rns
	TyeNotXVE2i85GAbUoMcqybB/eu/0LUBkBJLL2q43IFVHFF5qgQLswLA6gsG52nH0duARFTMDQK
	GR+NMn42WGI4oSLMIgCCHkpPK5sfMhZcWbSt91wDYHioImUDhzaC9PFVdls4HOc3tWlmz/wne7N
	WKLxselyUOZSgb9Ifqml0aVNb0Y0KnRqi9gDqJrkunJwmb3n3LdkTj6iq3v8DPHk2HSQbFN8pEb
	JzHlNwgDNIMvMTjaShbdmjQaS7oNM2DKc1UCfyjVntGC1C7W6VAso31HYGoAr5H9S7c7ugVGepJ
	kVZ2tLWpTTMoVyTOjTylSKjASAYlNzD2fXOW6jM6vjPw+ppzmNmu9TKQzpiyGVzZrfPREPoxkqs
	UidkFV03OAZ5dBPA2Z0fW0prs=
X-Received: by 2002:a5d:64e4:0:b0:446:ef9a:8f41 with SMTP id ffacd0b85a97d-45eb38df2aemr2484854f8f.40.1779428859873;
        Thu, 21 May 2026 22:47:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm1370499f8f.33.2026.05.21.22.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:47:39 -0700 (PDT)
Date: Fri, 22 May 2026 08:47:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: omkarbhor4011@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix operator spacing
Message-ID: <ag_t-PmIm-tV1KJ0@stanley.mountain>
References: <20260522053854.188893-1-omkarbhor4011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522053854.188893-1-omkarbhor4011@gmail.com>

On Fri, May 22, 2026 at 11:08:54AM +0530, omkarbhor4011@gmail.com wrote:
> From: Omkar Bhor <Omkarbhor4011@gmail.com>
> 
> Clean up operator spacing to match kernel coding style.
> 
> No functional change intended.
> ---

Run your patches through checkpatch.  Wait a day between resends.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

