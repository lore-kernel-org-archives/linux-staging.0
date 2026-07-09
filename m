Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D053F1650
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596139; cv=none; b=RbTbgt8eGLO0jZWd80bEALK//XH8L4q1PuvulUJ7V+QvSgT6vaucAqyY+PC82tMscJd7luFN70rrN6OnhlX7GK2B3eCyGY7vzBpx8fySuBgQjnCwykz7QGodrJO5OwKXlvqLTbP2XBMHp8jZxowMPy3f7XjhbnAGbhS6lbh2pAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596139; c=relaxed/simple;
	bh=F51qepsmIqkYSW+u/nRZULsZ0h4Hxz/pFc8lKtp3m/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKX735puWZt/gocUsNIL8GOHj+wKzJQ9jMrUIaoJS+LOJqAOsmJINpkoy1rkdPVBJFroiYFuVy6u2ssZxjzlyG3Eu7bANkm/ysYc1adrGMkacz698Af0TPe5wTh/YdJRWeqCChlDBF2yA1+mP3gDf0Ze4jdVZuhnKgw3BhfuNiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1jJMJtC; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1jJMJtC"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9fa42f08cso1285781a34.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783596137; x=1784200937; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L97oa22rqRYQnN2lA0gHFbJaDXfbrCyHzvc6NqNE0LU=;
        b=f1jJMJtCP3Zd4uolQ0EmtAYhAF0bjxwuJM6qIoFtZKeHh+Z9BMj7mq1VagqsbaD+j5
         87g5uJ8DvbB1If+6BMsY13oJR9+ycjSaAOxR554Uy8Pdorhmm6LNJVtV2VJVlgcu3d2c
         0BSVe6r7nAe4Yl9mNyH+ccnhybAHVBo2adZ7JNsWiLcDY7eZZ78GA+KU2R0J/tphR7/c
         LSvB+X2sk1u6imdtXz6wimkMG1wccsStLv3t9jqwquUEftSH29M2vfE3Eb13wkx7VQxZ
         M8aCaEmPZ4EVJPppwAwuFBk05ZtLgwzGPBtYaGiaw8jd6NOgO69X0JdeXQvQMVh92VJN
         /tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596137; x=1784200937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L97oa22rqRYQnN2lA0gHFbJaDXfbrCyHzvc6NqNE0LU=;
        b=dsLeRgdd6uwdxUQOG5tVhoXKxdFXHznUNMTPAp2RbfD5e34BtBc2lrvb6aalVaRdE/
         D9sGHcWTH7NUeDPU7ND8kF5VsIltIM9Mi3s8npGVm7MxxE3m8Ucbty5ldaHAQnP+iO12
         NEgZdcwp9B4mEB5sE66UmDlPxs3udktKbt5wMoYb7Vs5m5QkdpSgld4dq0qSEw31yYBc
         Z72EQrVcW3LYR9iYP7Hx5/jT7A58N+tj/Ufc99ygXgLUmc6yNmb89DsHzcgPvY2ssQ/w
         I27aAFWIX4jIYC91QTRbtPTYALe4OhlaH/4i+Np+/rgSJrCe9R0whWRBvVuuJ4ia91p/
         zObQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nsxscIQCGNp6jJygg+CJD3SFvl0q9LGgRsde+tiACTP7UekuMZnRzoImuOl+qG/JiohcF4TNQLdL8YFjR@lists.linux.dev
X-Gm-Message-State: AOJu0YyvMr0QtmmMy0qUEPLl/yoGvFHGX+VkKsYMj3xcNB1mIP0nRK5A
	H58Re1DoWbWcIKWmXbrrZQGpYk/XEKWjD6PWTYJaaEqL4VXF/nZrYaqxAaFXf85cmrY=
X-Gm-Gg: AfdE7cllOwZTzf5tJnDsP/FukmOUImw+DpCRSk/AMZsxEuWcIOkg2UBl2rjtJ/7/Dea
	4aT1QcfBNVd1NjwD0Ea0v0s7NHaYQBFY4yFEpmlTyz8BQgVBtLfK7LgPCDxp0OD/dYmXWpevJcm
	69PpI2KT/HPJFQAgEX+0VH7emsEHGovLlh/UOTZBfaAf+fiTxx4TTEtml2u921jCuq6SzOGS06L
	3R/meDvdl/HXVGYPwF6GvQP8RG28cDlHN4Smj+mFNTKeWrwJZHAcK8guBeDXo+gp6X9jk+jskc9
	ODKbyO0puuyjj2vWJLUYdaGhb7wg6N6Een+U67O3zmxmLOZnUnFBJ9lWPvqbGNruKb6osuC4/YK
	uYtUNXIagDhveZ/6ei0c3Mmzguyb1RwD0rTk0SechvxXMAW2F7RV68oWLGkN8btxMbDnRFRDrDB
	Yftyv0
X-Received: by 2002:a05:6830:4c15:b0:7e9:b34c:ce3d with SMTP id 46e09a7af769-7ebcff78d91mr4953408a34.18.1783596137021;
        Thu, 09 Jul 2026 04:22:17 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae177c5sm3984476a34.5.2026.07.09.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:22:16 -0700 (PDT)
Date: Thu, 9 Jul 2026 14:22:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aditya Tipre <tipreaditya@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove else after return in
 enqueue_reorder_recvframe
Message-ID: <ak-EYb0-7UlD2Twc@stanley.mountain>
References: <20260709040419.216324-1-tipreaditya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709040419.216324-1-tipreaditya@gmail.com>

On Thu, Jul 09, 2026 at 12:03:48AM -0400, Aditya Tipre wrote:
> The duplicate-frame path returns immediately, so the following else is
> unnecessary.

What?  Also no.  It's necessary.  Checkpatch is just a simple perl script.
Use this as an opportunity to learn to be critical of your tools.  ;)

regards,
dan carpenter

