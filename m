Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD45F476
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796311; cv=none; b=b0ZzyaNcN7WKdM3YHYMUo8DsbnfyTYBUM4Ms8+I05/74078UNmoA2fmrinmC/wWPhsNDMyy+d2aP3dz2i127CJobjTV+pP/pSKAXB1dTWumtrvO7eQQJq4Y/fVwbLcLtg6AzsrAjr7t/OAxi9WKLZr7IPz39yKFzBnhWp/qd4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796311; c=relaxed/simple;
	bh=AmgX4dnIIJccXjS/P1Fa4Yt9LuV8HcB1AwdQ1cxH5cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQlUkyVoZW/JYmXZ2skKvCGNOtR0XguZ3lNsY85zuIRbZA2sJ/V06ErkUKegkIlk8HGu4fwjkJ1S3BXVu0k9YXyZbaCO/UE2Jb0MnG+RFHoo1A3vjW3xYz372b82xBZR9pFwt0FALzzdq/tI8tqoXInN7JEAAw1uutbE1WvCmCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8TVmlfk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8TVmlfk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5113186bd61so599912e87.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706796308; x=1707401108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WZVZh+TcA52yG10ogW2Ket+Nh8qPqugIsfHxx9AocE=;
        b=H8TVmlfkA/qc3zdmaqKAb67LOmnbttmolUawrrlF5Z1wJyIyfl+i7oaBCZ9xN6NGWd
         q1W5qfPpd8TufMRkU77NUBvhKL6L9p4W8qnxbEvJUME5XlkYdg/0Lpp1Lou17G2hd/UY
         76Kpt+EJqofh8WJBB8cFD7yXsXNU4Dta12vZllOUhrffxZe3lGmGqqFzMLWzYvZ18XWW
         RGqpLESjVQqQbyZkybipuQXhX++32vTF5OZgxtTz+5Ciupa+NyqeJB1BZcstM3ObDdKu
         mI7AKutlVoKNTh8nJFQ285kjs3vj5GQZkb+ic4ii3keBiyGSYSAAA0vMBUMYA3ztXIiq
         DS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796308; x=1707401108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WZVZh+TcA52yG10ogW2Ket+Nh8qPqugIsfHxx9AocE=;
        b=JD5oot15jC1dHUsx2DcS90FWRy12IlbIR5saFCzLoCjsBey7S4KHjmDR9Xk0Hf/PN9
         /aPazuZiclYsTQkyt9IzICkzqN3TVu2B5G27Wuu/mZPUXegD/HsCSmW9ur9egW4oJD2G
         /DEe4WG+R6FSrXqqWb9QuPsHx2YZg3NWwWKuPqCM0KoVSP8nemW0Pgx5VUgCHAI1AJ6x
         6JX8cVs0uahZ2pZtrw2e2BufnXoqV6bZwABuIv3MDp7EOdMC9tfoVf3hHbeN6Vj/YxHo
         mj8nY34A2kGiS91on/Sd+EyB1MBdXLMa+mJNw6OnAh16V6lBIThttOm5Dxb5qwxAskLw
         z+Lg==
X-Gm-Message-State: AOJu0YxEE+Prz3DVT1I5rgzHVJ4JeVsWXM9RCMvpbHPm8u7GiciuQzes
	6g+A547GJbAOh7HXg+/Ms+7hnJzV9L8+ubBUyWPVfxknL96Wu1li
X-Google-Smtp-Source: AGHT+IHDNg725o++Oss1URoSO/bNwqddYJfoLIxyC/NvU4fiiUKhP95xsRPWiW/MDXE7mhF//2V9Sw==
X-Received: by 2002:a19:ee18:0:b0:511:f41:dff6 with SMTP id g24-20020a19ee18000000b005110f41dff6mr1631947lfb.37.1706796307693;
        Thu, 01 Feb 2024 06:05:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWLIuEc/KXyagZpnA/pb3oIaHfKtvfYxL6bfR2s6TawoG6O+ynYoHrGEcGVDhp5UA+XvwrWNyZ7oSFjqM6L9+OK6jzGgWxsoiRMFJoMFIIqvK0fIXDzuIb9nbNcC48o9NqPLRztJ/wnb/e0pZFxqOfH0BLRCR3WkmFECkiqktJi+yYRwC+i2pg50la5cCJ5D5HTvMgIdK8qpx9JGE3gs7Z8V1eyUcOG
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b0040ecdd672fasm4451195wmd.13.2024.02.01.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:05:07 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Thu, 01 Feb 2024 16:05:04 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH v2 1/4] Staging: rtl8723bs: Remove unnecessary braces
Date: Thu,  1 Feb 2024 16:04:56 +0200
Message-Id: <20240201140459.438479-2-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201140459.438479-1-meir6264@Gmail.com>
References: <20240201140459.438479-1-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

braces {} are not necessary for single statement blocks

Signed-off-by: Meir Elisha <meir6264@Gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b221913733fb..5568215b35bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1548,9 +1548,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 				int do_join_r;
 
 				do_join_r = rtw_do_join(adapter);
-				if (do_join_r != _SUCCESS) {
+				if (do_join_r != _SUCCESS)
 					continue;
-				}
+
 				break;
 			} else {
 				rtw_indicate_disconnect(adapter);
@@ -2432,9 +2432,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		return;
 
 	/* maybe needs check if ap supports rx ampdu. */
-	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1) {
+	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1)
 		phtpriv->ampdu_enable = true;
-	}
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-- 
2.34.1

