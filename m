Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D607386578
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503312; cv=none; b=pr/b9Q9Z1N6gMN4/pwNUgr4jlbwBIYCOtFJrxxTvPLrHVaKz7CwrT1dnYRtF0ZKQHU5KSVfWgDhoevK9ZLtS2uy1x1/zKkxSE6zurLSZWh8s/KAooAdYdrmrqW0MdaaNZMtIG0zuGyXqY/fJs+lHG64azpRb+Qf9Dwdyac3jygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503312; c=relaxed/simple;
	bh=+qZYh7WR+ScKTDa+5gXvi01wqyGsVDFVH86LVwo1Vi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViAxd8BhJE9pwCrlZYrlhCDDYr4uEh9fey2/nJb3nxmWsFhIrmxWzjt7HAQD263e+oZ1sKa2IwvwAil1lz3Rqh+YhuwXQVErW9PukL/CeGhMVnojvstciC4U/HKJw2fXOknW6lomtpoeV11+gmD6iO6dyGhabK3QuxhKckdJP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXkDd44h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXkDd44h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso50571635e9.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778503310; x=1779108110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=HXkDd44hut3C1mtTGE9+jmxFAsbdeEiTnNJLhXlYW37IaER6oBWTNRNDPiizoIr9eP
         vUIjioMb1j/o+yFC+l/9TSf4LJpX70IqNy2zG1Ado7rA4c4lhKvhbjAJb5yFOw4+ScDH
         LAkXzyAaoks+Wrl7YueN5/sncv2dAmeXAk7X/pilAC0aTvnCPZcbY3ZZEtDgLx/1GOAr
         QPdvZIIktjSBq6XKiEZcvIePUaPj+nxDQWbvZwMyUiTiKZkvY1+yYY49BItsjKtzelBs
         OvURxLMJaWfmctf5/eNOSqDRscHpohGBdhm3LN7zUsTcJTWq3NzLm7sPSTfXzCrnlVWo
         06JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503310; x=1779108110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keb7XlVhDus/Aq9Wo25qkQ1a+272nuyuUKaQUlw/8i0=;
        b=d9mh/8J74Ct2/rGVGrBMEvoa84Cq8nKa4ulW8kHF5Gxq9X1yRe9hHmP6myCd7WJHAR
         /FI6MfSfxE/NECxh9nHkBwhBoEUFctOVZ1izpeS4mMJoloryYrXYXkwqQ11mozzmMlUv
         qLFdmVzJGxgAdPkbpwG+mxG8z2/2qku94FDJDMChlAZT63+1hY3b8binEvQ206Ivht8h
         MDeuk3Ii3RRDH6idisIyioPPAhNwUKfu/bqW2ojgCmAezvS0jOrwaqa2Joj2dfjGrF3b
         fZuvt0vX0qaFr16+CxXFaWocR3sPBN25t1svIRFxbPwiO8igfiaIDl6uGRwyQzG6urZV
         /TuA==
X-Forwarded-Encrypted: i=1; AFNElJ/TiE4KB4CA1f6PeXYeOup9bVGrFoZ4Whzlm1v/1LZuakQy5YCWohFc0Q3uB8PQhJcFNg7MPinPcrOvdSPA@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm7Ldl0mIaQLpcdkp+aMsYkoUD2/X+hm346geyFdKoOxlQsrQd
	rQ+hJmjlvkLKRe3PZn8EJLsThFmPFMPLBZyq85/63tqFIkiAmby11Lxl
X-Gm-Gg: Acq92OFl03RSPAYjFO4VnPNRi1DQhef10S89ZBf1ag2sHm/7lXP2Fni1XZ+6S5X2v4n
	eqRkCd4wAdvjcvWTLgQHhiJTxq3XfcPRT876Xmr+f+R4wGWdF0rJgTgHCbnjLHpWuOFLg2OSacB
	WU7zr80R3sjQc2ZgfeX+nV1DPKYAZAmzzQvTPNvMkDz9w3MGy/U8VWDZqnRV/UAEPu88mbJDpS6
	g8zXHXpBBgqMmuHQrCsPovl/KnIyEvWqZHcZGIZRDUlGb+JvoP6Ii8mbeck/ZFUkAmc0Hg3uzom
	Ajb4EE7NaIX+zdR67HnCQj+AjrFlG0P60SiYdLv+TNoraIm1yZLzaMlA0Y0JPpMen/HHIgWGBTo
	qT/LV4lR+ny4GGUIEbYPfVe7DuZjV/sS0M0ieBw1LyU0ZdnMvlKG+IZfUYk0FeJhMr2FZfknUpB
	O9DIspPyxq+MusmdyTrhE+mr7l92/BWrHn9fAUzRLBraeJWcotzxWGZsMLLFNh5FybcrytRoquL
	a3ZVahe0Fk3
X-Received: by 2002:a5d:64e8:0:b0:43b:5672:efe with SMTP id ffacd0b85a97d-4515b056cf3mr39035174f8f.9.1778503309258;
        Mon, 11 May 2026 05:41:49 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c221sm26056634f8f.13.2026.05.11.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:41:49 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] greybus: authentication: validate CAP response payload size
Date: Mon, 11 May 2026 08:41:30 -0400
Message-ID: <20260511124130.22092-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051156-hamster-plating-7ae7@gregkh>
References: <2026051156-hamster-plating-7ae7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, May 11, 2026 at 03:53:00AM +0000, Greg KH wrote:
> Was this tested on any real greybus devices?

No, I do not have access to real Greybus hardware. The issue was
identified through code review of drivers/staging/greybus/authentication.c.

The vulnerable paths are:

1. payload_size is used in a subtraction without first verifying
   payload_size >= sizeof(*response), which can underflow on short
   responses.

2. The resulting size is passed directly to memcpy() into fixed-size
   UAPI buffers without validating against CAP_CERTIFICATE_MAX_SIZE
   or CAP_SIGNATURE_MAX_SIZE.

A malicious or compromised Greybus endpoint could therefore trigger
an out-of-bounds write through an oversized payload.

The fix adds the missing bounds checks before the memcpy() calls,
which matches common kernel validation patterns.

If testing on real hardware is required before merging, I am happy
to wait.

Thanks,
Muhammad Bilal
