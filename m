Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8910B385D70
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282135; cv=none; b=lz6/nwRf8IBMI5jqDdMJTON1fR0apXrruQxh8fqOhhvpRkKSxmQUdjjkcNOYbvhOZU7PCdFs0xeyduM5DLFQgVBi75ZLcgU5BTqDln8dLIrb+BaokZi6Xxd6EZiPXKsToPmDvNhTBMFbG079zYqBxi8Me4AhbzPDJYxtDm6Fa8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282135; c=relaxed/simple;
	bh=iA2jQFQi7aUuyW+NEi3pdM7vtD+gpjGvXMqWxMf/Hrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFDHcQTAlubuQ7Yy/x/hFPRC8DW5XcdAN0mrDifZGwvqoxGkKXMv8wpXnuTcByp/OQoqxu8S6T9779GikJIfl2HACpkcpOLApqNlPBRtgKKeCHcbg3TGzuWwj96HDBGu58QNA1heK4p6wme0W1eyh/hTa6MwEmE7BH3sn9RAj64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZiiAJOR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZiiAJOR"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c0d6c75c58cso100956966b.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282133; x=1782886933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRxB7+nWbl+xPPuabqlXkiLeUH/Z5B8J6JlB8gvKkmc=;
        b=TZiiAJORyau2RgBLjYEsQ6h0grlDLNYb8dnNfFCsW2XIJRkbB5K403r8p1q9qfEVco
         zqjWzpFsLLLZLGI06tM7dq8b3piCYusAkbfELEI6EY1Js+TJBKCyMEbrJ6ng4iREHh/f
         A6Sb8A7BtguCPuP3KoXc23OGUIgfuJoG9Peqe8wjRL2lDNQVmjj5nnWm/btU9gHahjEF
         a8gTb9xRGGqdK/T4QmggcXVIhIazYxz2l3AyRGPZhAhlgG8ToyvWvHBm9ctDMhRmzPsy
         KgWu42iZbhHBUvuHr36dhD2nd+U5xVuPYnLt+bDI2q/vlscUGjaASYg9iXceCtgma5ha
         xxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282133; x=1782886933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRxB7+nWbl+xPPuabqlXkiLeUH/Z5B8J6JlB8gvKkmc=;
        b=av8Ygl+VDBJ+4gSXkv6G3mKXUfbzxjBpc8CsvhWcAUNACiGnKfa2BFgQm41ymsqZii
         8CyiJ+Zg2X5jxMHdh4OLpWXVti6gWshANI2rSbKXind2ln+5kYMMZ7Kyl32jR3OhB5ev
         ZpaX2NLfonK5+EeSWVelKx3juUqmX4o0ry+/cYwmy7tpX5neOCPibo39piVK+yo3BIrM
         1pQF9hUyT4gKD1Vf55X5xiYFmkvAmh61VSj8d6KNdL2E5l2m8apxShSLsV3Xsilq/Kd5
         0AvLCKXLw45iPC7po2zFLeDJLQ556gjUB63kczLA3a3G/YU+OOsDjHOmlhKxlz+L0kT3
         361g==
X-Forwarded-Encrypted: i=1; AFNElJ+MtveurKpOPOxtSMAXJQ8ifTxjpL8OlOluyB8amt09h9HlPjCe/PhwXVSsZ8HnblqBHuQKuzP/2rJWB7MM@lists.linux.dev
X-Gm-Message-State: AOJu0YzW7MmAc2bKiSEC67uVFEVL9chfoxA5Brx2lBvt20l1sWYwoaFP
	ML0eT8ed/OOQNwDCo6QD2UBX0O4oTkOjrgb7zh5w5gT8QbCjELhjIc5w
X-Gm-Gg: AfdE7cm+54pmuQaZ9sJLdZ8bJkHVP+cBVtVnnxxrqjrOlOtTLqMgFZngiibSz+48JfG
	czI2l92EfXheJnW/9tGTY4sgz5mRzmVU2d5DXu3fmn4bBOaP2K0FOqrQf9v3l62TEcz59qmziiQ
	knkzQSO+sRv91c6iI1hKV3tWHARogZRl0URTR4f74CxoiAYKhFZIm3pCnMXqXW+F7kPTk8iRT5B
	BzObELpt0GWvpcj4VXXhHXusDsyBvx9pdZgLehZq7oOEaH1jjVwgHuKtIbcCIU+jzOVQQPw9iXn
	MAh695ZDJafrXrf5Kx4Y13mybmFiRkm7+Nl0aArpsoy01CBpH534/9YIR1BMk6tEiSgLSBF46Ee
	Vz6n4gc916Gs/GJsxiehMfZpnV6SR0rhBc+qT627wlHaO9AHFMa8fNXYOaLONOxxT5MlC2qm+ha
	qJrRSSf6fe
X-Received: by 2002:a17:907:1c93:b0:bfe:ed25:c564 with SMTP id a640c23a62f3a-c0c671927e1mr497535066b.53.1782282132956;
        Tue, 23 Jun 2026 23:22:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac97aesm607385966b.30.2026.06.23.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:22:12 -0700 (PDT)
Date: Wed, 24 Jun 2026 09:22:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: use dev_err_probe() for clock
 errors in rcar enable functions
Message-ID: <ajt3kH-ceA38gYIb@stanley.mountain>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
 <6a3ae40a.3dabba3e.2527ef.7783@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3ae40a.3dabba3e.2527ef.7783@mx.google.com>

On Tue, Jun 23, 2026 at 03:35:08PM +0300, Batu Ada Tutkun wrote:
> rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
> dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
> fsl_mx6_enable() in the same file was already converted to use
> dev_err_probe() by a previous cleanup series.
> 
> Convert the remaining two functions for consistency. devm_clk_get()
> calls clk_get() which can return -EPROBE_DEFER if the clock provider
> has not yet registered. Using dev_err_probe() suppresses the log at
> error level in that case, avoiding misleading "cannot get clock" output
> during a normal deferred probe.
> 
> clk_prepare_enable() cannot return -EPROBE_DEFER since the clock handle
> is already acquired at that point, so those error paths are left as
> dev_err().
> 
> Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
> 
> ---
> Compile tested only. No R-Car hardware available. This is a correctness
> fix for the deferred probe path, not a response to a reported
> user visible issue.
> 
> Changes in v2:
> - Mention clk_get() explicitly in commit message
> - Add testing note under --- cut off line
> 

Perfect.  Thanks.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

