Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18032D0DE
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521088; cv=none; b=HNPRBXoiv+1S3UnPnSBH/V3OadyIz2+f9u+ZwydcVTraBEe6Us+XWPko1ZYnAtj3ear5HUcOoaIJjQleZvWLBscvufGcv6sfJWaWT4IGXvF8KJq8//XJ3XeEREubhTsEmSQKDLgy3Fyz+egn+mhAWhKMbwrxxRXNtRgTYAlPcIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521088; c=relaxed/simple;
	bh=D2Yfujhx6iSDuZ83eJlmYUy8xlVHiP48gwcfLTirYCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ild5wqjMZ0U4xoURiPHFBK+sFVYYZ4nrRzK1JDxH6nCns7Jq2l9vA2frTX3964bUaIphQIOaZFm8weccIpj0aB/WmU6cwO2mU39NnMTaKwYtzheIExousQTexS6vmvxgcGZijF5Lu9yCf5IWqR1KoQvqUNCzfVcl62gcXLfWlho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u16kkfcA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u16kkfcA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so1845014f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 22:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772521086; x=1773125886; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNDJLLeSJmwJKOPj1eJd/1ZsJIZjKzORivaRrmEhEJY=;
        b=u16kkfcAmNsZ+px8+lPdSURHoN1pDY+u3xcqp3bCKK6hMBbekeeLUchtTO4+NHzYXF
         lKwTrFD36uVoUJBF2V0Qqntu6vRXXfECzAOUNZFdUZQleCsQG8uZMHagjell2rw2PxiA
         g/+/GZb+HkA8E6P5pM9NTyohBO0BU3qRVgaA+nYyURyMx2m5aGF1R31ga/TvAkocI9aM
         kcAl2x00ZVAzMSiiB2hL+C84Zs0soTgkMnC44adjV2467j0hfYoeXQ+IERR6TeUJ//Yn
         3Pr63NJlG+Vo3XEOW/me/wzMusoIX/S2Vu8ApmqnnUBdtY5DHtinS+Q9CDSKIlEMQ1Im
         4M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772521086; x=1773125886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNDJLLeSJmwJKOPj1eJd/1ZsJIZjKzORivaRrmEhEJY=;
        b=G0osCSmtbx/4C+nFJ83UA1j3gabjrE0kbxynIu4TLegS77uDiSi9jNcYPen0vchrh5
         4yDKnkL16rRmhLWnShL4+/rr7r5KX+A6YgqEVQb4KJEiiIfocgM65rOfSK9z+0QaRshw
         3s5TOOH+8m6b1q29h+iuzAJyXbu50puEclBPnBdhFqMNF8g2RiMDxr8yFlO2ycmTOZ6B
         yXVwiH3BBrMXC3oEXYEQCKj9OyGn/oDofbOzKVoK6AVB8LI0AawDdIYlkj6uzBDORjKP
         kS/yEacf6v7O5pk036hynPFoPw4o4XoYFkh6wZvAXGw2WumpxgKeerj4vRL2fYSlw6B7
         V+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdR0Uj0b3op0yuGUzYFhvbtp8QLxeWOLiLxVna5IAqI2+A/Ya12rZ9/bxK9IrvknOO9IApDc3T9fNhu4sb@lists.linux.dev
X-Gm-Message-State: AOJu0YzSlpEuPc5sjrzYzWSPwxGtauIbC3KkC0CTPDZXtXpg5nTDqTr/
	N6zkv6sluSkK0FZ+1oOUgL9Dr3MRtg7ELojSv/rI047idDEFv0ESZLEKy8OG5CAYrDY=
X-Gm-Gg: ATEYQzyAynfs1SjlEyjboS6YGhxKmq1Z7MYrxWcahTk+emNFf3AtNHLep4t5VOpii0Y
	6l3tALfcpqfZjOpdPnp+lhvd76PfWsMSb3AmPdDmWYzYsmeKw43eSuQtyMs0d3Q8nJWtPQbAUr8
	Gd3EpG221EZv9zIDWn43Ow9WydF48dVi4YaFbPP3NYP0SHoKnMFky4dfI2jc3Umsn/gVbRHWPp4
	Klc43ZCXivDdpDOIiFjo6C2SDht1T3Y0RbxFoCrCKSRxVViRQAcQj8AuqZBL20QQKUZNymHjiRU
	mqS/M/QTjiJwdEtyL/Nw4OMi4nlyK4I7vpS6GCQ/+ayrhDpwqmtKp0dQvalldtmraFxVT/CJHhr
	A6CdwsnwDg7oOhY2fjGDemLhW34ZoOsCmf/JHWgW15ouKs+GUEdG3ORSUrxEhO+ndduij46Fchv
	n/vkW4eVudU4yxwFXXyOiZBmw3qPz+
X-Received: by 2002:a05:6000:4312:b0:439:bf55:f5ec with SMTP id ffacd0b85a97d-439bf55f749mr3448556f8f.50.1772521085733;
        Mon, 02 Mar 2026 22:58:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c38sm31809353f8f.31.2026.03.02.22.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 22:58:05 -0800 (PST)
Date: Tue, 3 Mar 2026 09:58:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Message-ID: <aaaGeaAyIFVg-RU-@stanley.mountain>
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

XLLF_ISR_OFFSET is the IRQs which are triggered and XLLF_IER_OFFSET
are the IRQs that we care about.  The intr variable is the IRQs which
are both, they are triggered and we care about them.  In the original
code it clears out all the IRQs that have triggered regardless of
whether or not we care about them.  You're saying clearing all the
IRQs "blindly" is wrong, but to me it feels like the correct
behavior.  In real life it probably doesn't matter at all since
we probably care about all the IRQs.  And apparently in your testing
it makes no difference either way...

I feel like leaving the flags set feels like it would be more likely
to trigger and IRQ storm.  But we're debating the number of angels
dancing on a pin.

Let's just leave it as-is unless we can show it helps.

regards,
dan carpenter

