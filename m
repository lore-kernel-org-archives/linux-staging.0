Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201738F927
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 23:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847852; cv=none; b=kh6ly145p5s09TWr2MmUUZidMRKD2jgCNrolu11TioPBT3vFA7gAgLIo6+rDYlVylPY4Poh/gKvrmKQpevXXMGDjz9zAqr8Bd2JSJiZo2tVQ34KsuVsnM+si3zZslDA9n7W1RQIzjyuNwklNBjZ1cC8jT6UWsn0Z6vGHKw6CoOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847852; c=relaxed/simple;
	bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbUWLhBqR05ix1oqINaDoquMtiWrovjVfau3RakfYwl4xdSJ4uQNUCaz0f47lw7RUY+4X50OMC2WrOtgyVeUecYSxkp7mRsyGZfzSfi+c/FBo+nHHivSTLy5f+lb2LYGISfc/mMSWPNUZv4gpESUfd6Z2ZIrzS9lvyN6v59NLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=TpksNCvS; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="TpksNCvS"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b83459526so14664066d6.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 16:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791847850; x=1792452650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
        b=TpksNCvSf+nUdKXt8lORlcPaw2N3BRtjHGrzJWLLRXcpk0Y9dWwlPoNtxoM7fNz6NP
         kYT4Z+Rb+W63suxgXXVKTpPEugItWWAFGCy5xpZ9wKrV/AMG1TfBvnd7tb82Fuv7sHAe
         V4OmWIq/Tw0/5xhqv0Qx+YeKoGH4XUGjFjNYVNspqAiD8+q4ZuUb5OGEqp0P7oJcf+OJ
         5m00rWyRB3uFb/sC8CYqwh9FZmd+s7VQDfTsZHYGjJ7NV7c306TKY76BLDZTU4L/rzEw
         fpxOPPKmODIcqhAG6RiTZ1JHKVEVGjxx9YyIp9NF8Gv7rSpNAKFKNAepWIB7uS0wmscJ
         bNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791847850; x=1792452650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
        b=I05bse/H+rmepfUujRV+CMVMKvsi7VGE/yux19VropWxg9dGdw9r8wfTy5T5Sn8SCu
         BsJ2MxLkdFtLYAGQVyeK+ys8W6A9cfP+O2hL9VJ97kBvbS34dG2PPpMwXRlv3aMN8fSB
         JDrUHxpoRn+obYNg4mXeImMJ+EAxhv7V9geSK7GrFqaiAPve+LwgAkvMp7Ba25w4YIqP
         6yOaPIqbOGRWta9+D8nvWCcGsOShVwAedQtF9CgIglByt/nBGkVtBDxDr/6CPhXzWr5S
         uWVkTz5zun+oRDa38vOiZExx3yNCI7LYYfCqpWZY6+oxEPGRMur5PTOvJy8eil71gX4b
         s3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqNPKg6jls1sgpkwP5+w34szkKqT7L65WZTKrq6KQVefg74j90Pdo1wpQyr3BsvIfevOJLXEuAANw7FugG@lists.linux.dev
X-Gm-Message-State: AFq9FYKvs0Nkt4ruQIKEE1VwbumVMV9k0YoIuLc9IX4wAOVeHDFE37iI
	psFVSsEe8fsTsfbKNNOJTO5edDSZnVvIxwCofTfmW7Dp8Uqs5Q6S7il/n7a9fkHQy+8=
X-Gm-Gg: AYBFou0gyvJsGZnv8drIedXvo4/h9s45q87lUbPVMklSlXDT7AAcYjg2KySaIq87uWF
	65lyv/nyP9eyqVGXom0CH9BcdkfV/gfOPFrj2HL+XI4KrtDLcKZvCaE1WftNxYO4csderEIUpbE
	sJ/22G6QleTVd7Ljn3oE1tTlTHoxAk0dopyWa8C7N0F9gfYMvplao0GN2R+P3OZXODdTdO0LVES
	BCV9pm1IjFDE4rI+hx8wtIM0NPOQjMs2zy1rmoGthrndxBDtTkM0WyIay+cdiNo8ngPFb6g6EZh
	/3LxWDtKY7lNaxdWe/wlBSkLOo/hzowxm11I1bQr5yelbRHuSIqzi5EabBsQjBSaq2l8FWqUIVb
	cGZXxRbsFJlJUITtSVLZWgsjjjlOumQyE5n64Q/9rLq6/AYGo68L5+myk9YLpXyby4yEg4ryXDq
	ryeEdeZNQ6ye3YS7m4zIJwzeu8WiwddO9pyNAHcRwSpmqTdcCYSyGnxlpdF2yNqBFf799xvr7Za
	eKfTSNXS6lwBnSUW922sMrT2E+zXuZPg83tTFU47DdO+wbecZdhdD9tuo0HNs8Wm+xhGy4ljG8e
	Ckkaf0EPiwGzpKwWcOXbQS06R5n1pOZbLYGfAzjlltUfmDlSEnOrMg==
X-Received: by 2002:a05:6214:328d:b0:91b:5d3b:4abd with SMTP id 6a1803df08f44-91b5d3b4da4mr183530656d6.50.1791847850247;
        Mon, 12 Oct 2026 16:30:50 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm10654626d6.14.2026.10.12.16.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:30:48 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: staging/ipu7: Add 10-bit greyscale capture formats
Date: Mon, 12 Oct 2026 19:30:47 -0400
Message-ID: <20261012233047.1026925-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <as1QTFB1CRDNxAEY@kekkonen.localdomain>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com> <cover.1791608336.git.j@metarealtyinc.ca> <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca> <as1QTFB1CRDNxAEY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 12, 2026, Sakari Ailus wrote:
> We're about to remove the ipu7 staging driver, therefore I'm not taking
> non-fix patches to it. Can you se the ipu6 driver instead?

Understood, I will drop this patch. The ipu6 driver already has Y10 and
Y10P, so nothing is needed there. I will retest the sensor patch on
Panther Lake with the ipu6 driver from media/next and send v2 with the
result.

Jake
