Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9AC30AAA6
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220627; cv=none; b=ZNSfsal9Gf5McnqNO32uGZAodfTw8gi503I47c6IyNN9BcU5hSTfP27aW1DmQysf5QzhPhCTuUi5fVCqaZB25k5WkkGw081OtFfjYS3fvFCSFDlYAlqJqVVGnw0GGJN0haQYoatzLwZsDdbUOgY6DO/tkeSVwHGCkPSYxie2Kds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220627; c=relaxed/simple;
	bh=yHyj608976wab40x3rsluhL1qNNC39+L2MUtVW1iYSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gz6qNc39pTEiSspKoeaQ8BnetMH3zFnKPD7zc2mIIZHh1AXcAOj4pZ3AnEBFiESyfyrbGufHyFGntr+wFdRtfS8eJnHFtrGdE/Jphml+TCol2yMPwP1K1KjlM/ZCNVffshfhJTUF23GXSq5PRxGCIZXW3UsqqdJmWKUEZ/X3HwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUTNTVN3; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUTNTVN3"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso1207190a12.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 06:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220624; x=1782825424; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cC6Cq8bC4aGlsoHvL3LiTDVV50IQJG1ncLB50xy/GWk=;
        b=SUTNTVN3EWhUtTUdI98cyZSo4qbIk6ntLUuKVt6JoEHzGApCF50hvhzDpeg9AHIx6x
         DTomNiO+V6Rw2HzbtOIzoAk0MpXle05tHzz7UgynkSCblXJTkFUiiWilMFeHzYCRbE9v
         MVi+PGS4ojmBeB8sUyTukuK9qF1rCtiKBwvsmGTrgC4FeUCOdfd4H9LY1M6kB/zxzBwz
         iTUZr3wroKQSrx4ZDPLDj9WQ4C6G7HJasEv3G2+6Rb1916pSe/VSn5BW+mVMxXJvls4k
         Rw51MQUJ05BSONkvPvPfWgG6eiRyBcsaXXVNhYwvxkhTqzYfEYk3bmTV24ZyI8ljPybc
         JdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220624; x=1782825424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC6Cq8bC4aGlsoHvL3LiTDVV50IQJG1ncLB50xy/GWk=;
        b=lYrzThY3wV4hE0LJAAyJVsifqCv7oMX6Z012L7VWBN68rgTZc9I2+4yah7Wtku83ta
         4mF9TfWUfv1I9X/KocgfJuXf5jjpnOrPZGqUgT+4tLzwR2m6pI5PUrs5N59Zk5DVDJcv
         zcldVWTLYAdEpeKkhZ3MpQpr63b9MtCgBWY1nOtqBOzGszzCs3BJNur3rNMYAwUUPQ5x
         qCU6rc15dUnQKpoBXwXuohJNQiksSMWUlT8vcABTQ47vyLx/9vTI3r+qBUhm4UYKZoIN
         98VWU6beYSO3BGrVwkZMVQj/yFpeY80exD/qCpSY8OH67EoTHfkA04sDKyADCw8udSuK
         zFwA==
X-Forwarded-Encrypted: i=1; AFNElJ+X/RbMMbjF13njC9BfeH8qyPXomhMWVzYECySJ02iRNGq8pqKAROr7iiKt2C7nggQv9fdVg90kvW5D1m0v@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9yARRWQYFb0r91sfYKIs7336S/tCbgHnxBUt1F87YmNAJRiRx
	0jKUblBSsd8DKo8OzjJ6sV4BVVQK/H3biSU8XGwhozrNYvLgQSxuOJc4
X-Gm-Gg: AfdE7cnCjUGc03VB17MuB680RBjrolrNWAiAbdaDwD6WP780ZfkeIY13cibXQ0rf6Ds
	W2Pd39wxSBSmOFVfPH/b2TMXI64YKiup2bar8aJl6sh01BfuJrywcJHIGzJAtk3r9XAwPHlgRnQ
	fNQ0II+kRrMB32bA6xQAr677+xAIVCyf3W2ug4V2UNu8IghtLUkFsYusCiZy27sZyZKX/7d2oVq
	SgEmh5+ZlibfOtGn3cqfa0MVwX3V2U13kZ6l5oI+jFisB7ZYZiaZdvBA426eqXZVxZTZQ5FbDjO
	EbJvpF9xIb+o8hgKMvsVQlGOlG4KGZO/QaRP7ZJROC/vSonrEgd+wLQ89oETQAdiNaCE4XvdELD
	2kYvt+UwtRA6euyfNFqe1k2u34UBPLGcgwIuyPrGc7h5vi/LQ/mh7vlzwM7P4BwHk/WgjBG3S4B
	D7MvSKAVMu
X-Received: by 2002:a05:6402:4022:b0:68c:3439:945f with SMTP id 4fb4d7f45d1cf-697d4315887mr2014951a12.12.1782220624018;
        Tue, 23 Jun 2026 06:17:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82ee0bsm4934979a12.6.2026.06.23.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:17:03 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:16:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: use dev_err_probe() for clock
 errors in rcar enable functions
Message-ID: <ajqHS-i9zNeYq-Ll@stanley.mountain>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623124243.1245-1-batuadatutkun@gmail.com>

On Tue, Jun 23, 2026 at 03:42:43PM +0300, Batu Ada Tutkun wrote:
> rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
> dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
> fsl_mx6_enable() in the same file was already converted to use
> dev_err_probe() by a previous cleanup series.
> 
> Convert the remaining two functions for consistency. devm_clk_get()
> can return -EPROBE_DEFER, so dev_err_probe() is appropriate here: it
> suppresses the log message at error level when the failure is a deferred
> probe, avoiding misleading output during normal boot.
> 

This feels like an AI patch.  Please state when you are using AI.

In fsl_mx6_enable(), the original code returned -EFAULT if
devm_clk_get() failed so change it to propagate the error code and
use dev_err_probe() made obvious sense.  This was done in
commit b7a013c12504 ("staging: most: dim2: use dev_err_probe and
proper error codes for clock").

In this case, the logic is "monkey see, monkey do" which is
reasonable AI logic but it's not enough motivation on its own
Does devm_clk_get() actually return -EPROBE_DEFER?  Does
clk_prepare_enable() return -EPROBE_DEFER?  Should that be changed
as well?

> Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
> ---
  ^^^
You need to say if a patch has been tested or not here under the
--- cut off line.

>  drivers/staging/most/dim2/dim2.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

regards,
dan carpenter

