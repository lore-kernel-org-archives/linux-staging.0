Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008101F03D7
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160364; cv=none; b=EWwrWZQMIvmGMDhWRQZXBLesqhemzTUhpYumtcEAz9TV2Dh+x59M9QrDyPwgAA8mSDSMH+n+MLlbcFiKYnOToHZtqkvDeooHtBomcXpBeImOptolbZGvoZrltRC3ZUeZ0NPiRhFVv+h4YiJXh9LVbmWlZRlOiN4KQFsObvIWbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160364; c=relaxed/simple;
	bh=+tiHM7oCl1ZmVCBaxgQhOmhvaOc1vK377JCwouYKzDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFfFZ2Lk31QYWngnt8PJ5RMM0tpRtWKk28/AwoaMom0l6UxD/kQD9gS5x0B3yvVMDcHlzNvtCNxcZoX6wdgTuI+MmOUc6s5kkIugfHIY/3N5Ic9jEh/+X3WJ0+QDn9HL5l0SUCqkzybdO63Fa++Tsh2Bcled55G5/tKqW+Kkdlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=j13A2974; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="j13A2974"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so43791805e9.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 23:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741160360; x=1741765160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XuA+TgzxO0cDd+59g+qU1yGMkksNmClDdcwOzwAMqE=;
        b=j13A2974mVdIBfOScBUOfYi4OU21jpOclEJrEYSxxO0NnOqb1EsuubHno6xPPsA8FU
         ux71cGwz1EMNQyIcBrQn2evp61fZpPMwrmSkzP4t8roHBiR5s/OwhxtxcmZ2LBWzRWX1
         a2nWAOhEqcoqczwURCo4JbIKoG8e3n0NYnyJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160360; x=1741765160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XuA+TgzxO0cDd+59g+qU1yGMkksNmClDdcwOzwAMqE=;
        b=UUpVxKz1rEuA799PyZl7tHJzv1PlQm+HeNWRJ2bXuUUV9jX9MnP71CLmZdNIa9Bhqv
         DdrjNQFFjDEA/rCuR1rO+VkbY30cF4/kye4nrgiJ+4zDU7TRTt1o92tgIUOSqfUby/VW
         Ca1kWce2g5dKvYJAim/hEjVo2llTrBUvm6CqZmdnwNWaJuW2eudR8wpCIC2fnlhljsnI
         nEZ7bFV1kD6FGXbDuBQvwNnKPeIkr8v1bEbCrQiI8bp2EVXlyKGOJDtHnGBvXvbMulSp
         8yHdaCYH+zzPEnFFFX6juC481LJXSGVesdT1PBVPMaepbCVlVpnnzBn/cQeWMeSMcSMW
         Jb4g==
X-Forwarded-Encrypted: i=1; AJvYcCUg/+h+RlctMLLTkzD6XDhz2iSZZ0yKQmk35WyrY9FoJkyEY8jKqMi8Z1tuls01a/CYVuIL10gZ3XospdI9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxv2dqp/KQ+vu+jDmxJillB/MyCWORtUexUDDvbOE0MTKkO8uz
	TW/aVI0U3UzCr7HVNb9gZyIbGuupC2TMOR8wOUXpesaGaqC5X7Ysg9TobZp7gPs=
X-Gm-Gg: ASbGncshPwRp7SbfQvgjUEOBajjN+FqI2OQVrCw/3aX4ed93Yx6Q7RRmxZw5NojMc9v
	2Qh5QHloYKyNdOn5g7xhPivKrKaBhS3c1mEu/3+327vNWfzXtf3E+XQXta/PXbGGcM7dT8aJ/lw
	S9UQKfbPu8e8z/i1CQWJ1EDvwvKWPvPoiYlbGCadyXH2l+1gmOmmDXDohnPl8H5tHwjLhJdHVkR
	eMIX/XqNIBMmxc+lujfnMUS5ZiiFI3OLfvjszpGO2zrkHF+0i48x4kprJe1lws9ugOSF04dmB4w
	bhX3GulTd5L283IKXArrXDUnDS2JAZeEt4SufviGmUg/KnH6V8kVDO3J
X-Google-Smtp-Source: AGHT+IHNDniz1S5hPDkK5ssZDMLDexZifLYl1krGvetjlRdBrr6MVPUh3DFLsQ8NIkK7+0HJSn4e8Q==
X-Received: by 2002:a05:600c:6b10:b0:43b:d531:ca94 with SMTP id 5b1f17b1804b1-43bd531cc69mr5061085e9.3.1741160359980;
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426ca07sm9175785e9.2.2025.03.04.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Date: Wed, 5 Mar 2025 08:39:17 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Remove access to page->index
Message-ID: <Z8f_pcnaC5iJMz-Z@phenom.ffwll.local>
References: <20250221173131.3470667-1-willy@infradead.org>
 <27cc53b9-0db7-451c-9136-5fdcf42145f7@lucifer.local>
 <Z8coiv3rn8loOltq@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8coiv3rn8loOltq@casper.infradead.org>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Mar 04, 2025 at 04:21:30PM +0000, Matthew Wilcox wrote:
> On Fri, Feb 21, 2025 at 05:53:16PM +0000, Lorenzo Stoakes wrote:
> > On Fri, Feb 21, 2025 at 05:31:29PM +0000, Matthew Wilcox (Oracle) wrote:
> > > There is no need to print out page->index as part of the debug message.
> > >
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > 
> > LGTM from my side,
> > 
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> This patch is not yet in linux-next; can I expect it to go in soon?

Being both staging and fbdev it's double orphaned, I stuffed it into
drm-misc-next now, thanks for the ping&patch.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
