Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76A1F94C
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919965; cv=none; b=fGPhC99H0akYp9hpAXxZ953Jfyy5ov36hRmlOiHAPrX0K+B1npJ/vAXCk+hQXcId8W32q5AUfSHHe1eHuDRPKcfokEHS/ME+44d6ibxfERi5kOrdwDlpBlZ+HfnXpMpOqgzyjVsS0lKkBSiKcn8HjGq/aNcNPXDj6jo3Di03I/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919965; c=relaxed/simple;
	bh=AiBuBvvwNpK/KQr77GSv+juzO6zdhF7q2Pdsy+hD1rU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kh620WJOYZEZ7nSc10Pc8Klok9Lt5tIb9zGeXxabD4SfdqfDE4N2qjcTIBU1APFn6NNU7k29PpNZlONMDzWwkmumtts8MN+VqDx+I+I9Z8VLg2V90PB5ftim4mvgC6u5rkj60e84hHzjxpa2fnt9gewov9XacqP6Pc/7/xIm1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GdEDnbDF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GdEDnbDF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d7881b1843so20428535ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919964; x=1709524764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSSVxPrO4lCI0hg8jSsGiVWd0BRnv5gjYtDEYGTxDSc=;
        b=GdEDnbDF6QPiAEc+l4Ty5/QJKDP4d+hu6OlejgmJv7gbRU9XZ5kxd3JZ8dhXvdpun5
         QlHAJr+B1zwBr8kZNcXulPmBgXf0fdbPKPoaAQAWYgFjFGMgnX3zX7H3LqEe5j3wR76N
         osaoKdOWqhXx3XVBxZyPWszqUJw1VoKWYyXPIOxa70XIFGVAdq9wDnZbfbhqJI0edwdE
         IpwG/KAUyxukMRqHiL/wX9noUm6JGjr+5YDqaCGzTLZzoBjWNeL/JY2JcFBpOdeybaj9
         4+3P8J5uuevZCgE0ORk2uKbKhq/P1m6W+z38mbKIu1sNWOvniP0DgCuvF3kWuxxCfbV/
         jvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919964; x=1709524764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSSVxPrO4lCI0hg8jSsGiVWd0BRnv5gjYtDEYGTxDSc=;
        b=hlJ9fIRc2thoQ2jEojh3Etnxs621AxYN6zxHRAU+HGbL9LOOyEW0Mw5xkAzb00yexO
         4cOgkHKmg3xFdMF0mRfHUAVn0iPYdplVkkMHZkn6Z7nb3wwwywk/Lhyl2EeZkiwVyBoK
         hh0I6MLoKr3Wj4OwkC+i9Y+8ACg4hqtLMRDHsMakalasJ4uz+/h+bEpFd4xflNsRh0tj
         gmDNdEU9KMJraCsBM9AZ0YzAYgNcN3r5S+7nMInrHyLYpgFTcdE7rfhicYuHDhJMkHSV
         uH4rS4R4ZOBF3wD9I04MCK/uQlwZLi9yqLUnhzDw0ex7DOCR9sYOG4ubBcNjrGkVauUv
         +n5Q==
X-Gm-Message-State: AOJu0YxnNsYjiH1lwIPF7H3/kPX6PljzzvFnqYb3CskJUVLRH2Bsb1m+
	DID8RmcP3GD+FKIT6uJy3QfqkJ/HwwIaB5tnzXeXYzLkgGLfMq/4liMPLhtMXQA=
X-Google-Smtp-Source: AGHT+IEE0+s/vLr/q0NN1tnenYz0NlElT4D+tBNp8bPv1CrkD0oLPLrPE+b23zUP5NjJj0Q96LRZ9A==
X-Received: by 2002:a17:903:1212:b0:1d9:3bb5:2819 with SMTP id l18-20020a170903121200b001d93bb52819mr7600044plh.34.1708919963976;
        Sun, 25 Feb 2024 19:59:23 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:23 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/8] Staging: rtl8192e: Rename function rtllib_send_ADDBARsp()
Date: Sun, 25 Feb 2024 19:59:11 -0800
Message-Id: <20240226035915.370478-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_send_ADDBARsp to rtllib_send_add_ba_rsp
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 1aa57f654b82..c0006daa75ec 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -186,8 +186,8 @@ static void rtllib_send_add_ba_req(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate ADDBAReq packet.\n");
 }
 
-static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *ba, u16 status_code)
+static void rtllib_send_add_ba_rsp(struct rtllib_device *ieee, u8 *dst,
+				   struct ba_record *ba, u16 status_code)
 {
 	struct sk_buff *skb;
 
@@ -283,7 +283,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		ba->ba_param_set.field.buffer_size = 32;
 
 	activate_ba_entry(ba, 0);
-	rtllib_send_ADDBARsp(ieee, dst, ba, ADDBA_STATUS_SUCCESS);
+	rtllib_send_add_ba_rsp(ieee, dst, ba, ADDBA_STATUS_SUCCESS);
 
 	return 0;
 
@@ -295,7 +295,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		BA.ba_timeout_value = *ba_timeout_value;
 		BA.dialog_token = *dialog_token;
 		BA.ba_param_set.field.ba_policy = BA_POLICY_IMMEDIATE;
-		rtllib_send_ADDBARsp(ieee, dst, &BA, rc);
+		rtllib_send_add_ba_rsp(ieee, dst, &BA, rc);
 		return 0;
 	}
 }
-- 
2.39.2

