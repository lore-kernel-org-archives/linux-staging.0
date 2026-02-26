Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F43D7D7F
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 18:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772130368; cv=none; b=W29mInG8WDGHBgNJ4exAJgp4v8ypGAFocimlr3hGsDkVWM0nmfCiFvtNAY41UdnSB5K+mUOFbSjRM887sKj3f54kJkYgri9RrILWW3npiMtARsZVgowQnuPZ7vcOAw6xiGfThdTIAloH+mml/r2P7vFzvIulsovAiZtO+otykCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772130368; c=relaxed/simple;
	bh=YSL7gDcnf5c43asbFbv4ZgcRJ5XQVgjSTUff9bWl7Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/WVXnRlnmA+ksceWweMmzUeNJwum3kGErvh846WzyzziyyLIHUH6N/itUo9PEPIlu4P4YtFDun7/gEmyxCo5NyFk99bzyrJX2DWUTFUx5tiDQccMQiPIkuZrUnIr7l2GzXDNgOgoXpCzFh1bboNhYfVjnspMYl141TGm18TOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcK99ess; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcK99ess"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-827270d50d4so1262485b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772130366; x=1772735166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSL7gDcnf5c43asbFbv4ZgcRJ5XQVgjSTUff9bWl7Rk=;
        b=TcK99ess4u5YTZ18riQOhONc+TSN3Z67se0ZDjpHroRl+XeSKNCjIitEqfSgNdu/lP
         gkaTJO4USlepmWOJMt6tHs/MfgAPp4jPVAdTXLg0q51gN2RFw0UG3BD8t6uj/53nr5vP
         qvyNO0jKLKgcByN45+UWethAeBlZdRBURlTrzVbVDaszu0NUjjH1liCwZ1YWJoCh+B8D
         uVVqZWyW65IqJkH7i04HGolmaqCsPYn0XuBZbD4AQ3NgygkyqwX+CkIHvsS5/TuDvfGZ
         E7qW9d6SDtFAZVKQOf+sU/8ecxQ7vjwePmQEqICWsfXbk70n7qW7OLSQ6KoPHoQ/OTgl
         nFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772130366; x=1772735166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSL7gDcnf5c43asbFbv4ZgcRJ5XQVgjSTUff9bWl7Rk=;
        b=RihG1b5Nh4LgdtVYO885872cemO9r1t3EnsMPncLU+8QDKJvZSQpB7RDUCaFM73PSY
         49ZdJ6PzkDDDSwdS6WW1musYuGMopRZOxvVtUHY+62iip8FhrOUoZSnsuTGezFfnYLXw
         2lvPoMpc1TyzFkM7kmgBpeuvigUS2KPixnn+5YWbtO87q/h/zioOWLwge8fvfaUjPusM
         sVzJekl4M7hSDqfsUx4gB5ydqbrYgro2QCmujUEoFHPNS6mMcM2tZ4mMjuXpDhJXjqQi
         aDYMUIQqIP6ixvwNQJl9WWp8XtCS40RDNQ7IPpeImIe31V+5MJtCysJ+lIr/sOa0+eNL
         hV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2U3EK0hUR0kfyHAQwd6NfqAtrNXD+oqrtO0RRpjUjvriGzuX7Wi+5Tz9gdLDt0hW7R+cajA0APLWyGzJU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Y0f+ZNJyfgEKE0zIOSIhe7ssdDrN1hBFBpbUlNmoa3beo+6p
	YA77C1/8VGa6+UVaiSdFnnuj/vNkysKzUZJKT/pSYNnf2OopoXQXQJ+k
X-Gm-Gg: ATEYQzxaJcpgC68QvmqjKA9oOJiUdcLzq0gyYWpClnxJmVJyPA4OjvhkoGM7wmRZyNV
	jGs+oh4suloFxR/ctyJYOk5IwcsCPaYcXzZTQ+y5scz2TAbASu/4O1hGBjSFuc55oClszUqtTGV
	VYmYOrrVb56ZFfb6yTkBfb1yZWmXCK/4FFYVXEwQTqEkSPMdGiCO6zRr7/vfyRyry08K6GyoN6D
	Oo2C4iplOhRxkPdvl/HUvgtkDQ81oSb0bJ+fjjJJXVs01q72ej+0DV5nv71ekOB39gdyv3hKrx0
	sh5WorfLfKZrIlwNm60Lk71iADps+U4KFygErDSegQ/stuSOiS/jEqf1xORLQtHzif63UKD+jve
	GNU97QtWCjMbuIwohY8CWxMduCqfmernRbKK5pM3sNCUtJhWCw5KR85kZCmwJnfqcP6+nqIe7DV
	w0yxGKEeQAP6yPHQZM5Qj1dvyLPAwwVmlqbg==
X-Received: by 2002:a05:6a00:c8d:b0:81e:af19:34bc with SMTP id d2e1a72fcca58-8274d9f4011mr33669b3a.36.1772130366275;
        Thu, 26 Feb 2026 10:26:06 -0800 (PST)
Received: from fedora ([2409:40e5:1160:7851:d9ac:d756:7e02:e043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff372fsm3053585b3a.31.2026.02.26.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:26:05 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: chakrabortyshubham66@gmail.com,
	dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: greybus: uart: convert to XArray
Date: Thu, 26 Feb 2026 23:55:43 +0530
Message-ID: <20260226182543.19246-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026022506-untouched-scone-e6bb@gregkh>
References: <2026022506-untouched-scone-e6bb@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Understood, I'll drop this patch. Thanks for the review.

Regards,
Shubham Chakraborty
