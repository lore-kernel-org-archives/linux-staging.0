Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B6295DA6
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198054; cv=none; b=t7SOCQzqw8zNn+hp9X/uJwoN7odR0HxakH2YO67630+8tsfaUnXX5LJfP/R+d6eyoxDEwPjq8HvOc15Yg14c5OYBerXJIIvlCChVu0ghtpKFl65qCqsGrBQhaxP+nPXD8OddvZtnFAklhXPMMthxluGdoU1K/vMSkjOv5uS+1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198054; c=relaxed/simple;
	bh=qPonf3AZtatUeCCGzcTzVkMI7OKDgDP2ONlb8EW8HRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjDakUsvFMi+lDopRGYTa0Abmg7S85q5dzYGdkGAWuwh//JOgkwYerWc2hHFtwwEnWfljzJo6IuSNv/G3DYyZL//ZKnqDRgHsR91x1p4JyNhRSGjcWU4xOa1ga1ym4LBJ5nu+A/+ag/SmZJeQWeUEXQEKu3EBLrGy6bnn4UtFCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WnrJEeOb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WnrJEeOb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483100e97d8so3242235e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198053; x=1770802853; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPonf3AZtatUeCCGzcTzVkMI7OKDgDP2ONlb8EW8HRk=;
        b=WnrJEeOb+zMmmoe1Av9dhuQ7KoKtA4JE2eyrDNDetTcvvmXOKXCtpwXUOHWiD45ao7
         NHKGRQtww2hUWDUG6CsQE20ZIO8nofKEmSKgb/MPisz5a9yGsZGzHYIjoXFV6u0ddV3+
         meKtuBEil7MHh25AnZy4/gnHFPMJjrK7SeB42yJcalD4E5jUHTi3QCVmcr0LW3wnfG6y
         o9gYnRPXBAtVrVU6y5gS2IomU19PgGwywWbnKRrEXwAeABIABkPJTyeCocBDaBW+Jgzf
         HWDfgZ372rSfBqUx/JyhFEQf4h14EJu7+/ialjmAaI/goIb0xrbqR8pP9FrCL9uG2iLM
         eTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198053; x=1770802853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPonf3AZtatUeCCGzcTzVkMI7OKDgDP2ONlb8EW8HRk=;
        b=dYifuhU2AkETPSumSi5WIup3KMGmo4rjef6QoIoeeQJ65nk0KuFhC440ZqXhCDUtz+
         qv1CUEq6wc7D1TjM16XFcui9CIuZo45sASj9V6KsebJ5e0liCTiN76tKk6/OTxL/kP8h
         34vUXt7h1cG1ybDW5S15W3C6duI4Fby0XfdKAVuE04k+tMuUGYfKKNFM/JGRMo6mzNAf
         XLFJTfpW9/DogeUN5egv8Q+lt6itky8h1vXjoT2IYRwt3NDmT5Fy1k/byTGJlT/nFbUi
         5ArcR5v5ZZrxvUCiEcpkDOjd8qcUI2B+l6U+hSqMRfyhDjiZKiXWd1q+eyA7Yaet/5ff
         zq3A==
X-Forwarded-Encrypted: i=1; AJvYcCWMFAkfy7EWA6JuNFpxcsGKCD7NEINu0OgpjxYRf4JOXqsmuyrD9dZe10PVevaw/LWJT4+cKJkdfMkcEW66@lists.linux.dev
X-Gm-Message-State: AOJu0YwzAmA4+tTIwZ379lSkMPpRLESaU+HFR98gftvAKfnqDjJjVuyc
	j46GranNAQRFQRuhlOtjN29fOs9N+XmiPhGv1eblA5yPVYvJzf0ZN4dO+7i1NkCpzrQ=
X-Gm-Gg: AZuq6aIUqghDgfzDxqC/drzBup690tyzYBnvvmTbauMsvGXyacDF9tOR6OTK0lJHe6k
	/Ex7DFvMisV6ssHNIexsOFqVYUv/xu2ON8t+MvmpJK2HJa7NcSQzqXbFvJK6SibSYOUzsqbmVD9
	nNwzN7pocoIlcapMm3+Be2CGOs73s8a+5nUUKlhDpO7Vh1KXOsvKxJo8DAK/YNUoc9hnu+17Mfl
	hA2wjabkeQ5r7HH4xkeeWZgR8yiZ3OrqnmIEGmBapRvmWHahNNI2ZZmGOQ+91gOD0bRy3Y3Qgi6
	BYbLpTiC8CYqIffGcb3WuIyYsMYAo0ar+aG36kjHA1hTwO4gAQueU9M38qNUaTO8qYYTZDqMnQs
	qo9L959103qx01SbvlbwPvYPTH187S9BCK4MaD9tQ9FWer4JKan7hUC/HF484og3ikJ59G7Lzkh
	OSoZWqjQRnuBckADAc
X-Received: by 2002:a05:600c:3acd:b0:47f:1a8d:4f30 with SMTP id 5b1f17b1804b1-4830e972198mr30099105e9.26.1770198053051;
        Wed, 04 Feb 2026 01:40:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310919211sm46050275e9.11.2026.02.04.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:40:52 -0800 (PST)
Date: Wed, 4 Feb 2026 12:40:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Fwd: [PATCH v2 1/4] staging: greybus: added comment to mutex
 declaration in fw-management.c
Message-ID: <aYMUIUr2g8JqaaBK@stanley.mountain>
References: <20260203123209.182175-1-rchtdhr@gmail.com>
 <CAJH1ELDtpYQvrG_Rd8-XtTk6Or5yDT_nT3dT_s8UGg-mpnAwWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJH1ELDtpYQvrG_Rd8-XtTk6Or5yDT_nT3dT_s8UGg-mpnAwWQ@mail.gmail.com>

These forwarded patches are corrupted and can't be applied.

regards,
dan carpenter

