Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DFE42589B
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380005; cv=none; b=TIlzrxdSQTVkiRC6S7NxWajGV0F3O8Ubr5/dyaPI+GY2SxKNE/sALuT1KXXUi5Zrnf0vv+DLmMbjLSGJBC6L4NwmtzkAu0JHzlqrPOPyyvAvW4yqfq3eB8/u2UnF5BhShSmn66FbS++HEAmN9qsNXkeYNk856l0kL8Bg4weGiHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380005; c=relaxed/simple;
	bh=nY+8DjuSFuBpxoEHzHL2AZ4ftLmPBNY9AbWt/IizrHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uT/ufs4UPrvgGdgRG8yzdOEa5mzKwhFaEegtddGGb8uLDY6sBwvDqgmaqpJC/KrMvK6RUZRy3DfluYyknD1V6HorHgoEbhAmlCh9A4zTdx4svHDx3sF8ON5OiG64+25mADIQomd2ui7Z0jbiNu6rCQjfng3WsD71N+feAEWkV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=VNPyM5Uy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VNPyM5Uy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so5808655e9.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789380001; x=1789984801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7QNpdgjusqgoiOYsJVTbvzfzST6HhgyXQdP08BJSIM=;
        b=VNPyM5UyMIrJKM8OHvNxa0PQgvJixKVkE28UA9FoVa7XBA7nnQd9HP4HSZupUqwvRB
         xIbhkwTBrcc6gsXQj1mn2LygeZ1DIH9MhStWbadXdjWvbto9h9jcZ2qgkxGtPGD1oX3a
         evb+EFkiwJYgp10PIaOo7Bv8ULJ+DQIgWQzQxkN5iG2cLzbh0yje/m98m8TBK7/uVbFh
         5esxm051oh4zcZPFYIcLEFFNDCRjGtH08bnr1WL32I3D4C5w2dF9d9fSwwa+wtuGdBIi
         TnPmgurkN6+ocwmIag0v+xsNzUPri1Fcy9Ssq+Kb9bKvCoDQZcnjtBlz8MTinyr/w40Z
         RMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380001; x=1789984801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7QNpdgjusqgoiOYsJVTbvzfzST6HhgyXQdP08BJSIM=;
        b=WecTihiYy1rtKKkBGKM1kq2bG2SuN6EcUQdFZDPd5XeMHwN2V2bapmgw7HGZH/MUE3
         XhmpC+YYgv4rJA6iD1WVWMIyTw7y7xiux7/wtW1N25mxI6uO+bH4SXQK5IuP1t7F2jbG
         MQQtD8bmT4MpW7jSJa4fDwsXz2r+iM0Ov7T6mAkGvPZ3rNi2ZcbGmYNeSZhxY8KxS42I
         qTauGsBcNLNEi2DfxHaG97LYoAb3pF+VHTDCe7xG8Ezp7FrftfDRAytwjJQwjk6G2bHq
         ayMKvX7DRiVCvHH3bmQLNVTHtm63L5ieOms+LZNOEsDcrLIqR8LWvd3WFq5Ii017reEt
         pptg==
X-Forwarded-Encrypted: i=1; AKwUvBync45T+/Dy97E+ijyx28l9plndYyFA/Aj0IFHRkS23/RbjI+ky9231mGVzcjFIg+evIxw0B28NujoBmOap@lists.linux.dev
X-Gm-Message-State: AFuF++l9jVSQ360wjKaCb8od/3PN69dk5eSlX40sVWBao9GrqP+4jCpW
	rKLsWtk1sIZIUOm52Z7sHKIRsqdnYXbBF4XlxYbQ4QEFDuus475cGJ1x
X-Gm-Gg: AYBFou3klJXrTJ6hQh7oH/xpQx4DkmFMge/vV65FO0Jlrk4MQkhYVgqeycjRPbAVK8E
	Jo7nJci7fih2l0v03759xE3wYXiLNrLUv+rxYkb5E5Of66HX2FrR0zGBBWxTgDccQ/Y07D54lQH
	smEpl5gOOeJ+0f3l/CH3ojK9JyzG5F8Ayi8VRcmJ+HoTeT+HkLSjGycqMClj8d3RkRhAUCAVvt1
	sUkZvDjJe68M9bLe3slr8prfHJA8oJ315nSJBjNjzUxdxRBHL6tpFDtQJ1/tLFuBf++n3PVR6C7
	z7AmokbhTpjS1tVPryvzz8glzSXDCSw8Yb5pTqpYAzAhEQgbJasICg6ZjwYCW6vNdHadSolF63W
	cdm++h/8htkqPRZ9kUbp5koS9sA4F1sZxkalv7AxDy/GPFfopNUFuN92bmnY/yC3zgBucMShlgM
	Ke8S6tC/cjNOD2Xc6okOkMmZWmlmYQ94oKX9NLsWXgnFTlwl4XspO3lJIvn7GVMupXpvMQ1YnbQ
	Y34LoGeA++YEgttxuepexmaHoO7pYECwyxL/1Ktlz8xYcyH4iRuAX/itDd9Gn1bVGrX2ugITlo=
X-Received: by 2002:a05:600c:8b2f:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49e7a657446mr17851315e9.5.1789379999209;
        Mon, 14 Sep 2026 02:59:59 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm439935465e9.1.2026.09.14.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:59:58 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	regressions@leemhuis.info,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH] media: i2c: cvs: Do not hide the option in the ancillary menu
Date: Mon, 14 Sep 2026 11:59:57 +0200
Message-ID: <20260914095957.217739-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913125345.588586-1-junjie.cao@intel.com>
References: <20260913125345.588586-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Confirmed on linux-ptl, as you asked. Config-only test, same scope as
yours - not booted with a kernel built this way.

Starting config: linux-ptl 7.2.3-arch1-1, the Panther Lake kernel Omarchy
ships, taken from /lib/modules/.../build/.config. It has
CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y, no CONFIG_EXPERT, and no
VIDEO_INTEL_CVS line at all.

Run on a vanilla v7.2.4 tree. linux-ptl does not touch the files involved:
drivers/media/{i2c,pci/intel,pci/intel/ipu6}/Kconfig,
drivers/staging/media/ipu7/Kconfig and drivers/media/i2c/cvs/Kconfig are
byte-identical to vanilla, as is every other Kconfig under drivers/media.

  before: make olddefconfig -> no VIDEO_INTEL_CVS line
  after:  make olddefconfig -> CONFIG_VIDEO_INTEL_CVS=m

Diffing the two generated configs shows exactly one changed line, the
added CONFIG_VIDEO_INTEL_CVS=m. Nothing else moves.

Worth noting for the stable case you mention: this is a distro kernel that
already carries IPU_BRIDGE=m and VIDEO_INTEL_IPU7=m, so it is precisely
the configuration whose bridge routes to a driver it cannot currently
build.

Assisted-by: Claude Code:claude-opus-5
