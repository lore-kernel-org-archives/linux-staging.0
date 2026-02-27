Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66AE3603DD
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179568; cv=none; b=E1NZ2Dag1jKjWprMJD6/DfK6E3ftk2EBx1iSCUY3TpXm98JuPEX5oAr5BOS9DWsmAArOKRl6jhXF9DxRF1XViIJObQSs5j977uvlRAL+yRKu6PpsdLFjul/nuJcPHetOJlDaa+GgfEWGjSh8wFbl4tzmt1L7nNQdtJTWW+hBwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179568; c=relaxed/simple;
	bh=7CJeNoor11PvCydaBDCPNRgboBrYatx5y6cy1bz5nXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K73883D0uXhnxfnHPkVSk4GnUhPFNR5zodxM00ws8+tXTZTcJzaZucpNpGBkq4MmzJoWBPdKrhUTaQCN3Iv6BVLqEgTNnosi8JimKb5HM6IsIRBIIA88IcGPLHwqOS6n0qbrVRrZmcIFnfFTTo9pWkzXYFD+b85uGsZ5KZ+XQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTHJVpS8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTHJVpS8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48336a6e932so10436475e9.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772179564; x=1772784364; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoRUS2o1ONcU/md2WysqTRyT10fDN5CM2Kp8+Uy7DlI=;
        b=jTHJVpS84oMd7ijuLvnujx1bZRKaFGTEz4rqEsMZ/m+MTWCpGPww37N6Nsn5dXVKyi
         uEB1iVIM8H+OtjXfI5jUtdjo41pyrFEC/QyJlXwnbfQKkWngxDUVFaeTRhnPyTrjoTGe
         6y/8SG0ygEAw5I//KI4NLahyVX8j1eJj63jecqnc3risbAWAP9iVRjRbfidfxyq8J8Uj
         YgwEOKz57MdTu6xR5aS+3QMPcZ0xWLti8lczznyJtAF76/sIwe0xxwgUNb+AyZZuVAnm
         5fHV/FRjvOLcU99xzahpJV9+AHLteIueuFdfHv2BsOVGcMpHiRUw5Pa5NsQL8nBDA9IB
         ZEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179564; x=1772784364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoRUS2o1ONcU/md2WysqTRyT10fDN5CM2Kp8+Uy7DlI=;
        b=dIH62K0rWoHABUMcxhCQtzRtbw17wf1u+T+/4EGDXe6SS0pbVLIN4T84TFt4M0Nv9U
         6GmSig6XUyFUONg+9LCM/9bCr4J42fdiUd44rwM8fKZz5js8lmjwURYGX2kOkCym+J4o
         o5b9OuBIc1xrJroG+RxfBAZDdu/8QSKTludFxCZ6o/p4qGKxlV/Ytyq9YbPbgNfYqv9a
         +DaspsDRJEfDyIGtk0WjOgI4ilv4QlPm7hWhGrw+iZ8wByludWrBEowm/ws2jftjPtg9
         8JoQx5IXyH2Hf14b9HJ1cr0tIC7qx/6RqBslHQrFeE8oOqj1+AONM+1gZpp6DYEtG0vR
         byeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgAy8smn5Bccu7eeDSDmAMqzAhXogJHij3vfvaFoYxW8vRU4SnJetdF1pSDxyMOvY7kNcc7N3nWwRY2qM/@lists.linux.dev
X-Gm-Message-State: AOJu0YxCcheRrry5aWEDFofYkYEtZLnjXBFsmFgbRflk7NAvQJKn+9Bw
	PSSMt0tlQJP3fwR5L5CirJHty7iRiHWMJC3WTpxHX1V1M76ravNk1wMsFjuGBzIN3RDvmex846n
	CKB0w
X-Gm-Gg: ATEYQzw+eMCAENv9pCV/kSlDhAgltF1CqhTR0QQGk1O4tF2ZIHAbphPcn/bN79e5Sy/
	+K+TZUr3pru2go0mBrJXzKf16qrLxB5p56rI7RlDotEab3sATqcJCSg2EJvDZLQmlcGzoW3bJKq
	euLXfq6KzARlABitcN7LDbeYyCYT2dIZUAVVU/Xo5l7ZAKuHcWe7OUSgBM/o0n3h7WBe0dBRZVd
	cxGerDK/g6c02mS22YnSAqFAKhl1FGACxdaNKVpznOIz//AnQWncNevVAdSJNqz5BjhdSWwD2BQ
	L7IsEXUT75drrcsvfvDKdTWAiiClsENXXARG1/wRUrCCPF5+xJwUAKPlGTdgpB6Np0LseQ0JGs2
	edIYyb8xl6l+mTeUtwn+zqH2q9E+svgJFdUpbCgqSPofeopqRIldVEwx4pnfV1U5Fx/LE9XtwRt
	0CIBWU6taZGq5sJBDRXlc7oXMC8GkC
X-Received: by 2002:a05:600c:1e85:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483c9bbbe23mr24408555e9.21.1772179564063;
        Fri, 27 Feb 2026 00:06:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84139sm102938085e9.14.2026.02.27.00.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:06:03 -0800 (PST)
Date: Fri, 27 Feb 2026 11:06:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	trohan2000@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Fix logical continuation placement
Message-ID: <aaFQaN3c3D65NjqS@stanley.mountain>
References: <20260227071942.6328-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227071942.6328-1-mariyam.shahid135@gmail.com>

On Fri, Feb 27, 2026 at 12:19:41PM +0500, Mariyam Shahid wrote:
> Move logical operators to the end of the previous line
> to fix checkpatch warnings.
> 
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
> 
> v3: fix indentation as Dan specified
> v2: fix indentation of continuation line, correct Ethan's email
> v1: initial submission
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

