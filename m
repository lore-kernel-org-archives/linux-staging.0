Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A529619AD90
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 16:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355139; cv=none; b=KDeRloaFwxmV2rU7D25Pc2FuSR5yVWk8857rncy5B9K/uA4sZRdsQ5CC9vEgXeZ07+y6MWq/ngP8kvS48dj6TXchnc/9AUizYh/WYf4TUFmc1t0YNLPdtFOzo/NPz/HTun8FhtYsbtQDIf7seo/ad3twCgZEQn7UWWRvVB3Ax/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355139; c=relaxed/simple;
	bh=fnccZPll4N9Oiu0B6NSxpKZw7iCJTTDkBMpqlHQOG8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIozsBRNnQmqsztaleMM59K7A5IhoZUuyk1iV245U8DSXqxT/q0A+12y1cCSp8SD5K+UVVQ98thpJqrzsTCOeSKJl0qRk+fLRTdzVMJJAZzFq7BCBh/CsWq+5j/m1OpL7af4GIN7E/1rTO3E35S3DEMByxClR3iskqlTjRnK3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBjDcoCt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBjDcoCt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38634c35129so13092403f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736355136; x=1736959936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHaB+dKhEuYryj3wDAeq/qbU6r0Z/A+voW5E087kcdw=;
        b=QBjDcoCth1nkmoQ16UJyA4vGOXirEXgpcRo5jqqEoA2l6Ft40avO3d8miE3YSbmUvm
         oIekKLMpGdbqcXtYyOf0os+EHppEAnBs7umzGaB4ESd3+K5/7s4LuEtWA/mTcZiC1Rp7
         06RtEkwmzuZFkP9vAncU0w0VP4ubkMnzirFua42Lqzw18oPRS312iHGdPuAVZwLs2SEt
         X5tt1hr/0eVAp3gcUSPlnwVlS04Wtqhb7ylWwNlLpWeRfpdcpeuBv9QM0xx/tjrIb54f
         dRBdS8Yi8yAMxtuY3PSOb86+rKGxzh2ddC8NH6tRsCX5xKJUTE84fcoCnqhg7n2M0n8w
         MXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355136; x=1736959936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHaB+dKhEuYryj3wDAeq/qbU6r0Z/A+voW5E087kcdw=;
        b=iFDv4NdYCfnpyqHDnt/0MuzPmz9Gb/yYa4nPzEWm+SjTJPzl59olJvHYjZviZneeip
         ZYIgyECwIq3JLKJhcaBBDD5luEoA3+XAUnjmdCV7kedVSboVyOoG+nL3MldNU92HOHpt
         J8kwmdvqdUafCEXYyfovy/szQwr/ySL1oy5ou/fAyLLRpR3oUgtOgtq5QiuGd53yrwGa
         hzto6SBagel92W7riORCnBOHmATdGyjDFeUqu+xrf0QqVo3Mye73w2s+5CrJmrHmwQNT
         GfKtcWe3wudd+F9gfBh5BiUuv6SfKjdMx80JFnp6erzLFwm7K9jQfWWd81l24jpeuupy
         yMkg==
X-Forwarded-Encrypted: i=1; AJvYcCX1xn3mOl0yMpsOzosc3xusqNcMVCmBlPcpyK7KEly4K96Fy0hJu+qGvKvmwooXLtsWbA2PVJcBdg+W3XSB@lists.linux.dev
X-Gm-Message-State: AOJu0YyeLxoaD+BBV9Pi3FyydxA/kChBmubM5+T9meTeCz/uhhZkBoLy
	DZ4C9VUKP1t2suCJxXCeIcEHdDCa5tEcp2bvgqh5gHo1oeBSlZkB6IZinqT0
X-Gm-Gg: ASbGncsu9bYOK9frBjQTyOquXNh6QuG5C9Wn2Enx2uDPH6fzE9h++CrhVBufu/6lqBu
	Jz4QsEE2OK1Kqbqm8Qfyn4hx0ID4WUCR0QQ9NgH9pjIVprQODC74DkipW3cgY75BrQ8L9atJtun
	fu72eIeFMP8csDksqQLRU/EQDlrio4E9HWUqfmiJSHd3PgNY3coPoyWS6ipsf4MW9o1q6xIb3NG
	E0AwIspapc8KxHxj4lOzrNrfD3Dp/jPxeuYbUv48TMItGy/Cr/ik0x+OiXuoFtBBVTig4S52URj
	Bh0tNQ85GY9nauzA
X-Google-Smtp-Source: AGHT+IHEbtNoyQ8OPNA6sA97q4i4D/BmEJJnOHv973qV7kZIPDy4Vy3DTpyfiQTRQlihHgyuzzwYNg==
X-Received: by 2002:a5d:6d01:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-38a8731508amr2738680f8f.35.1736355135792;
        Wed, 08 Jan 2025 08:52:15 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27b54sm26717715e9.0.2025.01.08.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:52:15 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] Add missing mutex unlock on early return in agilent usb driver
Date: Wed,  8 Jan 2025 17:52:06 +0100
Message-ID: <20250108165206.20721-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no matching product id was found in the attach function the driver
returned without unlocking the agilent_82357a_hotplug_lock mutex.

Add the unlock call.

This was detected by smatch:
smatch warnings:
drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns 'global &agilent_82357a_hotplug_lock'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202412210143.WJhYzXfD-lkp@intel.com/
Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index b21eadabc466..c22c6bb30776 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1365,6 +1365,7 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
 		break;
 	default:
 		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
+		mutex_unlock(&agilent_82357a_hotplug_lock);
 		return -EIO;
 	}
 #ifdef RESET_USB_CONFIG
-- 
2.47.1

