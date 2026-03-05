Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E82566E9
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 05:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689973; cv=none; b=mvjsQv02YxAVt+9trCmEpY+Aq/x0UdGyMGcaLF9LtWHKVFzTPt05vwgUYrM9msJ/HNzLziFN94d/pNGAfnux2+l6Fi1hi3jQFwMG9XgCZD02Gfg+mh5ex6P49vplHYKrh+Fe7JKeb3L8GV193/8kdUksP637ytPUZ7Dgj3OpZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689973; c=relaxed/simple;
	bh=PAib3q2+jzkZQl2SQUl2CQJxZ3Li/poRIFophP65rj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4SQKmkDY7pAjR8AP50YGv4Xoqg2J4Ja/HP4aCJroOixUKU1j8N8sukv8uU5B2EgyX/gL/qXv52VmhScDY6yrVKP6r1E/5u3wPcBEbRyDeJRGJisw9n0sCL7ZDq2WrNT8y9VBat2p3RNmgSIZ3mtwPY5ky1o+YuPwBu8Byv0OXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5sY4vQ7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5sY4vQ7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so2566504f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 21:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772689970; x=1773294770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PkSdYaC8CvQvE6HYrnl/qBK5Q8vaUau7HiPYcQ/FByA=;
        b=G5sY4vQ7DsrUYdNltUFRCZHQmV0jUAtGM/OIo9ffT8DYr7IoNYMyCrGuZGgC66qgRA
         PzUANTTr7CUFuEuE/5ZlmHekA/tMiZxj3z5TkDmdvtVyxaVvLWGBhnZ+JLiCt43tgJtN
         H7t8ZN6J7+cbKvNsawQ7QIU40oooPGQ2c06hW/NfQYOSQl7oVdx4x91/K8TgDGmk0nJq
         yKlKyDeUCPjn3oCTKbWt8AaLbb71BH66O+LTet1+ydhqz5TxcfBbf0mFk+mZNg10kFkZ
         r6qP2iuswJu8anlkSA1bIfGdQr0nTEnUS+WKi2TSgNP0jOmDmpfCkZcIjnDxilmAfsmr
         LH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772689970; x=1773294770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkSdYaC8CvQvE6HYrnl/qBK5Q8vaUau7HiPYcQ/FByA=;
        b=aV1+JeRHYBvAjdJFREvfqIfk9ZE8a3vgisW17sAORxGLWolVflPp/D+SUkLFv5B370
         ueaizz6uEsBrQ1HyvmPVNrG30dsKtXIup1QfLrulTnnoQbqvWdGe3KHvkrfrycH20Wh1
         0xm9NJhV07BcEbysE8RVVtn35OALzBDJ+KMO68vpmifnoW11+TsTHkShUpgDaYVMAfOt
         s92NtdhhG4mwcpxnCHjbK+leOM+Q7n4gfY3tot3zGTguDpOQBW0plyWvomb7y3kt9rDf
         5KDX4mAB5PbW98kq+JbQ2LramGAfanNaq/EhQk7bLm+zcUfm83mlfuL1KmXQoEvgf03S
         XEBw==
X-Gm-Message-State: AOJu0YyZ5Vf60wI8pCtq5vXQDLkjhFEu0iAvlLlZvlUHmdIoJYPT/S5Q
	F4yLhd91DnOfHxOaGUtkpEl24L4X3WFX+WmPBx4PljlZbliGV+uzS7w+W5baZBNOmEk=
X-Gm-Gg: ATEYQzzciyCewsBVXT4SgMNvDsg67I2zfKj6wJ5ykfdITvAAuTVXs95bPO0URbfRhUj
	fBpRiNbSRody89OFUL7szUplzhA5+F91VhfrEo4kYiov2gndsAX84hAHTdtvPS88iUCNVWg+Ge5
	+J2pwuS/DfxiQwAtGMbGUMHGNZKtJoIJB55uhAxNKTg37+1bJKhgOnvgJ2TUqHqNZq0EODq5Lgv
	0/AG3RugDcdzxuPbzi85XCPf0++MYLiwYLu5KWXUI717yv2V2raSKacsMMG9J7d28HQ8VVcG8Zu
	tLEta4E7UijDu0XtkdHSjZxcjKTGS9gQ7EwBgsn37EW3RSnTpm32j7ip3QR71XsV+fqgEs6/lYr
	9uwivAKg/0FvHgIQUSjZ01T/iIKBSXyfzMeIevT8YW31KYuFFgYOeU17VtTBmyGa3AOuBeWjxtY
	BbPM9tfw+65E6r1wcqR2/dqQsrrRo0
X-Received: by 2002:a05:6000:430b:b0:431:8f8:7f24 with SMTP id ffacd0b85a97d-439c7fe3a2bmr8326230f8f.39.1772689969742;
        Wed, 04 Mar 2026 21:52:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm31427795f8f.39.2026.03.04.21.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:52:49 -0800 (PST)
Date: Thu, 5 Mar 2026 08:52:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	marvin24@gmx.de, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix multi-line comment
Message-ID: <aakaLv83wsXQl54x@stanley.mountain>
References: <20260305012626.56403-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305012626.56403-1-marusik.adamenko@gmail.com>

On Wed, Mar 04, 2026 at 05:26:26PM -0800, Mark Adamenko wrote:
> Fix multi-line comment style flagged by checkpatch.pl.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---

Someone already did this.  Please, work against the staging-next git
tree.

regards,
dan carpenter

