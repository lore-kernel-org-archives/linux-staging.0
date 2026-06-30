Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6223BCE3
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828324; cv=none; b=ZrM2LONc4mtwzVHp2cCzZknmEnHe8V5/Z5s8yHnplmBQN8EK+Mi367OOINC8UjiQUl9H4bHr2ZDmW2ZoT2qbyPJb3PcHPpM2xFdctK3skmzjoaGFQ6gVNB0SnUcuH/jiKA1p1wXroPWjBGq++L6VczkSBkLk8xV0E8tdOHCbbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828324; c=relaxed/simple;
	bh=h4Bk2vS84/K+uN7N+3iFwUXv7x6OXYbSuSCpCdgMOCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfZIOgZOjuFyHuX6y5stfUMZJKPCG88p9opBfZrU5OGvLDnrO4a/0xE/uYOzPzEW4d2ehmUKebbhbi9UPr++HwgTZDwRAVUwhKexPrfD/X/VTDTeyt4yGT2wtSYSQWRSlc7JL4UBbqx5T8oPe6iQSiqi+yK++eBPKrqg2MqG7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2VikAKj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2VikAKj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2638432f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782828322; x=1783433122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6LhOb8EsOqkumof6PN234kRqnlpHLJfaxXGP2ixv0M=;
        b=m2VikAKjxmzF62HSIInr18z0K0IrQCY2xsWQc39muoYoLKT3yL3oDuUIEfT2/nhg3m
         3WPm7SjiHUsqfg2cnkDu1HhnAmyUT5hSM9/6wjcqDkCC5IpvPb2q3w37hU/i2ICyEbGl
         FESlOtA/ObzGYV6SG6gUrNKwk4yUEIVkv2XDks5nFm5RGCKYCqlliBziCzn+BHevvIB3
         v8BOlQFiH8cs9kR/q40xytNxdGAf8YVt1GRYQCihfEEjZGMv7E+wC0Z1Booc2JsiOqxE
         WkMftBXjHJZCPOFOhJTqvF0OWN2+ykq+2ihvbCL6AlEmotdQqf/tpECMEO8HiygZ0pHZ
         /uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828322; x=1783433122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6LhOb8EsOqkumof6PN234kRqnlpHLJfaxXGP2ixv0M=;
        b=hOGFhdiFqI7Z8vdeVOfutaXWGt/seT4Pc1XzYsrVrF8rYvPDmToBQI+lLhCAfHM6wC
         b5Xo078OiglcAOqjxBru3RCfV3/5schySjxyo/SBn9zCMM1VSifOE3SABaoL5Mkr2iev
         f+jfw117WI6kH6Tw4ZTovTlqM+7u49I4O0/XUrtToamJgz45X0x6+OaKDR3tf14WSvvj
         38U71LC5Qjtmyr4O1I0q3mVeg7xK8o5LCMfM5/df6k24+8QeyDguRQSFayoTob2ycqtt
         oku4e0k5WnHD6xG38f3EVgJDfjKvYJuCn7NMHdSjY6UbuAU3UW4lhGj+53QEFD0++AsH
         EaDg==
X-Forwarded-Encrypted: i=1; AHgh+RpMWnx+M99OJVp5L7V7gYZGyPucAAcHb81Sc4BRgGRdKX34bsgMFpl7tI+HmmGYWJHPQSWiGMGchfwjlw/n@lists.linux.dev
X-Gm-Message-State: AOJu0YxnjBWa9fAoqkFf5UL7I3qRbM9ReEzODqcgDAE52F5FhEOLZblh
	v0jNt+PravZ1nwZqxSCIbFtWZaxxdDr0ck0J3ko0PtGO/+3oj2vgJcOb
X-Gm-Gg: AfdE7cnijxmj5/kMd6ztTrN0sHbuA/rNXcBFxV2oIUG8J9JeNEB/cO1YHntVW+xiPRJ
	LUK8DBcpIT6DbFg+iH4H0mRmG79oOibf0X3dharzqyCIFFYUpjuAmaYno0KuCHRODHBHL0frrTr
	/qU4TWdIsoR3/lbWQRGGXELuG9CeFIA6W/47ONTN05DUY0/AhW2r40l2KXHE26tBcDnYmaCde4P
	ZK9sgZfIhfgzuvhkGrmdxLPotQRRJaz9CsQrDFsw4uTQEbaOuqgzCo0spyuKaFjDd8428nLoF2R
	VKXRLSZoOUMiN3fdAOZGuuBBoJL/INkLVfHGV5WwaOIkkyqaTjGY1cGvf+5oDoVGZgM02a23XnE
	bWoAIquMXJo4FdnBBM7u3CyWDWHFHFxVea7MezXajVj3j9Tm2PAf6UuAo/rF/ef20RwM90EvhDM
	N0lr+DsSv3HJ6biJN6s3Zvc3dm1IQ=
X-Received: by 2002:a05:6000:2510:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-475f0f0a0d6mr2897097f8f.59.1782828319713;
        Tue, 30 Jun 2026 07:05:19 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm8456382f8f.31.2026.06.30.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:05:19 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com
Cc: airlied@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
Date: Tue, 30 Jun 2026 17:04:53 +0300
Message-ID: <20260630140453.78029-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87jyrhd58b.fsf@ocarina.mail-host-address-is-not-set>
References: <87jyrhd58b.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> writes:
> Given that we don't have that, I suppose that we could just get rid of the
> DRM_FORMAT_RGB332 support for SSD133X and just default to DRM_FORMAT_RGB565.

I see your point. In v3 I'll remove the format_rgb565 option and just make RGB565 
compatible screens (ssd133x and ssd135x) use the higher color depth.

--
Thanks,
Amit
