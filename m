Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869C2D8792
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884957; cv=none; b=KpthiWJOpYvFM607WqxytRZQzU1kQR2UWTub8AggqwHHvKxKaGHGSJNT9zxcS0wUaycgXNTVkHkrOptQmqePstB3IySr33vcCrXj2NBWb9JVpgT/3egFdEGCLESTm6TkwUU5U6v5G023twlpk/mShDxdTChJ58rIIqG2dfoMHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884957; c=relaxed/simple;
	bh=HFXwuFT62wYnDkN7NPJX/3nDmqXAq9eD9UHg0mlHeBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzaSzsOeGpXE/JLc7QMM0ML1t51Mji+BZgBVbHOr/n3Mz6F9PIgMQmnDm3gS6pGXJP0HVs/Och4+YQKhVd1ooYy8pCfeRFeV95NkIJm7eW1qQlZ+NPqJVfouSwvd4Ch5E1diwCAIetE28Ba3mbVE84ilh/fTBYByhum8Jtv5R2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRyxpWys; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRyxpWys"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48336a6e932so29926755e9.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 00:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770884955; x=1771489755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/feMcERx2nxrbP5HNOWWcRRKUtOfFXPBAyOoybmzow=;
        b=GRyxpWys8HyvLm752NGCM9V6lxifeT8iNRSSO3gHhnqIZdpI1EQsuY4flnhediAFWh
         UNIQ7US8H+2NHI2OkQJcGa36IgxLHr87XratZ4neyl539Pz3GWN/AQ1BMyJAqPAL9kdY
         +Vm9qS8mNYmhdf/Ovv5mA5AnAXiYxELFtCnSAXezKmDMT6mk416jXyph3V+0Ux5NzgbB
         inVPm0IWt9OcpowRVgskeuXyYI55GvObcrRtU/C0RZ4tZdMTBt9yGlGul4ol3J3wh2rv
         J0MMbqENkUhowcxd88rBlOKaSnCQ4xspeOko1cNVCJsviZNAmqP8/dEi0qvxSTIfjxMo
         T7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884955; x=1771489755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/feMcERx2nxrbP5HNOWWcRRKUtOfFXPBAyOoybmzow=;
        b=LDKCzu+kKu3gl45sqxJ2EK7hPp1q+UCJHOOQvrqoYErpbOYkFa/yV0/fmaliEN08iA
         0SL9nO/oiRxw/rTJRkM24JmRTQQnGQgVS/mfEwEuJRcDY4BNVjL62coVPIc9NtoK+djK
         /EY2zxoJa81FuHQZfBKoBYvLKaws3e3q6bG4OU63qR8nCt5U2jxhhB7ArpjMwYpsvUBP
         l+VWRSCBe4wgXh5CRWV7r88VsfPYrKczL4SWUagm6Sl+1h5YHS2SLuYUyCnN5IsEFukm
         Ar/XBOjxxtC7WyQEv78lTvwekPuTKwanFGNiuikqQ1LB3rm2mZE8zxF+/AwnNHVC94eA
         DFEw==
X-Gm-Message-State: AOJu0YxG7hwsTgyOwueYUpiK8KEf1Y3R5LJRhJRYsyWE+j40OqSysrL/
	ZKdqLLvR/ylgBY1Gt1OlUjuT5aMrajqfR8T0QoGHSAITG1/oG1VXKy1r
X-Gm-Gg: AZuq6aLcefjO4FgrrOu0hjZJ8bD3qxlnvjnxrFqaPeJJfT6hat3Kq8tPM42kCRiddJC
	uZnuRwX/omktYLJDLmIr9EWi5jugAe38WTHJvqsgCEwigZd+Mi51R81NEwf1IRKg1xBp7O6xhD7
	Y/MPciIDyFroMponjHzZLvH0UqwFOFVNOOl53Frg2kQS0al3XmATrKjmztFqlmUMdSdAuYPeAYO
	sYLYXsSMaCeo4Or1YQowNCKDSsKz8ZHWWsReL9J0nGT5tx7lJTy/odfpLVsyegf+pJH5uV9KwjO
	UrX9/9t7VAO7D6V113ten+RJBOo40UxJ2nv6+EkfaVTJdtcTLyZal6LyxaOhhkSv/N3pnL6OjrV
	v1bj3lMzFfhMhl1/O6V5vfAY7AhPvH7xO8TosUShADo+psqbJw5gKT+ZJNpCbbtn4sg8eygy52a
	iFJgqiNAqm4QJ4tBNEFcJnwIz4aYw2Cm9NkK4WOA==
X-Received: by 2002:a05:600c:c84:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4836570ec18mr22352555e9.22.1770884954926;
        Thu, 12 Feb 2026 00:29:14 -0800 (PST)
Received: from sarah-VirtualBox.Dlink ([147.234.64.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a627c96sm59341245e9.2.2026.02.12.00.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:29:13 -0800 (PST)
From: Sarah Gershuni <sarah556726@gmail.com>
To: gregkh@linuxfoundation.org,
	sarah556726@gmail.com,
	dan.carpenter@linaro.org,
	arthur.stupa@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8723bs: fix blank line style issues in rtw_io.c
Date: Thu, 12 Feb 2026 10:23:57 +0200
Message-ID: <20260212082358.3403-3-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212082358.3403-1-sarah556726@gmail.com>
References: <20260212082358.3403-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl style warnings related to blank lines:

  CHECK: Blank lines aren't necessary before a close brace '}'
  CHECK: Please use a blank line after function declarations

Adjust spacing to comply with kernel coding style.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 7bc09a50d4dd..cc00ea80daae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -59,7 +59,6 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 	_read32 = pintfhdl->io_ops._read32;
 
 	return _read32(pintfhdl, addr);
-
 }
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
@@ -76,6 +75,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
@@ -89,6 +89,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	ret = _write16(pintfhdl, addr, val);
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
-- 
2.43.0

