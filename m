Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03045D5C4
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150509; cv=none; b=d9KLwAO5GbPh/1VzXYlOGFsMlRtaNheIVAt7c7QEM02z6dx40SOMJl1p8fOzWMtQeK8T3bre16K+RLqbmBAKVG24YbdhTwfn50I4WmKTGZexIjlEaJ1mF5jxJ6juR4Oo+ARZ2q544cUyTy5vOsJv0oy8wxZShWMIL7+xEKS6wxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150509; c=relaxed/simple;
	bh=CA4XKi0Cd6YgI13rxF8FR/gNyyNEOMYqWRuRazHMyaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tj2HA9eV8RwP5ZoetvK1uwkILFpD9Q1dVeb/athLUb82ZwXZkr3a8kMKbMEOs6foM9JoJT/M2PjAMtRiVcXdOp3zCHKn6i2O/s4sxDsEWV7VQCROvnXVlAzw3o6RzbuYpwzoLD04ZZjS6MbEOEU/0STo8NWWJ1RG+RQgeNhcVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY3rVKAK; arc=none smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY3rVKAK"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so79943366b.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790150506; x=1790755306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIsED9qvHGygDRbseLLF7eMBztpFKvOOESnk1D0m6Q8=;
        b=aY3rVKAKz2ZaBInsCDA708tjxBuf6PaELj8GQ7vXImSAyEkY+S3niCqV9rjnJEcUos
         XJ0MuFByHRlWo2bvoY+VQNXn5PnAKr010uh/7C9zo0qT0OL3A7SMT+IdZxxwv41CoJiv
         680/zbaSehSq6xZ/DZbpiKrWlfmv/QOdKVCqD89K20LiHLjW+JXrWs7THouwsGScKBhC
         fvK0lnLB1pKBzk9Ad1+VeDB2pP1lBEpHboDzciC69wbwlwPX9+CidB3/Wouyky3BiSJb
         0JmhDtSbUrmx9QSH2P6lBbLnlafeADQ8eoz/GNq6laN3XXBv5WGIg2mFoBGh/bkzn89P
         u3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150506; x=1790755306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIsED9qvHGygDRbseLLF7eMBztpFKvOOESnk1D0m6Q8=;
        b=2f/XRydbLD/UZlNejcwPPW8Ij+cERzPGeB6C9qQbvwqnDEIAi/u27FKxN729lzfcQF
         35fyKhcskTrwY0JKGVIQ4f9SWlIZRPYB2h/jUH9XOcFF8EuxlVi4ayoGres7VaaKKbW2
         hckhw42zs9C2+6aeDi3uytcj9LOjEUXgU5QU9xZhSo5BWRWRg7OSUQXf2IAR81kJg7Jx
         6co1iQE3kRKb35UWEi87vKgMWzEAac/TMBSfSpeXrpfZecD4XpH9H1J/2+At3qHgwYG5
         EZTfhSaJqmUX0yp8bdSOZiGfoFEKIIePQr/hkgHeM1R3RuUVChV0Ge+UaJnggl/dc6qo
         PqrA==
X-Forwarded-Encrypted: i=1; AKwUvBxPK7/fl1JxQO0/m4MRclDkdunt3E/QZ1guiIPG+s4tLC/Ue2STmq1S5LGmskYbUoEn6yRIBw1XKhgn93MZ@lists.linux.dev
X-Gm-Message-State: AFuF++nAvzSlghfjIiDcQlzDH0quqPb4+cHhY60/tEdcP1PdVJF0vShN
	5qE8/cqsCWUUmAD5O0ZcZDuYJuBUbCmKJ+UnsM2fv/Cc+tL2znnH4ZTB
X-Gm-Gg: AYBFou0MHi6W4p9R3NN8YQmsvQwTKyKte/+aBsyMkSKhwHStL6HgUz3BHKs9iCqkxx5
	0kXWAAqyPw1kV2KGlQsIom4eDMgGH0GaMRXXjjjtRMYU0V6ndY+yY6H9c9k3E60WXC3eQL0js53
	ik2KOEYuE5vTZRlzhwWi6+mewigPuf44aQhQ2mvUPqfwFPpNPP1srMSvxgZiBH0GuoggNZkRFgw
	ZT0SRcJAv/h/CrNUzMs5fOSCv/hUQEHyK4pmT0AWksT983R3XdexeQtYLaefm55eppYOLzfaH99
	10ztfByMbOr0Brn7DwqZlQnpvof20tK5tolSDHUAUrDVZ/8ksij4zxBJYjNWX7g2wBrivsZdNbH
	7Skpix114j03pmdDr0oVfP3Wq3+mQpEzvpO6BMYvIwIcKstnUKR376QeKh1vwdkU/atQ9ZZA/jM
	7kuqs+M0SA2nQjIUeE3DE6ExK6Oce8nbiWqGZnDPVmlcQVnlcVswfcyc6iTY4f12ebVzM=
X-Received: by 2002:a17:907:d408:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c2aae140494mr127071166b.49.1790150506122;
        Wed, 23 Sep 2026 01:01:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6d2defsm62414266b.56.2026.09.23.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:01:45 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:01:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: avoid snprintf truncation in audio
 topology
Message-ID: <arOHZcAocfvxCJP3@stanley.mountain>
References: <20260923023405.41700-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923023405.41700-1-hackerowskiy@gmail.com>

On Wed, Sep 23, 2026 at 04:34:05AM +0200, Eduard Zateev wrote:
> Building with W=1 reports format truncation warnings when prefixing
> the Greybus device id to widget and control names.
> 
> The destination buffers are NAME_SIZE bytes, while the copied topology
> names may already take most of that space. Split the operation into
> writing the prefix first and then copying the remaining name into the
> space left in the destination buffer.
> 
> This avoids the -Wformat-truncation warnings while preserving bounded
> string handling.
> 
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---

I hate the -Wformat-truncation warning.  It doesn't really matter for
the kernel.  Dmesg output has always been really grotty and especially
when you actually need it because of a crash then that's when it's
the most jumbled.  Truncating the last couple bytes is not going to
make a crash noticably more difficult to solve.

The fix is to get rid of -Wformat-truncation for kernel builds.

This patch silences the warning but doesn't fix anything and makes
the code less readable.

regards,
dan carpenter

