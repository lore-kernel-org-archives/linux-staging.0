Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9739D6DF
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674630; cv=none; b=h0OUXgZRrUtNj5o8lsq7/RO8q5mu1F3ZVUCyyCAt9OLBL1FNv+/OcId58FZCTuPlfe94+y3QhXkEktdLhuv9+u4p2IE1d9K8JgQ8BbP/+qO5f+DCWP3T7W06/4I8Bmrduny+g57fbg9RpocybWlV5qpfyJH1xG8OfpCXfxmTlfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674630; c=relaxed/simple;
	bh=ZXea1BR+YN8HLwcz05IFzp7+H341TSXGtkUCMjAqUI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPbbr+VYfL1w8y2KZv89zrQ39oBNOc0Boi0nHeY+8+EBwf507YX4Pqns5TrOtdpY+70eVZLqSdGCBx0LQZY6n1wTG79p3Tv5Doo98KNGM2jhzkM39EhwQ9Q7pOPX8jWdZfSE8PURbOQA1hiQMHgMIVW3HUoOc73K9k8Wo9yMcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INgBO7Vi; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INgBO7Vi"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829a27414a3so2800689b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674628; x=1774279428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5n5U8SF9tBDKp/G4y5GVvHf9wmA6XAYgGU0V4fhIFsw=;
        b=INgBO7ViulI15wJzCktOFadmGDsjNbPzWSNCzZFIQ/MUbZMNm1JiUW8f0Dh0lcmKK+
         y++7UR0cZ07HitdKcHo+FNPUc9rlbVqTQVRMZ9/t72RbIIKk4+5I0Kq36LEN2ErLLRbt
         fc13afjYk2i7oePY7AK3Wg16qhTzmyYR4T9YXQbNRm5uwKaYRnbfX8PdZQJ3XKF57QPL
         6cfauAICXNot05vBeZwGw3KQ/zwQZDDVt4G+NsxTDGeA8CXqKXcK1/Q4kaUhmNVcmXTX
         1gGmWvM+3e7d6C5TmK90ehbH0dXiPhH99R/GRljlgCFFJjJLL8VaasMUObykuDz/TnO6
         61JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674628; x=1774279428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n5U8SF9tBDKp/G4y5GVvHf9wmA6XAYgGU0V4fhIFsw=;
        b=d8tR5MYg1b1WRx0O6ind/YIPahbpOJQet9D/Fbj3dvy7yzPMdKhEQQhvWr+c7/O6r9
         7/IyZ+2JfxYaR78AFPz/wGxxEc7mnkH2nfclJzjfI8cTXB4d5ELEV+Q0Vje4LxmOZv3z
         NYoWXzLTe9CI5IsbcVSWsotIWvveC0rY/QdLzbmieq+ySN4Gj7FD8Gs+Bekya//q3mvP
         terufKS1KfiZRt7XQ3l2D5mThoVyQ0PxjOTUfj5R787uuMOWftk43s0sTbA/Rr6llg91
         aLhDu/0wuR3UI46F3BNSiGT0nTnJUFT7wQcF8ssSUXn+8kkEGw4uzqrx8C4UlE5tcfK8
         hAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqQkLTMS4AjVnm7WuWRkcHtxVG0/avdZGuaAMjPluPIQaWJs3iYtVOiOsEYItbGJ1oL4TC9b4wBZaxGGaI@lists.linux.dev
X-Gm-Message-State: AOJu0YxXXYjAyFsM7kF0dqRohr3tp+MAeCG8KHTg8zm03EkQhyZvWiJs
	ZbLrUiZj9tMAvzpzDoq99cHY/zEBC0EeC7brDeDoc00oMr8w68wDT4B2
X-Gm-Gg: ATEYQzx3ys/jBMinIzx7e4Yh2k6o3AeV58i9+wqAkonH9TQWoqeP6kDBupbGD9FtFWJ
	a6cAlM0ASNHdtZprDtSSq2KOkjT8ehQXTXWYTDU0mvDn50diXX3kuQ5sCQNf8JRuT5mwl/t0dMP
	AuaRopI2KuvOfRSOf2KuiwpYyVeTCQHp0IR3g9t7VzEiWTPrF6R5+idakREG7u3NiRu9GHw2zh6
	5kLeyks27g1xjmG5mxB2KLE2g9/7/68Tugfak/X5lmRzQywWoiyH9VjeQUf3/OKirVxNAkii3qK
	/PrI8jYMsXDZuazvVmzfBnqyrYFzi6LtLwwqTgC/8MMOYRDJ+Wl/uqXUMVsATVkFpQ408IEEa52
	3QTkFPfDH08ZbYF7Z2icXVmZEc+OFqxdforBVYJTRvKb0N3GS12dRLvncKRI/BwLkFZFCCLeo0/
	dovT1ts5BogdPPn1HRI5l9ktSMQiyBo6+84Ptb1Q==
X-Received: by 2002:a05:6a00:1709:b0:823:1406:8797 with SMTP id d2e1a72fcca58-82a1988f219mr12466479b3a.31.1773674627532;
        Mon, 16 Mar 2026 08:23:47 -0700 (PDT)
Received: from ekadanta.iiit.ac.in ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072419efsm14694146b3a.11.2026.03.16.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:23:47 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Date: Mon, 16 Mar 2026 20:53:39 +0530
Message-ID: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes below warning reported by checkpatch.pl
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..f4709b2c4f41 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -958,8 +958,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
 						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
 						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
+						demux->playing = (ret) ? true : false
 					}
 				break;
 			default:
-- 
2.43.0

