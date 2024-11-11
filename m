Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED616A930
	for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316469; cv=none; b=QVAwKvfvSBEAXTlnG3VdZbES9qHdjIYsZXC1f3oYVYJwgASBFTLcF68wR+e2rJpGqTmbCmXwgfli9DhjJc347YZnK47QNkqseqByzFvmc69BbOky6fuA9Cjtwelmb1IX9i32xcpjOO9yvMPEil1ovICfIiVWEGX3sGTYH7RcHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316469; c=relaxed/simple;
	bh=OxTK3kBbHj69gWipHOv8iwxstU+Bq5GS1YjAAZZpka4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5+NTj5/IkasEeOmNWiV/Ly0anKWdQRVLbOMIgxcM5xn6DonrHKdKXIua0lyt4tPKwHXQkLJmg+SYSVJ6HjdKh0YgBNzGeL2j/zSzNFyFVbB+cziLRj6Lmc/SXiP5W+UQcLGTO0ufK3XGz3vGs2mXcdaFqd5azD5IjFPKjKn6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUn/BKs7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUn/BKs7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso724888266b.3
        for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 01:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316465; x=1731921265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NWeH3jkHDc0Ye+Ypt1Wuxtz4WCpROEp8hmtW2LYWTE=;
        b=kUn/BKs715eKxQPl1/hjFbQQEMixGSyX7jycSHxa29r6uE8AuDh2JdirbYck/jO7Wy
         /jMfMN8WilhPGE8aVtsiHSEhy1Awdl6MwJZvh1UcLxQfXp44/QZ2au6WNdtXnwXZJwSz
         Wurts/sLrfkw5nzMLlk9hNk6fj4BAhJ/Mkx5MTYDOTntjfGGC3XhRkYfzJeG6umD28eU
         coPzZPQdhMr8c4wJO+K0nhs6WYN+AP/E+DcsbEnbBvOaCzdV049OiiR0lx0fOpSI4/OR
         C6MFRyXlO/hnLF2p+ikDBnMe5v0AsLyg8sTAKqSLYlWujTMyT9cuzCDVt1el2O4YOSv3
         k9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316465; x=1731921265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NWeH3jkHDc0Ye+Ypt1Wuxtz4WCpROEp8hmtW2LYWTE=;
        b=VYN412loBL0KRGGcnuc+daICAYFKiwDssAKL51HNDdLPPCgAl+ztxTFCVPOfBtEPHz
         K4LDkwEB0uv+4qiT0avS+sojBdu0dM4F7DDfimZH17gixMMSB1fpst3FeF1mGo8AHVvh
         Nb9a2LsjW4l7RCTfMBn0aLoeWNXVKHtgONNEq+ol98T4a41hYkB7NU6EkK2Pz9VPOJ48
         wZ3bmiaU9ZXiH11AiX2liAId1zaIqhGwS0cxBS4cASSq2zBJfuZWGrnOEkkH1AKWJB3o
         omYM1kTuKPYI2XmHXu1eQXTDzP82rdaq/m5Wz9BvHf+qwgDQWOzgi1CWT4Bw9QsIMJw5
         zPtA==
X-Forwarded-Encrypted: i=1; AJvYcCWs61tKUCeJYFMbqwn04DKM3+nNWOa9nxLdVVUhx+c5D1Pd8EaL3a291T5keldhTxg7NgKzA6lmr695wZ2H@lists.linux.dev
X-Gm-Message-State: AOJu0YzCr5RrmHV+nTNY6+FKK1EFqQiItUPEoBou0EDYIf/+Beu18n2n
	UqfPf2ze489OCoVBCpUkOuFKzyZJ0Zf635k/U+HrLS8RGhIJeHU0ZurSz9BtBfA=
X-Google-Smtp-Source: AGHT+IEJR5XILRv2WOEUbzmDldjOYjUKGr4w+bCfjgRlb0NalsMvd9Y6kH0/jAioZL9hxiS+S8Zk3w==
X-Received: by 2002:a17:906:c103:b0:a9a:4158:494a with SMTP id a640c23a62f3a-a9eeffeedd4mr1144156866b.41.1731316465395;
        Mon, 11 Nov 2024 01:14:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4b82csm579790466b.67.2024.11.11.01.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:14:25 -0800 (PST)
Date: Mon, 11 Nov 2024 12:14:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Qiu-ji Chen <chenqiuji666@gmail.com>, dtwlin@gmail.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: uart: Fix atomicity violation in
 get_serial_info()
Message-ID: <9378fe55-66d5-4a11-9524-a0ed01f458ed@stanley.mountain>
References: <20241107113337.402042-1-chenqiuji666@gmail.com>
 <2024110724-overbuilt-liquid-3734@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110724-overbuilt-liquid-3734@gregkh>

On Thu, Nov 07, 2024 at 04:11:00PM +0100, Greg KH wrote:
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.

Like Johan said, this doesn't really belong in stable because it doesn't affect
users.  It's mostly about correctness and static analysis.

The linux-media CI system has also started complaining if we don't add a stable
tag and it suggests that the correct thing is to add:

Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

Do we really have to do that?  Applying it to stable doesn't cause a problem,
it's just not necessary.

regards,
dan carpenter

