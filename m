Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E171F4631
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346123; cv=none; b=Iz2AzJ+2QIZwp0nsNLcO18qLsKPylg8ePVqW6MStG0iQC4ds066YZp22Yb2iLpSL5C4i38Ea7Ly92m4voZOWkmfQ7E9OSNixy8qUx8sLqD27OU/tW+diQ6FjHXd6mViYUMUHdV1T6O5jE0HgHhhmSoqu2SidqrnlqT2jMLrj+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346123; c=relaxed/simple;
	bh=lZM5ojKOgHOEV14znvHqWXs4UTvSpe+irnlflzaJCdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4f6UTGpg0DBuCcyVDlFhEd2EaxdezCIjdgIrN2pcLWHZEiukuGTq5RyEs9cWxi0O7ft0px64Rbtb+ZzmlNCnqWU5vGx2bw6GR5DlvjQ3ok0ja574/mPLX5QVHZiiLJ6NbHAVjztLMkzp7zR0d7CrKh54aO/uO5g5sQbzH1iekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEBJ472W; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEBJ472W"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so13906435e9.0
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346120; x=1787950920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kYJ1rKhGzHKjAvQGDOjcwLDSSX6jPaIZ26u1Z7Y2lHQ=;
        b=PEBJ472W3Siag3lpya0hIHE7d2om1Ube8Cn48P8F1+hUBoUeC3onf+iQl08wQ1Ed2l
         TotoBGc5JCYedWczAg/VYjt2t0k8rRnkj5hSU/4mfRrrob3EwKR5VPztevXYrRTk3AJz
         RcC9GA/GgNOzLNRo2PqGXVoxVodMoi14nZdJTnnSSQU2Jr3G3TFEhjCFDPN/AzUNXXbt
         frKY8Ru/NQeWkfawb2ClONRJPTzjb2AynTVSaUPxvxLThutpJ+D/mWpe8TYoKwa2H4/e
         x23CQ5CL2hzGI9lYsn84fHCt0GomPSAJt1jyqhfW/y69LXUX0faEOhjLXG5pirVc8Hjp
         /muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346120; x=1787950920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYJ1rKhGzHKjAvQGDOjcwLDSSX6jPaIZ26u1Z7Y2lHQ=;
        b=Ein4rjanxw56eC0EehHA/cbEgRmVtxttpV/PNRnFBUMlTSNReZD27s8KhSv5+uKvQL
         JpMI7OWD1A0U8YmJYdaGMyQZCBSrhOzrW0+5lJEQyQM3ZYCq23MbTaveNLomXc6cSG6v
         7c77dLd3QM1XZj3qHAb9hrQQmmWLGLRDq1dmzQWAE10FIZm7H1GlyZ2rx69SesY5KWSV
         lSIMalsJs43VyoZQk5NKtFpyKt3/MYX8WPt0QHGXyG1lkzBmH6NLXJpafuwkaUk3vmTN
         IfvYWDmPMbntD/iTHbGxNtxFiK6j3Jom2RrulykZX/rj73EiwbguHdLM5J3Brc2OKOEX
         OYcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrs8kUNn28mgKIqE1VAgZliM6wNJANAhFQtRdStyf2t42+YxSomMqN7UonMNxHEY7KzV4hfSo5CP6DPZGIt@lists.linux.dev
X-Gm-Message-State: AFuF++kFwZT6ry6kXAynTIwMfPLyIKN2QTUxImHDZTL9/AG3YzS5zzqQ
	KLIXZx3vHXBm5+SfTImpPwvhamXZ+ftzqL4lQn7KQ2DjgaRXGjnRX7A4
X-Gm-Gg: AR+sD11ItTlwu4L2Piqngv0ZvOIpocJy1gdWUAbxAnfDino9v83BSQwlErCO5tfZpV1
	dCyQopuU3c7+aM/e7pkKW3TavdQSwD2q2HFi3X1FBbzv/1x8b+R+W4mJw6x6dZH8jmbRAAR0Jxm
	VjrNRC14eTSzhGpUUWCjWrOe26B9INLu+hFd8ZJxOr8SaYnuW4booFd3DHHeZ8SvzXUfhNldp3V
	0aavxNKZYaqI4gif8T/ZUVIyocW8w+gQKdudFnskjz+pbeRNGylOYbHTH1OpvrLyWeUkt4xl0u8
	CTCXxbjA2qLcXcdZciGhVp+to9cc0QbTDuxOoF5HYfCHlSY6KoFG0+CXvsfLOIGwqXih+Yf7eKW
	6vlrHLmSCX/OYQ1K9ItQvqe/H7LVwxHSckgJO5Av/kJCR9SR1S0BEqsE99wALI3pbInQflERzcn
	aC0IJvUzNr9ABk2YTIaqmTyMoAshAfrfatsuscW8TCqGRitBJPRj70uAlZ
X-Received: by 2002:a05:600d:4452:20b0:499:7219:122f with SMTP id 5b1f17b1804b1-499c19a351amr11715265e9.4.1787346120519;
        Fri, 21 Aug 2026 14:02:00 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd8d9sm69400f8f.20.2026.08.21.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:01:59 -0700 (PDT)
Date: Sat, 22 Aug 2026 00:01:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kaden Vaughn <sciproj486@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re:
Message-ID: <aoi8w92XIcpCqGTP@stanley.mountain>
References: <20260821205741.141120-1-sciproj486@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821205741.141120-1-sciproj486@gmail.com>

Something went badly wrong...  Try sending it to yourself first
and applying it to a clean tree with `cat raw_email.txt | git am`

One of the rules is that you're not supposed to resend a patch multiple
times on the same day.  Slow down a bit please.

regards,
dan carpenter

