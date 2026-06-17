Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197623EB816
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697232; cv=none; b=IxBpvA0M1AeIFqdf7plbxAoDEOljGSmMEhibiFkpyR4vTmaXAd+vLcmOOZChnczQ2zvwa3d0PmHV9HA7qtwT0Piu9R7VoXZxuZ0HuJwCakSm8ZeJF9VUh/PgYlRMDi6r0/8RIcFJZRJp0erjsH3ASDGplMEjvXluXXElm/u/cs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697232; c=relaxed/simple;
	bh=ePpzT0EdYMPkTeBxdvCW4hC9F4sEQqsRpVfsX1OYEPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5PBoI9Ppi/9cWsbfOQ1NG30N/OPUx8WhZ1j9w5O2Qh6nIFIm5Skh3Y2COIuAeNMArWEY/acyv5Zh7obYfSWIG6DZyr5myFC+UvDfCf2WLlsMwPYhoJKRZCzQldb+RuzMTQhrd2kV7AMXmCA3o7T1u1mToY4i36jjaak77l/0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0xDJKZ5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0xDJKZ5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so36833795e9.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781697229; x=1782302029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYB/XwpPmNse8LMaNL18VB9NeuqIF/LgTr2KdTbty7Y=;
        b=d0xDJKZ5TqUzglst+BJDAYj7YqW7H26Jm5e9ictAm5dH7pI3QKhVY0MrqDCAVpkp0h
         eORCzdLrRYmg00RrbzAoCnQIlrufIGjgVVpGBC79E+PSsHKxataepSc8U4zQWK2VFThy
         YlPTYMcXUx5df7iopefV+V8L8Tx3qy7EkdCT9R4Pa0byYRyGkAgzzF95Nfc/BNT2W7aZ
         9cyTnjhx14ZYMpZtbK52fUDNt1zg+nZc0vrHSZ+xNia+5/2qXZGw2gpY7vkMuUlSR/Yi
         fRctIIxB7wJrF2uVkqVPDkE4hfbKVoY8iv4SwL+kvKBy26FidoZQaZkbimsradDoPKo1
         H9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697229; x=1782302029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYB/XwpPmNse8LMaNL18VB9NeuqIF/LgTr2KdTbty7Y=;
        b=NWNJttOolgcvfvMlR7sIU3CapdIHzZg5XTP3IB47j289W0t3SuBICv8FQakbpIeS7n
         Fn7IwMjiAApapoaP7CKMATIBVUB9GcLZCpiHj22VlTbZaZzoOc/L6a1vUzyE5OfzSJlM
         MxNq+BtxbUoDPIuETZe19Ip09di+XAVGaIyVD0quXlbutQW6siW60D4boCSWBJ/3Ig6X
         ii2OcBAGMA4NycYvWAAzAHs3coTvNGcdR0qlOhNnNshGI2ghpywG8C0gLCghngIIgBY1
         +LlQk4BmeHHCfFSoOrx7sbX7RcNeASxUODcPWFQDzW1ocjmmvYpY5LRZYx8zoL+kJXks
         x1Uw==
X-Forwarded-Encrypted: i=1; AFNElJ/ehiBkwoNHj7e1xlh5tGZeloyJNiQoRAMyMX4RcYnMEpgvbmBCJzg4htNMKu/0sIKEQMpz3xROUnGrT2/c@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6pg5Rnuq19nGcJh75wcLJv8MfPjtnv4y1Qg+d6xQRn2n3QEI7
	71AGI+8oEZu/C5cgBktYMgxhj2yEStChvd/SzfCNJamqxRp0Kugi/VyM
X-Gm-Gg: Acq92OEvFwYN6RdUPiZX3vy9rQMM427zWCpYVWoM26KRlbOGPyAuwPtx2zeZtTZAZBi
	W3zxRKa6KWDV70c6hfXcHOAPQKI+W0RcdkCa5J673/r1qnv5ghzqS00a8LFNIQCOK78aQhskgK7
	xxJy/yWErI/f/PvCeES+uQz7JvQui1um36ekvMEvRGxa3uSv+DGnh0YjuVM1sI1NcZbEbnL6G5P
	GJdJcc6KRhPtfTlZdbC0stDt5MKKF8oqcG3kcTuAoXqCJoK3bnHtRwYmr9etvQ3JeWY8qrv2Key
	/8Gy/+aNTRR6edqLa29zt7en3zAE9j30W1w2H9m9Uvqn97qCh6NXoGdsVq6LhMt6HEJORZK++iL
	t2E9NLsLK9MkmdDcSYpd0FUGa5PzWzeEdS/4GtAh/LLCmhbEpxBFV1LlolCEBT9BL+1/ERYf/zu
	y6aTyxXLFmJQGsTD6ZirA=
X-Received: by 2002:a05:600c:a144:b0:490:601f:d775 with SMTP id 5b1f17b1804b1-492333a02d6mr52326975e9.5.1781697229515;
        Wed, 17 Jun 2026 04:53:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm57790042f8f.24.2026.06.17.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:53:48 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:53:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] staging: rtl8723bs: convert update_attrib path to
 errno
Message-ID: <ajKKynn13sv-_UZl@stanley.mountain>
References: <20260616235241.99076-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616235241.99076-1-dennylin0707@gmail.com>

The first three patches are fine.  Where is patch 4?

regards,
dan carpenter

