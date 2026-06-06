Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979B13A3ED
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780729737; cv=none; b=BR4kYlVFALw2OOg2Btmgv0ef3L7bmhLRH5GMp8+JWjcdMG3c27zqWox8rpIGLmW3L89OCkoKVRQAj5CNp547dd2fdVXOmRvXcsbxMM8jETtMryMA9tbFkxXxKab/dQza24Pd3HAB/bzTxlnruIukXCHxpz0MUre4aFCublytnM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780729737; c=relaxed/simple;
	bh=MppUI7eDfqZQVROhWHQbERi9G52gl/0sq3OgKbNVZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyGPKgQ9Sws1yJxCo+hag0dwksadZmFpVqNzQK6W/0+2YQMfk9DAjJTEFzQP+ttBFFJ/A0GpH4sdzKPMQYFsGJ6RKo4YOBiku7eWKKH+z5BUX4220DveZDvA1lGVrIAQL9PRtJHj49vHZnREuSlENH3Y+kFtTghkAaE/B2DxA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMQZOSmc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMQZOSmc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac357c55so31453875e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780729734; x=1781334534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXB9BQNTN3pi9QGK7Hodfnr/DGugtVaRvxc41ybnc1o=;
        b=UMQZOSmcC8BbyPfnB5dQif4Ekj9A3UF2yP4Q2tr8oPbHMXZxZCBrmHq1XlFMYr70S9
         BAUVGKALZMeob5biOCbazSrrQkMcDB6gwnS6pS/ctJplNM46mHBMMxCVKy5K8d8oWool
         k2N1lpIn+dzcQpsJjOW6PDhdXI8jA7d+XVIZgyQvRSHOQXae6bpy6ya41buyFnkYA3ob
         6prKqO2sA5TLgbNuxN6a+42dn3UAwI1hxgIBZVHzoV4p4KG+xHZ5wSCkfE+1yvt1CU+N
         3NY8wKsCgBXLfhM2+ITY75F9C9y1CikmH8adfa+AdQLp5aUT124gxzvkW/ohXYaGTpO4
         MUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780729734; x=1781334534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXB9BQNTN3pi9QGK7Hodfnr/DGugtVaRvxc41ybnc1o=;
        b=Q88ZTieBLZl8GGOFpZRe2YwIs0FNVQV4ug9Y2bLcTncbZHrYezhqEeK3QWRq+O+KHM
         0ESqhVqbaPM8ayhndNAD++r4zgl5zjRWMhDxRGj+BA/lPKdkwkqnlIFneK8bAKEUKnag
         +lAFOHC+pV9tPEurJPTB3qgB/H09FbzTK/aHV2KDxPT35AB+XCFfPx9rKJClUQ360GZA
         d2hcD3X2l03PWj6ODoP2oI5ppTNba6fThIhusYLWZICiuH0lWe4fz6ZZcyXizslb/e0G
         GJbxf7cPYITdxIdeAo/cQb7os3YoH/VzCeipztecjE38OS9fW8zebwZiIFdUkWE0W4U0
         gruQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tp//Xer800fopLxgxdgrF0AWkvYN7at74t3RYlhqAGdVI9iCKEJWc3YK9Y5+4CdR34OF4xvT/qLv1cvhY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8uZo1Hc126rJe8IZtTtTdwuxlBKrfpxNlsBpJuz+LcXOgEtmz
	dkCcbE6BREm3jUXjfBrwqTW81ipswbEj6QyvORZ8glEPAiPkfPY+TTF/
X-Gm-Gg: Acq92OF7K0pzM7KzeX7m+CQYlQVzmsVBdT1RFWvHaQh5cUILf7TWEAp2vzdB/4Ps3sJ
	SPC7/DaBC72DjYg+ftFLve7FltRjb1UBlTSCQNDAOw9EtmyrTMRS8DDMyn/SgRr59rrln3y+zRg
	IhkWxfQwMQdHkKPqPBj6iBb4qeo0J/R3dIZVyR0RtKxoz42PMrPzmgt6CV1F8Jistgv9CCXUBsA
	6MOfXCCGeWbOHXbypn3ySxtyYqTb5+dFNNgs8PjEZkfLh18sbondukj1gSgwCqzGnJc0fRUG04j
	TbhT6nufjdhtq8VWqAriPgjlaqp6658GSuybNW5qg2FfxeS0cz9TPMt4QgSVAjCilETEv6ATucr
	5NWgiQiMysTWTVanAgTnvZgQnjK2Z5d8VyMCKYZmWNkD4AGRj35/Do/5h3MfBl7/id4jAPIkz8A
	j+dzEOqSXE7hPzhFkMV0f2Q/9CSwZSwg==
X-Received: by 2002:a05:600c:1907:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490c25a0800mr109044625e9.10.1780729734323;
        Sat, 06 Jun 2026 00:08:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm31925879f8f.3.2026.06.06.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 00:08:53 -0700 (PDT)
Date: Sat, 6 Jun 2026 10:08:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: gregkh@linuxfoundation.org, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: fix snprintf truncation errors
Message-ID: <aiPHgttTk0bK563E@stanley.mountain>
References: <20260605192857.78944-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605192857.78944-1-rhys@tumelty.co.uk>

On Fri, Jun 05, 2026 at 08:28:56PM +0100, Rhys Tumelty wrote:
> change snprintf() to scnprintf() in both gbaudio_tplg_create_widget()
> and gbaudio_tplg_process_kcontrols() to prevent potential string
> truncation warnings when prefixing the device id to the control name.
> 

This commit message is unclear.  My understanding is that snprintf()
is complaining that the array size of w->name is less than the array
size of "GB %d %s" plus the array size of temp_name.  This is a W=1
complaint.

I hate this warning.  We use snprintf() to deliberately truncate
the string.  Now it's complaining that the string might be truncated.
Oh no!  What we want to happen might happen!  This is the same argument
that people used to block safer alternatives to strcpy() into glibc
because "it's still going to truncate the string and that's equally
bad as a root exploit!"

First of all, the string is not going to be truncated.  (I haven't
looked).  Second of all, this warning makes no sense in the kernel.
I have never once had a bug which I failed to debug because the
last two bytes in a string were truncated.  There has never been a
scenario where I was looking through dmesg and snprintf() truncated
some bytes so I couldn't guess what I was looking at.

So your solution is to change it to scnprintf() which is kernel only
and GCC doesn't know about it...  I bet GCC eventually learns about
scnprintf() and it eventually becomes a warning again.

A better solution is to disable that annoying check.

regards,
dan carpenter

