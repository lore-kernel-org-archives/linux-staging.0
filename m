Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC137D10F
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151170; cv=none; b=X1kuqTCUOQ8h2vdtTdf9s78ZguAgdwd5lpOzSWyTwuxQSegaL0Z2FYSVCRfYlsSz6LA8v7UTQ3aZH8811E9Ro86N+GJVmcxAcJxyTGTwX4X88VnaUfE3qj/5oc+J0DD2OvVryExa/L8PUSZfPLAsyWCoYeut0PWkN0XgoKgKTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151170; c=relaxed/simple;
	bh=dZbI56v/o2ICtsBYvukydQVhgLyj8yfVR0QIhK4Ejr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sILwRy3+tNPsjdicF6RAQDWGuZw7U34vevB2DUPzPuysOrbf4muk6sRJTNU2iqhiyv+5hfoeqI5QmwHdabIIppjaPswO2aPTrM2i/+SKQjX9Y0eptkdMWPz6wacEWGZ4bwa8yq1BHqwSwzgyVPO6neUVBpjlpWAb9zVRjl2nnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3TZW47m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3TZW47m"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so57097095e9.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776151168; x=1776755968; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSF42xvXrzBa4KmCc83ZJg8r+kL7f44ATnnik3EjWWk=;
        b=H3TZW47mu7EJc2upQwZphaN2WAzZljgH+WsS5a92ac6aFlgRlNMRPt+Kad5TqfMZqc
         RRMzzAv8e7pyXgP2KBhTarfxyzy70NlzvCBn/CO4S2JPCkTFNPrdNcYJM+OG4G98NUkx
         1vQEU/KpH5a+KoEfW4eXlKajt6LpTwSkXetNX4SzhGIb7kyo3ngubd6aDJoJrVfQNvbq
         oJ+48mauulrGJSPl0SqMhDXyE/4l694lyjCgOh9i/HxhfMlNAZZ3WpEI0uVxYkLc8kWH
         1U2RlT9yR4fsqIlsy+8UnuA7u4bHSv3vkxxEDUDbiUhXC0G+kd1jJOFoA2C4yZW62Ah5
         HGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776151168; x=1776755968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSF42xvXrzBa4KmCc83ZJg8r+kL7f44ATnnik3EjWWk=;
        b=WnFvA680/7FIZZEZTVrWjax8saxunjMdVwp74mJpa0z0BleD6MvPRKzGLxVXcb/A8A
         jNVHsCxmvshqYU8EU3lJXpFU1tOhdFdvwzlHdXVAlxYyW7bWpwCBG0hhGWjQ+IgRjIsI
         OS/i5MvL1QfeGTsMfDOwWe1iw9QVe5JzeteqNPIv7kbGrktFQmR5GgPjvGUAKJD/e5dU
         f40ZxOp5R929nCIhhWzQielAJRMqKklfMnzrivXVbDLirRDwEfEVZUPN7a4tVRkHvPqZ
         YMiDODSc7A1i+/dN5/1UZy+Xk6FOCw9uyfM8q9zENUFVwbMr+wyY4jM3b+FvjoDDTFf/
         Ia3w==
X-Forwarded-Encrypted: i=1; AFNElJ8aU1YNcsY2cie7ASuweaghcHIeYctQHttO7koa38vx8foQEPX+jc2mDk/UN0AHywFznHJ8TlL06OuK+HBa@lists.linux.dev
X-Gm-Message-State: AOJu0YwBDFBWZsygGgRFWwVNYl+aesMx6IU7G78KNyldcB9i+EvRXNA0
	+RBHOEiQc45XJlVcLP8177/O57/Iu8Hq0Q8DzblrmrZkhOKbm0RjdjpU
X-Gm-Gg: AeBDievA/0ZWxVHSsXiRmQmmF9Kn53HqbHP2o/Zn+3Z0Vih+rDOSZaPifsWey2Yi94t
	qiKRZIMxaKFEo27yjqSp0rZONSd8QQB7W4RD28eS7JQ4ETxaOpQtV2u4/7+s4Qw2lbPaaBxCAWN
	K+F0730xsst10lwQGLa/sLViTe6r27v8T7mO1oo74j1D8+88QUJ3KoL926NUCTZp4pXU8oOCr0g
	nfnshqjZ2o+c5e7LkjQGleVv9mJgmuj+NhVGxEsPOfZNLPO7g0FLR7ersWW58Hrp9lo+gVCosFm
	KgkmtmN3FMGM3dV0aXArJxgFsHz3ejFhW0WWLxUL4IUnnlCASaAhxmRyTUaaYWKhhPT0TwgqV7x
	GTqcXyl3IdPfnK5EVysne1Qz+08Oi9GGHUBxhebvkcAjKV1+F8KaQXSnyrZbbxWnQPfpzU6SAi9
	hDFtxAkvPaWXg1carbCfEOn99E9LR8eiA+ZuMc
X-Received: by 2002:a05:600c:8709:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488d6655adfmr224805675e9.0.1776151167573;
        Tue, 14 Apr 2026 00:19:27 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eddb9751sm47593285e9.0.2026.04.14.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 00:19:27 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:19:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com,
	andriy.shevchenko@intel.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3qelUxlK5B8RW1@stanley.mountain>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>

On Tue, Apr 14, 2026 at 12:43:06PM +0530, Shyam Sunder Reddy Padira wrote:
> The return value of kzalloc_flex() is used without
> ensuring that the allocation succeeded, and the
> pointer is dereferenced unconditionally.
> 
> Guard the access to the allocated structure to
> avoid a potential NULL pointer dereference if the
> allocation fails.
> 
> Fixes: 980cd426a257 ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ---
> changes in v3:
> -Shortened commit hash in Fixes tag to 12 characters
> -Removed blank line between Signed-off-by and Fixes tag

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

