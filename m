Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9227A3596FF
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028558; cv=none; b=Q9KHknvEa+QiXFV02qh5kc6rHw/pJLpn2QkDvKwXERB49ptLYB7s+48VP32KY5ggc+yw12P3VJNO4t0ItZ11l2Tq48RhEsmGcKnqv0CF3e6j9MHpH6GN4NHc68Pj06C7kkGOXNPjCepQ3CzgGdA7DpjixIySL3DNzK9B/8irr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028558; c=relaxed/simple;
	bh=u3nLWsv+xZHspUdaarvrIFfYRC4HITj/S9WkR8PPpmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZbYl/j4Yz9WxAX0T9oDkasHl0zEw1/zrQdHP5/wiEOA32rXNs2iy1VYBg02AF1+GnpDZ9Y2h92tPORovfc56vOVVmxqpXqLa9otKDQdRzg42u8IhukmQsiLMGKX+e+yHpewPbXaTe3rtwoUFO//OaqWGV73EVoT363UbNJdIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUT3XA4s; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUT3XA4s"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so33554065e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 02:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770028556; x=1770633356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3nLWsv+xZHspUdaarvrIFfYRC4HITj/S9WkR8PPpmg=;
        b=eUT3XA4sMfE2v+AVa8VIfdUnUNYgXRsGtBXehx5K43TgdAHhs6502lu0KTy4BhYeyu
         9aXAKWrjt+y4tKxM0Y5smGKxQ4jrSpr9eS6gpjAJTC6xjrq+xnoujtPbvrzU6Hk87qph
         51avkiJ+bfvSAmNWoSCbUbUT6blDMIfatNath8HtKXEBnu8dfKvTGodTFi74YEudbWlZ
         RAV4VbcRgOUpFHfrukOgRXoYbSJr+rTCZemkyhqILbxT5nM7DJFMiYE8r+z07h/KFtOe
         gbRDuHrRJBUK3XROKQHlvvjnYGncmytIZ+YJBF9Bt8EK/AEIMufLX70nmSjsR5gsOfEO
         0+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028556; x=1770633356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3nLWsv+xZHspUdaarvrIFfYRC4HITj/S9WkR8PPpmg=;
        b=e37LfBW9WxnYawgD8aMVooyv6af39fsB7Ipf/Oc2iXvRN3k2H1/0JdZExz3bkw8LVS
         g5mrLE3wD+OOc9hauF2JfC9JsAmIlcEoXZpPor73lbmiRxaeGOgJK0e9aSp2/8USFpjO
         tgb2+Oq6kzmByyoy2vWzZteuasJXuVAFD2gJAMcfU5ES3DMEZlDjqjAW6bnrwR8v9iGe
         bCTmGpZWjx1H8JIlMwBJt3WsmXT6ZjVGVH93U/ziXiKuFKkeKDL2YnYscj7MAs14YoXe
         sPXUROTRdjN4QwoTexMyVGDqKYpu4XEl4hPIfEvAIGDnuvosoKAcFZGUmzAvju8WJGzo
         Hx8w==
X-Forwarded-Encrypted: i=1; AJvYcCXzPMFS/jTqqD99A9dwzTasQ8Z8J0a+0reJJOwDPGrJnLP6cLOOM+4yPzHPO0HMqPQGOj/v8T41H8SrUgKg@lists.linux.dev
X-Gm-Message-State: AOJu0YzqSZv7KLPrv2zq1x5WbRXSLJaTHqsR5lpvsVjinv5BjLpj4Tu6
	/OTzHYvFGSP3cjYDO24Nv15hxUgAiAok6HSN7nHQu3gtvUW0yDbaNGVU
X-Gm-Gg: AZuq6aJOkXWpGjvdsWU7gBf8g/PRSLNfUvqJySNqMfceZbkYvRSzny4Kke52FaNscGi
	xFqM+8eHv+cZKVptwJlfOpTxdGi1MWOJngfbSCyXtCNAAbu5KpLKaJdpN5iMWZeLRKz3qfAa2U+
	dQyrsQNdo3hI+d8h1Qcbgheflr155YUXk1GLxGHg6GK3r/t/M3OIul4Pb5KjKPqB4akpeKuQrX5
	XApyyUXkbg41r5sw0Uimo4YqN5zl7y8dOq6xdq0wKJ+S7s4l7uRP+uXYJD72ilacwhR7CzOUKZ8
	kQhSBCliSzQg4xiZPAPNPw4DmQak5gvDwXRsFjRuZIYnBSHBKEwuEqg4J0CczuLRl5eV/m8Q3FV
	+cxzI45g8Oj5TpTZ8zBAESIFQ5KbU1kdWr13TkRBCjjzzL9l94RzwjmkotR/lgSNVA5Bl9Dyp4h
	KDNNJt2czTnT3hrpMHqN/pDBXDdPl33VSgz3IJiQ==
X-Received: by 2002:a05:600c:8b26:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-482db4e5cb1mr139231635e9.27.1770028555828;
        Mon, 02 Feb 2026 02:35:55 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da6bcad7sm123911645e9.0.2026.02.02.02.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:35:55 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:34:29 +0200
Message-ID: <20260202103450.13839-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026020258-very-numbly-b36b@gregkh>
References: <2026020258-very-numbly-b36b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies, it is my first time using mail lists.
