Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C273E6DFA
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900652; cv=none; b=KzbW9LeZJDbPXvlPgwlaF61FEE531l0s54Ouz4X8QEiKiEEhb9RE2Pm8mRsWQcyx3m3HznWxDmci5rZYxRFOXFYrYHUECj9LTuUlBxabVMCI2P0pRaRtbcFXm1cpHLzi5hN5m5E67jaCuoRkx5iU+zLiBHBUYJ9r/cf4wcI5lEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900652; c=relaxed/simple;
	bh=OfNfRJ2LAN/WGexXu8UyNtejPx6HM2qwLRLsVAmkb0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jI5OhN6S/bFSwSGne71LGc17qPwAh6gXQFrEmEKrVTgKiUYbH7gT09l9YQCbqwCbwZuvP2Rs73IbG7haqcrahEKBKPmVOfFt2JuIp9O4nHS+JFUtmDEZKX86vPV+ZeMYwvZl/Yi1Zpz0wra7Q/s7yMoO6ezVmTxcyHkFNCivqsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jejERsSz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jejERsSz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1098572f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789900649; x=1790505449; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OfNfRJ2LAN/WGexXu8UyNtejPx6HM2qwLRLsVAmkb0c=;
        b=jejERsSz/2pEkbD/akuc8r8qKgZi1u9Kl7wf2lf4bOnsQ8c3mNVR6gCL7i7gPqvCWB
         NaUtKeV6JI71gK0bhlwBJ6zkTdW5zfzsGYEVQMzUGvIE6dqKim4S4nssa1AquQ3kXLPY
         RmCz1Q9CVkVcuPMgO8KaO3ahXfQoo1SyilBYVYK4Et4yFMHgzbTZEonZgab57bZLlyed
         SuSdXgg/DkvD23um+LRipmgwSfbygBBL0d+0QEzSW6t17u1iLDsVpfrUNZfJg2VP2XRH
         zq+n64ED3ygCzksNTNf/ELvAwye/xob4CPaqPqxvMOK3omSFfQXIvrvxEiVgjzZ7DPuU
         x59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789900649; x=1790505449;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfNfRJ2LAN/WGexXu8UyNtejPx6HM2qwLRLsVAmkb0c=;
        b=I8SkQFH3ynZMyiT47XU6LUYzstv+u4lFVaPx+4zKB3mtYygqtTIOfHY+WumY6Fz4cz
         sLzsW3RBd9Sn4N2vzAjYeZUzweY7uFJBbBzsbcTKyHZw5qKAirQrPN8OfdjvmB8JPJQ7
         FUxyvE1U+XatUYgmLbU7j+qVrOcldtQ7IDshlrE6thr3NP4+xsJ3Q4a1Y1StyJQPbacr
         kDhlRTYl6/3vcjUoyQWNAli10NSGoWcOJwC7Ves1SiX0ArmXepxezgTA1Fx1n5FeykBz
         g7ORUlhrnEtbyaxtaiZH6JIuoBIFfm0aoUe1djiFE1d/2nptXR41zqXgiS7kNoSutnNE
         gUTw==
X-Forwarded-Encrypted: i=1; AKwUvBwYDwIuIiF1VIKuX7XjO0CKpTvnRZTlaA8dOBaOPT65XBoh7FitNVvxPmzqIKIb4KXMeGIRRH5uAfD3atnd@lists.linux.dev
X-Gm-Message-State: AFuF++ndfYUMOI2MirzSWfUJXdHZLCRRVkWIoKVXMc/S07we4Q6udKOw
	vTJXY2PeIM3RJWPvND1wjX0FtkPmO9KhlMqj24TSpgE0dx3qtHsEXySQ
X-Gm-Gg: AYBFou1vk/vhFHSIRCrZUzZ29AYmPdtq6SDezmS1AVJsswqUo+yEalIbwL7YkdFTbIO
	BYr2HVT9Rbp0NVtoNaCKGEhi1HRfvi2YT1TyTFOYMd9zR4RTNdJcK5yaX8BPp0HO/j6lhObwXFJ
	8Q4/sTEjQWJXcnwX/dRv0FcK42gGGc3ojXpA0a3D7XLexkyIS79PzlpjAZt55g3EzVhRSDOLjKD
	IefS2F3msJMqoF95Vm1kc/h+ap3DocUIoE6r/AAG365X1+CMTft65hxG6yEoFN8tB1A46bFSraG
	3pLFpJOIqbMKvWN+iR2AJVa92gYdShsvk5p7uXfoJ/P1HUEfnkVsFjFnKYQSC9YpVUquXoa6CVj
	o0qMEAfh6wvZaI1RMUHYrB1pvc5TSCiwnzkvVKowBjG+i7j70bjYpMSc0Qmz+tG+UviRM0pftKv
	m7CgkM35EqCp7zpEbK5VsVyN4yEpKiKWb/21eYw2EjkKO41A5XSCZ3nIwIWt6hwQZqnh8eUzZ0j
	NVdzBnc76xK5To6TsZfL5ozMn4frQw=
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be8mr95949865e9.14.1789900648846;
        Sun, 20 Sep 2026 03:37:28 -0700 (PDT)
Received: from localhost ([176.220.200.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm102353495e9.1.2026.09.20.03.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 03:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 13:37:00 +0300
Message-Id: <DLK2TDB5QIUL.1X53SKJTROLDK@gmail.com>
Cc: "Vaibhav Hiremath" <hvaibhav.linux@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Vaibhav Agarwal"
 <vaibhav.sr@gmail.com>, "Mark Greer" <mgreer@animalcreek.com>, "Viresh
 Kumar" <vireshk@kernel.org>, "Rui Miguel Silva" <rmfrfs@gmail.com>, "Bryan
 O'Donoghue" <pure.logic@nexus-software.ie>, "David Lin" <dtwlin@gmail.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open
 list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
From: "Omer PALA" <palaomer100@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Omer PALA"
 <palaomer100@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260920094058.9664-1-palaomer100@gmail.com>
 <2026092039-greedily-jailer-80e5@gregkh>
In-Reply-To: <2026092039-greedily-jailer-80e5@gregkh>

Hi Greg,

I thought someone (not you) can allow this.

I want to contribute kernel but i dont know what should i do.

I wrote 3 devicetree schemas, 2 performance fixes, 2 mutex/spinlock
fixes and 1 syntax fix.

All of my work got NAK.

Can you explain me what should i do?

Best Regards,
Omer PALA
