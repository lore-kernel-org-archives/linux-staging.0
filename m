Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF58469851
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089215; cv=none; b=fI39hZMFEYvMrXV7VtDefXSTDSaG+C22MNftcn/1IfsAxJVn/qHplkovFjv973ue2v2yprnrEg8x+K7KLqU9gruzAGf9bHatfy9CfVnUgbFwKnOPme+temIgJfv4kr4eFXqLdjV+/jijTv7O+ZPHy3MQtd4GJkWx98Y869Yt4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089215; c=relaxed/simple;
	bh=pv+HUDJ6Jqv1EfEXVjkswn5QmcTtpO/JPntGSbAYY1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oS99rfESLmQqR3gM47lgbOzH0mYnKIZQ/aRaHUTli1xgoHWCRDuGuw+z5XAFwvqzT7SxMunM4FxboJWWLNm439/UWbrQhtzr6Nim5eC3b7HcrUSo4zrtDmM0ZoAgJNFyv4EgSHXdEnUtU+amlknEg9iFUIcKDqfMHQjK9j+0SIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5ZZjRgt; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5ZZjRgt"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c0ecfaee7so19506411cf.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 00:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786089205; x=1786694005; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkSB5UeEOgCFJxMoU/6rdUo5e6K0Xm0j0jwgxzCJuXM=;
        b=U5ZZjRgtR+cHDhtvdFqmqJOpDsqP4tzjVIrUdd+uRA504AwOasar/zfepWC3w3/ex9
         gAyJzXoRjT9S4ZhQuXZwzCabO7gOEoHzzzCL8EqYLeXL0WPmfJQCkhzzdgEfZkY4EwDx
         /ua3x9yCvNL/NQ/ABeWKlUuNcoo++Wiml/ekSaEENbsCkQh7zaJYU9+JI08i04ClLn15
         XJT6J0mTpEeYkro2y0J9FaXJdW0qapVEAL48B+ntHOJ1zJuRln+LfDsa9Y66PkAQHR8X
         Ex0WTa1aAlyZPCxsUSHzIea4fyXorNGLy4ptrSEIGopxw0P7oEGHuxGJEzC3tlewQ9C6
         MS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089205; x=1786694005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkSB5UeEOgCFJxMoU/6rdUo5e6K0Xm0j0jwgxzCJuXM=;
        b=X4724b2m6hVXwXDGiwYOROJt7H/r5xjmIE531mhUOvpmtMn5MbGardufn7UK09Xl1f
         FnWtdr1WaMuwvbnlbTFaWn+J43zbEdSG9qNxErMvNJTsox6GGfc2h39UxUBZuYFLBz9q
         trc97zWOdSb9FpTp8WAGCFg058sMoRHY6wGYrsBnw3GFNtejcqMzoxJi9Zz52O5Buil7
         iCSFHDGJSrefkBUUJO9uyAnJF3GLNo79WF6GFpo5Y7uNc2G/5ewMQrBlUq3cczZWmOc9
         1ZX/AqvkzByojd5QwaWe+65lfD4GiClQNDhNTCmyRHC4/r8IZIPn+1SQylp7talGnhBw
         kkkQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc5652AinY5G2DxJgyinWH0VcYfUez+qBxdx9eICXXwJ8ZPoArOSN3tyZbz6jesiJqjlaxWZwl2LTcSKsH@lists.linux.dev
X-Gm-Message-State: AOJu0YyKkqfNae7xv64l0MNqans4jHiiDuoVAx0Hkx39WjdnWiTAskSe
	18n1lVuORhk3mTfchgZkVhCHwQC9IqvNZd0GGi8+qiElPymtn6M5OEnZ
X-Gm-Gg: AR+sD10xcFEtNgQ/UfCKQMfwUGVGQNf5minawk+IuzjItN1gDdptGcvL8q9hZBUt/YG
	bExuOVFwcy2CjQfEYJDauHEY3u5Sf0kqN5tZfaRGdDBrRW/72NXHyygpW2FnhpA6S4kn31071bC
	te1s28ZWy2HiBxlbHd2es1Fi5BEX2Q0d2LQhZE4Z33lx2qGvRzclhgIWOF6Tt5qRJZ4XJBgTScB
	3faCDj8k4QjFWMs/M7HG9Q/aqy0rjWWEJbSH8DfCRtRomO111o1b7I4IimqEtK74nYZ1HFy0acc
	bcqfp2YgQevpBVNIqJC1ix7aSz6DJXnz3slX6mF5evhM89PIqQKjMNU1DN1t534d6lwwzAxevqa
	v1tf3VJDYcBScBVOOhv+EAGeZbQbuSmMopa/YMjeJxcjemf2HKsN1wCGlkq5Fowhf5rL9mTWTxx
	wyT2ZzXRgQbgADnFUBGZww0c9fbVAr6o4ydqcX4Q0DAGED6thD3j0MA/4=
X-Received: by 2002:a05:622a:1792:b0:51c:1408:6c13 with SMTP id d75a77b69052e-52ce61f0ccdmr208432251cf.44.1786089204809;
        Fri, 07 Aug 2026 00:53:24 -0700 (PDT)
Received: from localhost ([172.93.148.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1659b9fbsm6999931cf.15.2026.08.07.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:53:24 -0700 (PDT)
Date: Fri, 7 Aug 2026 10:53:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove static HalDetectPwrDownMode()
 function
Message-ID: <anWO7VdAafRvku1S@stanley.mountain>
References: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>

On Thu, Aug 06, 2026 at 10:34:48PM +0300, Nikolay Kulikov wrote:
> The return value of this function is ignored at the call site, and since
> the function has no side effects (except for the assignment to
> pHalData->pwrdown, which is not used anywhere else), it can be removed.
> 

The patch needs to get rid of pwrdown from include/hal_data.h.  There
are two reasons for this.

1) For correctness and cleanliness.
2) It makes the patch easier to review because as the patch is written
   now we need to check the kernel source to see if what you're saying
   is true.  But if we delete it and it is actually used somewhere then
   we can rely on the kbuild-bot to find the mistake.

regards,
dan carpenter


