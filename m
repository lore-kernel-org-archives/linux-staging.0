Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC2E154439
	for <linux-staging@lists.linux.dev>; Wed, 20 Nov 2024 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732122254; cv=none; b=LE3zbIMsWI0FknnFvur406zBMajv5+jxfVRRma/bYq+T39OgtLUuAf4/fdIqu4cJWc9KgCSRkbapaRvUhYJmBnbgi5VHKydzjPFnoxzuPPbrx4yUAujEs2DFSUAY/wjDeSPrj2SrwtxUdmGjAKDwwYiI6ZDEEN1IF8oD+v/UVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732122254; c=relaxed/simple;
	bh=2UvVAtc/uLS9k8h6KdYK775dOKGJMjM75TfPH4ylbAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaFaN3V0hCeRrTuxgQuJotVlECjG3HJBVVeqRyRBnoJJEj3qqbmrlES1VWFi0GM+NrCBGJW1MUkxd2MUslfpmT+5QxrVYV+q1RoYrpty38R50CqCjUpP3Z3h8Rg8KYv5YIQQPxx5GcPq14TfvInf+9Df5RUGLytYN+SyjCY85qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDnOZgo2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDnOZgo2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43152b79d25so48962135e9.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Nov 2024 09:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732122251; x=1732727051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1f2X60ZGZWbIG/u+FbTLhY1O8lOEuX5gB3Pdf3Y5Gk=;
        b=aDnOZgo2FeKv+EVbZwf94JT35uKHFsCViBtEqtyd9+IV6HdQAi/fTbkKM2z7SFP256
         H3Mi2YyiM1s+YYsNVBxQvCaP8cFnppKHS+yDyv9P4X8gmYUAdJuo9DxDPGN93tBpgHAb
         tUl9GYjo1U/pDddFV6IGWPl82BUvkp0ml3zwGE/nH8o1GwjG0rdB1pT2cQ1jtfCEVEUB
         SOk9RlgGrl3SMJHrD44J4KN5lv+TYh5zeGJESkuL1mXCm+z0R2jIoOffDLKnMQLtI52J
         q52/HRPx24ppHoTnLfFBPBdSB9hCtw/BFVv099C/fvR3N9I74NymPd9Mado9dlgSmR37
         oHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732122251; x=1732727051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1f2X60ZGZWbIG/u+FbTLhY1O8lOEuX5gB3Pdf3Y5Gk=;
        b=jhoAf0CJHqi8zIIW5GtLQUV3h1DsdV3ygzuA4TACONm5yRqG6TRkKClSpSbfWbMtNA
         CWWZLA37vvjRhsL3zh2vJqYypZGIa/ffhZ3cw2GFiOjNncaahUdzRnuWEOk41v5wOzVo
         G+LGNftb91BdH2P9pWsKXnSS/u4advyg6X0iSOVWLkyUd4b/KdncMG7DAghtvbXkPxvM
         vZ/UaHoAjEWXHxe4zobzYJjQ1YP8Gi8++P2yB66JhJ7yaTB2hall8GBbFK+INK6YtQt3
         08fx/O6duXWyOfcDIxQqO7oTEUvK/RuF+ehZ99H2jaOBPQdQZmg+WxFt6qAceZlc1j1z
         F5yQ==
X-Gm-Message-State: AOJu0YwTYlvaqXDIz7MRTFgzXOZk/B6QnF6WvuvX0lWMFz4I+Nq9QA2a
	BpTIWnPf6tP5wahAPLdWslFcn4++N29vr72Y1W3HjJlq2WxcMrL4x564l2wVFfw=
X-Google-Smtp-Source: AGHT+IGLki7Eyzyn3VgPcW31cIDh05nCl81yRDZJNH1FCUDvtx1fvtj7JpUGqQMpryfZCBsaphK1eg==
X-Received: by 2002:a5d:6d8c:0:b0:382:49ad:54df with SMTP id ffacd0b85a97d-38254adee4amr2828612f8f.2.1732122251151;
        Wed, 20 Nov 2024 09:04:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493eb92sm2514070f8f.95.2024.11.20.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:04:10 -0800 (PST)
Date: Wed, 20 Nov 2024 20:04:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Perego <pperego@suse.de>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Bakker <kees@ijzerbout.nl>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] staging:gpib: Fix a dereference before null check issue
Message-ID: <a0807e04-b2c9-4261-9b3f-7660fe258f56@stanley.mountain>
References: <20241120144653.377795-1-pperego@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120144653.377795-1-pperego@suse.de>

On Wed, Nov 20, 2024 at 03:46:53PM +0100, Paolo Perego wrote:
> This commit fixes a dereference before null check issue discovered by
> Coverity (CID 1601566).
> 
> The check ad line 1450 suggests that a_priv can be NULL, however it has
> been derefenced before, in the interface_to_usbdev() call.
> 
> Signed-off-by: Paolo Perego <pperego@suse.de>
> ---

You need a Fixes tag.  But I'm pretty sure the correct fix is to remove the NULL
check.

regards,
dan carpenter

