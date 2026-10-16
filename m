Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702A2E7366
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140427; cv=none; b=judw7KslPpw5o8WLBvqe1J+5TG0snquzBIbQnutZs7JK2MloSGE7sqGLnCSmZ29TOA5ojgvq30yWu4dmQUy8PPBmRLKWpmsikLa/l+RC7Lvr2Dn1vDiM/QHtmT/axSI+yuvR1Hu36rTuRiqnd0E5lvkm+3ClZHleNeHdZRBY6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140427; c=relaxed/simple;
	bh=YjG91YIz3Zerv4zWRDx1TpDi30zCwvUPs7vvdFiWhk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fH5muvnA+GciaCNvnQR2r8B+ikHt14kngq5ooMDw8V2K/nuqKrmbKrwaVJDSSA59Wed0O5/Wj76hMlRfHQsjjueimsIHYTSvvVP0Q9OLnc1BOUgCnFUWiu3UpXawLy1EqJFrH+3H5FTVQGK0bvBNwHi+vfaEHD9hK6A0O+ll1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEmN0MI4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEmN0MI4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso45512525e9.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140424; x=1792745224; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ72dPFO/iBJ1HEQWMn0AbHuW9YDjx8PElC1gghKO1c=;
        b=iEmN0MI48hxJI++B5xfsQgjRO0+G8nTUXAMhamNwLQRan/oLYlWeOkldAdkglM4LMd
         44AvNqqlttvoiWClE9FDnhnuKFnghPG31J9TRhBA5WXv9kvvz2PdPZ3c2PdjzpEmbE7l
         +djny0N5mEY7080q04pObF3qSbM4OFahckeILdyKDF4OgX28mX/GF8rOZV2mQOMsIgB5
         Ijzf6+qoHB9ZhuMH3fE7KXtq8y2POIbw4PsY2cIn/BOsTU2sSFhxZj/RfbnMzFpjmaZy
         Rp65a3IDgHqP7TpEeUiyXTtBkIQ+FcdPuLZO6Fuawmm3WLFQEV9U+4oGP4uwbejuZISc
         HbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140424; x=1792745224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ72dPFO/iBJ1HEQWMn0AbHuW9YDjx8PElC1gghKO1c=;
        b=k3W75I4zEuRFYWVYBRskcdg97iEEir55loREasJnmcEBhSrw68QDjEBPVSZCZUDf1O
         gBL4IXW4I4CxiUjHjponHY6SO27TKqgk7VFffK5n4BlWa0GZLpFQZYBBGGljPd7q6cOu
         7sTv4xpoCeO6d2WMwOuG50R1IQOIvhS95yDcVHOu0Q006Hss8Lvh0/DddAAGNgy6itsF
         ponLU/KZH10mJdIg6FOY/0d08OPVdi3Lgbb6iWnYPyl1RiLtGWJjbtZEDePvUWFblI7c
         TsaP9cWRMQhOaz+4ybDU7xF5DyEZ+fGrB21iwgpI9ktGpJwL126yZZOXeC8kdUPhvf0M
         ET/g==
X-Forwarded-Encrypted: i=1; AKwUvByiruRoB5Edb+LxQ8N+kuno5ICypqZvxFXHGxS8DbizuzbKUJ5mbOo/eHOcsmsoWr5q1iDPjHX3mNQv6f3m@lists.linux.dev
X-Gm-Message-State: AFq9FYK8Pd3NRBt0j+9/3AGLROcEfkLEsPQ7USTRo7Fmq194Ms0cSMsW
	PmuxgiYTOaVLXhjhHUQ1vRqgWN+vwlFDdDSiF/jeTRTnZbQbEMbx98L3
X-Gm-Gg: AYBFou0m2EHmrFcI7ClQulCtyMMUbtYAfWbn8ewaV6iJGgtyhl7SphK+vCApE0SjnlU
	PMkIfgk4Flrr2XNrPQ0fOp+XpE1xbHQC93p1YXlCIQq/pBtELdV8K+Q6RBiJbh0FuCLbdRUAWFq
	Y85jAjlZtr4sabnD65oB1XBzg/ney1uGjgz3m+lG2CghuY0oRv9rTDb+8m6G9F/fMFrOxa+21c0
	Z4B2ibhKjIx77Ket9yLcECGuGGqkpr+xR9q+2WV/RxziVmo5tMZHpojKbNdB6CPsAx44JcphV+E
	oFy9CXiP1JyMk3IF7/e92RnlByJwwckmuHAlKBhHrLcC1Qw2XHDoMvo76C8/0ehZ+u1opCuMRcZ
	8mbE9oTxhw1KWGItcryPhKZpXOY+Oc7RxC2/8ZrMyTIK8BwHSnmYrvOpZaAduJGrO+a8DlaABL1
	wz1RZeEnLn45NWkzetDTQhMhaNxZsF+IY6ngShVm50glF8r18u3K3BmXoAyg+YHOf9seg=
X-Received: by 2002:a05:600c:3ba2:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1acab23acmr284700145e9.10.1792140424251;
        Fri, 16 Oct 2026 01:47:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm131123645e9.4.2026.10.16.01.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:47:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:46:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Riccardo Oliva <oliva.scorza@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access
 outside list loop
Message-ID: <atHkgyGbF6TR-lT4@stanley.mountain>
References: <20261012034020.100737-1-oliva.scorza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012034020.100737-1-oliva.scorza@gmail.com>

On Sun, Oct 11, 2026 at 10:40:20PM -0500, Riccardo Oliva wrote:
> In vme_slave_request(), vme_master_request(), vme_dma_request(), and
> vme_lm_request(), the list iterators (slave_image, master_image,
> dma_ctrlr, and lm) are accessed in the err_alloc error paths after
> exiting the list_for_each_entry() loops.
> 
> While the iterator variable retains its pointer value upon hitting a
> break, accessing list iterators outside the loop body violates modern
> kernel coding standards.
> 
> Fix this by referencing the dedicated allocated resource pointers
> (allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
> blocks instead.
> 
> Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
> ---
> Hi! This is my first patch to the kernel. I am learning the submission 
> workflow. Any feedback is very much appreciated. Thanks!
> 

You should generally assume old warnings are false positives.

There is a check which tests if we found the image or not.

regards,
dan carpenter

