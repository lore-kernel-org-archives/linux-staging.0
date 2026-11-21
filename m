Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278308;
	b=BPCDaOvK6hFzomKmeRAaSjhfqtYVdlV2Hzs6IJW4+aRdlbSfHoko/x9xMIs8fxXG08q8
	 BHXdpQqk7/yJWHOGFU+umSK+WuqZgP4LIb+jnwF6U/ihs3BKHORJwJGWFyL+Je3hHgIpN
	 W+6n4UjvM9oA8SsiNe6xn0swlNgT/gCoL3bHQYgnKiz5VYxlsnSdkyDoyBl0fcSjHYeE9
	 M8q7s7hz3P+HoN/pEB17EQWT3IHhU/01JTBxvH46f2b7oKPphCGdfNFpNOPzhOFsP6Q75
	 krJ7UH5YgCV24tCMMUQ+eaFdpLm0gi3/XX3mkBr6lw3rDBA2COpdpvEWzoucqnwjjAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
	b=wS/3q2Pl2NykQTb/dds43JJubHMGJ7uPHsJetH2Vh8pAdwvV2mLh4xA7qw7MHE/OfXl1
	 a9NanmaJZLpR+gVDdzFCGzRi0Nnb7KnJATAy1Dke0SIbsOwL00N2UP1Z85jS63Lf8kfvU
	 4I0SWenMG4tnmelqLXd+u0u5cgZdwsELkCbIvfSfgAUtEAWgIiBL8QaWul7BXSzFCny1E
	 gyKCK6aipwhdcZ4IhPnWZw9jkXjKHXo0X1pQIm2Wq2WWQaSUcg9lYDt3hpt+1giCEE8ax
	 iNOVlETq8A0j3WZlTSjPiJgnpBWo9qoXBAvmenqBlLdo749/01fPwA9rE4jaY2LYF5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbBR5gv5;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDC6606A32C
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 16:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDC6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbBR5gv5
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so22770705e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278306; x=1795883106; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
        b=xbBR5gv5ZTte6gDE2bN6aTyJ25L5KjxXb5Aa3ASNkGpB6RxNtcWsrGIhh19sSpFFiu
         eslwxRCkhsYSiHkbgL9IuROcNyaro9sXtCHc2ceGZ7oIwnpWpAM8FWrQdttHoQEH8Fnp
         7RXIXuiOCzI5onAWPZDr9HF+8FkvYjKaMn6jjbgqSbTwSbXOIyjcxQZLLGuWi0Idr+gx
         jh3bmR97wylUYHZO2mTLaFafcvpk+qoet3TKqfg/w1pq5n+0XiMcDx4+OH6CGsZ9L8lu
         UmJK5X3Qnck54HM6KduHxNEyRs8PwWPvrTHHsxqVegmmDqgtWFuPCGLRnN5j+xdP97e9
         pHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278306; x=1795883106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
        b=GMyXMR6/nVjZDwYzOM/cTnJclpCMyDqHy0zeiWus31UnJMmC9bNlD1Wf7XqlBnyI/S
         FP67VpZiPBLE9uJRZ44NplJbfkNi8OPxRF6Rd0+sl9FZJ67z1G7OaeYtUVwvXKEny+U3
         fmBB6dYTstb6V0CdAjUqosl74KNuvdfdDmrdJTsoHwZtD6BUaA44hxfjQ6kMkBCLZVBc
         aF2CMJlx1nlPJuBG/1F1CkPdUV02YPi2rHJdPjtC/6QzhfmzFSNasw7xLVkPWVvOi1wJ
         msfxdeGG0Wuvz5Z7G3/IhYL45pHZrq9MHfc8ArDiEsdgyVpgBlEG62TFdWkxTVXFp/DB
         UUlg==
X-Forwarded-Encrypted: i=1; AL+hErEAezZxQ8N9tMZZ2jUOuelL+cEoKWGWa3RYXV4ciyd0UReJnFpTT9TBDNJbRdBSKnxGdpgsxpBQOKgDuxP1@lists.linux.dev
X-Gm-Message-State: APuU4Z9Hu+ddvfC9dFA2JTr/vleRYKLxH0UfAb0HtSH0TtcCIY7htBRg
	mV1W2XuUPnyxGahHbZUOFhub4XSqByW52EAsQTnp2ItykMekew9vds76
X-Gm-Gg: AZFdTZdnXaXf4+C/olrusc/p69wi0siKQDxvsH+rye1VBC4eWZ666gOnlDEP4FrMbmE
	kLs9CqDpgIgWsT3+OJYkIRNZYvzEtC+MLL+PN9D4TiroTBOmVmQEJ0KsIqVfuLcuck/Ru3h+HXG
	q+FxmKK4yt+8a/IjyynAUPuGofAcuKD/u3gaDZSQTHCKH68jL0NmdxPLQIdu6Vl7/Uzfpt401A6
	obMsPH7OIKw3YumFxK4b1sQGsw1xP1vFGY2884YmoFQ0NHG/AMOOs+YnG5dv60zYQCUHvVsauhU
	54IhZxeppNBYjn7dVR6X572ZYEapFM22+q3L5eQ3MCR7rELQ74oP7l+rDa07kEquANrkESAY/Ng
	EPEkiSRDZHUW7jcW9Z2+hMThv7QpHeS8/fWcoFdAXq6xFbAVCEd7NiigLBpr0Y49pyfE3ZABhgm
	5oBDfL8gCV73ZKrbwJMgb0Ttf+Vw9WX52JKukJYd8uhU2Nv6rJ0OfWXMr/rtJXAsbOMHRfFdqJd
	hJTfGqqS0/fSceZH9seJnL7kuVqwZOy4BKpa7wph2FaeiRcKRcnw1biEvIbBhlPR79d+9wFRmnU
	NQ7rzxksrwCRuPPLQhPa2dA40rWSyOP59FWjqbdkpjdyfbMPCsqLPIW4FLqSXiwRAGuWocwbhTs
	kuw5IDenxdZJ5
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr140280015e9.9.1795278306276;
        Sat, 21 Nov 2026 08:25:06 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:2d5f:cf9a:376a:baf:495a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm67580365e9.3.2026.11.21.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:25:05 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice nodes on rollback
Date: Sat, 21 Nov 2026 17:24:58 +0100
Message-ID: <20261121162458.1373638-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121135349.GE2472094@killaraus.ideasonboard.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com> <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com> <20261121135349.GE2472094@killaraus.ideasonboard.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Laurent,

> NAK.

Thanks for reviewing. The test only checked which nodes were removed.
On re-reading the error path, I saw that unregistering a new node can
invoke the subdevice release callback while the subdevice is still
registered. The test didn't cover that ordering.

Is that the issue you had in mind? If you see a different problem,
could you point me to the code path or assumption I missed?

With Best Regards,
Maurizio Casciano
