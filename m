Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8453DD86B
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365361; cv=none; b=jPGe0csVRT4LNkprp42LXFIzMQC/g20Ws0F/8z38K4XCoKmhe/TqaI45wslPm6c/lQoYAXdP3+eilEwz9BS368XuknT4U4DAleybKcKDfI1Jiei4pFcWCeAouJNBtv4k/owvbEF8Bzben1sB4MglHAqmApjAT1lQqLYwKt7BNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365361; c=relaxed/simple;
	bh=S4bE2BgAbV/cAYIRrQlCKFuqyCJ3AdpaNeDWcqSlJtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeddRgvhXKi24yoGrEIct/0CVUyxCeaoGUvHd4/ZdbQHqzUh2LPe61pLbPFuWNUec8iOCBXysb8KjhmX9/m7v6E68g5IOCTockfWgAnpO8tVSh0pNCriGoUQxkBZDoQq+IS9ybV6WNrziphwG4RTY1LnX0WrpvsWCCSPfPI535U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVePqEdt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVePqEdt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso641617f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 16:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792365358; x=1792970158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtdMrgS5OyN3BgVJlDrKUHEutVSv3PFnuFIUQXZ3F4g=;
        b=LVePqEdtom0Jf9vY1AhZyryhgQIE3ERZZ2bpvRgZDRoXIe7vz8nF96zZAh2gfItd5v
         AqQRTzRH7yBGM35Xw/XO/8GVQIrh89GSNOWRm47n5z/7Qmb7Sqv2+APluM9g75enaYms
         eKPJtNMGCawZBh+EXqGntJ5bo8YaoYVNerEetraaX0YmZ5H3ygk7NPLYhQ4oOT9LjyMO
         bY4hAfS0EUB+B/ZlsCCNvq1nHhb1fhXOAZEbyv71sG8S6TkVHy8AJ0fB0Yh6H7yyVXil
         R6kg0kN+5ncNFx4edrq6Qb0UcIIoiGyBUucyvw6NTFAd/L4vknsTIKGuv32U6nk/InIr
         L4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365358; x=1792970158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtdMrgS5OyN3BgVJlDrKUHEutVSv3PFnuFIUQXZ3F4g=;
        b=vAQU8hukecwz0PkRc8MIn/xG4a9IrlXEbtTfCI6hU7KBZGisqPifc+EhBypz5CkhK0
         Kg2/sDfRSxp3OBjorMMKt8b6LfCYv9FDPps55qZ3LMXqqDJMN1tUF/VLXIjxpy3xAok0
         0jGHnM6M+Nj1GjG6ZDRVa9ZpVyjdOuutgktDXAqeHOsqyAm1gCB4B7P4Rh4zINa7zkIa
         PJvzdtQTDQtOpX6ONOGMVUTqfqSsVyRNl1skyK5JEvuJBag8Q+1FjVAqAlootwEqDJIK
         ra8UT2aHXj8AS/uFZZgRhWCc7T56j4VlRetDjqR9GkRQtOP14KQZ66a1wnX9diDCUSpD
         Zn2w==
X-Forwarded-Encrypted: i=1; AKwUvBwSzbD2wWodqEmiRJnSqjX3hxnqf+TebcqYnHecFQ/nKRkZ82UzTn0aKnv0QrAq1zKOa6F43y45CLyo0oaO@lists.linux.dev
X-Gm-Message-State: AFq9FYJuhbVUlmvrrrfydDcMMWcQ96nbl1EJmYKx5N8h2e81NjbnD9Nn
	7AHxQTJPDSNKxP/E9sKNJeEoE8QWa58cxIRYjr+ma6WRBq8MM6BdFtCN
X-Gm-Gg: AYBFou3B3730Y8jR+uTfAHpFPXX8KluvzT/kP1gb9nyzcsWkeKxG0GWUqhUJnd4coGo
	KUlCpUGRctDzTAm0cHtjvgRVg4Yh4f11/FciAaC30rZrZ9eYmsNqx6wHjCULR4nQu+pHYk5M/1x
	/gwfnxmQq3Va16urQhejtmIxWNyaZdMCOmyN3+UV8COBg76iviOwtEWTlZPE2WO99uUOAfrzs9m
	a6LQ8z2o5kryXlYaDXTcYlj1Y6ruKmSyKyRwU7oJ0mWklEbunZNpx2eleeQyE6iUtwyG9nphkwh
	r+6Ph58zFilEAEGCKubjXDcZQanvxar30n6bFu6yCKeEQOEt8LN+1iw3SnV0axCHvAStej5p9B+
	sirz6qGlhzyNSoZ2Z8HufcdICtj5cAXc2Jjbo2qNTteMHD7aL1JMxAAJw6WUQe1hF0LdX/xP1Gm
	ILfAM7Jiotqlm8iVyP6T6cdxgHjDkdU3X6F6MOYuiGTs1Vokihbz7Wb3rQH8//ij3NsYRVoQC/F
	OfgcNafd9k6t4CcUnAwyCvUUg/WM+z8DjxwiEUMdchgz/lK/lIBeUce4u+c0vt6yWTWRnuPzhqj
	bYIcSRENPh9If1LnS+bJioxYSUUYL7em7UbFLB+7SB1+5J1tjEwIDK8sWqzdUZPTcXSamjFKn9g
	=
X-Received: by 2002:a05:6000:46d4:b0:48d:f9dd:e3b9 with SMTP id ffacd0b85a97d-48e07fb2acdmr8466980f8f.17.1792365358372;
        Sun, 18 Oct 2026 16:15:58 -0700 (PDT)
Received: from localhost.localdomain ([102.88.166.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7889sm19432309f8f.24.2026.10.18.16.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:15:57 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: octeon: remove unused cvm_oct_transmit_qos declaration
Date: Mon, 19 Oct 2026 00:15:38 +0100
Message-ID: <20261018231538.74139-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cvm_oct_transmit_qos() function was removed by commit
6568a2343639 ("Staging: Octeon Ethernet: Remove unused code."),
but its declaration in ethernet-tx.h was left behind.

Remove the unused declaration.

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.h b/drivers/staging/octeon/ethernet-tx.h
index b03d56b0d2b6..498a5d68407d 100644
--- a/drivers/staging/octeon/ethernet-tx.h
+++ b/drivers/staging/octeon/ethernet-tx.h
@@ -7,8 +7,6 @@
 
 netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
 netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
-int cvm_oct_transmit_qos(struct net_device *dev, void *work_queue_entry,
-			 int do_free, int qos);
 int cvm_oct_tx_initialize(struct platform_device *pdev);
 void cvm_oct_tx_shutdown(void);
 void cvm_oct_tx_shutdown_dev(struct net_device *dev);
-- 
2.43.0

