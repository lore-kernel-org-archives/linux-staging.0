Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A43A4B5AE
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261450; cv=none; b=MZFczfdINlEaWUYE5/DmJGwrTrJDPq/ftcdpHtj0Ou96sxfhSH+/RehH9H3bxFGQlFYUGo7KdFx30a88MU71bazKQMEc9Swm+zM4F45FPE0AS5HsO2dHZMX8y8/pB7dCQTFM+1Np+s6PM5SlQZ8Sifw4Ri/0x3o/r+9aiRtYOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261450; c=relaxed/simple;
	bh=y4YjY+AojbIRMjK164jPJmgD6gUrucFooh+ClOh/re4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=howXy4l/v5GpvaT4d6H5+K/z1FO17irdKdia4asGi9ktw8cQYgs5Tor8FTjjApSDgefNa4q95IK6lWpJlAQeQXytEhpkJKP1R7gWpSkV2uOI/my/Cjy4gj5EOjq/eaH8033eNYthzmM4sgmA8tvsgdajX50GjzxpLz4Z3di4JFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GFE5lkOo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GFE5lkOo"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ed96772f92so92953685ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261448; x=1716866248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEthYODi4I2R9YSYx+IY/meHc3WazGs4QoUP4G2Bq/A=;
        b=GFE5lkOo6VCfM+787ZitnMaMk0WauKWVZxPy0QQjWXW3zSOzMcAjDm8WVqgefRs9l3
         kyqzUsfPat4OEU55gR2d1AF4CIzoW7udQAh9wVwUUaKFJKDIhVThTq8KdIH146S2Bywr
         3w/daMxOLlTpUL+CJ6cWVLCNa1UBEmdovOC9N8XoSZb/wwC0DqarQEYqbeYQ2gosQPz3
         RECq7IUVVnmjRt3R7FCT9T+xmGmc2QXgNP7qjfdeMsjMEzXBbla+BIyjXqf7yfFNnb5F
         ksVRIC8UHcYtwGNHVjC48coYwyEblwNwg8/zFVIpcao6bQOeejChAZNUHfBNUjBQzqVh
         Hvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261448; x=1716866248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEthYODi4I2R9YSYx+IY/meHc3WazGs4QoUP4G2Bq/A=;
        b=Ti69vu2WiFSnwSEq44EtQ0TF7tdyOAKQJXJhBG0eXjjbc1wzhrazDiT+bntoCtjXbt
         LBtZJFdwjsGvfXu3pbjrdjBAD66eC+AtRFU2OrxmadtQJNy4xrQNv8pAeTyNAA/zdjjG
         Wi9qJuuD3fJQDNAq8wXuiV59w46vO1zFXYVezBv4/vJHXfQddPbYpmrcIzdYRhuQnsoi
         NlN3UAezMvjH0jsgN0iwOnsFocMA5fe7W6GYL4s07/Vn4vSV+gBl/083tVelW0O4Lv9g
         tIlCAa9L9pcX2oOqRJC7g6gX8LhAWaPTg97kfc4QD2qMvKFjmptwaX1HAxs9aR/vnLCk
         aYpA==
X-Forwarded-Encrypted: i=1; AJvYcCV5inGwSwlgeSt/UxVO5BzarQVGTaga/F/ZM94Br9OZX0eHomNPIrvWMK15Tfn2oITfUylcTg/IUImn6XLUJyt6EFdz+tb+tg2DHjecaQ==
X-Gm-Message-State: AOJu0YzIoQ0kyIAFo2DjWi5JD1An/CTVmRp0FLyI9xqY6rfuRGp237E+
	wfUlylW7Yu25NmO1p2jN6mYzaraR+2vTvnCYWB1HTzrZs347JLFmphwWJI/FEXU=
X-Google-Smtp-Source: AGHT+IE5In+DU67hMeJ+W7Cqy83Za6bcsr34N7BNepHTaCmbzXqcBBJbdgHcQWECMG9sAETxWRQbKQ==
X-Received: by 2002:a17:902:d488:b0:1f2:f566:8908 with SMTP id d9443c01a7336-1f2f566a562mr77412435ad.52.1716261447741;
        Mon, 20 May 2024 20:17:27 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:27 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 08/31] Staging: rtl8192e: Rename variable elementID
Date: Mon, 20 May 2024 20:16:55 -0700
Message-Id: <20240521031718.17852-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable elementID to element_id
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3722fc0cae1d..4645fe803a15 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -728,7 +728,7 @@ union frameqos {
 #define QOS_VERSION_1		   1
 
 struct rtllib_qos_information_element {
-	u8 elementID;
+	u8 element_id;
 	u8 length;
 	u8 qui[QOS_OUI_LEN];
 	u8 qui_type;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 19cb717df3bb..76389aef53ee 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1456,7 +1456,7 @@ static u8 qos_oui[QOS_OUI_LEN] = { 0x00, 0x50, 0xF2 };
 static int rtllib_verify_qos_info(struct rtllib_qos_information_element
 				     *info_element, int sub_type)
 {
-	if (info_element->elementID != QOS_ELEMENT_ID)
+	if (info_element->element_id != QOS_ELEMENT_ID)
 		return -1;
 	if (info_element->qui_subtype != sub_type)
 		return -1;
-- 
2.30.2

