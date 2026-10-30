Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368463;
	b=4hpyfF0LlzQO/AktewdAwma4sS37O9AVZBe0FUnPVDaRs9JeaJzrou5OzjiI+e+YT7sq
	 oUWAvPq68+5PN77E9N0aP9vvCW0uTOYCINBkD/tTc5v1ZT127J74JbGk7xb8Z0AZ7x6yV
	 ZIFCR/uuACzYbGekhtw5hFLts9gxVl9TV2rEJ3z4jdhHkeR9Lmb+W+P+QHWycPXUy6Oe0
	 a3XZ+sNsQbu5ddKlyN62vnPyWzaGdnw0TDuhZl3gmTqmDeHdAaOpdNMbc4bO47KyCT1sr
	 aCaYcPwpv0+sPX2uVCJnnOajBYMtk81DjFUlD6HNkq1CJ6AH2gJr2m6zOFkis2+qNlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
	b=KslzWFkowIg931axnDW1o11q5AKGkwwkRVIN46WRKdsJXVfoNfUCIJYj4dt/gIdzjMkG
	 G3n6+yR2vx1FmRdw4CQ0zM5MhbwzzFRa2avASyMWp1L2cYfs282tmf+GrFfGMA2K06Rui
	 q8ocW/YmqKA9JWQJ3l3Jseyo855JaGyaHAD4Di4DXtJFzuzzFGI+KQ9U8W8PevHYzUvSH
	 PrP2RP+TG8MCsBPGnsdr90yyKdpUhKiEmWdBdLSdikpU3HPAyYpwhi+YzHf+G2hD9ip3A
	 aDZtTr4+pJfF/1p8Tyv3Hi61FHcAMQ+mcydckTco3KSAlajY5nrZRKwivEPABrwuwqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew5OXGO7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F7606A31F
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5F7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew5OXGO7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso8410975e9.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=ew5OXGO7qsLHwNO7roJRSJXgl5WL5Pnrwrv7mnCuu+N7FNp/x8FOCSX6PKDoEC5Ii6
         6Q1aUeuD3ZSLohnNkKT2B5XLfdVxBO0VpRPz7UGQ1qyrWBBT3dg1BGLeEu+pmg88pjDG
         8IsCg5cNFh/qMOWTRx9VENKz0ZTchUvDkmNkSOdrYL4NRqgXPrOtVvL6i2yrZcM/EUi7
         Qya8VQczJ0QG6VIra+I2ucyqxo7Cfiq36g6gjjKzzLlSJUz+WKKB+It2CwoPJHcxnFQV
         fZ+WcjpurI1znEz8a1U5yVsV34anEhWyj++3yA3HIahWpkRuZBoPnGTEyKns1T+9Hq8+
         QuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=HCeGgJA22E0Obdq21F6xqXzg67F2mnixdYAch0wf0tkUgmII7isOT5Kv4VdEv2VegV
         gqAOmzIOA1/lrtAzN1n/mZwNpOkIT9GcRB0M9TDfA6UuwQBFlIAva0vqRwaMog+Yvd/t
         /QwuVcE/doe86S47oAIEyTXTZHBNQNUH6g84nB+S7eMCy2/JslMjMgy04cafV2j1zeeu
         4rfepj79GwyXxp8GNxC8pZqK39m16ei2nsIuV/tuNIa0ZIk0e2US86CmVZJUmNzmo5Kh
         cgzQShSZZsUkRchSeJAZKtDKFY6KIX/Luf2wVlzgmfAxEE3RRNRYFAu6ZtaEfjEydJLt
         g7iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEdcHAjd9lqQ/Q1CShhdRlA1Q5ax9rprEdCsTf5o5YFaLXkEMweZniJALl2Ca+QOLvqEEm2S9rpeTQYEIz@lists.linux.dev
X-Gm-Message-State: AFq9FYLMxpCqBg6tFNW8e9Ttw/V7LSmf5dAUl+n1LwxmZ9AgAOVJZ5c9
	9Wt50nAq2d+eylho/poOVY4RulMfa35+3SFdUOT686m3HJD5TJUckEX+
X-Gm-Gg: AYBFou3Aj6PfpHAmij13dtnHXdeUk4dww1ew6Ycsv1ToM3WCWFI2tKOCGPWhn+fE1XQ
	jDKkazZMYNx1EiTYmveEKtIuuumVmE5OxvSY7HfkJy+uc6703D3kqdO0mgUaB6TH4a229+3z4uO
	wxT0e787LmH5hokP5nMkK8/mfXekIBlXaDVh5qw+E8uEG7du9SH91kQ19SnQHvD0TbmdROpbS9q
	0U0KdcpSMXmpxQ4VDaNtGyYugAChWhxps3Q04hUdCSzttGCoKcHQQq4AdlyQGYVEMzhXv4AoE8P
	QJNiDPWDRC17ohwVTpylUm8iXjAYnltFePHp5S4FojJhUc/dVnF7MIYo0oQsFN5I4EFNfnMplWf
	JXqksRS+UfrfwXoSd68ii8pxwg7CKlZ/vwa9iyNEoaV4nS5jdGl69s07gHN99mvxU6z7YCiboUR
	NhLDGlpMI2aEJdccLWKa0OtldZBvucnfocoCD9iiyGGDgIiLxOEuKO7NeqURDixkJdkzRGL1aXB
	3EbzMGpLzynjDBRbPYBGg4bmaEe11jLSxAMBs5KRW4CQRwrgGOKNLGFOwn0blWGOIk6rfKIUnsd
	9XTPr+8UFOwYi5HRLGghz2eLRNC4ktFS1DUkE5e+CrVv+cLXhf1EYw9IttC+/wXMVzrfN0x17xE
	WN4XNR/jCIJ5SUp6ysrjdrmWDky6VxVs3gLGUnjT3419XhHr8XIxRzATLyr4dOinIdA0=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

