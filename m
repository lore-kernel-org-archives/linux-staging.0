Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA42E54DE
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273128; cv=none; b=lWQy1l0YDtm+ST2s+/VmrH900WE8uL9GXFNYCXlCYj+IIst5N0ksSsHbH64BtqcY3xAfJPkweO6JEMg6DCOTmf8c44+Fhvk/T8K5Femw8hFa/kzjA/9NsEYl+c3LKr2/shrhFJ7fvelHCMft2K0yYQ7lMncJRhiUIqq8c4RxHNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273128; c=relaxed/simple;
	bh=tFeZ6eqQEns+BbNpZxKKzRzzk5L7mf1AI6/R/s6kqxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=He4eOv8+IyZTyRHDczTZ1E8FawhA8N8fts2NvPrWiCzdU9QDlcaiDtgP4L3u8To/9t1jT6Yf3jxLdfQ7loE/x5ZraZJCJdydVxip/+YRxZf5J7wNXVd6nhSo9QB/27Hg73+q/Ao+4xqQlcS6lLwU5TLycjIcfv1hNF13jsjaLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c99PtE+8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c99PtE+8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso7972555a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 12:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273125; x=1771877925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=c99PtE+8byA1zzcrg4r/qRdHe8Cv3UdBj1KU5/WcTAD2K7PIQqeu1YyGQxe/jIo7KC
         fY3ERytZcZ2OcRgtERQ01iq+AoFvJdO9AYa7D72OC3gHegqbjSRlzEvT9G2S9bt/jpto
         g0S9OlYTqGNROWVdBv711BHtz8AMFfwgGgH2JRiX42bR4sQHutPTXC2M2uf1F75hO3xN
         SqeF6Cal40M/BqPJCIYz0WB2XbK9+KFQo/MXl9WfpoMr8QqnZ+4a3POy+AL5j+aK7M3j
         E1DKZgpYtzM+u/uoyEFnBPFwklmmZq/1F/XlF3NkTgExVh939L0oRzmrcfsxOFkVJDmY
         K08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273125; x=1771877925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=srNZwhN9JMLeWCo/r9vzRK1V04JEbhDJYS28z382650uMbhLc5tjoYFdiqukkAmpAi
         B/0FP/Px28VaD88syDzSmaR9leVKzrYPvDXGTjDjeIFEht6ehQonXnzJcsNKOz0cH+wg
         tIHey0Na/u5HUBmSCuMOXds+RQAiJk0uQuhxygeN1fgZ6n+od2dM+Br+WoMpSfNdp8h/
         NVjDcKrz8FqUDLrxinO4tR/b55CfzRTnyjzXITKlvlF0wwprjMkHGnQaeMb6zRtG5s0q
         qVHV4hn7xoZpgDDZrD9ieq6WpnEoQ+bsmcQMRqSJgpvFikCOXt6FCQbaKCELQCzV4voD
         Osgw==
X-Forwarded-Encrypted: i=1; AJvYcCWaH3TktVL+8Ob1lFPVBJnauGyYRa26BkT6gH1mPTaFJosDK8g6rnYJS5YvvujxrkUvjKkAn0coi8H0i9Wy@lists.linux.dev
X-Gm-Message-State: AOJu0YxDyeVa3/+PJthb9uIrHBCI4TTl/yxGJIxNVGs1M0z0IiG+EfPN
	h/oReCjubntSmcR1Z5jG/8w+jdHAVAn4Tr6KZKHnlsVxUKH/+MzgpoLp
X-Gm-Gg: AZuq6aKuDYoF8iw+GQ0b7byejlEtfaaspBEV/iOCwXLAtpkkAKMi5kHgWByz2+wwgKG
	7zwNRM0l+G0qpEJ/wCeprYlaWalQ6Yf60WN4sMMJDQgSSyd51ncGQ4TNbcCbf/UUF1Le3ilzLxb
	yenql6+cNk7P2gK8yINgpSkPasNi3LaV7PvYERaFxcVn33BLTPyP95s5PUExv9uZJn2+9zvyM8E
	X1Dld8em1mWHxIyij86+BBfR+PnYczt6ZaquViSyl4WlQsPXaoRgMLQfHdC4PQyI6b73CMFuA21
	Rqz4Wk2v7ZbESBUPNr5gM+rsT7lpLqTFBCo5wlMHiHBjaViatvcajsXT0cFLJhVMSq87vnG6kK0
	5ulGOG/ZOW3eIR907VuJQhZ0f5IWSe2opQuOesRLDOEBW3ACfC0DeopV2PTArAsX8RuHZpaW852
	XrnPLunTeVsygwjOLzUT/evkF7HaCDAFJg8Y+aofGJazQT7EpFPbsPtzVuiFKcmH1F6pxAYtcbB
	b+Ek4w4LHNl8GT/5xnS0p/x4M8YoHRKLod+2q9DGOzaf7Z/RnI6fxpcCYhqFazrCwYEkMxiknLC
	vw==
X-Received: by 2002:a17:906:d92:b0:b8f:c684:db3f with SMTP id a640c23a62f3a-b8fc684ea97mr362797266b.12.1771273124991;
        Mon, 16 Feb 2026 12:18:44 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c7020sm281486866b.67.2026.02.16.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:18:44 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: media: av7110: replace BUG() with error return in gpioirq
Date: Mon, 16 Feb 2026 20:18:44 +0000
Message-ID: <20260216201844.1768-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG() with a return statement in the gpioirq tasklet handler.
If saa7146_wait_for_debi_done() times out, crashing the kernel is
disproportionate. The pr_err() already logs the failure, and returning
early avoids accessing hardware in a potentially broken state.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 602342d11..bd53d1a41 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -460,7 +460,7 @@ static void gpioirq(struct tasklet_struct *t)
 
 	if (saa7146_wait_for_debi_done(av7110->dev, 0)) {
 		pr_err("%s(): saa7146_wait_for_debi_done timed out\n", __func__);
-		BUG(); /* maybe we should try resetting the debi? */
+		return;
 	}
 
 	spin_lock(&av7110->debilock);
-- 
2.43.0

