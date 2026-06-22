Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A535E93C
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110500; cv=none; b=devTDdFGiFljlKu6Li1es1VCjH1Z8OiRj0dDeKs3t7LThZBj+s1j5WyvBplhsd+KW3HoWjZ6sgp43JcvvZWtXRc2KSQR4jov76E+J5zCSnPfPXsU1keDeXSj+t94+d9M3i3U0lrye5W7yAxYoyZfEtsZdeDeHd7KcN05Suk9O5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110500; c=relaxed/simple;
	bh=L3FK/g1QRfSVW/YnlQxWhu3/99/xxtCfEcoNJ8UIkDs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u3pkqeVcflFnJV2cugwAm2NeABlylI1DrI3YyqdYO+crQSQajBxwApftVbPleaJLz8He/PwYwsilCzQe963lNg4petpgA1Uuzd+jJaVomYXA8FVZXOp9f4O48sPUFbipPhthcC12nTQ/e2S+XNjJ/YOwTyTAjO4nMHE/vF4L6ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAWP/BH9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAWP/BH9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6ab886da6so23623005ad.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 23:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110498; x=1782715298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeAUUiGbJ3n860yht7IUw7ZzshulQ0h1wfQX8R2AOWw=;
        b=lAWP/BH91mRC+f25NienuB/IMioRo9nfz5Ui3S5PnuDMAaciaSf2tdr4lt+6YHDOJ4
         2+EEPDYY8oesQQxMqiH4WJa1wbhY8P8PwxtIbiuNJZCbwW9apnkCTIpxRKdKN0oog8yJ
         ncFiOEbhoWEEA0hhRErOVdJTonAA785xXBThTlDxnHASj9xCjlqZ3rNFj7KDfg+B5l/I
         9xnlO57hHGSIFYLAafVu8XumXdoM79gObKlnJM+UwzeRur2O+u9A3UsWRxa+p+kipaaf
         0LBcwE790lIl2Wm73dfMS/4mZh1SOxwGLvW3MIOsC2/34r5GKUF5K2JNdJ4hyOMnYBnc
         lKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110498; x=1782715298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeAUUiGbJ3n860yht7IUw7ZzshulQ0h1wfQX8R2AOWw=;
        b=HjHfnfGRqqGr1K9e7TskPg2f2atfeyKkMy/eTBu9VrQYdWDkMZgbQJJqc6zrfA+/jY
         Pq5/m5gV8wQ1+4yPSDw+5C8PIWudI0h4eYPxdsWQkos2mHu13CP9DOhfcLQZ9DNdjztC
         w7clU3bIrPrlnXElKYj8JgkbilsQv7TFvnZPcfqYn4t18nLFj4J94SOFRPpZWcm+5Pvk
         Lm/jD1Lvq1X02LHMw3aRqVa2oruWKpolWoGPm0or0ZmSWavb3Du9/igXM9Qn5OsH9Klb
         AVIKeGpLMvdFARJ9kxdK1CeKI/nRTdKJckpTcAiOI/XhtJCb+pZRr8U8dXOKCcD02jyl
         LguQ==
X-Gm-Message-State: AOJu0YwehZ4v1yUhe48rksMdN2qBAj2PjE9Ma6cu0fDvG35bwn7Y5lLz
	Kdrs7dK60oU7PhVQhpvEft3GcuxFo6p5fO5eS5DbwAzdcZA8/8wfeb81
X-Gm-Gg: AfdE7cnldU7AN8fVNNVB8dmGgXwjxs2YGcqiApHtwvcO5Jjt1KRKtWZ6TPTeMZuvlhG
	tS/T2AJrvM2/t167r/QXDP1hERViTppggZMbDr2Bh2S7NUWUTIeg+EWs9mHxuRFzIQJ1OWPGZpH
	l9RBBch3DBnrAWycxhiDOcRhzCQAw4luy03sBhwR1rWNNzyBVeKeT0F7hfU+O5vhIXWeB9R6KJQ
	0mXdJStbFOCQBgvN2dahrl4OapMPiWBKtI39EkXxcLZFZx14ngVi6OKejGsX6eW1lUTXKhULu0J
	nkE5suZPhYoXhXmooCSGSMyzNZoQdp9pAbGO/3kJ/3+GLT4Mmzhc8DeKogu8VmU4DJEmuhq1zqj
	mASH4eFxrF3LmHyKo5qqTdu18li8mkqUaw4R0zuedftbDAtIe1qCz9u+4z2ojT4a/5o8rWZHurO
	VI/WtOdVJdgnJ3ReeCVcN3BCJKnSiQI4EZEUaoPLE2HT/BXLAY18FduV6jqWl3xCE=
X-Received: by 2002:a17:902:eccf:b0:2c7:a981:93a4 with SMTP id d9443c01a7336-2c7a9819587mr14472055ad.11.1782110497971;
        Sun, 21 Jun 2026 23:41:37 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c799749cb3sm21123865ad.72.2026.06.21.23.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:41:37 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in os_dep
Date: Mon, 22 Jun 2026 06:41:26 +0000
Message-Id: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces bare uses of 'uint' with 'unsigned int' in the
os_dep directory of the rtl8723bs staging driver. This covers the
remaining files not addressed by previous patches, as part of cleaning
up unusual variable types listed in the driver's TODO file.

Note: os_intfs.c lines using 'uint' as module_param type specifier
are intentionally left unchanged as that is a kernel API requirement.

Each patch addresses one file independently.

Moksh Panicker (3):
  staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in
    ioctl_cfg80211.c
  staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in
    xmit_linux.c
  staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in
    os_intfs.c

 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |  4 ++--
 drivers/staging/rtl8723bs/include/xmit_osdep.h     |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 12 ++++++------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c      |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.34.1

