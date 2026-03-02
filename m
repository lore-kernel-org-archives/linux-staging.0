Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC52130DED1
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439294; cv=none; b=a19WYX2lt/MwCFue9y6eNrT0Jc9wnFsDELBe166wlqfJIBO8H0syapanvaj/nJYP9IT3Y9hKDTZstrINZ3EqhDToqZihomdl5xY24mwZpawkPicTqAlvwRc+ZgxpIqz6by5M6+o15OUXAzGMIQZSyF4M70vyQfaddVFoKBGpOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439294; c=relaxed/simple;
	bh=BhuuqMR+/djDVK+SN4OLUmlfWQ6iTsQjIQOxo8wZ8Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrNjGAox7U9mg9nA6d/XMiAIR5QtUa5oBB8s10uzwhArs32T/CazaLadm/Z7ivkQ+lnteSvXT78J7wAY+uzidLv9Hwg793c751HF1YNFQz3ZqwpgPgsSF2bk8vpUvNqfJO+eFA14yflxmyh5NGkxY7hkpKSle3kUWlEKDqcorcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLawxhTY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLawxhTY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso434974f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 00:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772439291; x=1773044091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Da86d59nXtb4im72QQu3Yn9+TyJMWhfbPsNWGYmebrY=;
        b=eLawxhTYvK6a//SQSqpwOUi9TtPOUUUHRelrQ9KyvzADu3/fH6OcGDbf7iQamueGZn
         k+Kc9n6zoWTXrwwBnbnU0jsKNFpI0M1bkrHWcd7F0llThIzwBgpTV8q/PPaL9/ex0vI4
         71n9AEsUun2jco3xy8UH6NKBjOEdD/NHHn2gwL03vrbLZiMh4CdOp4eDdKyCrO1+/TjS
         vbOnTPezMgVV2WFiocrISNK5uW4Yu7H0jDb9kdqcwMMcQEk7i3gV0EXVCl5VRcwdUrwA
         xNmT0QtWXAOR2KcPENkYjGTHkY2aQ2s19rNessIs/1gCD/vc0NLr1xp/+8oAIG4MenNT
         HhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439291; x=1773044091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da86d59nXtb4im72QQu3Yn9+TyJMWhfbPsNWGYmebrY=;
        b=rVEQ8oVBcHaKrA0TfnZj/YjxHZyA6GO/gRSxbLVnZhBuaTjU8Yovk2sNwqOaOQm9z7
         7q3LQ5scUVfyC/vdhjDBFDbueikQO2LJiL37ho7UzVCdtkPNngdMky+e1TzuATb/uRBM
         aLRAQ0Olns/forRdyQBLhaPCPEVtCpysPuyOCDB3psbrvJr0q0TExlEdIrqhjBkGcs1j
         sDGikgDfrVdS+Kjp9cP1O061Qzjgp9wmSdhG7X2iJ2ZUo7ISAGoASzzJMCrhCauAJaq9
         gfwyuhiJpvyLf1FQZTaiTp33tuArVd4cUWuaNt5WbFPyBacm21COFnoVoJFpKIsg1Jfo
         X6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU3/mWEtf/6mG/X1nulopHkKL453sAFW4MqdVUux9wiq7cWnCMEvM8kTKSl/Th6o34hBqyfPsOQnOk3WQS@lists.linux.dev
X-Gm-Message-State: AOJu0YxKX1Tc02ZF7iQLREw5vvo1498nMJKUaAqrefPhp0tzZu/mujgE
	ZyidZbeeTV5OIAUND3O+ARC8k/FU7AHszj3yzjICJcDEvVa5IPeGZf0LzPSCR3yTQC0=
X-Gm-Gg: ATEYQzzj3eY5xCI+5rDXQhHT8KJ/NLYQ2DhyKuTfc51R1pRCnWISCCZIs5VU80WTi6P
	xLumRvWviOsh8iBUgWBnoUkyedJuV8cbMGMPu+Kjr2vMqGg3ApcfwBXCVo9z9TMedZMrufYoTqu
	u9uVyUi7jlfHHlyCuCZM4oPYOKDbGo0darZjGsnSoRFYMN6GTyTmkDfsW/KrMiPbps3lmfT1TLC
	gDIJlW4+bnIyX0Eh2dYfaDmS4P7Q3vvYrNWJ12V7c9C6BsBJVkboESi2pxgEY6ND+zBod3MZDC/
	/o6lwD+BjikOeHY8vXsdZInZfUqYu6/ORBppSZb1mtBWwbDdwKBf6aBlkLyN0JfgAp8lMvOSgNi
	lhc4txnhmHCjcSYjMYLQZQGALtV1jBMep4S5jocVdQqBWHWx8fGz77hAiodVmqpPKSEZ15CiB5Y
	2yhbF/fEA10qbnogRgLczmbDd8WlwB
X-Received: by 2002:a05:6000:26c6:b0:439:b7c9:2ef0 with SMTP id ffacd0b85a97d-439b7c931f8mr3836855f8f.33.1772439291388;
        Mon, 02 Mar 2026 00:14:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4175fd2sm9571699f8f.14.2026.03.02.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:14:51 -0800 (PST)
Date: Mon, 2 Mar 2026 11:05:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Message-ID: <aaVEsCIacXl-kuxa@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org>
 <20260301214815.2628942-5-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301214815.2628942-5-objecting@objecting.org>

On Sun, Mar 01, 2026 at 09:48:10PM +0000, Josh Law wrote:
> From: Josh Law <objecting@objecting.org>
> 
> Return IRQ_NONE when no interrupts were triggered to avoid spurious
> interrupt storms, and only clear the active interrupts instead of
> blindly clearing all interrupts by writing 'intr' to the ISR instead of
> XLLF_INT_CLEAR_ALL.
> 

Is this something you actually experienced in real life?  The commit
message needs to be clearer about that.

regards,
dan carpenter

