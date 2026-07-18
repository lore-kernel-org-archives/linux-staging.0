Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC825305E32
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784353459; cv=none; b=PzGYasJVbcyrfV4DsbumRfKm3zIFKh7RyY8Yz63zdCfb/RBjYhrKg+E8v4nIWy5Ok8NlWJhPkUqxfevsdkGUhHi1h3qLMLB1rWpyiUo6Od/+3ZUDXjQGrJmZzFKNr2Qm21PXHnG96hdHLbUDd767noOWnuJ5c/qMZ4nLEkqbk/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784353459; c=relaxed/simple;
	bh=v3COTV9+rSfqp6L59u01sSvvYHm7zK17jRrglIjfiyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHVnUDjRfi1jIfkV7K09kPNtctUmxBFR6aZ/JRDu+w3n2Is5WsokzY4vn3tPBdIdOyYYsn2zG5JtWFw4wiEwjd5eGGzoKif3pkTTI5w0uaHYdeXDF92mGu5f+gU2M5NDbLYYkoWWpIhP70rAatTLrSWB2xJUJWuE+Tro94mnO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/EnESkW; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/EnESkW"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a0e55e82d0so3232808eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 22:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784353456; x=1784958256; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71HbJ1PmI0j43ZykPUAoW9mbuzTezbVtmIlABT7/mPw=;
        b=F/EnESkWqlFcSHvysTJ72iGRNSv6Z1VFHzP/j3iivlU+SjBdZITBwEHwMevxQ0bIr3
         AmfGNjfOev+pxj55Gcib6ZD2QB7PRxQTPXxxdbBeBKwc7vGiDgVk3CaoBn4/P7AIqxOM
         RJqEReY8EIsJ7I6ZsjZvbOY70uac77NmJh/y2Nqc9dbfgi5KczJuFCwyD0Iz/Esz82oM
         86hsVRO72MG55ecRDd8tK4C7O6iYdOVt/X29xWcaxGjHd7Skhp9FdPAdqSozoxmbenCw
         akIh3fliFyxMj/i8+ptypHXCbTUuYSw0M301K+ckxFE8tOw47lb9IdHlFk0gduJnCrXh
         QSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784353456; x=1784958256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71HbJ1PmI0j43ZykPUAoW9mbuzTezbVtmIlABT7/mPw=;
        b=efGZX/9awZs+yVshrCVYygw+L3pBdXiw4lCKQvViXO1SGLBbHG4SALTfG7Y601DmUd
         5p+tbts3ktqwsRQukGlDYKO33JU70YYEuAeTi69wSMn9BIbJHVRhe5QX2u4PDq5EMVNP
         OMc14rQUilbOGGdLiNhyuzWxz5X8Xj+zeULy2aJPOO3Ye5AcsgTiBu80sx7FyQgVq1hb
         AuMwd0rHbKSf1YhfnWx7StL9G+YDFDkF2Cdkyvc7mbGs/YvgwxlFN3l9+59aPA01+2Zs
         Ik5GacnsB2Y3KFN/QX03XILCQ4iMIyY/u9OxHU5U2sIPo31b2K9XkR2VyRTAhNStaj+Q
         ag5w==
X-Forwarded-Encrypted: i=1; AHgh+Rr8yEEe/q3IBZbsha7QD2iFt1kOv/P/Glq7GnZMmMPWQdXGR/vOsyJm597XTNsh6AAFACEWhYd5vUEBQi6b@lists.linux.dev
X-Gm-Message-State: AOJu0YwxqXDfYCdfaL0ds9XWiBMuFvWWegsSk+gUe9nLsVhb/1JqpAC1
	mLjWVY7i6/5c3eFZRIUnzB89D7GXtRyJGrKL0fyuAHf/Kzd3H91ZRErs
X-Gm-Gg: AfdE7cmMuspbeJhFnDjJEnPC6z8iBrVbd0/TSfnGNb76N0YY2OsV/iJ5zpweTCjsIxk
	+mI49Zqsn6gsGAMlQb8K0F2/MOk6uNWgV7O1t9oT2RTlAazlTymRz2G2Hmq7iXyT7v5Kq7CQHBn
	pgHrgCKShE/YRGs8Lilbe6tjS6wel8+lzoxVIB5YE/E9dKc/0hVLEPr18YhZS3RYSeKbJ55Al7U
	wZ4Vrk5hvL7EqJsxjEgTw0yLG5sYyH53OYl5l83pCOQaQbg+ktOpdSvVDDPmGaVxEzWyOwFseHg
	+q7tnowqcBIlQ/FQLw9h0eAC+F2SeXNZS227ATwFMufhbsk9hXlnQ4ExD9P5oTSye4DZ98y2kiq
	7zLoJ4m3mP2ItRDKptweIbecL0EyTa+1QZrMwvceR/Xw4ixl10Po2Uf4UNbZbhrh4LDjtoA==
X-Received: by 2002:a05:6820:150c:b0:6a3:7e5d:3e26 with SMTP id 006d021491bc7-6a536896826mr2682171eaf.46.1784353456605;
        Fri, 17 Jul 2026 22:44:16 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a51a2225c8sm2857440eaf.10.2026.07.17.22.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 22:44:14 -0700 (PDT)
Date: Sat, 18 Jul 2026 08:44:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix mono image source stride mismatch
 in lynxfb_ops_imageblit()
Message-ID: <alsSp5tAe8tunTeG@stanley.mountain>
References: <20260718045641.468640-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718045641.468640-1-meatuni001@gmail.com>

On Sat, Jul 18, 2026 at 09:56:41AM +0500, Muhammad Bilal wrote:
> sm750_hw_imageblit() advances its monochrome source pointer by
> src_delta per scanline, and computes the correct rounded-up stride
> internally as:
> 
> 	bytes_per_scan = (width + start_bit + 7) / 8;
> 
> Its only caller, lynxfb_ops_imageblit(), instead passes src_delta as
> image->width >> 3. For widths not a multiple of 8 this under-counts
> the stride, so the source pointer falls further behind the real
> per-scanline layout on every line, corrupting the rendered image.
> 
> Use DIV_ROUND_UP() so the stride passed in matches what
> sm750_hw_imageblit() already assumes.
> 
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>

Looks reasonable.  Add a Fixes tag.

You have this hardware and are finding these with testing?

It would be better to move the source delta calculation into
the the sm750_hw_imageblit() since it's just width rounded up
(or rounded down if you want to be wrong I suppose).

regards,
dan carpenter

