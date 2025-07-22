Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897CD298CA4
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170090; cv=none; b=EysNnW4SoO6V4JGncXo+N+j/yhxIwbOFxEsnhkJ6hzg/J5/JoWyIiATZS3qrKtF99CZ+6I2/RY2BN1hSPCtxRJBD9pKCMBaZa6JTJGVN3yYOK9Wt/l6Ueof8hLpE4JCxUciOsbkwXX27nPHhgBluJoZjxDVIjDqy7tpXi7aer40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170090; c=relaxed/simple;
	bh=EpT+yU0X7Un7J0hwX8aoJ3Y2Y6ydxawfRWvDqxA+f8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LguPMgvY4BLY3ZKgCWLfdQtK/e8VZZ1P0doa1MR4GrWlLIhpOt7Vpi69N5TW6u2EOEJTG5GIV6XiQAMlFKDegi3tzP6XemuBvxM6kq1Nxp8AJuJvgEyWkNHD/W0+L03WseEFv5TcRSWAPdIUSVEd2p2CA1fBdk83cPmF0InnZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmvLJQnY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmvLJQnY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3a604b43bso873427366b.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170087; x=1753774887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=251cVjb0zmvivJ92aefaYEnL7t74uE93HyIsOFkj1Bk=;
        b=LmvLJQnY991zCqDHbQbmMoj+6yBIKfgmRai8t4HyOwI5EAcxi9QNCZXja4poyFc9MF
         krFZ9fI571PHLnc71CwzZ3gOjh7japeaVku/WD3QiHDM2Q7dqeAfp90bw3vI7889jgGJ
         0bQpkpgrRo2jQKUqn+t7G9e+jl/04oU/1taFPQ3jyZXlL+LprX72RH4UIJzz6a/0MUMh
         Qfj5XTsKotmkq9hoiAiw9mC003MNff27+/hgQgIiDpc/rdSWtTai8oGcciffFxH9R+od
         jbByZ/OSNV3LTWechfD3F2YYkUb+MoPuKyaufmy6d6RGpwgNUKQ8hoDGwTvF7FY+WRNL
         hDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170087; x=1753774887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=251cVjb0zmvivJ92aefaYEnL7t74uE93HyIsOFkj1Bk=;
        b=YdNd2ERC4E9qDUREeXS/4vkFpL8nouI5KvYXIKvvwwRUJld12C8TDDRMY+SH4biq40
         LSIm5RhPGbtwu3yhX56skd8lppEhZ6Pkqplz9xZBYdAT29EfdEftVLF4qT7hTQMXX7eY
         XYoOUKOVZPxUcEtuLoVi1MDzoIO7I7c9Yg+0LnswmCw+n8INtWZ+5tX6HOrTE+Qfwrtg
         tYnRdzHK1p1WuQnFaTA8kEcJBOnSWCwut0elYi27Zc+HS/R8xqQZf6Jnp6vmaDYuUuLc
         ysV2LKXrzNqjEoNq1yz+P/TQZOYwwH976lZwiLsqIGfQD2y1JELnGXkZ/fKvSWqweqFy
         sMPg==
X-Forwarded-Encrypted: i=1; AJvYcCWZTObqfRP8lJaaeh2GwuzvHRSbOjVlTQJ/poLYUfPFQwE/dvtgZ7AW6R4DGEl0t03TMvrZllScLhJf3hQ5@lists.linux.dev
X-Gm-Message-State: AOJu0YzLFJ2Ak5lUYuEeX4EngAu9JnnqQtrlTyM8FggjNxAEVrgEw95b
	WQzIsCqhEzFWsnHLBqjDpAGngzlav4Sv0rsxKu6TU5AtfWleO+BcmU+J
X-Gm-Gg: ASbGnctTZN09W4vGJo/DJaPyUf+ivFJIfDfVxZNNFh60NtACxF1wQQ169UxSeaNn/9l
	vrF4ni/TIQ03bSHfP/W1+y9STlOwJaOdJT1bl4RuahOssKWgC/2RdMXirBqr/x4N4eNPj/wEbcL
	fF6IsO4mcg5ThFvkVBczkDhQYoPZ/CINk5eRVrGxzOnMMKISXAuwBFQh9BYz/OFkl84+tQNVkDy
	WDeG5dFxxdwZ8d/afTpKTQ21Z6Xp5H1uP0NHdV2vrjnkz61pITBYUOzp1a7bY1TkjOpn5nf84YV
	LVwjWnpd07vNReDX9EAPC82Y9aqXs9J52YM0318FDkC+7PlrouyPl/53Q035qZnhnY7PbSYwU8g
	xGjr4URYWjX4mvgCk6MxMEo4=
X-Google-Smtp-Source: AGHT+IGHzurZHbgcRHkHjOYhhPlJ1/IqhDTnA+ua4GEZLIxVcnjr7CmelJgBtJ/VsaI+uHJSvCfLPQ==
X-Received: by 2002:a17:907:d596:b0:ae3:5e70:332b with SMTP id a640c23a62f3a-ae9ce198c16mr2000680566b.52.1753170086695;
        Tue, 22 Jul 2025 00:41:26 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/7] staging: rtl8723bs: _InitOtherVariable is empty
Date: Tue, 22 Jul 2025 09:41:12 +0200
Message-ID: <20250722074115.35044-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function _InitOtherVariable is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 35f48b564199..73561a63401e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1094,10 +1094,6 @@ static void _ReadPROMContent(struct adapter *padapter)
 	_ReadEfuseInfo8723BS(padapter);
 }
 
-static void _InitOtherVariable(struct adapter *Adapter)
-{
-}
-
 /*  */
 /* 	Description: */
 /* 		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
@@ -1122,7 +1118,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	_EfuseCellSel(padapter);
 	_ReadRFType(padapter);
 	_ReadPROMContent(padapter);
-	_InitOtherVariable(padapter);
 
 	if (!padapter->hw_init_completed) {
 		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT */
-- 
2.50.1

