Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F3326939
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953151; cv=none; b=bLxspIhD+PF2a5SucrdgkM+t11k6JjhRpO3GOOJsaX17MugLoWhgvmlUtQBoFfa0DHkrDqEG++vBWU8fv/G6rBpqGjPEqgQy0JV6B5a9f6i5A9YWM+fUDlCl16R/EfRCChra/S4ujdZsjnABm+MxAl7lzUThh+n21+WgAXLnzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953151; c=relaxed/simple;
	bh=IaK6hicRJgf4hLQwnBQsswAs7T0jA0DVk71K5igSSQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llY/e1FN2/uwOmxDYx5Gy8y9SVpbBv1SqX/fUbV+hTfz2bHbDivWUi2BRc5D93+TkZh0OHY1CrOvSFuoc6qi36o6WUNs33lmWBPQANVhVa98kPvKCEZLsmGN8O7Fh25r7k+4vy+16cxMXqxB7g9xBZJjhGtZ2nZFVTm94C29tbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6Ir0o6F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6Ir0o6F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4908b92904fso5623345e9.0
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953148; x=1780557948; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2G7wzgKJ6uR5/fQCsVOolXJ3mFk7LonEc7nuzSbVRM=;
        b=s6Ir0o6FKHl2klHG9W4awOQ7M1ecKWbFID+sdCMoL1DMxBh1Nv8+n1vGJW2ObL2Q5P
         CEajeU6gTabgOgKoL0+wBg3oqWddKw3QmDWrWHJvtSaEQnJ+pQTIfx9vR+/32Izjp3b6
         bd/19IVPdOUGx6LHntroDDjSKMo//oYrEQvwS81kztk0stvHEMmU7ULgB7Hco8/45yr9
         b00lJEOABgUHd47RasrNI3QHMcoe1w3QI7sS5QZl39KFz38rdspGCVRbpuLl9302KbuF
         Wc6PCtGYmbyl0gnFzf8e316HMwvFC62c+3g+vYcKEJqdluv2K4arHBiIYqfXEXp6rq1h
         I+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953148; x=1780557948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2G7wzgKJ6uR5/fQCsVOolXJ3mFk7LonEc7nuzSbVRM=;
        b=ha2tgk4xZ6L0jMH25UwCdRFt0u9d5if2p1gpbUzXh+qlKatZ/6F98cAaKBbONWN2jJ
         N6QnVdt6knF9OeFAkg4hD13ueIvN2FNS/vLv2BTukGvzVZryasER5VLN5gYBWTSS7ULw
         qBNuJ5XxMVMaqwH01RWKLLCNEwbxDGpt6wGUVscrObhZpf0MxS7PX1DEmfYLZavwnldw
         uZ8syZeK6rIgQU5aNA5JXyICNnCbvs6+7O3QG4HiIHciad5j291OdXGlY15jgT/kHiUR
         R4cmemY9u1JKjVekSAYHivGyVH1/BcHNXqvQoui2AjVIGlacjykwpqHuqkqe5wDfMmw2
         yREA==
X-Forwarded-Encrypted: i=1; AFNElJ/sfu4gx+yGn9QXpxJFGlvu4I6yauCQYQFIyKFQX5Bjb/K7MMWMCYcfHjMC3+j8c8TS4DRpYXJUfIlN5GKb@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ7i2YdD17ZPi5XcaunqUfQEzpWhqOjipC6DZuDZk1QA17+MJZ
	PUVu09EGF+mEQ/hVfD6hP/Z0rXGBhhyZrN+sG7Xu/dJZVeSsToCzgrh6
X-Gm-Gg: Acq92OEj4f5nxEtatouylSCEEvMypxxgkTXfTFxw5RISxZo6Qsd0ChP7zaRzr1Jxz/U
	59qPWd16pQa4ELOJUkgQORqDcNEUPVCRA/7tJWkrYyvKcoumuExj/tJqJ9WkZz4rvkLAiHzMkub
	WjvPwMAgdVLy8Jgt+BAqp1TVj8ViTyCQVXKK8JXBBy82glmRs8YVX8g2MSypY/XixY4BmkjTV9P
	PX8nJM+Pm7zg/fCSBtLTt5L6Pj3c8LOakTIt3bQdhw9OYTNcOzmXLjx0JhdgfwER2f4lO7xDs+o
	ncUTS0ijkKdKMUkn3JZ7vzry/WI7rhsmyTOwROL/DhcqbpHmaKlMTCIA2nWK1yCIx3lzNPTi7UQ
	9bJSLbES4td//Bmbf3EB19Q9yvF1JpIFsKwlZPr7m3ONVtaQ/h1rJn8HwaLoYal7WVsSY8lrPAe
	FZrlFmD8fvfkkGA1LSjqXmqKOGP/KsT9gc/A==
X-Received: by 2002:a05:600c:310c:b0:490:53d3:4753 with SMTP id 5b1f17b1804b1-49053d34968mr347086225e9.31.1779953147895;
        Thu, 28 May 2026 00:25:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49091d55972sm22330825e9.0.2026.05.28.00.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:25:45 -0700 (PDT)
Date: Thu, 28 May 2026 10:25:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bastien Cossette <bastiencossette29@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary NULL check
 before vfree
Message-ID: <ahft9q0iN8LI5q0e@stanley.mountain>
References: <20260528070554.40315-1-bastiencossette29@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528070554.40315-1-bastiencossette29@icloud.com>

On Thu, May 28, 2026 at 03:05:54AM -0400, Bastien Cossette wrote:
> The vfree() function handles NULL pointers natively. Cleaning up the
> redundant if check simplifies the code and adheres to core kernel
> coding styles.
> 
> Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
> ---

Please read my review comments to earlier patches.
Please wait a day between resends.

regards,
dan carpenter

