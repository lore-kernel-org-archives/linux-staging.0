Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB831F9A3
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 05:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378535; cv=none; b=Fex95oxp++X1ewG+IBkcGOj6tr7E2TnBAs/2QDR7EsUpinPUgJAXisrAsYQfUfxkjZPtKqfTJs8AsODHmhNNRXcMHKnCWntka+ZzLxaH7fSrWJt05rwmPqELWm/KRPCOoko6xyhSZGod/NFyoMt1O3sJZeiwY06Whi51ZwLx56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378535; c=relaxed/simple;
	bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktSBieKNjC773n9c0YLjB25iNsJENb66tipPxR7FCBWLKIs4FBTVBRU9zKZ7UAy0uw/gwGlg612AtJEcY+7TdhIYOAnaiP3/dNFwIv33jZJ4wWNccPYqayIFHRov8ZWVEQQesOrvbsbzmqtzPpjV69p3kR0ndQXfBlJcO958hCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWcE082q; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWcE082q"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bebbc325000so278404166b.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 22:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780378533; x=1780983333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=GWcE082qG63KygR+2Q1ld5VrTeuWtxL+YvpLCuuxDcw7q5OpmwIacGTgpjoBHSt1Mb
         vwEPFi9JFfTw+ANN8qYBj1bJuU+kHyWfsk9+79gHKrdiyRT5gXAsvPYCn1jh14+QyFKA
         muvW+4Jnstp2GjxzitvbUZ+Ww4cYnNVe/a0gRMKbmdt/6ts/b+rkX0tWJlnymNw0iqtJ
         T8S84ulGoWrgH1TifkveWxix7YZf6z6WHjbpJLxwF7kShBupn9XfBvM/XRQNp8j36sce
         nB2no14wiFpySTFbbXKy5oznk5gjD0k+2p/SeM0FroKDJR2WMMrGl159zaUBJbxApXYD
         Dn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780378533; x=1780983333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=qVy3NmIbZVld4ZttCUYabapq/fbH1ETrUhPc2ZIybcwESPdqq9qQp28G+rBSPQTUPJ
         I9AH8DDRyJQSJ8dQQjdzv8mIEwnAmQB6FGcI7i4OQvwV/6uf8HB7OADW+YeyerylsME7
         5P0Bbf/VwVS0Cfu6+gHevVXzLr5qDj9Ld0t5f2dP6EarAcH3Qn29Y457k1/s1xqdZB2o
         +7L0oz27WmHLzDh0ho/n8fPHOQbvw3t48Q507RSmmYP276n5skrU3kNvh/vjVAgnPmTF
         CYdiZWywyp8dpApn35ocdEUqb4WxxcyJLhShw15UbZS7knG+oGHUAN+d0alB1Sb28Gzk
         bM1A==
X-Forwarded-Encrypted: i=1; AFNElJ8qqcn0nq8x8oIhfI+Y4N77G8oo69F0zwNKw9vl6cDVuDOw05PbFqnx83dUEJssTcT2HwR9D8M5w/EbRsZ6@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo7gjvLh2+rnSxmCMhu3QiyK+ybKEUnEe0Yaz9iEBu9+YVc/Yw
	5PfYtXw+wRlyJWAzXHC8sggfKBxb5zPLj4eafD3unGcd/AEYmWW/aTI/
X-Gm-Gg: Acq92OGTx/QalfsQUmNOXPT/Djrb5/fgm1P++dpAyStz6Ybs68o1C0Grx3e1Y8PT1uW
	tBXZX7iA7e/0WUhEXLE+UnpylOdgdvv4Jkx215VKfjNOVaTTKrGQdtljHN+ERtmIX4ZCFfyxpEi
	YPJjh9OEBMdr1fXWr3v0vWMK29SIWYT0eDcBja6w2PfgoOFUaQA7leRQKGUkCpAACB8fnzB2GJb
	DCJTF5hHKUQXGwbKvHpQvsQrdAvzQlrr7VQ7k/gdBnf9P5qS4SIXjEmR4NtR3mWutF9B8uQvLoh
	jjrkt0HJfyz5h5DKZIeSzy9KeKGZ9oxBN3EDytrxDi5gVFXq2UJ5EyrBLxfgo0/3hL1IsIyWTVh
	NAffbZzQ/jCNgb7ZNHKmAmQdloOtHX24UdiV5ZoEddZTYD4OsnGbOUPAWNzzG0W6Nv+VpywRRWM
	YhqP4/N4lHnhcZGEwuy31BEie2I2c4Hg==
X-Received: by 2002:a17:907:9453:b0:bea:5cc7:95a4 with SMTP id a640c23a62f3a-beab03de8a1mr874211166b.0.1780378532899;
        Mon, 01 Jun 2026 22:35:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-becf35ae95asm219726766b.51.2026.06.01.22.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:35:32 -0700 (PDT)
Date: Tue, 2 Jun 2026 08:35:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rtl8723bs: remove unreachable code in
Message-ID: <ah5roP3DbO5zwT2m@stanley.mountain>
References: <20260601150253.69930-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601150253.69930-1-nikolayof23@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

