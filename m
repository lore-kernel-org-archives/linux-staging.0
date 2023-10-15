Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DB63B1;
	Sun, 15 Oct 2023 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEfrQ0VJ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a81ab75f21so27466097b3.2;
        Sun, 15 Oct 2023 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369291; x=1697974091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E0umn+rEfJvO7Gxt9lQFRe3g330wvteerdClQ7lgaU=;
        b=TEfrQ0VJEY56h+B7Z5nePaEj7seIY4y9jAWJHSwhHjWrBBN/+92k76iDeUe3KhXCcu
         4gQT2sMEmeQB1J6g3fT8kITeWiOfRDJld80OimW3rIoeuB+QvCyHCRi/ivyxPEi1yeEG
         +5JtmQ03OkUeNXIK8n7SAcIWy8SFpOWEZuEMMQfRyyTVT0tcGlvgV7TER/HTqNbzNSKA
         576e/NvbJzaV4/yxFgAmXH5FEzo30hZuDyv/BGh53PHh/DpTIOlqKr+uk2mjvlHX2yaE
         REllkwUGwuLwfHrFF7OBH0lYASKkL3ssh1FexHY5O3ZoQOXXNB49Pt4FgfdCkjITQTC+
         g9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369291; x=1697974091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E0umn+rEfJvO7Gxt9lQFRe3g330wvteerdClQ7lgaU=;
        b=tkg0mA9UQ3RK2K0wfVO5SSwNLyhamb47Nyud/7jc4BpNPrNFFImZocj+zNLfZH5Ey0
         mH4iQXvuQmvYoElRNHXud3vzOakNf9yxIp6u1lgcu+rplt8bNZiQf3l7KK+/FNYlVNjm
         0+xy+ZjiDEFuR3LnT7GtFJhJ9GSIAWR56mOU9L/OW6SeoGo3hK1m1mbTMLarafYCtv9V
         5b34CEfMbXZzOpg0EA+PTvvqpcygtVHwJ281HRxRjgLItgc1jA/m3+tCKQE014tqiG5Q
         Fr9pEfyY/lU0aBU3bN0ReOzQ2cwioA6AIHS0tV7y09uJP7UTHFlVyp3YVn3LlJvV/9u7
         AOzA==
X-Gm-Message-State: AOJu0Yw+aWaF13TR6IMzjfsXkNeBipmm24cTpuWdJq9GFknqBYzYpq0q
	HZbxGy94kbquJ/T1NvNJNUQ=
X-Google-Smtp-Source: AGHT+IFm6Pj77L5sMLBRF1FfSD8KVSBA3IDNnxSPg9YAUEFBEIMfHff/VIFYhwaZxpgydUCRpMPBiw==
X-Received: by 2002:a0d:e403:0:b0:589:f445:19e with SMTP id n3-20020a0de403000000b00589f445019emr30273332ywe.27.1697369291133;
        Sun, 15 Oct 2023 04:28:11 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id r128-20020a815d86000000b005837633d9cbsm1300894ywb.64.2023.10.15.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:28:10 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 5/6] staging: rtl8192u: Align descendant arguments
Date: Sun, 15 Oct 2023 12:24:51 +0100
Message-Id: <0162d0d350aebd6b9d7cec1e7965b6b8ee42f82e.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r819xU_firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r819xU_firmware.c b/drivers/staging/rtl8192u/r819xU_firmware.c
index 4f8629e47e82..c515b4773e37 100644
--- a/drivers/staging/rtl8192u/r819xU_firmware.c
+++ b/drivers/staging/rtl8192u/r819xU_firmware.c
@@ -88,8 +88,8 @@ static bool fw_download_code(struct net_device *dev, u8 *code_virtual_address,
 
 		index = tcb_desc->queue_index;
 		if (!priv->ieee80211->check_nic_enough_desc(dev, index) ||
-		       (!skb_queue_empty(&priv->ieee80211->skb_waitQ[index])) ||
-		       (priv->ieee80211->queue_stop)) {
+		    (!skb_queue_empty(&priv->ieee80211->skb_waitQ[index])) ||
+		    (priv->ieee80211->queue_stop)) {
 			RT_TRACE(COMP_FIRMWARE, "=====================================================> tx full!\n");
 			skb_queue_tail(&priv->ieee80211->skb_waitQ[tcb_desc->queue_index], skb);
 		} else {
-- 
2.34.1

