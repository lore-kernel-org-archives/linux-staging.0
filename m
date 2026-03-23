Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB4C3AB297
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272165; cv=none; b=M6RkuBw9QxiyDKoHRhkCj3sHcBJLD+BjGFTmk4lN0kfE55joWd2V5Hi4cN5mOZ2JvHcb/nzf8XckWO4d5HbCSmwm8S3paMOpKjxsJuFAO9YRTkjnQR3xfBeH5QuItRBlcoVarCSTMFKuKemMF3HKqCB9ZomUgczzWn7iBObx4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272165; c=relaxed/simple;
	bh=j0JNoWs/5Ny/7nAmgdQ3ZChBWPg0kp9ZVPLuimhhf9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcZnjuXDOjbmQeCqli5UiO30p9p68sutQy1BDoxXGsEupnt3NPCp6PiVRX4jQ7weGfNGEstYn30F1N2uvvMWKdzSyUm6pUZPJbd0Aih4gX9HLyE6Ts2CwP/7xNZu5lRCNpsoX7vs32pFQA4u2f+OIKV1ZiY1TnDsgOH+dcvj64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2AmkWKd; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2AmkWKd"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1255761a12.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272163; x=1774876963; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SaC/+aR7z+dJtwXk7cfJ7isoh47sVWIef3O22gIXyNw=;
        b=a2AmkWKd7+a6jxaNInswd8qdx6ybgsG7L8K56vT7MZ0HbUY8ScH8M/Cl8y+yklChAZ
         k5EfhAsu3zFYa/6OUlxr03jGrX/AoXK++wNEIywecV9VKWkNVNGVEzY4tDUe5T4LrY08
         /Tr1sOMsOi7ugKJFNwtcbtkx0rZtQ8SefEQWnKEeXKBavwD67OhkOfF8hRQgWfpSSufG
         YZVEEokh2SiRdzH8FzVA2TkhEfNUu0oeQw6ZCClLzy+BAAhERUv4oSUvqs8Au5xj+SYb
         vsPfjv2itlM049sReVkWRRGQAPXj2hqYYbvqc9n6TqhZ/6OjY5xg6lHigMI6m8B+S3NG
         ajOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272163; x=1774876963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaC/+aR7z+dJtwXk7cfJ7isoh47sVWIef3O22gIXyNw=;
        b=kXPl5y7sgwOWYSQyzgxRQy8b5Gn2NYElEACzHakfi+MumDLunFBIHPlBJV1q97UTOe
         PiiHQGgjlMyZF++gZMYZEMs1gb91MCyhWJioUj9qL37oGcXFrtpdeW0gBc+1TkL49Szq
         x78dALYTy0Ebtc2Qe1nbGh8PRnJMe6MhMnBOmoCHsYgiZ3XTvXbe9DEEB8/wogSSKTxj
         QSlAU4bY/lq9YDnlGvCdu0LEk9THiweyHIEIOc13mKB/lzPggljPSUWMvAulC7RfycS8
         VeHDM6FnAJKX6ae4E5dmbCstAZlydCzLDjHiFyv5Niw2DB4L71TzSwYMWhjZ8lF/2mgB
         Z1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVQFiP0my6u6ljoRds3RseOkvs/tzu7ISdLoLpzT5kLKvzh9t7XHtatYOd2DFX/v6ijdhgiPWHCbMjZJfwN@lists.linux.dev
X-Gm-Message-State: AOJu0YzgDuGZFFx0Shk+905o2LieZWXMBKcxngGEnrjpd38IwO/1g3JW
	vXBbw6QNo3wSq90/P2p892XBVanCF4ndRwGjSscNAOc9rV/vpkw3UeKa
X-Gm-Gg: ATEYQzwx/nINPZkbeZBkJxnZcJqTUDSdf1zipZrFeGcSOqcVvYFYHrwDUtVpfeOIuXF
	r3qFltTiwbdWl5bFuFeS0volAfspQraoAEZSbfpy6T0yKtoaMFiPvuOrej/ee7o3SD+tuUUXMam
	8x5txXIz6POAyPOlsQ84tAtsnXSw1XYERMFKkUXx2EzdasMHknTrD9DbNnM1hPAXGFv1+0riAEh
	rsvvGhMrSEnP5Sb88SAywyC+QI0k5yVSx5Y0MtwYRRohP6gbLuA9+awhvtqUKhusZvj6M32aTFL
	I/WYz5yzC4H/W8SDJgv3fVfRtJ+bfLwR8IQVWEeZtLwBh4Hm+eDSaGXkkCfi4m6jCZB9sxdpkup
	aa4gVIoHPDg/StWiQDWqD+1ESaeBUObQfSuuSITAX5TS1kjL+HTrMUk5I7hXxFqtpj5/TQQLPsC
	RNLpUsTAbgTPCg2M1mm3YZyzyHfsBAqdtqGA==
X-Received: by 2002:a17:90b:4b85:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35bd2d105efmr9682339a91.27.1774272163477;
        Mon, 23 Mar 2026 06:22:43 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm12905677a91.2.2026.03.23.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:22:42 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:52:35 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: place constant on right side of
 equality operator
Message-ID: <20260323132235.sg6fw2azr724g7un@inspiron>
References: <20260321092536.138499-1-activprithvi@gmail.com>
 <acEFrIIYaS3ZW8j6@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acEFrIIYaS3ZW8j6@ashevche-desk.local>

On Mon, Mar 23, 2026 at 11:19:40AM +0200, Andy Shevchenko wrote:
> On Sat, Mar 21, 2026 at 02:55:36PM +0530, Prithvi Tambewagh wrote:
> > Place constant 0xFF on right side of equality operator when checking
> > value of hw_channel_plan to fix checkpatch.pl warning and conform with
> > the Linux Kernel coding style.
> 
> First of all, in the very same function there are more of a such.
> And hence the Q: have you checked the entire driver? Please do.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Hello Andy,

Thanks for the correction...While checking out other places requiring similar 
change, I observed the other place in the function where constant is on left 
side of equality operator:

	if (
		(false == pHalData->bDisableSWChannelPlan) &&
		rtw_is_channel_plan_valid(sw_channel_plan)
	)
		chnlPlan = sw_channel_plan;

Here, the formatting of if statement can be improved and we can also replace 
	(false == pHalData->bDisableSWChannelPlan) with :

	!pHalData->bDisableSWChannelPlan

Would it be alright to add these changes to v2 of this patch itself since they 
are related to the code having constant on left side of == operator?

Thanks,
Prithvi
