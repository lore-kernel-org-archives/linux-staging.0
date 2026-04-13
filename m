Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42C83B4EA7
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091538; cv=none; b=hlO22LDC+C9TtuuuLcZ6+Eb96/GQjP/ua0SnsCg5kuVuNI4LQyePxB1zMonPo7Gsgcm/NOe/HpiH/d0K6WyjInjfII8uyxKvl2CjtUAPbEUXSIGlLhOtDG/3WRBzlkC9f8dRe2Zc0QaZz9CmTEBcYxTQvUTZ4/G1ezHFT38v4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091538; c=relaxed/simple;
	bh=kmWyifGeVgfYGBGfDdbKPv9jlbH5T8QcUUNkGM97mxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBLTf4wKmEXednWhc4p7dxi9/Cxutzdy/aZKiNH2777Q24xoZP92RKpVGLFD6IpiusYQt8875yFzwU2JXRHu/JU5MwUeJ4LHjc1sHaX1W4muihseCK/87iD+Ug4crGjjpF2xgO+To6F2lJ45uWCfG+ZRJBlVufxsyoYB8n8P3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg5TPKxC; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg5TPKxC"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d6b9bca48so58769211cf.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776091536; x=1776696336; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ITvn7X7oXZotCVUuTe9jUnIiIMLcznplUJrhWp9sll0=;
        b=Jg5TPKxC0941lZC60Jwxozd7mbm5NSFQANrH2Qzf/TO3flUzpTASiOk45HJeZv1JTI
         lRuWPSFKTbNcTH5zo9+8Ka5WtvPgZ/UzI+AoupTbAxhLiozxDFA+BmsJZCMpqDg0W3Om
         QG/5A/LU/5ViIKdZCnPOE6sFazs9+cL+gbmE5li4zRMx5vKahGKh+ntnmr6HAEX1G+1P
         8vs0L+rOPz39D4B8/iq0lT4A2/F0oYB+A0fUPjX09ulw90sO3JCzp+iwnSJ2iToQMO82
         xMqlu6fcofkzI/qM49eU2/daq0igj3cqa9ls6rn0NziDhXxGA/1+793Y/rzEiFEmGAnv
         +NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091536; x=1776696336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITvn7X7oXZotCVUuTe9jUnIiIMLcznplUJrhWp9sll0=;
        b=p4yA6kLJYmalbQwXVJ3xUjWfRsWZr+UE3wmnV4f1NDFQG2sbCmzEAsRSTWk65Q+qWP
         T0hTu/qO3dpE5Ux5Y2WhPHDZB/rIdcGCBLB87mc1NQRfZGtsGyUltNgPYyZRxlCCTVeo
         mmJn/wEPN2+04MoJlxEbsQd5z9dkJdq+LwF1CYAN4aUqInj/YyQy9MXVA69updfy/DK0
         nRc8tmV4e5KBVO4LPIGd/1GeypzZevUioFXxl1ly0XVR8IgFDRRUuLFHUwDaNKpMkMZI
         YBqu4s2rZ2B0qcKj7pJkugngdUhSmCeABK626MQAvKvUmNWfk/CXucFhcUmUDWWQAVS/
         F98Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IMoY2LYGQlEi+qVLY9BlFrY3YtXQBGDOoKRE/BC55uCjhUwNMltNxN5iRHrSEvsGYNpvo0njzOFLGA2xu@lists.linux.dev
X-Gm-Message-State: AOJu0YxvJ+l4bvhWz64opReKnCdrsSaGuBVoD9VSIpgJi/+q7PvyuHe4
	MvyJw4v8NLk7zO3UMXAOyrA+RH2A2CbPC+Q4yKTh6dGxavBJvR5Q5uF8
X-Gm-Gg: AeBDieui1RTnACqnSPq6IV1xh29jkXqrn5Eav/Pu6pZBNm99/9VOJWxTGYDjvma8Cl1
	FbiEp6kez11epV5Bliee95eOXFveyRu3XJpTI5NP7tZ7CQW8BL6+5PPmBiBj3nC3C5j2CuYatt3
	2Cb3Q+GxjQz9XgYAiRucLOr2Ki0rIpv1vBFJyO0kI3Pt1YfzqZbSQMO1ltDQcNMviN/OxgNL/zj
	7zGTeFhKbnEWKWxlcNzhZhY9ri1lLVpg+RHhlErqPg+X0SGhajjA1/Binw2drYxMv5370lXkNUa
	2MCdNNtXfITOdhC7S6yM6DgsTshmg7taupltdfepofq2WV/gRAd2PPaiNDAJOa4Bs9DHslEPlf5
	GmMYaCjW3Svi5GPAjJkSRzQJU5pEP+RQ/Gh5/LkXzXCBshtuUWYc91pfIB2kSUNbBj5BRfLATpf
	g08S1auBwNg0qiTeFL6HR6/nuU2MDf/Q==
X-Received: by 2002:ac8:5a02:0:b0:50d:8734:ba65 with SMTP id d75a77b69052e-50dd5b95bc8mr221042781cf.11.1776091536454;
        Mon, 13 Apr 2026 07:45:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd5616487sm88973761cf.25.2026.04.13.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:45:35 -0700 (PDT)
Date: Mon, 13 Apr 2026 17:45:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix alignment in
 wait_event_interruptible()
Message-ID: <ad0Bi2roMGSIxYYr@stanley.mountain>
References: <20260413140508.1190800-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413140508.1190800-1-deep@crimson.net.eu.org>

On Mon, Apr 13, 2026 at 04:05:08PM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

No commit message.

> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index aa90b27197cf..9b5b640e53b3 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
> +			words_to_write);

The code was better before.  Just leave it as-is.

regards,
dan carpenter

>  		if (ret)
>  			goto end_unlock;
>  	}

