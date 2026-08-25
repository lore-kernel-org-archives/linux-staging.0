Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA178442B25
	for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662462; cv=none; b=GI3k56fsEWumTHIqwmngEopDd8GBuuTI5Cm8rYPo5WbffhZE7m82WFhwcuZ/0P4SbLZo5bryMPS7e23qCPggIIicNQZCF3N7v3xobbI21K0I/q8nlk6MOhefwiDfE4arfOrLac3ubxgDrIaX82JbIVdqGSebI0EFi/fudOhctDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662462; c=relaxed/simple;
	bh=X/5J17/j9WZEAk0ueGb2syz+Tn2iiIrMXWkmNUCHUN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJhft+buvrKHtPxUiRrYiWpB5C6EqvpnX56BE+zVbUbj10bQ/y88aFVTrMHfOU58su5zg6c5APalekxpT3aMDiZGHeerUue7kQgsLnd7tBKDS7b069YR4DDDedhCBVbeVksznPa78PlHnT4OC7m0uWpc7VBymLCOgDtga+9+Vyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deCuh/+4; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deCuh/+4"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f9dddd99so1543385ad.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787662461; x=1788267261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bl0t0GO7T8INmopjH/F3XhrXuri9ZE3GjRDAWOGxxEk=;
        b=deCuh/+49ZXx2F+l4seHLyftLnLirsNMR561KUlIYjndhgtORCc0ZyGBOhACzo410l
         YQXwonXAFeercBtKC3BLGLziNKD52x+oR1pISVrVWuoWnKRYs7FIhll7WtrcouRvpfo/
         GyGfGUoI1GqjxdPMkLX7jlKDmXdC+l0pHyPh5bzE/xoMKXQg45Fq3+X+ayeds7aocuuz
         sBRB8ow61hjMCnvTOfu7NztcALkpjP10btjTsRJxUhXqZq41L1o9hejecuV14N51NLpb
         zhZ7hakFTwSDZbuOU1iI3Jb4+QAW1ywY8TJutHqj0FzZYXsNXWaMPQb9uI8SxbYFTvMX
         Vmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662461; x=1788267261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bl0t0GO7T8INmopjH/F3XhrXuri9ZE3GjRDAWOGxxEk=;
        b=P6Qz85hVgErBdvUus5lsArPnLip8av1g/r+paspz3xO8CvYphkHm0jBAMIm9YniGzT
         r6oi3abMp+8w2G4Oj4s74qLMEzLEx/8YnVZz7nB4Eaq8FYZSosW3HXhFVmYEMLQ9g7Yh
         16eK5bvcHN2QGPWLc22FFn/vhrXXDq5NXSuFZ3w/9Dunwfi1R1ePYVt9XgOmRSqdroDg
         vWBmYVsh8GM1wTWmWNbjn2LC9YAd2U+vsfgomsLVBZcOS6LgIpiOcjuq3Q4i6GmDRUgr
         zQ3S/3KnyHyskgsCEszlCH+Zr92wfwBbE/e1JM6PZY9WGZ45csMBovJuEmse1oqnJq/a
         qbOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/GkUgpxnCSOuq34+zrxXVR3xdEysK+mCutp8qPNeFTpb0zNTuh+iluzzzY/giyUnQrJGOiwhbv81VF7bL@lists.linux.dev
X-Gm-Message-State: AFuF++lHtUdz+5VDg3QHX9z2MiqiWqeS+STgiAQB54z+mR0gqi+2OQWu
	KXKnNBd/jwxKrrxB/A1ZLDIof7aBDAsUcRAHWlYsj1zyjTWCDdOv7UC+
X-Gm-Gg: AR+sD10eaK39JOguCp3yeY20XUBI51IG1vm8gRisXS18HzUQxjEucu4Vi93L3mroYBt
	lmTvuSbw5tA15j/4YUVWcyippbACuqYKy7A5lHXDqN8X20DmTgVgMpWFNJQ6I4gXr4NXa1B50SW
	IEeZZsx7GXGJNsdmALCaT1tb2d+CSq0/AkgoMESXQfk+/2QMiZtCtG+wJw9wUmURQ91Ifd/h5MG
	sIKJwbMtkaL+MQLKOXr6+gUAhVH91kjQUJDjr8BWBTSaVadVTSUVuIWaJ7S7X947JnOKP+VWmRQ
	IYAFQCgHgxa+2vCTQd8XXkmlvvfmNb74wa4jzO9LsEvdXTZ95inIFMRhKCLfan6oDISyidqNNm7
	q6eguX7LNp1ZQ4vNtdxWd3IMi8xpMp5H6NthnSG871sIZjAUAQ4Demw7nKq4wENwcCUGFyzRFou
	uyu63XxJd6pSKMuN8h2EaR93h5LlewseHV5uwa7YDInM483QnVzoh0l3JLi50gFfgroyPPX8bIJ
	qsM5bt4jzrC5nwQ78Sje9rRxKA=
X-Received: by 2002:a17:903:1a28:b0:2d0:401c:2ebb with SMTP id d9443c01a7336-2d64adc3f0amr660230555ad.4.1787662461045;
        Tue, 25 Aug 2026 05:54:21 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm37098329eec.27.2026.08.25.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:54:20 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: make xmit buffer free helpers return void
Date: Tue, 25 Aug 2026 12:54:04 +0000
Message-ID: <20260825125406.1710-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither rtw_free_xmitbuf_ext() nor rtw_free_xmitbuf() has callers that
check its return value.

Change both functions to return void and remove the redundant _SUCCESS
and _FAIL return values. Also remove extern from their declarations.

The first patch updates the lower-level helper, and the second updates
its caller.

Hungyu Lin (2):
  staging: rtl8723bs: make rtw_free_xmitbuf_ext() return void
  staging: rtl8723bs: make rtw_free_xmitbuf() return void

 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 11 ++++-------
 drivers/staging/rtl8723bs/include/rtw_xmit.h |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.43.0

