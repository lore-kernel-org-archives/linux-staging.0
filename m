Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5C3DA7E4
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428847; cv=none; b=DDb43jCmxV5kkWoE39DqyQ2F6BjEcG2XySinmsBX3FScVCFDQPYDz/OBIkD7tfKdsBwHtRnYZid4/6NYjHtg5sgiVQe1aHKfmR515jr2wghcXyqKau2D/FVDWs3u+ggNQoxFkcDSI3EbfkiO/g7J1g2ROBX443XXJqeSUYc3TGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428847; c=relaxed/simple;
	bh=61BkP7lkzEn17qdI9r2zipRYie0qOjpNoqb+kuIvi6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epL3Or0uY+uzURdwrq3SYg4fNpDUOdIIucGB6XZ/iEYU94prVBmEsVEdNn4eCqt45On8pj6qchJMSVt3C21kMpEHXUNWDaMolE3loj/dFdOW0AtXpV19g3BwLltTsrhG921TcHcKiZWeEP3jdR+zyhc65tukl6/VHp6CyYyo1LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJfYA93O; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJfYA93O"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so22685365e9.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773428844; x=1774033644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4obB7qeQrJrHhNOvr097VsjYS+mck27GvRFQeFC1qE=;
        b=bJfYA93OqbgUOjFrWSzzfrkQ1Pl8lWj/7EDEF4VZQQVm3IkeUTQxnub6QioZlvuCzS
         rxs0bx4pcMr6bViGudPuslEibE3ZoeqwPEMI0l2+mn9BMvHpizeD6aMZkV3hHHI6TjUF
         likEmJByoeiKEiliJHByut2NV4rX74FfrRNpIW4PvMtj+rmkhx3/TqxQaPKY8moHqn/B
         2wJukZepBq3p2XUTsxMhnOlKY5vq5Zs3iQpobpGledNqpMMQMBq2KYUidKmRTSylNqR5
         Rq2OrgJBwEyPNr+r3woEhgB23MnWvBiu9kFlmqcduwQ3JxY5Z+/G7i8JTqnqdY8dCM+U
         wrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773428844; x=1774033644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4obB7qeQrJrHhNOvr097VsjYS+mck27GvRFQeFC1qE=;
        b=XXoLSttcrb6vg1N9K+UpBlAoxSiR1eJ83RKlWaxtqioM6upAgRJ3b5f6LSRM7cNlDT
         wQiCYU+7E3eiBB0bXBYXO1+3PlLWuQfuG66NVv58Iq3dQT+pobO/TCEg225ja0d+Jx5J
         dZV6BTnH6zDHuady8gxoC0SOv6l/MzX8iV+xe6xFqC1Ewx8arh/RInV2w4DtCf+xrsMG
         QXa5sy1YUsWqPwx5jfg5qtpLtWvLlD6QDgvIM8AkGMIjlTKIAIskQ6q7mE+hiuDcGKUC
         Rdhi4SWZO2f+JgmZx1XB1adaSgh+b1S//IXBa/3RZr4YwCsg4uRwb1Doc6ymObZ9yK6O
         EN9A==
X-Gm-Message-State: AOJu0YxQzWvMFswJFDsr3CQCI5a41J9qvnlSbavuPKfISgSfHEwX0bM2
	LOVpxDYjJwmkYW+tKqBfmU3rrx/9ctXthh/yIiiLD+T5fzbsUX9mgeEV
X-Gm-Gg: ATEYQzz6U7DJqMNXvvU4AEmfG2vbIq3SS4uOojme0PICqD+95LxwIoqtx2a4gH6PPS2
	Sn+4SMytU2PC976wplKIqb6TzeUeZvwhpJy3PkiCOBoASvU5cvUptAL9Qum4B+IaqhgVUvlBUFZ
	4uCBGRmQORVTTsNNZwZjErLldSySUkA+drFL233v/RBdchqUJQm0ZO+Pf9uKqpX1g/8S0BadO6V
	EOz7/P0pk5T3qQ72UuvTnqQ5lKTTxDHNj3/BImnbJwa68MpgFfYE8nV2yiRzbv4zy2DgyM4G+Ay
	Cjoijnu0txsKDxrNsoq70L9BVIGOo+w2Wjc8OXog8EpICm9AWbOpHRn20w6xi4TmUFs9tBIQW3Q
	m5uH05h/YDl7q/ZE1+XSOraGAgbwwhHRoj0rvcZi6xCndjz7TqXCzawvuk+aCLVdyP/xzFRvKeK
	a3dSTeQYPqnF6biR5pG7/JiXyawHml5YfJgSXqSmHcGwdOC26zejBa3MojORdtqeFPRWq/o1FEp
	w==
X-Received: by 2002:a05:600c:8714:b0:483:ad56:8d16 with SMTP id 5b1f17b1804b1-485566cf048mr75728215e9.6.1773428844266;
        Fri, 13 Mar 2026 12:07:24 -0700 (PDT)
Received: from localhost.localdomain (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm66656585e9.7.2026.03.13.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:07:23 -0700 (PDT)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused rtl8192c_translate_rx_signal_stuff declaration
Date: Sat, 14 Mar 2026 00:06:58 +0500
Message-ID: <20260313190658.13525-2-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313190658.13525-1-azamatrakhim8@gmail.com>
References: <20260313190658.13525-1-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtl8192c_translate_rx_signal_stuff is declared in rtl8192c_recv.h
but never defined or called anywhere in the driver

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index abc7a7c418af..1a04c3454b80 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -34,6 +34,5 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
 
 #endif
-- 
2.43.0

