Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65F3E4C90
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523592; cv=none; b=MwjXp82gTsELyn/O5zLnDQGyX5a04PKOGVqHEHBY8hP0WpDCL+5EPvGjqcwNysrLpfkUwAs5hEt3XSyncmzRDGn8DqczNS9e2ZwzIeBoC9KyJ5p/4ws5w1iJVILxLonGG/8FNwZMDbY1R4I9G4tkNlI1sqE4aIw+bxsTUnK4cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523592; c=relaxed/simple;
	bh=Z7OqvE75syAa2U+X2SOS0u90frEwNWeKDpIXMeHLtPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW485UW8JSWCOR/SFebiBCsRnIjloukgYoR2XNratrSjseyTqbdXp3MWkXhFK2fh0UxIv15Gnykh4llSosJJfXtL4CR5aF1CmVwkCkMNF2QvbC7DsbqGh8zeyyGloWaB16/8ZawZ4bH/A8HT6C87xp/IcXHCBUNHuquskApEi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA6KmZJZ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA6KmZJZ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517907feed0so43389801cf.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781523590; x=1782128390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2mEvzG86mOUiso05TrKev3JyUyvNYbprsTbBPCrk1M=;
        b=ZA6KmZJZwNyrXYvaPsIYBqh7FYoal+PcUk7f63rP9laI9B0X/dF3r1pUkPRp+SmgVt
         wBx9K/LyepJ975pDk7/AmwnkmSPTZN+cfODcYqMDQwzQG1BB7nj/ypg1VoLwnoQy7ET/
         1KyGUrnNc5A5CqGo/pgQt4Bx3pTF7J+S8rlhw5brIJomp3YiwJaii31s1BTU8hI8eIhP
         MvHlwBJPW7lwMW7RhL709Zzje4NKhdFcE59/Kllyx70qYJvVDw9kl/6HR4OoGeUg+MC9
         3k9bfCO0juBqb2QAJ/EIDwFNN4WRrk6w4Yrb3knpIfNzyzVPyloHKaTo/UxbaaJT67w0
         cJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781523590; x=1782128390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2mEvzG86mOUiso05TrKev3JyUyvNYbprsTbBPCrk1M=;
        b=df0Bi9T4Vo53zV9Ugrhs+qCgJR06FXDfY3XLTimc3ItHSFlUZ8oIbVu/XAQ6dgETSZ
         q7NmcjdHMqmiW1w0hIoPd+PNgocGCrVQrt6HKSU9/MufQDnxiCAkIVHz2UN15pQxJmy1
         2djlITJYHAdiOg95ZtrKci9AyzN9Rt2Ud0SfiI7o5tpjc7JYmUeTGD2qKJfXaAeIoRSs
         pj1iWX948zPuKDHu5TMpKV/CH0zT2K2OVKHPEDy6kEZRHHoLq+DeNXpgMkiyuaI40rzh
         9oAcePylaYL91JD/0GFOcmJIXMm0af0ZWGS/gh+nW03o4kiEhcpJoNkscwX23nA0zAxK
         Fcsw==
X-Forwarded-Encrypted: i=1; AFNElJ9GvdV5K711Z3KRxA5pIpzocNIeZlWFqUnJ1JEyQeu15WTshcfcfkW/0HUZs1S02wkj4q5ouKKWdW2eAUKS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx35JiUscGmmeMqi+SQXdxTGhBGf/O6gumyJW2Q/X9QE7TJi7Sn
	AHLDz5uzmaTCEsTBpCvPngUU9HzNvbnxjDO0TqLiLd/ec7c4qRJtkVmh
X-Gm-Gg: Acq92OFEyc9i5Tj0Nm4IQ1+hFmymgwbUsGq/NxILCsP7N+3ZYaTJ2W3lwdEBTRx+98Z
	uEE5e7HTCri66sw66AF3/W9QmHmOIwhAihaGPsADrNe+eUUELiKwCDL406zJboX77UrGpJXvkUx
	uUfb2kLuggPah89W/M2kC/do5zeuGfIn8wMlgQBbfeqOTgbZkHOE52D2jp/emRBMVuwh0iyQc2L
	VDikk0Kvdi1ieC9IREXxq4uk/TOsTM4+1kgc1D42lSWovgFlA/kFCQ5VQFBP374KOTxjmJWKaBN
	Ybf5ZTMYF2iPG/e+pBpIhL9ZMki2zAoEY9knN3YBA1xFu1qKqrGPG3MOnPb71yEbQQa4GMEDZim
	/0BB13LsXAfHRStTN1SFJiV/r/LZaYT8ruftQqeHiJrxQhCSigN/Js7NNntGwM8MYISftzJICeZ
	W+tzjb9WXXAXWFants
X-Received: by 2002:ac8:6545:0:b0:516:ca56:a44d with SMTP id d75a77b69052e-517fbc89409mr177167071cf.6.1781523589611;
        Mon, 15 Jun 2026 04:39:49 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7ec47asm105333951cf.24.2026.06.15.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:39:48 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:39:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>, Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ai_kfgkuDYcFd0bG@stanley.mountain>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
 <ai_d0B8YOZAwnqu_@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_d0B8YOZAwnqu_@ashevche-desk.local>

On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
> > The bug was first flagged by an experimental analysis tool we are
> > developing for kernel memory-management bugs while analyzing
> > v6.13-rc1. The tool is still under development and is not yet publicly
> > available. Manual inspection confirms that the bug is still present in
> > v7.1-rc7.
> > 
> > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > an Intel Atom ISP platform with the required camera sensor hardware to
> > test with, no runtime testing was able to be performed.
> 
> These last two paragraphs do not suit the commit message. Please, drop them
> here and better to describe all this in the cover letter (if not yet).

This is how the documentation says to write commit messages.

https://lore.kernel.org/all/ahgaOigklcDCYvRp@stanley.mountain/

regards,
dan carpenter
