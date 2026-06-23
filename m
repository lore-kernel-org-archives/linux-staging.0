Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AB26E165
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236519; cv=none; b=Va3JBTG/dCMDDgBzdsS1Gqum3MB4dBL8tJq4uSxAm7n9px4F8qhjQjbpCNleRfIbDMXyAqZIFihAwcXWE/7+GQc6pWveJdB0V0BLA7i06JqRftaCQxh0rzf0VlfPk++K8ds5nTIO/jmBQSDxvPU8u2QC9Ro6C1dEa04vdruLNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236519; c=relaxed/simple;
	bh=Cr2FzJoSMjhAWLiCORvNsQ/qT2AGi11n9vpdN2BGQ8E=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=aX657h+lEXSsYPhHCkNyj9KcYhZlSt+zSUXViL/wfcaI1l1FVp2RFSFug9yt/cK76gQRfIw+vwRJN6JkgQYP6k3SpYzO9DpEs4fpV3LGoVbB39n08TiJ9NNsosUxXIIEayXn8POVzn+7U2kGnbSBSvmytdZmXNou2XAtanDUGcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmz+ErEw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmz+ErEw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso903125e9.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782236517; x=1782841317; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cr2FzJoSMjhAWLiCORvNsQ/qT2AGi11n9vpdN2BGQ8E=;
        b=Hmz+ErEwuG2iixLMEEJs4pKnF2h7NsNxgHyv7Q5wPp7Zrpru/jkfxXqduveG4P+59w
         u1tg4c/AXnH2PWZx7v5987ZLfCbHgLfD3CjwkvJcW/Sxcdl+EgX/y4PJYWhn+70okbQN
         R8mWcKL8WXHXAWbvlwx8dainZ8JpOY41XpAUN+CnRhI2Cc91o4rFyVyY0q5cd8yWXelY
         +WSAnnpC4Oj5wTwcHkLDxxv3TMjFtGAucschZxB5gWL71cp7aW8v9et6cCO6SGAfQwWu
         O76Zw9MT/wYSj4N+9od7iNW9/k/ILAQaSz/FKKdOgS9P7Dxx8NcLQeiGON+OoAvJ4Utw
         ydag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236517; x=1782841317;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cr2FzJoSMjhAWLiCORvNsQ/qT2AGi11n9vpdN2BGQ8E=;
        b=RerEP6uEvx6D1fVwQ4xWVkNByp+4UMdIaTtKaelb5YqUkHme4fYoB0VS5GqpwnJJwT
         ciGyryCzrETr8YrolTyZVLEbxo8PwhndTWQhBtVb308vmz4SxIn+gCaP7MvT3zFZ7zjD
         oVa1gfw5mYNJTOAOHHycVrLimr8guFrSqzYl8ovKFkOeI3s9sycD9+QeI/X552WCmmSp
         IKh4eh4z6fLmBNBUeR3uFiHbr3Lbgn8VMW6hJau06lsmJk2TBUHrBQ91Bcsep0G3yDRd
         9zSlKHtZgTFj9VzpH8kjP/55v5wtcXhNHKgMQXWbVNnuf+Jos8XIQC+mGXx33Xg2D4aM
         u6oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nKg6/2PzjUX8OvURdTLoupYP2Vys3nQMnAnmrNrmQ2mGraovQzjxc/DhJa8rjJxLXdPFvomk2uodr9Ykm@lists.linux.dev
X-Gm-Message-State: AOJu0YyAZNRigaP3eAiweetwh7ZiDrw7ApQMFNOrMbalSHGTMaWE2b/o
	WzZJVJwtvdIqKpj+nFuSbyUsaERA/oqSvSZvoFbkN9votHlxOdsvm0JGARRm7Tbh
X-Gm-Gg: AfdE7cmTLLas4LVkSuNGKNcx22Zc1ZINrm9KRYN7S1Tc3NcGZZJhnJKfCHELwzLr6zP
	N+FL7JR6rLqYSJYKabGeASg1B4XPAIP2cKwqdccXlHsXgxDMDWcByBrwfn/dMNVCwtEaTjYMWzK
	1ZBDaVhpi4KdtEGtDKImt0dGSpZBj0SMdwMrisrSkL5W0e/k/9a55i1o5G0z0RrO+651klaKbL+
	oBEnIatFHghb6WXLooCbQvDO2/Z53z4PO8sr7gE/2ahvKj7bmSbuI5IZQx3vcOOls0Jrg7AKYyB
	whUwSuvUSkQuR6GW0VO7oJSjUuDiLAt0WhOwTCNGi/idjRH+gqpYQpA8m39+Giod08gkw2E4Zq0
	j7N7j43bMz5Mp4n+Nry3MF17mBkdKxtDLaKPBi3+Mx5XlTxc05ZKxkM/4GscxqPWMQN+y7T/ihD
	9sgdGyMkQ8ZjmuF6mS1BCZlQSlEecXH4XQISjC01Y3JWinZ/5OgdP60L4=
X-Received: by 2002:a05:600c:8b03:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-49249083cb4mr220127715e9.5.1782236516883;
        Tue, 23 Jun 2026 10:41:56 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15535sm426715225e9.3.2026.06.23.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:41:56 -0700 (PDT)
Message-ID: <6a3ac564.561280e1.325e99.1bee@mx.google.com>
Date: Tue, 23 Jun 2026 10:41:56 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: use dev_err_probe() for clock errors in rcar enable functions
In-Reply-To: <ajqHS-i9zNeYq-Ll@stanley.mountain>
References: <20260623124243.1245-1-batuadatutkun@gmail.com> <ajqHS-i9zNeYq-Ll@stanley.mountain>

Yes, this was drafted with AI assistance. Thank you for pointing it out.

You are right that the error code was not broken here. rcar_gen2 and gen3 already return PTR_ERR(dev->clk), so unlike the fsl_mx6 case there is no -EFAULT bug to fix. This is just a consistency cleanup, plus devm_clk_get() can return -EPROBE_DEFER when the clock provider has not registered yet so dev_err_probe() suppresses the misleading "cannot get clock" message during a normal deferred probe.

clk_prepare_enable() can't return -EPROBE_DEFER. By the time it is called the clock handle is already acquired and deferral only happens at acquisition. Because of that I deliberately left that path as dev_err().

Compile tested only. I do not have R-Car hardware.

Regards,
Batu Ada Tutkun
