Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F133AD88
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451848; cv=none; b=HGTZuOFQCQy++X7bCBRLjMmb+4K2YhnIXAg9Jw++u4Nfneyb1Raq6DK/joExIPBHmvuldAGFAMOOW9SJW5id+QKhqbrZJ8ier4QsWDGcPjRgdRoQdDQgB7tWgLtt131spcMnph6nHMrtYTIUWBL0Xb/lQO/fPAvLstGw9nXFgGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451848; c=relaxed/simple;
	bh=POB/rKYWyZzKP0KeLtvAIpH+LmAkanTpgXC4K8iHeuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqBTrDvU30+rO969HSHNipzoVpNTy+Od8y4Oe70KHjsoyQlSbvZajPH3MPXy81B2m0ru7rUsFKWzgR0ft8bEaTt0sE0ePAVIbgk0wmSPB+faFJaUUlLAZoelSsakliAR5aQvE5176gYBY+dZRKsZifn0bMz5ymjo4LHxfgSqBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTdsL5FK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTdsL5FK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ac10e337so16666895e9.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451845; x=1782056645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oz6PIFZNPBpek1l1gIJRIoH1qb80MU2GHgEXhoPMto=;
        b=LTdsL5FKo35MgHmikE322JAV4SkQuEAWhpwfZvVjtykAAoDDaAAitKuJ+fNraEZMQC
         dtN5vZ4XdG+g6emkAOE1CbJvZI1zW4uFuPHGZ9O3Bs0aX2HUosJwUj4gNMkmHyc8ma9Q
         fvh0T642QaxeDZ3Xzf+rN7yKz9wCoOUu811V8iIgB0HBeanWOEPVoGRFxQlxjqBKCLtc
         V/OFaJrbM9mEMIeDYuisMAINmVYjTrkIZptv4Gnfw5H85zSL+IbuWlyKMSwu6Dju6Iv0
         wi6F/Y2NM48bIaM7UBtyAx9s9U8kUb0ygiRNxpPahKZALzkYENG3Wzxz4SSuxIIpfniV
         iNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451845; x=1782056645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Oz6PIFZNPBpek1l1gIJRIoH1qb80MU2GHgEXhoPMto=;
        b=IrlUrCaYEgA5RpKzVnRIyaP100kmPzdQ7cN3c+hPH25ko9C/JgJy6CAPExryahqa8g
         TE6aeLAaCF5bL5FEAsipGSaWnsVMT5ZBXvaLGMaI4swJCXEseCwflC1ZvNFisj+azIbU
         LHhZjVdq+8d5//QZ45Kc56ndqhaqeQn7Do3qex61+rTAtN8oleYTgV58M0yW7Me70+8L
         +9yLlo4S8Y8uEyBgywL+GRwIu7XYbBlwYvi2v0HeBgVuHqpy9fiQ3BI92KpwmokT6FEa
         7HZlMPibtaBBRuaS95+cpICh/KNRw+AEA3X5RY4ya6OR2UYtywTE6TVJb4PkSqAbew+U
         9EfA==
X-Forwarded-Encrypted: i=1; AFNElJ9GNKHNoPQg7lPU+MIvFu3xONZO3BICKLUhQCOsBnY0TIx1jfG5nF3qIcz2Eq12p3W15PtdTjd6B617dhMN@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvq7kZoWvgse08BOtp/b/oVpdGX6CGtLr7xdGULmbp0Ysf5H9b
	iQFRbd5erSd4cFUVYSuqwX9S41y67anBmnbyk4yZw3SOruUZA3I2gB/m
X-Gm-Gg: Acq92OFg9bH9Z2yWjDMJqt+VPMxzB+3IJ840Ce9WxbhkOA6sWZUX+ehxm6Bs0zL+Lpp
	kcEdhOfr+zDOZYwVHZ4/RW4bQwLFCaRPXFe+6tH6a7YFFsTjGqyvcX0pv1eOclcV4qWaC1KOcrb
	uk44D8CItHJbVBzgA+1Yo0K8GNWl7iMH6nae75PHCUNubauQK6tSymuLSiavarpM+zgHZdLO0WQ
	yAKZnJR81DTQpJoOSr/+6xytICGBIl7a69vyEJUn2Tpa+4DkbE/zvm9u92wJ5bxgT08fDZe5WMc
	gtB8YU33nNnfp9cSAOe8miv7hrJAKuZNoO6TEoWspqiCpI76xs6NqGs3ImekV101NQ9lJlP/xPH
	dDGBgpB63Yb+pyqLUHi5L8Vxvel9RYgbq35jSPYr8Mp39foiAZkU/0IGtBmNuEDm+fssXmc7OON
	Ikf6+BR2yusD1G5mOS2bsEv0orXZZ+5t6OUOg01/9OhZH+A+YAhm22dyfV
X-Received: by 2002:a7b:c385:0:b0:491:89c2:bf3e with SMTP id 5b1f17b1804b1-492200e8734mr65930635e9.30.1781451845454;
        Sun, 14 Jun 2026 08:44:05 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b7d2sm184237135e9.5.2026.06.14.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:44:05 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 0/2] staging: greybus: audio: cleanups for gbaudio_module_update
Date: Sun, 14 Jun 2026 18:43:27 +0300
Message-ID: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses two separate issues in gbaudio_module_update()
that were previously combined in v2:

1. Fixes an improper check of the sscanf() return value (smatch warning).
2. Removes a redundant else-if check that could lead to an uninitialized
   variable warning for 'ret' (reported by kernel test robot).

Changes in v3:
- Split the changes into a 2-patch series based on feedback from
Greg Kroah-Hartman.
- Assigned correct Reported-by and Closes tags to both patches. 



abdelnasser hussein (2):
  staging: greybus: audio_codec: fix sscanf return value check
  staging: greybus: audio_codec: remove redundant else-if check

 drivers/staging/greybus/audio_codec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.54.0

