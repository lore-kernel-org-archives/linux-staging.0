Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97335A398
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434280; cv=none; b=UWGawZkGcYzHiMzkJ2UMz4UgaNl1I57grtElvuhJv8K4QBj5rubTctkRwTdMgZPUbmj5NjbkeUYfqfrNiUea2btD3Qgv1q+nSKKHn+HzYdfeODuCq3SEA3GGCihN40iYifEtfT0PMbn/2g4fPJqSOQKVHoBrVVFObs/r+8EJvGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434280; c=relaxed/simple;
	bh=wyeh1XSJh4tRQ2LpSSG5cKTe7u2vVvylVxat4xVNCjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npmFKANqdjQW6Ke2FdIMtLlau7Arl7J5MJk2R92p0yErwZypnXeFDhlYSTH1B9Q4OU9yD9Gc5S37/PZMPqi5BWvL5ciD2gQzFC7UPBMo00IMoEjyFcDXtwXcm0UM5a62zgY9823I+awfRRhUJVJSb0RDjVv6KDvPO+rSyL5ACek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rf5c7rAx; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rf5c7rAx"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a877510541so3710039e87.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778434278; x=1779039078; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/XteHeEvejsGki8NzLujfn4x60WyvAJFtk2JpcsECxI=;
        b=rf5c7rAxCU+wrqgm0p3QkZctxgSwJf42PstZoxmjm2KulO/VSZna6FhffCu7nxct2Q
         094xn8Z/zsWOJHcOUEP5Y363PlaMupnwWsqqDKr8IoZJclQIUma857YgOLiWBxcIOcGo
         gX9gGitsIKx5cPLzkKflGNbvAybst82a4UfgF1iuShvChYkjjKtu4Y64FgnQt915sofv
         2gK1mj2rZm23jfAHoYSMrvjW+cT36CizGAVVlR9lAzQFfidgiAeAcspTzv61enFpU3hE
         c3dcV3wgi/a613XK2hAztWBM5k3xxT57OH1HU/bgM65ZV4w5435GZwlDXd2PYQB2xfDY
         KHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778434278; x=1779039078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XteHeEvejsGki8NzLujfn4x60WyvAJFtk2JpcsECxI=;
        b=YKQkLQjZQkR2qSPFABo84497mGUCRoFB5dxs7bCvf9Bc9CeOUUIcj6U0xbzMGpruwo
         4x9dEz947ZFd8umZPio8WXW9ekPnSOmWQWJWcQERaWD0BESTj5yhjB4gz87/lWU3r4ss
         FWYolmxzyRWrUS4AQEQNOcKU4tOoLYn5qpGSoU/9h/6ajxjhsbrdxfz4rEI467dn8t7C
         SjDXNFqN682mXdO+VtFzM7MubfcaDGYJPFhFLr0FjcEBC381FTGc1LJbdOmNx72OVmPW
         1HGp8EoMkZaKaMBFSgeu9AJp3jMjQan1dqeO+KM3LZprzqGZsKQVVurygh02qHSZ4oyz
         kMAg==
X-Forwarded-Encrypted: i=1; AFNElJ/jkyszL705KQROSXm9aG8j3Gj2YgEJe+x9EQgzVyQpgqaR5zQspv3XvFDpshEElAKxZwPjDjcB8xdj8h4k@lists.linux.dev
X-Gm-Message-State: AOJu0YwctQt5K9SAviAiCb7dhJXY2/0ufylAS7YnyjVSiM0XdjGsWF/J
	Bzc5OP1d9Ltmtn7561mO01eNDo4ey+yiITiXbUXbdS+dtSFxvuQu267I
X-Gm-Gg: Acq92OH1sJg3vyr7YaWVThcaSNQKvx7miQ/xZvBnLtgDMiEP7EMAwTMgK+eKuLBxloX
	jfa9Xy7NG2o9jVZmxtwzzj1wMHh978ZPZT4xlAGk3g5xKwp19egdmwjmU3dJybXo1Gz9Lr4bf9E
	oR1rXwAFHZsWMGjiGz98MJ8xnNon2RmJYwnH6e9MNpfv/BnmWxkGZNbCOLC44t0hmTlFVEJoCfK
	/ggEUugG8iroAbFPEhxaZkIDDHwlwq2gpxciztwz39iYJqtOhiOANIMowg79bgXxDGTjcIwfEYr
	nJXRnyIiwA4nmoP6AiQhD0/0RKCZSiqG5aXb6tB8Kalf8UMYLxdjncaAJ7cLA9DomPBYf3CAuTl
	i6kT0vZiW7pOEbcbIB1SVPEbgLmNKSIqxvwPiJfC8qqDUEGtfdVE1zvk0mzdZV2wCWlYBSJ27Gl
	u1ZxFUPWqwTPQl9jXh56DVDcmPwJH70+1lpoM=
X-Received: by 2002:ac2:4f03:0:b0:5a4:1687:a32 with SMTP id 2adb3069b0e04-5a887ce7df9mr7722148e87.33.1778434277414;
        Sun, 10 May 2026 10:31:17 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfa8sm2059062e87.41.2026.05.10.10.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:31:17 -0700 (PDT)
Date: Sun, 10 May 2026 20:31:14 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Shivam Gupta <shivgupta751157@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces
Message-ID: <agDA4pioLL7AAsBk@archlinux>
References: <20260507175218.16831-1-shivgupta751157@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507175218.16831-1-shivgupta751157@gmail.com>

On Thu, May 07, 2026 at 11:22:18PM +0530, Shivam Gupta wrote:
> Remove unnecessary braces around a single statement block
> reported by checkpatch.
> 
> Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Thanks,
Nikolay
