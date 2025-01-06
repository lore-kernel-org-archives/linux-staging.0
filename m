Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083B1B87FF
	for <linux-staging@lists.linux.dev>; Mon,  6 Jan 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157071; cv=none; b=bQtC+dS4duwlmi81Us8KmuMpB3oLm5FBdBGw9JqxrT2HKwjBMajGiCShMjgI+J93NqSw+yn51eJEYyWMsKa8gK+ukY4yPzEnV+johc5td/VvmRWe9sC/6z7Iv4QnVzjK7EDe0jEVag3bnKudvSQLySeVUCmfR3OYANo4ywwXeEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157071; c=relaxed/simple;
	bh=StFOGC85qK2urFtRYqnRf9I7iG/S6p8X+y5EyoxL/68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3EVnaoufdyzrFJdzXAcQfOXib5IJDtHtUDQquRG3ab2oERi4HnTBN0TooN/ssR0Dez6O/wx1eTGAntIDOR58AH1SxFCD5R8WmhvausoNPTDlejaE8THlL89fbIBPmpGJYa4dGMUTyBwhdIY0pxQwjCV783tbYVXjbLG980M1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zvn71vgQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zvn71vgQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43675b1155bso133948135e9.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Jan 2025 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157068; x=1736761868; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1YcNhTzB+NJ0AXGpO3lzvdJFWAfHpdWAfxwOWgEsxU=;
        b=Zvn71vgQgAnKIqngxOyHe1t5y8zj+soIZJCgA3jkA75UnbaUgn32wMxlec1OFi3jHI
         x2kf9RusjyNC+79ZHw/qG/3j9Rc6g/HQkKzAJd4JLYG8Est37x6x1+fYo56Ek47Evt/T
         I3RFRgvZW186T3zZeJJy9LUL5jTxG6yVGNK9VOXSuHZylV1xLeTl4Y1islB1e9RMXLQu
         YSGm2PzsDpyTDG0aXV9qXIPSHFo06cDbUz2MVZvSNKYBb2FJv8aE9jZVOB+8qDgH/6qt
         kHB4aNtXYJ3A/ahxH7dX9xUFQJMeqWjvZtPYDBvBlcje1Xnlt61bOKnX4Jg2qpX59EhL
         UqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157068; x=1736761868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1YcNhTzB+NJ0AXGpO3lzvdJFWAfHpdWAfxwOWgEsxU=;
        b=ivm/T4cM3sAajgCtrhllVVzwsEvkr22Q52SNZZTBIaWIwj3rVffh+xNEpvgsPXxTz4
         /1TS68m9LufqyEMDpSKAC4cV3f4BzLOmtDuJ7LMSpRDuaoN/g2pK1p2dlSJRk8ojQozp
         JDfR0VEhHdUCCJh+UomSAti1PdU8pf339njEcpN6poWBzSgR3p7K+uuEzyqflg7LJEWI
         szP11on6e7pO/mf1nRGyP7Udtro4UwM/TBt3R/SbKs7kPVAQQ9WMIm9vVmiP1KIbCFDr
         e/FlNhHi+0bk3P8l+3r2h1LOyCr8TPf/rsuIbkM0KGtaAKVt1mDZAlf++0kQUAIorLQb
         l/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPlSy+eU0TfWm/BeSOGLw/BEUnqkGpmpwQvdZnTVUmcPnRJEUB1Bguwvwin0mtFwhgcobrK89uyqimXIm4@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0EIFe477xlmQjnGk57lZK5k+5RnfyMmaZzRzKSgTVnMKaMJ1B
	rICbwszvEN25tkuoELwH9p/z9G67TEgVdXpm1Tybf4/8ngb1K7nCpl2AkqqS1LGlMXsrxi7Hiin
	q
X-Gm-Gg: ASbGncuk62cUzawbup42gBiID45A4rBo9XSsAK6CQEGcFXzV9+0741i93zwHHP58jla
	TcFwCf+t6GUJ28CX0VAZ36jB/lsqKZ4gbHbX8HbPXHPL+DduvRs3fetc6DJooIkyysxgod77tls
	VNpF8uFdxGffp/O1KeuXKbc9sFS9vlLST7DYO7GUm8SWhNcH10uO7RrNBW+BXRNRRurG0EqRRUf
	nNxjD//bU4acegDg91RS80X+/BnCc/4d+/hIj04QcDI+a8Skv3tV9bPbWxeAw==
X-Google-Smtp-Source: AGHT+IHmXleKLa3N60gIDy5ub0LsWvE9b4koj2geI54RUXBm2V6RO5ggQ0ZKvSFfdiPyiXyWjCzTww==
X-Received: by 2002:a7b:cb14:0:b0:436:90d4:5f3e with SMTP id 5b1f17b1804b1-43690d46037mr311062535e9.6.1736157067794;
        Mon, 06 Jan 2025 01:51:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm48633973f8f.81.2025.01.06.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:51:07 -0800 (PST)
Date: Mon, 6 Jan 2025 12:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	mgreer@animalcreek.com, vaibhav.sr@gmail.com
Subject: Re: [PATCH] staging: greybus: Remove Module from list before freeing
 in gb_audio_module_release
Message-ID: <dbdf3497-4359-4b63-b718-f53bf9ad7fc6@stanley.mountain>
References: <2024122358-vexingly-broadly-7df7@gregkh>
 <20241224051917.1971-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224051917.1971-1-evepolonium@gmail.com>

On Tue, Dec 24, 2024 at 10:49:17AM +0530, Atharva Tiwari wrote:
> Yes I have tested the patch with greybus drivers enabled on Debian 12.It works as expected, and i did not get any errors or warning during the compilation
> 
> Please let me know if further changes are required.
> 

You're trying to ensure that the list is initialized but instead of testing
for that, the correct way is to initialize it earlier in the process.

regards,
dan carpenter

