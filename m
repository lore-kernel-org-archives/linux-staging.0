Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AB37E5E5
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064063; cv=none; b=kTl+bkRrnzZvVlM4B39irVpbPfa1OVWwz7/267LZB9EwOQLL1U4tu464JtOMpvsVJmIugnzI8O9QV1+9aB/zAUkrBCpPoY4PDnboiITfucxVOusPhJMc53CKI1m38LUDItDd1+r2JJJTDFyjlbVu3Ap6ENPfkgGDYSkmibeubtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064063; c=relaxed/simple;
	bh=a50prD2A13ww/WqAnFsiWorNSQvADBL8owCYqR9xAQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHyrU1iiOhIG8jjt8qN9vdUQDcAAanXwjlVGCIUI3JFJgWf6tPRTH0YGKI60TWe73ZZH/MeLsQ8VSlg+NCnjF0OQA0W6noH1zAg99Beg+ybM8Btcwa1H9UGph/nSNjEdrd4BMfH0eTvM02VGmmJkZ3AjoNiCqBl8N4HeByVZBTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCaF7xBQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCaF7xBQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso1261065a91.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 14:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784064062; x=1784668862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a50prD2A13ww/WqAnFsiWorNSQvADBL8owCYqR9xAQI=;
        b=NCaF7xBQS3U2cRDs2iXGOu31J39ppuXSBnnPsA6j5JyMztqS3MF6tDgMUSKHsC+3aY
         K1Bgwu9cww2VJ1y4kr7ENvlGv/uPfJoW3DR4qHyQfx4/8o+0St8yZ7ln7cIoYSfzPOah
         3chEB9odGSxpB7kX+maC652rrz4iGm2HV46Hgj3l33TKiTCSmwBSIaCW0aUcJOu11crM
         03rWJtRLKOF7BL4Jz0ygYnTdexEKRGd26N790AL3zwrrOOSGCuVAsO31NzT+bbWlrskr
         Fs1lDD2c2lG2XTCrXxIPWh3ucOGXrEsJStkrt9I4LZpm9QAuCIuRmgHwEt7oVTFOlMND
         N6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784064062; x=1784668862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a50prD2A13ww/WqAnFsiWorNSQvADBL8owCYqR9xAQI=;
        b=IxilMfWJIHoko27W+V2v97WHdgyYVJGjB3OUizoNDyZ4arpWEyv/DVfGOfD+EgDpv2
         whABsKWUuS23qxgrnQe5pY4yW2KJ8BTcmWUtgPYsPJmYjOYko/512HewIr7mDs+wHlEW
         78jR2d7lJ0O7VH1juwwh/oaBW4lLbE28yJVsL2DgwNJFuAwZdiimzzhFwjar4nia4Bp5
         bPLO4gKUg+eHadx21IXE/M0ykuSHOblnBBv8Bz3X7COtEwv21VJfTzKqf2sy+32nhuML
         KbrUh2WDr6wF6+9+fwGFIGy/4mJYGvxEz79E/72jmaHGJFJMz3uyTAahRbGaz/Wd82lX
         /Pyg==
X-Forwarded-Encrypted: i=1; AHgh+RotNUToqZVCfkLnZaPy65Cbdtp/Rlgw6rsd8H3uSephXMdcO7BB+Lm5ZcpQwocs9OHHu4lKArpHdBbRmUcQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxfyGb8qIGm8LwUmZETUB81Rz03WeYxsufJdofsJ4COyUUFhUZZ
	+9joFm1FSWXZ3Ds0l1iyo8ocq9pVpn8ZeK8mv82HfN/zkT9PBS+8EXrr
X-Gm-Gg: AfdE7cnNW7IPvwppIeFGzVL0UfQ5piQVq2Fn5IpDKi52OCo0XKHkKHAHwzHTzhdq0D+
	Z/JotqHEKnUhH2iI56Pg7r7ha+GwgkvYs+QHiIsvH2912tbTJtxayr6Ekyl4/iJX8wr2/Ha3rG4
	jD/7iyfpSDP68JZGC0BScKanAeJxijgM1KenO0AWvVuEEKHKO5/FE49ltztXzOJAWT6l21saOpV
	JkNR7nerjhcBhuF1Fbg2D3QjUVOFbDMfolctdvXVFWBO0OYUXE2zHrTHdOynXcZddv9rq1J9xx8
	Pfc6dn6dYGrbuvFQfhvQFp6jm2PZpFykMocqL9niqEM8v4onC3dOOM3tamreS2BitjSnG9kh6zo
	PUFiwdBktVHl+5NulCqI/W1Iu/7P15xrNE6n15s4YaymxYzBYWNDQNTC+ti96H8KXt19nepLc0R
	WhV2cx1fnFsGn3Q3xc2P6Q38eJVhxN38e6NqKaaXiZB4xJ6G0tSFewFpOxYkfhagQurZJyfAO3n
	Ru0gknXZHTCQaUZ8TStuyBkzSW4REwJfYBor8jYzeNNEz0sY018nRQfZu82TC0=
X-Received: by 2002:a17:90b:3d4b:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38dc782ab85mr13289455a91.2.1784064061931;
        Tue, 14 Jul 2026 14:21:01 -0700 (PDT)
Received: from bloom.localdomain (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17470008sm2032172a91.17.2026.07.14.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:21:00 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material
Date: Tue, 14 Jul 2026 15:20:43 -0600
Message-ID: <20260714212043.67013-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <alXjOb8c53MddWeH@stanley.mountain>
References: <alXjOb8c53MddWeH@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. I noticed the same issue. v2 of this patch
fixes it and contains only the rtl8723bs change. Apologies for the
noise

Ivy Lopez <skunkolee@gmail.com>
