Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011393B71BD
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496245; cv=none; b=HH55KDgGrcrQa3h2sVgvMWEqNTJY+xKEN7uaNrLAzTXw8BeoUvt5Ctuvmcx6N+MrxyWluSJiYTi321yRotVwH95kiZ+VSlljV2d55EWPLxtPrDzRXPIAAaXsVznWD93TV/yEWEw2rmgf1OMDA3necN0UcI36+eEja2nCnpvyz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496245; c=relaxed/simple;
	bh=/PTPQshCdr+INc/sRQADOhUiFvt+ECFqnGrgf4S9v8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSTkq9a9ODqOtVSgAFzEcFPFLVVNudcF/NPZPDu/arbhJt2Xiyq+61yevK2FTtuejWsBwXyOiBBjYJXRV9bwXKkUEtGb3tdyi5VLNPTOiuY6rHcZroBpoiwGJ08CmKv4awtPJn1EspUbCz4P4WDdg336vCbcSZvNFoIp2AcMOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLAU7aJx; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLAU7aJx"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so101501666b.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785496242; x=1786101042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+6MH3hCSieKYm3naZlQrmnvkAztvvwieG2fx2yk8DyM=;
        b=BLAU7aJxJdVuBCoo46wfaJsUbgJ8zsij+CVu7xmXyBnKpF7iSPBPfj1giR71JBxsQ0
         bOtAUkucLj1jyKOh8LMP+8RDDrdrE9ihRamVA9ndu4FT873J0y4+zljLfGXplvmT5uo3
         9f9KqZDgwbnVHf1k/AqBpr0+f9QiSOQlPnKBiIdbYzefKN7o3agFiGjqZVHJSA9ibVKN
         QFS1DVVccEKq6lii8HMgEOLt2HQ1ddaFsp2OsM8Cij/9KNMhsyJaeNRO+uJG0/FLHRMC
         4Nr7iGDjyrmcdQjbv6FepTWs53QiuWD+iKT9W+/FBBr56a66uruHVpukAri6jRw0Uib9
         xIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785496242; x=1786101042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6MH3hCSieKYm3naZlQrmnvkAztvvwieG2fx2yk8DyM=;
        b=Fpj0Ac/jZy15yFi72V1m9OoFR8spWhjKIiZ0SFxjfGjd0rTW8Nn9i6c2D2E87UrQoF
         pnFp7oc0y06vfGD1vh5DXkml49/6/9VyA/RivL1cbKPLWB7Pjw6ApplkSPrbPbOOUV4r
         ZebsgWSeQmDQSRcA7whWYy6VkTMg8PMasRZJAB6rACv8CMoZY8eniBDo7mvSmuLmntjX
         OsWCSTbtQPW/YdyL1h1QAp5zI/zEyRnWaT/0HyaZ6rcWCtH9CWmlm7ww6v/IsPlFZtON
         PyGqFKmlGNJvAM7DxeErmXHh1ocpWH14XX9WFCLq6mw1Vh4Lxz7wnugPfEGeOKPSlEF+
         mRRw==
X-Forwarded-Encrypted: i=1; AHgh+RptSyMjs9/DXN+iGp1BW6hJefZwMzC99bBnsw9KDabWCu5G3phaSJo+BUvkYVXf4o9QQlWfU6DaJUwRIHPd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1rtx72uRWwRiJSEoZxudJloM6Fz8yzbp6s1ZdJLaYqEEelomH
	2a9gmaC8vs5uQgEdLJqb2NvYKPbyZq39S3gMPAGA5qjRMMjp2JYjFOQU57GRLlk4/kY=
X-Gm-Gg: AR+sD11v/TnSzXMePRr9WZ3h2zyYVsq5Hd3cPoZp/9mlPjGVcvdo030CTcid2W6Duov
	Yto/LhhmiVkOymHzBXrJOTf09YYpB3eHhOy4gMCE9QcyUMEtKMNHLpfukvz0n1zjFi9Z7h0R8Ni
	Q5Svsx7xwAJNLAmrQ+D+BjSeXhzB1q23drgJN1rwPFZ40KUUmXzYucsTVWgQufsAwsjyX6wwOCk
	1OuE56ktVZPHCBo8GDB7JIOz3giK3m/0FCHqjc7XhY4aJKOchzfYMlioaTVbFEVIig0J2/zs3iZ
	+K4r0ehPiEmKTYrzgeptxsTsZbQddfYc4XRfgbu+jPuEanmcL8IDYz3XWMCez7u5kLGxCQCVGMT
	ovCE1fYVoUZ4KMcZ9I3Huuh2qHWrh/B3HheB/xp3U1UBspD4vAknomM6TAyxXq8KBq9kQyjk1V0
	EKwkssBkH7nIOsSzv5vUPYTVH2iNRMnUedM8MNymA5+Ls6u170xLvVWHfKNvcN9aqJzUM=
X-Received: by 2002:a17:907:801:b0:c1c:4a7d:c501 with SMTP id a640c23a62f3a-c1fd24a91b8mr91840766b.1.1785496242136;
        Fri, 31 Jul 2026 04:10:42 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5a48asm103523566b.11.2026.07.31.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:10:41 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:10:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Jeffrey <luquijeffrey@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] axis-fifo: use size_t for write size calculations
Message-ID: <amyCrccsFE9aWGxn@stanley.mountain>
References: <20260731034307.327377-1-luquijeffrey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731034307.327377-1-luquijeffrey@gmail.com>

On Fri, Jul 31, 2026 at 12:43:07AM -0300, Lucas Jeffrey wrote:
> The write length is provided as size_t, but words_to_write and the
> return value storage used narrower types. Use size_t for the word count
> and ssize_t for the return value to keep the types consistent with the
> write interface.
> 
> This avoids relying on implicit size limits when handling write sizes.
> 
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
> ---

This doesn't affect real life because len is capped in rw_verify_area().

The commit message needs to make it clear that this is just a clean up
and not a fix.  If we pretended that the len value in read/write
functions was an range from 0-ULONG_MAX then we would have a ton of
integer overflow bugs etc.

regards,
dan carpenter

