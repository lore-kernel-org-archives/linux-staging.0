Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0542737701A
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 06:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468520; cv=none; b=Um3J29Dsemjp6YB7pEGhu13rhmb6Bubf09Q123b/8fD0+CY5LORnjasKT/uJlhxqdN5ybFh5p6H9kY3tKYincfYZPN4utKyzqzRZ6hx8Ai3k6mnAgDepIuEmOmLF61PTvOAa//BQk+3tS6gwVTDwr5eW4q6ZTKdoVZhFyO6Wm8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468520; c=relaxed/simple;
	bh=346ACyTDLGE59bDF2wFTxUnTmxuoIH4D0TOdstf2UV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiuF94lunL4ffpjoK7emqXp2Mq0CYTn1YRsESmbVKj+BHE50ymcqWAZlx/u0AZkbhIl8i9UDLs0cWuLuaQ8lVvBlJOUGFl6T+v/Vt6UBPrL8Q2Jxr2fS3F5yzTAi/6ZVDUS41aIONtKyC4jsg2kG1TrO3+En5TB2rYxZM/nNIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8W5wxkp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8W5wxkp"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so4894266a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 23:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780468515; x=1781073315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWURe9Y6lgAwG6UlJBKV5vE/RI16Mz4IgeAP4LVM2qA=;
        b=F8W5wxkpHjiZcuMoTuNQy0MaUFUbWflQRz1+4Oa5Y1wv4u5f0Ff0fImSvBHGyr7Di/
         nsvgVdnzVipc9S95pFoqutTbYsecVOq1X3VVi8O139I4giohtK1sl71htKYOSgG9Y9BW
         eZxphLlSglmkgq1hgm7Q07sxrEaLzsIONZTLFNTir3+qiE+fMPXBkhPj4XmYsZjZLOsI
         Lo+J7PVjr+lZKM4lZ19xF8QafWHCw40D9kE7Pj/AJndUgfo8R0BKb6zUP+E/v3u3F4j7
         nIi12kYLK1Yp8HdqthUVp+9YT3/Erqom2PVVug+o1q4qIjQb6CTaw99jyS+soe8fUmEL
         Lmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780468515; x=1781073315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWURe9Y6lgAwG6UlJBKV5vE/RI16Mz4IgeAP4LVM2qA=;
        b=hET7DfwrYKwR6K5TS8HW/EECwL9avoF5Ln0pYOXrNle8eMODxt5vq1A/dHouAb12z1
         2pXVVjTh7s15S8WHUDV3eJroFHDvvg4eMexZanra35Ew/BcVbIhwIpf8WhQ8e/dGrIHK
         71cOJ5SJSqNQm+hc/4sj1QPWoO4T6FXN5D6h5XEs/SB9DngRSh+tj7aUJfh7bLUv6XT8
         t8Wps8dZWzkJ2gjWmqYmWBIyuAQTKhpYERUqfd7X+MO9FB+u2i0Q8vMMLdTZMUBa71Vt
         C5JEzd9yiV3Foc4oP5j66d8Xwz/VQCO/m0UypMVGSNpDqP/e9Nr2I6cb1Ij14SZFmL0L
         ZqAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wwzZXa9wZLSGtdkMB1aP3GyGeY+VEcMUHgKn5tZRs4TX2S2xkgUQluaVyDNBChefASuIcl+xKvDovDycB@lists.linux.dev
X-Gm-Message-State: AOJu0YzrXC+CHwsYAjvBDQc2Oi2O3wmvvARrVjKKbddk8nEhxsbZFobj
	3BAUdON55eKzkadtsOSp6S7nz5FHbRZ0ehUcHFnHnfLcTqZsNpRaNy+8
X-Gm-Gg: Acq92OEbOQ95YoogJVnhpvcqYANH5NwQHbBUDlZP/EJB5oLDCXzPjA0VpeRQf0ngfBi
	lw/hhSS4S6gAmcr/9vDfKUfSlIGSRk35+EXwwIqGdDyU2A7z61OFjfgZ/spRS+zvW+i0SrAIRCN
	x/k0jvuhmUCtMRy8/2bbS+Tq22p7hLsuGFsAk3QIVR6y/ZSgLX+fCQjR4aX4YLfuttW9fjg1G44
	TEM0hkf9R/tJTOhMM9XSLRW7Z7aDfh+wy0BtYnco5QlYj+3dQm0q6Nhh1WOOYmHp4KhBlXfx+aN
	CSAbMOglH2H1YxbkIc5O34xguWNXyfPaMVCvnoedM7179Dab7e72ox9xDOy4zddjDlE0RPRRgPd
	FHXfp8BsEph0lQXY9MjkWgngCYverHb3jv3Srns3GkLrPDVVtuJwr1e0mtLUbgR3W/QogMw8Gi3
	jDwKGDGEjJSVR68nDkx8zA2xgjcoFlaQ==
X-Received: by 2002:a17:907:cd07:b0:bec:8f9f:c964 with SMTP id a640c23a62f3a-bf0aee0b569mr84062266b.39.1780468515107;
        Tue, 02 Jun 2026 23:35:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0558f3885sm89037766b.54.2026.06.02.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:35:14 -0700 (PDT)
Date: Wed, 3 Jun 2026 09:35:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dorian Catric <dorian.catric@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	marvin24@gmx.de
Subject: Re: [PATCH] staging: nvec: fix coding style issues in nvec.c
Message-ID: <ah_LHzrIKqajkYqj@stanley.mountain>
References: <20260602205252.3336-1-dorian.catric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602205252.3336-1-dorian.catric@gmail.com>

On Tue, Jun 02, 2026 at 10:52:52PM +0200, Dorian Catric wrote:
> Fix three coding style issues detected by checkpatch.pl:
> 
> - Fix typo in URL: 'lauchpad.net' -> 'launchpad.net' in the copyright
>   header (nvec.h already has the correct spelling)
> - Remove extra space in 'enum nvec_msg_category  {' declaration
> - Convert EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL() for nvec_write_async()
>   and nvec_write_sync() to match the other exported symbols in this driver

Probably needs all be separate patches.  The EXPORT_SYMBOL() to
EXPORT_SYMBOL_GPL() conversion is controversial and not a checkpatch
issue.

regards,
dan carpenter

