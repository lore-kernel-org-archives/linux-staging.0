Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873573;
	b=27+nUxKeW4lJ2DIQPi8XEMcNFBulLikeeYQEJnoeALUOwx5e0in4ZlbMg/AkigOyRjiO
	 x5jCWoJMw9o+R8ZGP4EnPIrlGnQ2OIFY5SBI7IuKJ5HIYRpljP8LZroVJNz+M10gNz/M/
	 Y4tM3VUp79DWjwpVWqHcs1++yQqAR76nYIUv66VUqBACINMdH/yRBsdZ1I69g8MEtih5E
	 oX9i+FCV0H0LrsCx1XpzkRg6K3Hcqva/IdSfoGOBSUMVYMmowM/TfhRXLpUMuMQMp6JbC
	 3qIwzg/td9RWcQFFX6kmQsAQ7IT1IbKtcpHtvhm03hprVm78JXz4re7VPldauBWOGqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P+/zfjidL1R10zub9C45JZCt5+i82Kyb9zsDu0eixEE=;
	b=3d+ndgHlOu42ATtvg+ZJNiD9sFx4bIao7shmbhgXpsMJ2jf75U+nNjwC2Cfy+qtBN6wm
	 GrzWFCBFIe1/7lMCaB09nk97GrJTtEQVoZAg7aQMdwE43Vm+idxAFd7rwy5lHXzDcDt6i
	 hAYS/ZZAvT8l3c/yS0ik3hUZkID7qGU3dBzacxnqXzB9iezqwytgM3w/qMNLFF7uxjxLS
	 dcqgRup9g8Ytt85y/k9hyXQI1/RnGVPzKEXYG8u+mnhMPWHCoTZbzYgiQmyPiUWCigRk0
	 pNbL3Ll+xNhvFm1dpeThXKuSWzIsxGoGH2McSCw3SiovFXKXOMS1Mn4wHKVG8a+m9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uhil/rYd";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD54606D814
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 10:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD54606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uhil/rYd
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso2212681eec.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873572; x=1794478372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+/zfjidL1R10zub9C45JZCt5+i82Kyb9zsDu0eixEE=;
        b=Uhil/rYdzzdzznA7I/mc+Av9KMnDeZU712gSpRiyB1WDvIQPgEJeBJGRH2woXW4VGR
         0ekpp4UGYw6wV7W6sCE2vLsFj9wr+X1JW50hpZCIs8+6hTOZhd1PZga3bbqNDpiUgD9l
         VqBTPav8KN6uI9lkhSoDwu8zTCt9tn2uaTqbrosONni+yxCKir38ja+rNkklfzA/2uN+
         feF05TqjpV3PgoRiVWuZb/GieGVJ9EhxH+oIopiRz3P/ePRPsgWPDuuwMbcGJMR/u3nO
         7K9ZSCiMf9dQx6kSXOtoQacEz8GWZU3P+5HhO5dOLEgIB4FrYt73tl69WqSBrL9VoITx
         wjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873572; x=1794478372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+/zfjidL1R10zub9C45JZCt5+i82Kyb9zsDu0eixEE=;
        b=r+ihbB5eCBupHTtFq0vLIfxQ1CR9tkTF7OLHKyq2s1aWKaQE0WjI59iElV8qVcxvap
         apRgukcJeWLT/y+nvn5H57ciYjnpBHNLXA7huF7Gw9rX3svWmPJJRw1J4n6GRXLIAjvi
         Rr4SzF+7AUiUSS05HvAbouUnpPKSRyxQpRnSdFVAEVZEm2nmtVP11MuwFd45ZLfzrcBU
         JjgLifWQITdgvEduLgpeyeuwLADTwdqJew5CpkZAZ0jWFlIV2tLT/dK50WS793nJUTml
         UGsQS84Utd91KkcyU/DzE97bgMuB1KdkZuzye7Qb+tHIC2nUYFmpGdGWg5ZxCP8n5M4x
         Q8+w==
X-Forwarded-Encrypted: i=1; AKwUvBwHr2QeBUsXshfOwUQgH8hhMWVjDwDN+qGD95jIQcFhfbYjJt1Kypnk4MOcCoIaPh1ViccIrHN9IZUJ/jix@lists.linux.dev
X-Gm-Message-State: APuU4Z9nyz7VULUexMKwt+lh5jsf44mX71sDbB/lnl8TaR1whBLEkXiX
	GZ0vSHpAmt9Khny4FST9YL16MjTF7+MadGxdAqfUeMkuZskAhvMK7/I0
X-Gm-Gg: AYBFou1NLjAbAIg9IRZCvI/68IgST6lzW3QE/nHiKCUQ78pTKv4DqcPYIvcmVeMuZ71
	RnHADjjwLH0KDSazKdM1BO5LbutOkZyvjVndQbSnj+MbVhpx8s4Ql1YPXCLgWZEW3+fsWr2Iwkn
	158sJMpJrHoePAN7SpeFbSJx3UPdLqBZuI1l31xhNnFIQft6oHBLwFIn3VlYqh0IMLWztTDqFAZ
	+uIcHbkX5ov0lYoaTx6hlIm4j3PfLGC+GEgT88Fs1SvwurHDWciTUlP2l3rBx35xPqCJtbiIaK1
	7KLiUOO7Ua3RR+4Ke/tIWjyLb3/hYQSeCta/H/B2v2SX+xUF+/gQsXwV7eYfx4yP0IpRxapEaL7
	U29pWa9ViXfceo6nJt5lgLqw2a3MR6JVYGRejYlamaUIQCCPV24tYcI2Muf6WPIkC8I8UikB6b7
	GXIoVUY6Eb27nAoWcoFTpf8Ff9BxJquxmwV+J9OQfNc7KfnX/tTp2Jbv0hPEJ3wOoh+8TGuG36f
	PPd0Wje+0oNL4of97Xkyng1OCAXVmJbfmgLmcMTr2aAlZjTH4qU9Sa1bopm+SqF91W0uIE+zHDR
	JILG9bMBg9ICb8hwY6b3Z5BBcHgBBfOmXYYLHWutNYte+XjXXn0=
X-Received: by 2002:a05:7301:d589:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-36c9e268949mr9074147eec.9.1793873571639;
        Thu, 05 Nov 2026 02:12:51 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.63.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm18812234eec.7.2026.11.05.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:12:51 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH] staging: most: video: document lock fields
Date: Thu,  5 Nov 2026 10:12:22 +0000
Message-ID: <20261105101222.5478-1-husainsitamuwala21@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks:

CHECK: spinlock_t definition without comment
CHECK: struct mutex definition without comment

Add a comment to each lock in struct most_video_dev describing what it
protects. No functional change.

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
 drivers/staging/most/video/video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..d60be8a741ed 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,14 +33,14 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
-	spinlock_t list_lock;
+	spinlock_t list_lock; /* protects pending_mbos */
 
 	struct v4l2_device v4l2_dev;
 	atomic_t access_ref;
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
-	struct mutex lock;
+	struct mutex lock; /* serialization lock used by the V4L2 core */
 
 	wait_queue_head_t wait_data;
 };
-- 
2.53.0

