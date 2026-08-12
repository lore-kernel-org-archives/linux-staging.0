Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BEE39B4B9
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525604; cv=none; b=I0f8zRTAkiTDBCgggf87v5l/31F+nhIySkhatXFx39CZWg5zjir2keosKWbXfdw0mZS4Ot67wjru2UZB4qao9AFXNxVVvhcnkwOrNWzoSQexiwKlobVd7Na5vUl0CRyE+0kQnbL3P/r8ry1z6UvMl+aEoUWSBvYW/ALOkSntbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525604; c=relaxed/simple;
	bh=X5S9E4X5047qg4IL1t6gHrjXkXNH7oUBhBJAJFc0drs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2tRE80STSJGqdvPBYA4J3EOmf1OoPupyzeT7KmTmSGvEUXSDBLZ4SVP9iB3sOK6UXCcKwTtEWKoKxG9QYyJembSNbBimQl4/jvgTM4eBO5GSiEVR3JEitIxguzw/mTdUrKgeac+SAZI62fZSuUTmpOC7W7lDDBu370Ovv5HkAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPGlP6lh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPGlP6lh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4997581cdc1so5786615e9.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786525601; x=1787130401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hq1fRISwW1tZw3dG9wLdONLNZyIJDDT4CwKD1KvT68Q=;
        b=KPGlP6lhSMgA6KBF2gITK53jzIy9dZ4/4UztA0/fxANuOsHpewRCkqzf/m7uxnj1ke
         DxIBZguIhYg/na6akx3ZKoNd7PwIN6YbSkPoxTS7OCSubdNFZnkS00xAB1ifivNQNVkb
         ui317ZHv4tqATSoIj8CkTi7sWLrukOVb3LA5ak6+tck7y+2HD0zaFnS1QWSWCd+oSnE2
         v/YYUhulekNTS4y/EnUZFoBua+EG+ZnUyRhvGqeVjrDQMvn9LUai15EMpseKlFGvfa+F
         Ciy6HA8FJypgZGWKwDF6nC2MvcCQjtH+vICmZJL4qhcPLOgmiWxqEnb5zfxQjQRfoLS1
         aC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525601; x=1787130401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hq1fRISwW1tZw3dG9wLdONLNZyIJDDT4CwKD1KvT68Q=;
        b=IvCimllV/j4J8q0mQEZmczJWyIRbsMxTg68/t5p/FCXL5ZPeRssDKja3twOUrDGTWg
         xi+es+vqSepZ1p0j03kB20KxeZYStMZOejAXe+o7+lUS4aLOLKKxGSXAotCk2DFMupYE
         UNhiC5Vbu94mWCB+1Ag9jV0BFgkQG8c8OnGrZQtI+Dvde+YxHsVE/QpESfWnRnyWLPtS
         AA07FMWxAkEnX/WYrvDKOU5Zo4wE+dbp1ynqjvT9bvC1nuoLgtXlEKz1D8uyasb+9hdw
         W/ZVTt8grHfCYLZv2odUzEyzC+BjdGPiPpmVjfexz9Fiqblz6C++4e1dAUpPTao1L6+o
         qFoA==
X-Forwarded-Encrypted: i=1; AHgh+RpeJUVZRomrKo3j2+FmvCP0+/oGpPVTgifvxifBiua89Hzk3fBmjnHMzTvmKIZv/SRzqruv2VVRb80rl8jf@lists.linux.dev
X-Gm-Message-State: AOJu0YxV7FlXc+C5mypWrROZw+drQ8JsP9Ci+7DispdyTVBtUFKC3cqW
	sHBzdNFwbXa45X1Xtzhwto1DZI0OFNfhFeGumWmOau25IGy+9NbWFQqH
X-Gm-Gg: AR+sD12LPYP78+4JaOer03XVsKfp8rP6fHbdtUH/RXXPL4l/R+kpt7CWu6pgv1IeLp2
	kf42RquMtCnHOR80cSpaDC5eOmlI22bULkHjz5B3cJrJ15PSf/5nDdmicTxFVPuxuegZ9PYiQi6
	kNB+sYJZC1TVwzaE4/387kJHaY4mAV6QeJ4dDP/97orZtVVmKtu9tgmL8NDZVnDlkYSbKq7Lj+6
	mHo9sz6JIi8z9kY745hjWUBdNstgEVMg9YBWGf2SSXGsbc1dZvOtFVNHXZnGixg9W3CVC9DZH0f
	TcmEmKTehefppjrQNl9vUaY/M52bFlFdN/mZTdkThuE5sv2p+VND1LdORQkahDw2k+kFyYy8/6C
	SW32GzUKwePK84QvW5tV4vTLOjGgTEuCi/1dZ7wBlBLCzlOTY2vA6nqfBDZMbpXqVBxTHx1dffc
	s51bZa/6EQIASc/vqLyxJgQe1xIqWbKaQDkuMHXMqxunKj+tp5NiIIaS+1
X-Received: by 2002:a05:600c:a05:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4997c1256c6mr39626405e9.8.1786525600743;
        Wed, 12 Aug 2026 02:06:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e882d8sm75480805e9.4.2026.08.12.02.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:06:40 -0700 (PDT)
Date: Wed, 12 Aug 2026 12:06:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Raushan Kumar <mitramaurya80@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newline to sysfs_emit()
 calls in audio_manager_module.c
Message-ID: <anw3nOfSGKoq-1E_@stanley.mountain>
References: <20260812085117.103875-1-mitramaurya80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812085117.103875-1-mitramaurya80@gmail.com>

On Wed, Aug 12, 2026 at 02:21:17PM +0530, Raushan Kumar wrote:
> sysfs attribute show functions are expected to terminate their
> output with a newline. Add the missing \n to the format strings
> in gb_audio_module_name_show(), gb_audio_module_vid_show(),
> gb_audio_module_pid_show(), gb_audio_module_intf_id_show(),
> gb_audio_module_ip_devices_show(), and
> gb_audio_module_op_devices_show(), as flagged by checkpatch.pl.
> 
> Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
> ---

No, this is user visible API.  It's too risky to change once it's been
released.

regards,
dan carpenter

