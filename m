Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDBA44F556
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148876; cv=none; b=ssAzaFmpon3Z4w/cTF2YQR4JWA/EpzAqi3vMnSi6242QfY9vNw0ierFTRFq3xovY2j2EKOTKvwaBiQfuEd4DcaXqc341M1MNZVIWw4Cgk3pq7PhLBTqvyyoNIvX3HSYu08kqZ72tzC6HNFEMMbKpWtV8/pE8oBNM1juziPS7ZRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148876; c=relaxed/simple;
	bh=oxjEu3g1JDs13VRgHPDWh/8ulg6HFNUl6DeNgeFs1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XP7xaPHi60QJ6lOeKnLA9yQk1ck3z4tLIWVxNJxG8MtQF2C/10028yjLbQPtuteBJcCTV0rzMxFfT5Ztn01RqND8v6x1DcX6vUtTamqqiMA526rmBsHYTsx2PfRAM0CmnbMPiZ6pH3aFBV3xuw6i2gIzcC+UD1vHlJd/gEFTs/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPt/gmjD; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPt/gmjD"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aab226e7c8so1114005a12.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148873; x=1790753673; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5uHsM00XwjcAY5oHukw8fi+wOputRr/BzL4BNlEpqM=;
        b=mPt/gmjDsp1oHbD8mBuMTYl6JTv/8AjLnAyIIU9nbCSjbHVqfnV/Y+WlKcV0VaKcTf
         ZalBybiXXJPCzwJoS6PorSJB0EiyYH2pKxRd/7DBNXC8nXBbqium+MZHtDqlOZxZ/RPU
         x/1qHNwsovy3eEPdtyHkAd8A3c7MojE8Kf5TetDk4sbZtjFqzfSDja9phRiC/41spAzP
         tCeIHUWCJfXZnyqzTF6rOR/Dz9CQxq9inH0/uDbzNm7LptTRYMe8P5b+zdewEKIJg27/
         2+acQmOToOzqX12SrVccesIOobE/+V1GF7oTwyx384lZyZAjhlRXnoMDa00ImSwmIago
         IodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148873; x=1790753673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5uHsM00XwjcAY5oHukw8fi+wOputRr/BzL4BNlEpqM=;
        b=eizd+Icui+mZKRp3mSDwDUltAG0bjP68gvuoo99fPWH6PfAgugwXyu3Fxo63WOFRtS
         O6cB/TNzrH9yCJ5UR1XLNP7EXBEG35MSMnLNqlWk2NddOOf/h3geREeAIqPkT44phXmZ
         sZ0SklX0SOV9zXHPGgdA2vOjwechI1airpWaw49g43MaIij+d4+DdX+ABA3ynu3USFtS
         ADh3w2IU4R7dVSpfyPbGPqW5jimzMojCZCxS06I++r1zTJG/VikBq1Z6jlaDTXsMD3jx
         KV89xW31BsR3AeuxZTi992GDoRSbWia7g7jAkrfXVtrNwYgvaxaXnhYLmbnz+wZoWvF4
         mxgA==
X-Forwarded-Encrypted: i=1; AKwUvBz5e6IPWnQ1NV4axa93huD0rCy5XUuXeKPa3mj8XetUz/Bqg3TFjdNwEmZLGXe8di+ofdnl1cmOyPwt3umw@lists.linux.dev
X-Gm-Message-State: AFuF++mtR6Gfee1t8C8l/n9OCC/8T7TojFFPzp0aJo5V5C+roG5B6GmQ
	4bnqZZNlvg0eeGqm4XjEgXaF0igfm4Xxsg0yYUr5fFTpnMoR1KTRNwqH
X-Gm-Gg: AYBFou0rjs/7Ps16IgdLFhIIZgMdplSU/ohtl6ALIoq7XBNdXn389hZegeD0pp6Xl3h
	1bpGmzM7ZABIE4kJSsIgNFrz1+tWDUC7n73n2aYUxS9dmYJGl8isj48xkV+2VpBalA1J3w3V+0u
	9tdtrPzOauVcMie8YX3gAiUzWoFMXUdpUFek5cAx1jRMAP10bhBqpiY3L5uSp4rPIM1XJqP3hpr
	wcBSppfIdQWXsUN8dxdw9UudbVdpMZSbboqySNzw8p+t+rVpRTtNhPl3aKDz5VvUeQVFnRdKolV
	pwLmjfhvkhfEyJqSG4tMyik4rq/B/DtUL2ZZL1K3P48AMGBUiJrBC4rzWpCe3mW8DJXK5BcfVqs
	fUFMvIaZg6bWyyxcByx63PnRL/AAdJibbNUv5uhlr4YpXVSy9cwP4GrEFkOWa0KP9aL7ejA84iV
	Q0Ca2o5U11bgEUxKxmMh73MwFe3mSUMF/jaCEpqsvXP0jJOWLqAADBV5hZolim+Cj6HjQ=
X-Received: by 2002:a05:6402:51d4:b0:6aa:1db:f7f3 with SMTP id 4fb4d7f45d1cf-6aab3b7f6aemr1427318a12.37.1790148872625;
        Wed, 23 Sep 2026 00:34:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3896c88sm970410a12.20.2026.09.23.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:34:31 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:34:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unused variable 'tmp' in
 sw_i2c_wait
Message-ID: <arOBA2jJ7_9a1XMs@stanley.mountain>
References: <20260923013526.12225-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923013526.12225-1-hackerowskiy@gmail.com>

On Wed, Sep 23, 2026 at 03:35:26AM +0200, Eduard Zateev wrote:
> The variable 'tmp' in sw_i2c_wait() is written but never read outside
> the loop, triggering a set-but-not-used warning with W=1. The loop
> itself is a fixed-count busy-wait with no side effects; remove the
> unused variable and keep the empty loop body.
> 
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---

Search the archives to see if someone has sent a patch like this
before.

https://lore.kernel.org/all/abfFn_AET_xAVjji@stanley.mountain/

Compilers often remove empty busy loops so that probably explains
why they added the nonsense code.

We don't want to silence this warning because the code is legitimately
bad and should trigger a warning.  But until someone can test it, then
it's impossible to fix.

regards,
dan carpenter

