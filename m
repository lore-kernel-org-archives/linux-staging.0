Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9FD3CBE60
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921262; cv=none; b=NV/NNn9tdEkdy7V96yNIPdYYNAvXKWXsB5SU/8tR4WsVWYM8z8cKMECm8M9cibOhGMoGTZJaUnSS7a51Tx/ffi8FGehYb2afXBHWIe2wKp/S1VKwTAX0ikmUIK+9PAT+3xnJ5nD7QEQChO7Eo3xasJAqwUFCfvgsagZMbsJ7LKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921262; c=relaxed/simple;
	bh=1R6ZGxxAhA07h1ZtmzFPmcGfFrNSWG6e1PtnUAzKME4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NeU4u6YRT6NqjKOi6AB2qv1yfQRBaOb5mmR009qlyVJBdK7JX3H6JicAambA2LRsIUpupmF56nnh6Q9holelRhGK0r2DlGvlmHFS3tOsfzkd4HLP2lGX7e7R0977UAC91oHXRYn7ZknoxDsUuxWRAh4pyR07avqKl6meBNws6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvbQg4/F; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvbQg4/F"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0c482e069so784046eec.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921258; x=1774526058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0b77Lh0nf2IlMpuDoJq9zJTXvVsK2aUlG9m0gtiS3Sw=;
        b=cvbQg4/F8xrxxC0w7RH5DPiTViRytygtCSR18ezLXeqBMCZFXv2Rukfew2mcfDjh/o
         xXzLDh3aJbuZNNDSM2SZTrOShVca4Ux91t41+2fXN9DkX7pdhBMAck5mKsx+JnjS51UL
         nABHlq9s8k6refXTwLvE8jGGEgv3w7E2UR0rO1WWbb2ibrJVf1DEkRaejUbfXx6a4T20
         JIO6FiBTaKndK/LUlPl8m3OCuktf39o54EzoeyDv1CIRODXJEye+FbsHYYVmPJIEdGjv
         7Lvhd5nne8BYwwzRvuxkg18WThcZ2geuzxunflsf/OFYOHdg/DDgCfI8/BJNjwF1bt3z
         wYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921258; x=1774526058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b77Lh0nf2IlMpuDoJq9zJTXvVsK2aUlG9m0gtiS3Sw=;
        b=feOG9a7ktkRLBvq4qRiUJTB1jnP4CmgiLvaHDvj0q+WhhR79cMZqfaCsmO4kijYVqf
         ep/ow+iwmc9YfoAzS2dss11m0MNYPPm97EtbU4LDlZBhtlH89mVgqV1xCdydUKPqweiT
         /Wd2N8cd7N+acf50nwhgelmX+2rtBm1O0bnlOA0tsz7PhMp747n26UHIgRNw6YvtaAb0
         6kuBZxZkhxjZmTnW93I1x/43Zc/DnuqbtS7sIgO5qDRRJGLuRtPj8NPqHSxG3CCtWoX9
         8yuoZwWL/jst/+WxMPNAJ2G3Uu7DMUuJILRcm1rT49g5rHL5ckzpEfuFloX+S73dsIiL
         3Yrw==
X-Gm-Message-State: AOJu0YysY7Fc54SffvrZU8cC0Ibgels1CxFeFHxYXZ+yIYakRfKOLq2Z
	X6jaHtd2JunSiMpDk+ppZM5aMHluwzQuQek0vfqCGgU8TXm3Gc1wNzHC
X-Gm-Gg: ATEYQzyjmp6xUqpo2IJlgHRPZePBm1zk31P34CDW7o87nntLib51e5Eb8gFPGYSam2b
	abNQCDek+C9FLiqAXJa5G3xq5CQRZE5mRt3oGVENmxNS3eZ03O8Qwfnb+QJpntjSxkvvmnN1Q+a
	/lmqXoAE6o+8OED2TurRsbvTOSwQvVpn2QED9XBlXpKGL9CBhVP+Ti3v5F7S6IHze3wKIxvcVz+
	fYphLGENDyZH817qulIdyUTj11NIwdg+vwshoWNHw39xserI3TLFJBHnkUlo36ueCZCttxRfINk
	9HQxqU5waa7FsKmCpbYj+FEPU4gh4p2Dany9+9DilaTQf+rUPPKo3rEzy8JjYwG7IXEphknAVX+
	KIHOCqN7JM7fez+wDH9rY3SNneUELlSGkslIJKlBKuf8OBcgOXOz+kpq/YQveU7QbSgfKCyj83P
	Whnyn3jbdoC4LwpZAZjurAAUVPkKag6Hxz
X-Received: by 2002:a05:7300:bc10:b0:2be:d6e:6ba3 with SMTP id 5a478bee46e88-2c0e5089ec3mr3255422eec.24.1773921258333;
        Thu, 19 Mar 2026 04:54:18 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e536896csm8384630eec.3.2026.03.19.04.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:54:17 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: dim2: replace BUG_ON() with graceful error handling
Date: Thu, 19 Mar 2026 11:54:08 +0000
Message-Id: <20260319115408.24215-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst). Replace all
BUG_ON() calls in dim2.c with proper error handling that returns
appropriate error codes instead of panicking.

In try_start_dim_transfer(), replace the BUG_ON for null/uninitialized
channel with an early return of -EINVAL, and replace the BUG_ON for
zero bus_address with an error return that properly releases the
spinlock first.

In service_done_flag(), replace BUG_ON with an early return since the
function returns void.

In configure_channel(), enqueue(), and poison_channel(), replace BUG_ON
range checks on ch_idx with returns of -EINVAL.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 8d649d920..06f4252a8 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -168,8 +168,8 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	unsigned long flags;
 	struct dim_ch_state st;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (!hdm_ch || !hdm_ch->is_initialized)
+		return -EINVAL;
 
 	spin_lock_irqsave(&dim_lock, flags);
 	if (list_empty(head)) {
@@ -190,7 +190,10 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 		return -EAGAIN;
 	}
 
-	BUG_ON(mbo->bus_address == 0);
+	if (mbo->bus_address == 0) {
+		spin_unlock_irqrestore(&dim_lock, flags);
+		return -EFAULT;
+	}
 	if (!dim_enqueue_buffer(&hdm_ch->ch, mbo->bus_address, buf_size)) {
 		list_del(head->next);
 		spin_unlock_irqrestore(&dim_lock, flags);
@@ -271,8 +274,8 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 	unsigned long flags;
 	u8 *data;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (!hdm_ch || !hdm_ch->is_initialized)
+		return;
 
 	spin_lock_irqsave(&dim_lock, flags);
 
@@ -457,7 +460,8 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	int const ch_addr = ch_idx * 2 + 2;
 	struct hdm_channel *const hdm_ch = dev->hch + ch_idx;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (hdm_ch->is_initialized)
 		return -EPERM;
@@ -569,7 +573,8 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
 	unsigned long flags;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
@@ -645,7 +650,8 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 	u8 hal_ret;
 	int ret = 0;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.33.0

