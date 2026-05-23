Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A05CDF1
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529854; cv=none; b=E92YhpIcXuuwDNrvps0gICfy91FYr2bIPq6HV3+HwoIHfdjIV3z5ZBppqGsYXpiXfkLqAHLYVGbcMNi5msxBSMPoRPohlD4xLAnGF7DM9iKw8Lrd6fCew9waauarYY100wy8KjkLeaF97N5KTZLuMeDWodKT7251U+M806KQCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529854; c=relaxed/simple;
	bh=op/oYI9cujE4qxkGg0xcbWSC937583m70UoKSDY64DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVnwC3f14/GTSfSf0msVa0gdAH1P8K7cWe7WRd/YDeEALsqo+VMvWnPKNnpywwTJJYWiJHD9DRKketcpmxv774tdJpBF5iNa+Ycn5t+RPN8g8D+UjZEKvtbDyBRzRACySuO3pzBr1z3ISQDVMh/ZrtDUCyqOoBEKx/a2XLyuXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA0Nguym; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA0Nguym"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so23329715e9.1
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779529851; x=1780134651; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8oNBuIRpmD0KT2DdPdxp+0VGy8FUnSVWpa8pcQ3jfU=;
        b=BA0NguymPXdI7zdY/0zneJcPtFtpzJ0QqzTrBJbHGrvorh4N/42rKNE/C8wB1mWOji
         mbFKNmLyV56L2gzqjgydjimt+vS+oIid9A4J7a86SKoQLhp9Sxi+HqmAmMvkTDH17XUg
         m2XQJDCRn2Srts5jQReU0hvsj2dKsrCoeeYhyRgjg4EtPkEKJi9eFRVVzsddbc3ssbmp
         fVT1YEv/Oa3d1KE+WqSLkg17oXJuLfVnV/oXQFrleezWGA6YuUE+e/vQ2EafYfWmb/Sg
         s5+SIhIycQ6Zf4mHdRT+fCaPI81gPeUYxoWivV2eZJpTtJ+1l5ofdMLJrkcSw1QYracO
         Rilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779529851; x=1780134651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8oNBuIRpmD0KT2DdPdxp+0VGy8FUnSVWpa8pcQ3jfU=;
        b=CiJu/a3HV5qCL+755E+ogqXIVOLSjyn1z2TbZKeFLCs+9PeNiIKzrXuJCI+T6QkWVs
         CiiqZo2aIdd8uAP7YAZynYf0af3O6LPG+QhM8fz42J48FUzNtjFxOL08pa2DfXjSFUZD
         6mjZ/Lu/J+Wm2koOSk/gG64K08OxarRKZZeP2MjJ318hbfHmTjy90iA2XrfVETt4ju4j
         z4VDjTHLD9bVt2GYmdB9YtAR5cTqV3LzVWhxhyZcQhthNHLS5i3pUnjyRJDDy5zXFDXu
         tiblSs6q2DTjyD100xuVmOXfLAInUsS2VU10QrPpkSEzR49+CwqAldVT5sJVR7+a6fJJ
         Vnzw==
X-Forwarded-Encrypted: i=1; AFNElJ+y8jrDAHcQ6UvEGvvgfemveq+ndejRuBDWD6bW36dqVNeWNu3dRpQKrfMGBV39Q7Rul16ER445Xhgo6fIp@lists.linux.dev
X-Gm-Message-State: AOJu0YxQGTd+ToOjfFjqAe1lcXUehfVixu0esze7ujKzN1nR+Ck8oGwE
	cunBIa1FHpwIV3Ly04Xx+Xw4T0+LiikZHzg0cGv0gH73Nn5hqBtPX8Zd
X-Gm-Gg: Acq92OEAn5nF8qHZH0XGKudl/TVjXedm44jOY6Wvesb5XKYM2rk1qsoptJkAUgjN/OS
	rLpgzvI7K9X8KJj3+bq/M1accTWYlILJWbhxppZKwNs4FohWPcibqLQ5yjqUG2xlMTS4ffbPuLt
	VMv4vBOQ+7vEjU4lxLY9Orh7RpRGRUTl2lJkJmoxIjPgRM9WQfWu7Od+1tkee9MOhPBfle3VKc7
	FlX4EMm7Ho+hsuDhRnNWlmtsBDFluWitMv0FGcm9MOEMuoRODoDQB548fO95okr3zLeNUiGZIT7
	2rKI4V4uYn0Psv8HnEFNZUnJok8g22siMM7nTL6F26oZkVdqD+/Z4hW7Ncw7L3lXMdqTEkRWcP8
	yamzyAYGuIfiovQkSnMQhnTE6EVNSQR6RzT9SXsQyMwIsM6tjdVf3PTfbddQpzwaxPb8+JtO4Td
	KQsLR70EuNL/MGM/qZZDEX2p8=
X-Received: by 2002:a05:600c:4fd0:b0:490:3dc7:9778 with SMTP id 5b1f17b1804b1-490426d3f0dmr102086255e9.23.1779529851055;
        Sat, 23 May 2026 02:50:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d69a6sm42539355e9.15.2026.05.23.02.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 02:50:50 -0700 (PDT)
Date: Sat, 23 May 2026 12:50:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Elise Lennion <elise.lennion@gmail.com>,
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
Message-ID: <ahF4d--18ikUNOdJ@stanley.mountain>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
 <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
 <2026052249-shrank-trophy-14ff@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026052249-shrank-trophy-14ff@gregkh>

On Fri, May 22, 2026 at 07:07:10AM +0200, Greg Kroah-Hartman wrote:
> > total: 1 errors, 0 warnings, 0 checks, 16 lines checked
> > 
> > NOTE: For some of the reported defects, checkpatch may be able to
> >       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> What about trying --strict?
> 
> Anyway, think about rewriting the check for "== 0" now, that is not
> normal kernel style.

The checkpatch rules is only for NULL.  You're, of course, right that
== 0 is bad style here but there are be times where it is idiomatic to
check for == 0 or != 0.

I only bring this up to promote my blog.
https://staticthinking.wordpress.com/2024/02/20/when-to-use-0/

#SEO

regards,
dan carpenter
