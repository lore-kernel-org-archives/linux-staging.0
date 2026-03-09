Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BA22759C
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017542; cv=none; b=J1IZUv6F4ITuOUNQe8S4Nppxd2kDndQlZcuACYfS2PLDyBivdVgeyQeD9wjiKWDN0FmATAqcFiQoJbS1jswYeyV4etSg0toBvslhzuKgAki/vRS0/stmKVXl5P2YnipW37wasIpQY0NERt1cI3nOY9xlV0c5qz22j793bpunl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017542; c=relaxed/simple;
	bh=Dx8yu6F8JzuxbhekH2PEWLpWOtUDnCkAB4looUwe8+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3pRhJ4qKrrd5omhiW6VqPDelO9HP8OF6CHta2MnFKOwJXMl7Mlj4ODuwrXt/HWwlZc7YzyDv7QuHk3m3threPnUYAl2Em/L7hk+dkEGpygT9Jcb4dckZcfymcIgpj77iqRokMyogMDJ6H49nZTW230/XVLN8fWMdenNN1u5Cs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLAn4jbs; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLAn4jbs"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3598b2318c2so4382506a91.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 17:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017541; x=1773622341; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3onFf2IHRSd+Ozx82qWpThX8YfZTUd5v5uICFYE2ibM=;
        b=TLAn4jbs4WyOQbwGLk2x+q1mxD86qFM7GBiB2BmFj6FeCorIjZBJE0c6KV6j+Vex+e
         QoMhF9NdsYi8CF3gJDTEynEPdjcOKfBrrlqX9/gv3b1XMuqd2iV29ChRdWBxLpJwp88n
         v95lwQTfiSdBgvEyLoF8sM131Mjoai5tbp1oooZrlUeI6GSnOOkE6PETAdI2UqvUXN9U
         cAUE1kUnvVz3kCqYlhfD3YhVpWA7YQ2gEDbVwFqJsAPP8U7RRXQVVB7hTpdRbHtMPyHs
         FXq+T3JoBuDaaPbO5uJKCdWFVqmrQct0qtBYrJ7RUfTQO9QfEzadtvRMAykeA126V7o2
         GMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017541; x=1773622341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3onFf2IHRSd+Ozx82qWpThX8YfZTUd5v5uICFYE2ibM=;
        b=miEwFedUB6nDGKw8hn4RaRbooVw6+tjzLvo5ZFP77oYodVP0tie9wmO6meeQuvrj5I
         mcI/UdJ4Eniy6aRFNQY+1E2tVtLDYTjL92EaPpHZiLXqFRTj0339E6OuPMlURzR7Fc5Y
         0S3pupEmntnZ2J6/lTx7O2k9oWBTDOY60oMjtP3edRX6YNKR0ihSpazOCZQu3yWZUPlW
         UtngcepYOzDU+5brCjM3deQSh3cTN6KxUdwu8N4BHhcL8J/Z+U1hduB59um0Vj3AdA1B
         zzchcpSfAEqNHiNkZ/7U2vPFcHJ67g8HJY9jQbeVAUdxzkvyShlV7Qr74leORDwP1ZrS
         XeVg==
X-Forwarded-Encrypted: i=1; AJvYcCXqM1QKfoTkQF+ATovXlff9Brh4jMfW+Z/Ycog99C5xX7aC/bsHAN7GqIHraL7iDEtZEFzbAFJqJn6FR5HI@lists.linux.dev
X-Gm-Message-State: AOJu0YzRLnBa8LnE8CmbhNDtvzBj3Zry6+/t7MQDx2vjx0I9W+X/3/k0
	Coj0z3fwBF12Nyr1C71P9EM/2VPB47A5hTQZ+VQx7EYhRh974NCB7SsK
X-Gm-Gg: ATEYQzxdVe/678O7xum6s5MJ0ggyIToyuM714hFc3NNn2ZSABSbdLoF/pLJSVOzs2Gs
	cpWAxZcDYCQZ15JUkP3BVO6+fI7L5MuVOFdTPeVlCsnlSkWCcqsc/bXasRiF3Qiuw9akwJ2mDou
	9U1pyNZC47O77vhOIPR/a2ZF3BwEkSkqXlNriXODKhvENmmHTbCkOcwxIxTZD1eSwE4zqqJeBSd
	TXTyVYwl1ffOYdnCE5/nPOMDQM247mcxrhcgOgReCNREyozKlHdl2E6zK2P8aE7bbu8RzcPl3hW
	WgQpKhbtfcQYU1ASeB/sG5na/bCkzJWXxUW3z+mE9vOBFYRGNJbZwptd72G7c0i9YCVa/jboJXX
	wDgqU2MfsiUyPzPZiTjHaEVznSSLpJHon5WTJ/MrVKBvzGzwbK9fB4wyHMCzhDIlayA4IuDoXHJ
	21zZGpEU9IFHSigAnLQx5yLLXvjlV8e7yBOQchw7ABPe/L8g99q/uvwJRpzgJd+t5K6giXRLJXJ
	Zc5aG0JoLlX6WvK2QeQ233fIluaUQ==
X-Received: by 2002:a17:90b:52c7:b0:359:8f4b:6ed5 with SMTP id 98e67ed59e1d1-359be2e3d75mr8190570a91.15.1773017540956;
        Sun, 08 Mar 2026 17:52:20 -0700 (PDT)
Received: from localhost (static-103-70-166-143.unpl.net. [103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcb2abecsm3335567a91.9.2026.03.08.17.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:52:20 -0700 (PDT)
Date: Mon, 9 Mar 2026 06:22:16 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Bera =?utf-8?B?WcO8emzDvA==?= <b9788213@gmail.com>
Cc: benjaminpotron@gmail.com, daniel.baluta@nxp.com, 
	gregkh@linuxfoundation.org, karanja99erick@gmail.com, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, simona.toaca@nxp.com
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces
Message-ID: <aa4YuXUNJkwjChnm@kforge-fedora>
References: <20260308031704.4907-1-krishnagopi487@gmail.com>
 <20260308114001.1215-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308114001.1215-2-b9788213@gmail.com>

Hi Bera,
Thanks a lot for sharing the post on making a v2. Will make sure to follow the 
guidelines as specified by Dan in the in future patches.

Thanks,
Gopi Krishna Menon

On Sun, Mar 08, 2026 at 02:40:02PM +0300, Bera Yüzlü wrote:

> Next time send your V2 as a new thread and after --- use version tags.
> Look at this resource on how to make a v2:
> 
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> 
> Thanks,
> Bera
