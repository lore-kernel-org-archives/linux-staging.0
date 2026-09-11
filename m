Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F754EEAE
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 19:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155403; cv=none; b=cGc+gLPozG5kQy303P2nugG4cH9ZIn8X1z2pkfzHlQ4eZCCTdMn+69T4A7H+nNm5+a1euThFQ+zPUQ/v417Vl2FyT+IplInZRgFva46lAzeSrL/0YdcUps4JPHLc7vRvXq9Hwdzzccd2ZBtYvXcZEzRNtVcXqdlVQ4PQLx76aZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155403; c=relaxed/simple;
	bh=1QNZaSkFmE4tUaovHwbMXXOSGp497lzxUR4sBldDwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNuUrIkp50k/1ZDKcGUCjW9AKCDwGPFmNBtSLQY7+TygU3kM8k7EGpfSwN3DQc/YRhqTmXrwI8jdX+CcSDv40gGqhqmZniu1prSuIlBQESPyQ9ifZE+3Pv3ciLa8Kz4Pm+HVf8BEp+V2vekXL67TaM5s+xegxgrg0k6g8TQzbv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYRuHK6+; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYRuHK6+"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef19aso2546161cf.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155388; x=1789760188; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+/XqoAmOedtSVBSjps/IKUOstu2oAlhhf45OFikfSI=;
        b=JYRuHK6+hu1tKUowidtU0Ow4I/DQdn7BCNjOo5BiYUQUSOTH1d2mTBSgfhb+orysCV
         mxKFG1NUduZq2tfwf+lZ3GvSKzOQozS61ZB5PdDfNOFU0zl8YchTx0Kf9r5ph7lc2RPu
         Be1yvwXG9oWcOkXuDzuT/d4JGZTiBGXTsBkjeDS43TdHvYxEGDMTEFWK8/hEU1XubmHE
         PZXBvDEQQJp5ax9Qf7Ab73tPBuj78b6c7k/WTzvyD21KdnskHIEUwdKag+jcLduI+gfk
         9PTH/A4tYab6R+9GsGAg/pFdYXojbCTRsw8+//L4goECbwnaaGh8yKSop+c3nk6My2FL
         h0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155388; x=1789760188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+/XqoAmOedtSVBSjps/IKUOstu2oAlhhf45OFikfSI=;
        b=Hu2fb7sYb1jl1zrW8QMnUXgnyzWxG0oqBJ0CQg3tqGgXJpJ03sLqa/itELFQJd9Ua+
         EWTvoEEnVTob/xOj9BUksLrwMKzaxJ1gcz4B0AyqZ95Wy5eF22LT9mb/zbuGxjpICzCl
         V+/ib60R2ZFILjG3MQ9S/Lxy1NpPwmFMIWLQ2iWObAtZhsxUm/Uu+4CINZ35M3zYcSqX
         KQw6QBSpsg5QblCB/tYQoHHILhTmvGhldfRBZ2JfZh49VAKtzq2KlTS6qPQm9BOs/o0l
         PaP39b+Halv/QDixurQJ5hAxRsu4IIdCpH7BT8QARpL6ZNFTRT43g7cA7kpn1EOGLEWA
         t8Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzSgmkKz6ydiz6F5NiYXEzHZgv2OYrD2AC6xqPiH16BuQ1KiLova0PV05UfItA1k2J0xxVkfC05WzFJrqZv@lists.linux.dev
X-Gm-Message-State: AFuF++kA4O5vDvrIOlV0NS1c12Et5yJ7zAuqL/esKn9wbfeHRim1xc+9
	XfFfOWlYuEXCIKgEzrShJQdpFGbFrRG+4xMVrM4AYxKyDECOekez4+oa
X-Gm-Gg: AYBFou0cy8tMNGz0cnJas+2+jdBen/GZYAuwHkpFm1o1+3O090oncrBYR0nEhRUCY0F
	eqwZ6UZhG+FoWbvpnOYIP/mJLEr8nQZxHKeF7T02iNvjoBpgddvBXQaKivMeXKQCDPECbE6ofrQ
	/Xy+HH8ofHSHP3q049TYVAubaF7BPVV96lg9HwvKO1g5GhUkcMxidNg/jWkTdOhudbkt22rk81O
	pzokfdIgLjLHY1I2EOWvAMMm7XLr3XspJa+ePEaxsgCAGVQu8CIdJ1u726crEN2EqRsV18e6oVS
	S+ZOUC1LV1e0mXz3TFK9wBLsDC+qpZwZ8jwFeUojdDFNxMNeRhMx8JkJip9aLxqQKT2P43K8qK1
	hezETjfya1k8lyNuFwV6NtgH5n2KZjQT9npL2ufEJjk387XxS7VfthDUC3ji9zdSkejoJTXCruC
	7RxtlwbgPEG8zpjhH5cLBKqKdW31varE5YUEUDkpGNaXMSGuEZc4qCFjQFNIEgm5DtEeU=
X-Received: by 2002:a05:622a:507:b0:527:631:8d6 with SMTP id d75a77b69052e-530c859b38fmr80771521cf.25.1789155388428;
        Fri, 11 Sep 2026 12:36:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4899dasm27027761cf.12.2026.09.11.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:36:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:36:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matthew Zvolsky <matthew-kernel@post.cz>
Cc: gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit
Message-ID: <aqRYNjOCTRBIZtcG@stanley.mountain>
References: <20260911190253.894650-1-matthew-kernel@post.cz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911190253.894650-1-matthew-kernel@post.cz>

On Fri, Sep 11, 2026 at 09:02:53PM +0200, Matthew Zvolsky wrote:
> Add terminating newlines to sysfs_emit format strings to conform with
> kernel sysfs guidelines. Also clean up envp array declaration to be
> static const char * const.
> 
> Signed-off-by: Matthew Zvolsky <matthew-kernel@post.cz>
> ---

This has been discussed before.  Do a search for the function
names on lore.kernel.org.

regards,
dan carpenter

