Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DC222597
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375461; cv=none; b=by3Oj/aIIiidGRa1VnFLd/WzfwRR9WSnOaT41fnTTffmO1n/wKwFukvngnMtAz2g7OfA0EQUyjheWA4McW1IDSmxYCjZHSWAzv0Ca5riWgdY5SZvXuAbcpPo6uzqdDjWOG4FFWg+DFhGoNRUtY6uY8LlG68gEsBWzJ45SEtpLHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375461; c=relaxed/simple;
	bh=r1bFfTmOYRTdCcIghTJ4e7kbX167WMAEldTSgFrmiH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3Lc/q/nmG5zmNdelULRRbeEppdq/v8k5IOqhS5L+xSvLCem8dPM3Ql086dViHLzzhTEPFUfxPp++EUnedNxq2LFAJJkvES6VbkvXqw4wI0P2xWpkriE8fh2Xb5+OkJqq9vUrNx0NjngcSMpJX71bgIEB8HpqVnl7jMxD4wZzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFUPu1Gk; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFUPu1Gk"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304cf518c9dso3245527eec.1
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781375459; x=1781980259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBZV18c/aGJCNBhT8IOT5JChuA/ciySBkO+JQCAFe5w=;
        b=cFUPu1GkmG762RGlkLvStdvVAYlfzXcCzBwhWIAhNdzej/IyVNk6O7tDtRKDgvkwHY
         sRoKEDG+SxsI49Ffis+i7ZnvVxlhDeWuWvP0hGKNgNGtfTo0pLJsvomp853ezVvyvGYW
         gwHevGuGSd+ZtC7PiYa3NLqeN/embiM9zHW4rL7oOR0kP4zclZyvUhqlXXTf8TMvq+zh
         oXJnC3ADtGx9N543tPIZZkvnE/u0vHPuV89Jj5ZOkUB1qGUOElqevuQi3QnnVV8NvSiu
         Fh/CZSh+OoTimOxB9VnsZve+g+S+8/P/ekXbJfxzGQm/EA2nh757WLVNYPvUQELvzhdG
         Btxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781375459; x=1781980259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBZV18c/aGJCNBhT8IOT5JChuA/ciySBkO+JQCAFe5w=;
        b=dRAaXAlD2iEgbE1yyMuzDQhdJaxoOsuldu5i9CljIWf/4YCcea9nDzNBMrq1rHbqYW
         HKXbRoKaxAxF1erQOpHgEZo3GZTL+8D/vmDrs5J70ecUA6dx5ynQnBWygqn1uaNVcuMb
         PAvxqI4qroGzmDUX4F9i99pT97n4I2MaJ8D9HywC7SCZM5lAki9GUIP87CdE/NlRnKZ3
         nJrklVM+i/uEyssAlXbSEnRN0NPpuvQ+lezNR+wnKaCAMLZQFN8xv/PN44aFs9/jjFSf
         47G1scWlSpoYj7a8gmdwCcDbUDN1j5ZACTif+GlHRRVcWJd3bDWQWMpewTewXDuIOzfn
         5Akw==
X-Forwarded-Encrypted: i=1; AFNElJ9dk/bGI1oC4h4lmwOU8TTJXq4kA8KveedSh1ObqIhYoCRKR7YW7a2GGJzrSue3Q/AWMv+v8XELe4yKdKE/@lists.linux.dev
X-Gm-Message-State: AOJu0YyKuYfi9v2NPla9tAymFNMpTv0g3UDdKnSWxIsz3kj4tdrTZKiV
	NBudu2LSVD6ISnNbiXpn+bMN+A0grtGDA9ECSQv21NW7+8NYiWJrObns
X-Gm-Gg: Acq92OHpAWpBMAK9fFimsLccrcwFPAW5EJfz5PrFm2DbcOy09QVtgOhkna5hoaUBVrf
	F34hgYL8KkDOrf3Lat2uw/RgaiyebCGrrCY1nI07AFgJ963ZPeCLaH+u3yIA+UM4nKTf71a0CHO
	FY9lY+GhXcJmznlevWGmt67YfSIU1dmHew5OqnZuLqwmkibYrRyhvVJoYOkqQH2shkonVYZb19h
	Gb9n13zojD/5PSNwv48NptfzXRIoNKAXyECHtP81a7RDoyEn+S7p/F+mMsolLyspJ/SJqLxhv92
	MvLtvjIakNzqvtmV3Y6Jg1PVhaDuZjfOA5jMTO+a/F/O+q69DKg8edCQ2ePR0YmUcxU5kQmWy/B
	xGJSMviBJUhwRoKS0mgKjPGu2YubuLyNOI9JzZev+wpVL/8pXB5vXXKsKhvJPEEQYTMO6/IkkVm
	rX2cco0bfoYWaifoodmj2zKZ77SDVCTl4wjVI+Crr/qCJlK6WxVjYVeJK1ExnxEQSqlP3RLwdYH
	1FDf+q1XWwfMfWvsgXqUFrinyCJmGipaoylKzBHz9yAoseX2FsG5Gw+T8S0sSCt/ALsneWwMKxv
	glaEdNyCiP5MB5ZCcQ==
X-Received: by 2002:a05:7300:a14b:b0:304:d835:27f with SMTP id 5a478bee46e88-3093c0f4409mr2139545eec.22.1781375458801;
        Sat, 13 Jun 2026 11:30:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91fb97sm8741150eec.14.2026.06.13.11.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 11:30:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siwanan Bungtong <horstaufmental@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	linux-staging@lists.linux.dev
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove reference to nonexistent CONFIG_SDIO_HCI option
Date: Sat, 13 Jun 2026 11:30:51 -0700
Message-ID: <20260613183055.10425-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in the rtl8723bs driver contains a reference to
CONFIG_SDIO_HCI, which does not exist in the kernel. Remove it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 53ba99e1de00..959bc702d22c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -13,13 +13,6 @@
  *
  * c. provides the software interface between caller and the hardware interface
  *
- *
- * Compiler Flag Option:
- *
- * 1. CONFIG_SDIO_HCI:
- *  a. USE_SYNC_IRP:  Only sync operations are provided.
- *  b. USE_ASYNC_IRP:Both sync/async operations are provided.
- *
  *  jackson@realtek.com.tw
  */
 
-- 
2.43.0

