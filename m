Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776942F691D
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771667266; cv=none; b=Ppf4QEViF4xpyaPBCwQEMbS+0CohsIRDKcM04/uJIhp5MkCGIR84BwuT9zabPgnPQVqMU6diaWG+tMnvqqWm5mfAtRZ2XO74dZcHj663bd2viF0DhBIlp+o1numbz0NoVwiou6HOxoJLkQSuSOeT4T/UjzS4HsIb3BFOae2ZE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771667266; c=relaxed/simple;
	bh=9uJRa9//gxLp+afPMmv4ZMa9BDDA4udpwHDdBdp4NTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOCNIrgW70H2NOIBkJiohsy8fbt0d0F8jmidfIjCAe31qMhyw7DzDYPI/r9HWoJ/KJKT5yhXbQ6wY0qZ/9jfIjUcxON+DmzqcDYitbs2KUej1qnoI1QlSdVwsikX8sZtKA/Z2gsNDTXwBIY+xnA6tK2h9zuiOKcuFxcMq+MnUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXlMCHZd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXlMCHZd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so33582145e9.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771667264; x=1772272064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82NQyBahBGffsSCIoQbMaiyL04+QRoUDVuI6S7EPFUU=;
        b=BXlMCHZdcS4Vn8vzIg42gPgd1BO8JbMMKoxVNzQ5/TW9vlbq0v/iNiTgx32br1gdI8
         NyxMVSjrDpXH2tMY8ryGPmzpeKlCnst6XGlpEhL2E4sG0rC0nrIeEYuclmA9dbDscV5N
         krNwL+5sA1iiql1NgmKkLfNHcPXjkkIICNOcv22pB0ioabZSscgmz4I2v9f1VWmCNFM9
         U8peBwgctPQ9sDAg8CfyAtxgWI018E45olKOonBsB0jNMzJdqWayEbjsYJMcbvSCJklj
         OaHRtm3JUyzrhTpoYbcoI9yQOtjQWn9/+iWOlqofbuMOugwszWAtDsfofRF8t+NJH6KY
         TpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771667264; x=1772272064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82NQyBahBGffsSCIoQbMaiyL04+QRoUDVuI6S7EPFUU=;
        b=CtDQRHAG0Gd60bdbfHHpBiDbid31YtudiaO9NbZgcOwi6bML/xY8Krzm7AEFJkUhN9
         TWWmvDz4200lDQ1yYtIMfu7uEMuFxYNqX3PARwj+OpGGhDmsxzyHFbwV5gkxCzC1j65I
         xReur1ov+fVZ/6XduWu+gKnbZcz2FS/5OqUpFPIaHBX+tK42KXvjvYvoiLylSDVCODCv
         py9mEMOxQbZf1fVg4OKPkpic1OI2X65XPsMsJiN4RBI+Hmd7iI3IlFXxwMwYe5HyOD0H
         ed+c2beNqEDpnsq5TEtPQ7QHCnxhBQha2xpPP3NZvnwSuIPqp/6jqv5CDBRscBcz0jK8
         kDKw==
X-Forwarded-Encrypted: i=1; AJvYcCWpJUuL+nUp/VoYEOdpsgyCW1SgAARlvbB3v4b8bt1R8K7F+6I5CQDey5GmWRwOx4Rm+NcaTlxa1MGGsRkL@lists.linux.dev
X-Gm-Message-State: AOJu0YwXYhwpAiwS/Czk8SqKwAxYFpt+SmRd9zt28KDaADpMmsygCkV2
	KKx8Q8IQoOgSPOApOd7D/Aj7IV/xe7yNLjo24pxCwl1CYlSGu0fPpkfpZlKenNO5qgo=
X-Gm-Gg: AZuq6aIAHeLCnxpRly9wuR0E+AbvZAaa4JXMLnhFAPAmsioFRMCaMsBzIpT5GazZB9S
	LFUnM0TZaPaJsdxZHjJJmgPrsEMdV/zSop2Y3ecE0MJQbULqd0L5XXwLJE9g5LN6Ju4N+2IeRdM
	VUNVzfCBtc8Wvza7jw/chexpA9nbcblNm9RJUVFh4DxbsyjvYRjPYE+gmJLbO1c1bi/vdlVj4bE
	hiKY3zOEH5hRDf2VBPbjYPqVEKDgkThKFdJH9HAxv+vO/V/Eqn0f4wygRUJy4oncc8QP8j2Nj2s
	xbhPbEUVEodUhPvr4jYsP/IU62PNXhw7B8sIwtAoVuNhQaluf30Y79pOKClAZehdRKMVmqZUCLo
	b3DBtuSgaDd1Tfz6fQJF3W0apoAIJ9x+4D6hhfPbsMFIEKtkvZyESXDG7lgs22/oEL8JGeBiFEM
	b1sXyCF/tNGiT6TA5JTGcTZlF/OaNq
X-Received: by 2002:a05:600c:528a:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-483a95e9570mr36772555e9.17.1771667263888;
        Sat, 21 Feb 2026 01:47:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm196356735e9.8.2026.02.21.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:47:43 -0800 (PST)
Date: Sat, 21 Feb 2026 12:47:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Priit Laes <plaes@plaes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global
 symbols
Message-ID: <aZl_PKjinee5AHx3@stanley.mountain>
References: <20260220161611.2398915-1-plaes@plaes.org>
 <20260220173104.2410217-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220173104.2410217-1-plaes@plaes.org>

Some of these patches don't have a commit message (they
just have a title) and we don't allow that in staging so you're
going to have to resend.

On Fri, Feb 20, 2026 at 07:29:46PM +0200, Priit Laes wrote:
> Also drop some unused

If you're reading this email on lore it looks like this:

https://lore.kernel.org/all/20260220173104.2410217-1-plaes@plaes.org/

The subject is hard to see.  Same on my email client also.
I quite often only see the title or only see the commit
message.  So think of the commit message as a totally
different thing from the title and not part of the same
sentence.

regards,
dan carpenter

