Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086343446CC
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770632353; cv=none; b=ZIscLoEBL/lyEMFXm1Kb4Ld4wmwk4XHuXL/3gr7WTpR2HrOka0KA5I1zph+u6DiIdhT0II4Si6I9Q++uGGPZEqUc+Xtq0X0TX7PtCPx+j65OHBTvfpqYxw3BvOOs8gGqpegLVyIzP3kGPzG5unAmNoO9j+02TmKEHYKUP+yMY5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770632353; c=relaxed/simple;
	bh=0w0jXSbiYvV9PkfHd7Y/gTBwbMDBXcyLKCKvbcT9SVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6/kkJOHrBMBuWnOdC7suG7Ds56deVJlTPP9QnJbVSI6ktIzaGjbzPNWD1o8/HaVHKCVpHoW3MH/tCRMx4CsW843ibmMS+p/P3meZLLsDEav7RBMIS3bYM0s09V8nk0OtjuYmFTrX5rhjkDtVnSS4mUi0uOP3dfxXJr1KW6XUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSpCOWGW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSpCOWGW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-823c56765fdso2350346b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 02:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770632352; x=1771237152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0yJ30IO6L9zumScY2O/11JIUZV+AhdfVdk5gSKn/lk=;
        b=hSpCOWGWQdGIDa7290oqhckAWorI7wGqwkxFPjc3rRM1YInE0MNvDO8pyxYMDu70OY
         ydg44demuYmDwm7ruZNTYu8YnmELE31zkRTShxvzdaM4DEaIDsvHXsX1O6VtRKKPzQ9w
         nRArM01bn1hut1v2VYItKMMerjo7zfAycaDVP97+1p7aAz75cvIn9VbEaPjSXbncPC5m
         oNITAb+gB333amH5hjSxmPj/fJAa2SJBmvdKCAs+rIJ0taXDohpZV55IshaSyRNyB7W/
         escRJZVD1Mwi3jMZWVxrgOxs739wzXYNa042aL2C0lm/Ehzu9+f/qy4DlNxqi3Vc/Q4C
         j22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770632352; x=1771237152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0yJ30IO6L9zumScY2O/11JIUZV+AhdfVdk5gSKn/lk=;
        b=gcslH93pwWjlzdF3qjNL9w0S1ZKBvS6QK7SghtO0v/l+8IW9JM1rDldqyjQ9bur/zb
         vKPPbCMSGkFwP9y9y4l+6h4GsmKHVfU5HNThcGIHPofdFB2fxqirpLfQAkYDmGOeXXqX
         4Il5K0wK/z0QPBhPvo4S/lRLSv5fnUC44/X+8nQT2ulzLSg8SeorBbR6EIvP6gKalaNv
         eYnk36V3eIDKYSICEBKc7yghYGqODwEGbnScPuKWsn7Y3tB/U41p//2g1jCNShWax75e
         ZSwGvUvBGl1frtSwe6xUmebdbzrG/NqH6cIdA7iDzyEMIEz7mEuy49779m3z8fEYPwP0
         eq3g==
X-Gm-Message-State: AOJu0YyhwJHpZp0qzwXOXxAkTIS8UeDaL9cgm+pqfoQV0RHNTfIJk88r
	RACV2S49xyBbB3+11d3Gb1iiniWFEVsUOdGXFRGwHceA+qzwvimbr+qH
X-Gm-Gg: AZuq6aJh2PDc4b4feLZz9IKfqO/4PWfD8w11RLfCXuO49AMLvdFUehGjAWS83DL7nEW
	ivB+aa0KajpZ5/tyro/6dgbgjZgn3PbX+f0UXPmCUUMSVa227rlYWKQb02WlGYbgC1jd1nxLAGu
	ZxLNU6Ukmc5/3v1NBTbnPk+BT2I6Tuj3ocMB2Xqi6JDTg4RVn9ArRC32g1flj1z29JIaYnCO/12
	vXBSJgRn5jwMh50dciuMOZUpFXi4BNqZedBC7vj3vwtoC/FdJkWXNwOjmhlqwnE8EbBn8oAJHfB
	Bk4D9rhQRkclUUIrsLBJuzFYwHj8S41F03jVZxLVHyJ4tLtu3/TkXzyL70CJA7PqTUOMGBeZ+a7
	pV6yxIHYY4+AVAwaV1L+s12by5Ty+68GdwCbWtGR/FgRVnJv9RonhIEpVahHGwHOcPsHixX17Uw
	s/bRLXDn3xLCZtUSFkvgHo1R+2TREZc9TKE2pjKn4YHmi+65KoDp5TA2BctS20vBgGeFq9ZtcqU
	cffkMp94GAiiD9w/2v0vHSc0LPf407RbEx4wMP1/5ohI0eD7aRzqUPTprU=
X-Received: by 2002:a05:6a00:4507:b0:822:d43a:103f with SMTP id d2e1a72fcca58-824417a44f5mr9635358b3a.60.1770632352256;
        Mon, 09 Feb 2026 02:19:12 -0800 (PST)
Received: from ThinkPad-E14-Gen-6.. ([2401:4900:b92b:c483:8daf:fce0:4f79:1dc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418856d5sm9159740b3a.38.2026.02.09.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:19:11 -0800 (PST)
From: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>
Subject: [PATCH] staging: most: dim2: replace BUG_ON with WARN_ON_ONCE and error handling
Date: Mon,  9 Feb 2026 15:48:29 +0530
Message-ID: <20260209101829.2121131-1-ysinghcin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG_ON() with WARN_ON_ONCE() and proper error handling in the
DIM2 driver. BUG_ON() crashes the entire kernel, which is excessive for
conditions that can be handled by returning error codes or exiting the
function early.

Changes made:

- try_start_dim_transfer(): Check hdm_ch validity and initialization
  status, returning -EINVAL on failure. Check mbo->bus_address validity,
  releasing the spinlock and returning -EFAULT if zero.

- service_done_flag(): Check hdm_ch validity and initialization status,
  returning early if checks fail.

- configure_channel(), enqueue(), poison_channel(): Validate ch_idx
  bounds and return -EINVAL if out of range.

WARN_ON_ONCE() is used instead of WARN_ON() to prevent log flooding if
the condition triggers repeatedly.

Signed-off-by: Yuvraj Singh Chauhan <ysinghcin@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..58b09fa581e0 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -166,8 +166,10 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	unsigned long flags;
 	struct dim_ch_state st;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (WARN_ON_ONCE(!hdm_ch))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!hdm_ch->is_initialized))
+		return -EINVAL;
 
 	spin_lock_irqsave(&dim_lock, flags);
 	if (list_empty(head)) {
@@ -188,7 +190,10 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 		return -EAGAIN;
 	}
 
-	BUG_ON(mbo->bus_address == 0);
+	if (WARN_ON_ONCE(mbo->bus_address == 0)) {
+		spin_unlock_irqrestore(&dim_lock, flags);
+		return -EFAULT;
+	}
 	if (!dim_enqueue_buffer(&hdm_ch->ch, mbo->bus_address, buf_size)) {
 		list_del(head->next);
 		spin_unlock_irqrestore(&dim_lock, flags);
@@ -269,8 +274,10 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 	unsigned long flags;
 	u8 *data;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (WARN_ON_ONCE(!hdm_ch))
+		return;
+	if (WARN_ON_ONCE(!hdm_ch->is_initialized))
+		return;
 
 	spin_lock_irqsave(&dim_lock, flags);
 
@@ -455,7 +462,8 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	int const ch_addr = ch_idx * 2 + 2;
 	struct hdm_channel *const hdm_ch = dev->hch + ch_idx;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (WARN_ON_ONCE(ch_idx < 0 || ch_idx >= DMA_CHANNELS))
+		return -EINVAL;
 
 	if (hdm_ch->is_initialized)
 		return -EPERM;
@@ -567,7 +575,8 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
 	unsigned long flags;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (WARN_ON_ONCE(ch_idx < 0 || ch_idx >= DMA_CHANNELS))
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
@@ -643,7 +652,8 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 	u8 hal_ret;
 	int ret = 0;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (WARN_ON_ONCE(ch_idx < 0 || ch_idx >= DMA_CHANNELS))
+		return -EINVAL;
 
 	if (!hdm_ch->is_initialized)
 		return -EPERM;

base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
-- 
2.43.0

