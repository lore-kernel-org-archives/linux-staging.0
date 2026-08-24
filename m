Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BA3E7174
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555329; cv=none; b=jiyGp1oBMKxZt9GhY1EwqUAz/0b09Va6qDE+8WlhTB65AWRWLlvPJnCyuHSmLOYydm7YVaLn4fKYY+vF60s57c8ttmwVZsOGTe27OEVjdrPkeEW6S5VQPm7TSNKGUmne6sy1jja8yYmxNWZIMg7x909CkVP3l6xBNGDl7+oRK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555329; c=relaxed/simple;
	bh=1CuRtmpb8VEj2j9q83La3hC/CxtkpmssA4kaLk8iY40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbkb01eLySgstET44wN7yq2ZZlZJglG7eeOnDekNUTe/QKuS5bLc6myvQZTEfKZ40W5A670AiS9e1dS9snqvMcXqcE5sMJ8pCh3IhkOrdVZcna8PQhdJ01Iqq0S+SDRYOU6CtxSH4Dj5ofqeuplx+9rIDZW6BgypxzsxhIrOG0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEK8Q9wq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEK8Q9wq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so16594725e9.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787555326; x=1788160126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJfaLrDf5XZY2pXU/P43cPJ1i0a1rovzINLp1pW1sik=;
        b=qEK8Q9wqH1jf8fGsICCW5rWr5gMM3qAv8ymAOaQXUuqJ+K9Zj4zNmWR6geg/QZEq4f
         R8nRODqMJaHOYjSe6sGM212yAfY6j8X/Y2iQaroh8/o9EF6J9R3mB8DSxqe80wYoQRvk
         oOd3MUBvdMSllLeVXBkXYwCCZp1AvfgZ5BCI+ZK+FkGVexGHCHGVxepQIDFO40GEuTVS
         C/aB65ywtPjz+vjxiizmmb1rWsqOjA9ab/BfVA+ExvofO4vltxkITtEsXsxOvgnJf8WU
         mGsv6PVcphOLDAYQOAqDRsQ4ESgRyuAkAgGwGxPylLqCuIgY2T9vHyJWEMvXOgW0iJkW
         rAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555326; x=1788160126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJfaLrDf5XZY2pXU/P43cPJ1i0a1rovzINLp1pW1sik=;
        b=hfVN6hCux2i34960WpOdIkWeMrH9+wkg2peCFUUJ/vt+KGTLMyzrhAVqA7nB5M2x43
         cKIiK6Who+sV1lTFjJj76IO+AgAzEbxN10R+F26i/A1OwMCFmCaO1af6eddG3Gb+kTp+
         vl615Ma0R+XOmPnRmU7qLuBclA3rgY6Gv460t4Yy0NElx3KgqWnmN4IGjjO+gCBQGCIh
         X9NP4Y9ITpJYvTtcWWmUS76ysXoszxaNT2RfjCXsgajk2H0516oeGUvuBmfbDHP3bgfi
         S2viAT0zKzLPeCcSQj063nCZPkuGqVGsejx5VTsYXpDES+FaSatZ/Bo9ZmI/bO/8aiIR
         59gw==
X-Forwarded-Encrypted: i=1; AHgh+RruOhAV8a+YaeMcLmV1tyECiuQ8CdTG2OrCh7JDxalMB8geYSB6w8x2UDAuXK64BI6Ied8Pd0M8mamjzKRS@lists.linux.dev
X-Gm-Message-State: AFuF++kKqqRUgwetJJjq3OlX8RSc/dw0IChuS5OuW60Xchj63Q7KkB36
	PetRzjTx1Sgn5QPfMx4kUkVlXAyMCtdtq8ye5c3r9QN0XmL/KdUvOzvV
X-Gm-Gg: AR+sD12SF5muBLys3OTj8p6bZIaKilHo6GhegCpuPA7EkmOurAr4pAZetFBHvI9kuI4
	yNY1zjtvDbUSxRHobwtrzk8vYSyIVEyoI8H1j3gigpaOsH5fcH0NAX979ufr7kF8pywrBrN8rZS
	q4Lk0hLT+xr1QZVuHGH+WhsBLaeJPbFGmDXhFEGtSaN9WJPXKkQzv9o0+14ynoiS6Q6epVMWIqW
	mulfmfAU7Chz2s/8L6agpjQ4nXkqKSMfd4neR4Ihuz+lqzFFACc5PEsKPcSJIu+7JyZPnokDzIB
	JBzg8AmYbx8E/GuIST5VZnP99bqtndl+JInYKa36DUCVmaBQRat9AEyTtMFXlpr+rhFYIAOz+I5
	NrP8SSalwxsuDFcY1YgKjMBA7cBM/GmhaxBwbEd4Txz/IDQ6whA2QYWcRsaDz/hPe18ii1PoOc+
	ra9itj9hRMY7GyIgQzMHMiqL0AWMqOAil7Sxm6NQbydenGpX3uIp09Qv0u
X-Received: by 2002:a05:600c:638d:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499b8457084mr316416545e9.9.1787555326336;
        Mon, 24 Aug 2026 00:08:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm73590055e9.5.2026.08.24.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:08:45 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:08:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kosugi Souta <k.souta0926@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: add missing newlines in
 sysfs show
Message-ID: <aovt-qw0W4eYYGSa@stanley.mountain>
References: <20260823011424.30697-1-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823011424.30697-1-k.souta0926@gmail.com>

On Sun, Aug 23, 2026 at 10:14:24AM +0900, Kosugi Souta wrote:
> sysfs show functions should terminate output with a trailing
> newline. Add the missing '\n' to the six show functions in
> audio_manager_module.c.
> 
> Compile tested only.
> 
> Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
> ---

For old code, search on lore.kernel.org to see this has already
been discussed.

https://lore.kernel.org/all/?q=gb_audio_module_name_show

regards,
dan carpenter


