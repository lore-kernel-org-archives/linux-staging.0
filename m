Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B73A9D94
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 06:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738631; cv=none; b=r6VCq+04xrf+KSxnldVLrQ7CbrTHP3vqC/IMXwoh+Ppc6leiQL5ytQ1+eeANXwhWP5IFd6Y0+6y7YRnyGpyAHD6mpkqWYkN1qj4eXaxWnAY+pcmhw2zwgKy6bM/ZBM5SHAs3cA1a9yDBGXnGXKPKrUx9pKqJIA79W4d6TkbZugw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738631; c=relaxed/simple;
	bh=XYuMyf3KfpmgRh6WOCjw9y8nuK0B+fBm/n/jtwktAvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XJtuAS2r/bsJ7TXcjEB4LxfiZ95Z7iCKezJfGzDX+H8dfiIdWQRaU+cKIYvNxV2WOlhZr4Et3t2NFhlWYTobgNs/I0P5GZJEt5MwkXK0HZ+LHOKLpa4G9q1/zTFMwAk35VX9DPbLLTKb31KVqKPGye+OWmnEGfYC6cBIfYXeWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RewFDNeB; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RewFDNeB"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2c156c4a9efso10463246eec.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 23:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778738629; x=1779343429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iqejnEe7nCqBbm4fKSCCqiNoodL+MwdoLCW/3y8AIbk=;
        b=RewFDNeBJZHECwJ/uygRI737SLXJWR4ZI/BsAp3rRsFVoPm2C1xMUh/29jXECBzAPK
         FthsK8FKadsxrQ9tBvTt4g/4ZFoKQkXsOYXPSz2pFGE0yFWyWs66Y3F1UTvqvhrEIlEn
         e2p8dl7TPWVNuYaWWu2RhjC+dUfcUbGYgpE9JaAghH7A+UbBRxLsVR8ldiXBz84hynCg
         9eS92mhwujIkaAIS3U2HR30hznX2DeqUDuMlSLOKaW3HUkMDJSC/MaySiQUkkqfx6gKs
         YPmDw+CBz2EwuCpdRpfs9hg5ZB2ZeqaSXgjpn8DQrTZylG7oiEgSwfIonY5hSNHJk1oe
         vxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738629; x=1779343429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqejnEe7nCqBbm4fKSCCqiNoodL+MwdoLCW/3y8AIbk=;
        b=BgTeRqr39Ibb0QyBRngdVa6O1kmZ/Ww1/tC+M7/LVbpIIVeQhxnfkPl979dmDc/toi
         qOeVus1+x72OiyJSZP+/Q77BuauDn/x9VwmToolbr0MIN6OVUAUPr60eYGX0N/3c5EUk
         iVR4CSF/7OdXJoTuc8kDZn8W3KXn2tosDxDipXDcxFPft+rzKGoHEUbxg4SJ4egZBi2i
         2bUV0lfjcQM/TlldsEZb+A0P2ytUmAz0T5ShUL6oTZUnQPVoipLvxzPVcQjzw+3UW9yt
         007RW2WClS0B237DVInPuE9lUNmXS15yJnSAs0alSjm4aA9GZUPJS1EEkNeMUw3dUytL
         /OMA==
X-Forwarded-Encrypted: i=1; AFNElJ/aON6oYR2GnMx+kgnql6OQQj1O3DniZIMhmrgW+Td/V9WISy3jjJq6lamtlUJUWuIqjGkHK/ddBxOc6UQB@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc7cW9JmEjCXq3+Hi4eq4hI8rqXufoXIKJiUUGfGmX9b4czbcH
	qB4eHNw8AeUBU1KAg3nhUsF71ggF4jG8CWV5rguJeQ1sJj//RC9leLtq
X-Gm-Gg: Acq92OGATua6RyN59AE5qyQRyQxp2Sd0f4oouyoE04mXuzSE41t6tDofmhrzlnBe/Ov
	p9fkDwb9VSeUv+42KEDVEdZDXqahTxSItXF3F6dkCj5btF8OV1qF4+13dm9ILig3c6+mykGss1Y
	XUBclFuPIJoCc+TsghNKG+oy5UD46J3RU5wYuXcg/oxqbukE/t22a01R9IbWQqtsFdOntsbzOOO
	VapJ5hiSqGiuJtev1I3wkZ9myrg61S2AHXZXsdD+nl4jbj1SjntJNbssAoJ3jcBPZvvWd3j1yib
	bkKcG7QyhlI//W4vHBbG14HGdHlejWyZ6ROCId/vgmcnw2rQQZF9MgoKADXQtyZbxl3sXq/sKVV
	ih12JOjykHcsUnqMFgMqwtjuvuVRh5lRcTI5z+Lxkw2PsN5A8w93lzFiO4LUj4TfXMlN4yixar1
	FVqL9ZiiEht/FfBDmMF3ojtEukBiPqD8WWRSgLpFgBH2OXfLosolrtzsU=
X-Received: by 2002:a05:7301:3d0f:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-301512632c6mr3320795eec.0.1778738628880;
        Wed, 13 May 2026 23:03:48 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm2034772eec.15.2026.05.13.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:03:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: clean up xmit classifier and propagate errno
Date: Thu, 14 May 2026 06:03:18 +0000
Message-Id: <20260514060323.24895-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the xmit classifier path in rtl8723bs and
converts the enqueue path to use standard errno-style return values.

The changes are split into small steps:
- simplify control flow
- make the helper static
- convert the helper to return errno
- propagate errno through the enqueue path
- propagate errno through the HAL layer

Hungyu Lin (5):
  staging: rtl8723bs: simplify rtw_xmit_classifier control flow
  staging: rtl8723bs: make rtw_xmit_classifier static
  staging: rtl8723bs: convert rtw_xmit_classifier to return errno
  staging: rtl8723bs: propagate errno through xmit enqueue path
  staging: rtl8723bs: propagate errno through hal xmit path

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 84 +++++++++----------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  7 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/include/hal_intf.h  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  3 +-
 5 files changed, 52 insertions(+), 52 deletions(-)

-- 
2.34.1

