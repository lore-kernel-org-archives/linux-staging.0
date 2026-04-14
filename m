Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292403CBE8D
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160742; cv=none; b=U/F8ZU32GPzvDE3V13gcgFQDlcaiOtFiEiVuWLpqJGR/3XSPYp4dkd4LguBgaYqqGKXGHhpZlAhsG1zNcNCTS7AoP2JC8Ydg1IZSSL84W1+J19Ejk+elVZL7sOcGeaNR5OWWuREGYugx09cRUj11Xrb117/H7XGypKcqtk3h0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160742; c=relaxed/simple;
	bh=cigqYaiI95hZ6Uh9P/wD2DmyqcOpiQzU/+0vTicsJgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVWet7kVmCunMQiQoz+MwrMkqql0yUohz/k5XFzz9eLdnu4KC9h673uli5Lt4lBYMOvLPx8t9HB3Uh0qYcHoXFM+O5p0Lj3n3Ulhm785kCdcuEqkBPO9cy0fJsD1izX2B9h7LI0gF7JKWii2QA0ymP2x/fLxhMyix23EeOzqk9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Thwk6hRE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Thwk6hRE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a3cc771c26so4323227e87.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160739; x=1776765539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pp4dkNOqmXWeG8D0HndGuYiqy4ojGPxRtQgL9sf7G0=;
        b=Thwk6hREAPaSgCTWvThXrp79C/JgKwRnH62qIPw6pcRQUE7lpqAOfhCNMPbjFy0flH
         X3w1JXMlO7QitSDEysg21fHMNG6LBlpAY3BsZZYd8Q9q7M222/PCkPeCev8cyW46+vlf
         3f37z6i3NYm5m5jVIrhPZcQmIiSeIuwP07OEqPMf/qmXNg2dq1TUgqa62gWRg95VP+iv
         oWnV6D1VIFgU4PZJ/h2qYUZQT00HZ+mz1EPzTBjlulb9NXMPJzv46KFd6/MuxivVMOrE
         Iqnj6rKYnX0yAi05N419lZd9uKvzzHjGJjJeMxwNerQpS55gEd7JBqG9pnnEiifAsd4X
         a7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160739; x=1776765539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/pp4dkNOqmXWeG8D0HndGuYiqy4ojGPxRtQgL9sf7G0=;
        b=cnAinh/uIF4uX2iyrmMUGMiQ/P1CkSKRwm8srRtEuqelfKsuKHAt4339XvS/XD+Jzp
         hrIxSfgYfnxUXe0GNoouqQ/yZagB4p+zyTOS+BIIGE2xwdv/HW54IWshrXiETc2/q+oJ
         GJugqMPCCULl1NSyEkhXOv9vtCxgE0x44KsyemZSlQqb346vmddn1Do0r7a+pzQ1hoKe
         fHllaI8HzDGxHf2t7khJmbefzWeYjUm1ArTV4WCaxw3Z6hiky5FTIHXnt5J3UDyk4Jfd
         7fdddlIvc+Fi81yhXLsPxhV7d9hhD5z67k0dgo+IA/jaMcZTP8a4oasw3quWc0QdqZU3
         ykRg==
X-Forwarded-Encrypted: i=1; AFNElJ9w8+ccVLvqNhYIFECaByaO+1PWMeBjm4r2IO343zFHT1UHnH4t6ojWuuCnDGaH4hxiKHsYF2QTJWK9Tx49@lists.linux.dev
X-Gm-Message-State: AOJu0YwWeejhSTmn0oQuuqv3Ui5nRINdn0tnIVKtdiktF3eYdC1iariB
	LXMlEHMY2Lo4Twd5uaYmFQSRrkDPGcbQWAgPM/em3mTunu/gzdRu/zEC
X-Gm-Gg: AeBDiesSqVwbFUOZmQUzOKggiZrQ4XTJX82OtGWNPpDV2CGHbu+qzSJhZ+MyM11h7ih
	gnXDtrG/9oIKBtywX10hDR/typGhPvSUC/zN2jxm5mvNqOuKzeyupGqA0+osM3vIzwPkCKjj0Qg
	VswpUp4kK70w81RJredPhGbYUMeQ10MgnzbLakcIqk/R7/6H0Xc26QPGTM+KxvnuSggjiWiOsEr
	HPIfMbtclDxRqci+Lljq1yIgr1eOQ4sqVuHCcDQ9H6p5fQ7qdf6QiaYU7T5FsVrZK5kYDy4+QMy
	R0vMTPYFaDYt4fN2RF2P+LnOasvvZ5yCfYtvk3TwmYCJ68Klawdg/yO02AuClfkVsjId+gY4WKf
	3kU4SpsJHH9DqEpqtiGiYDCow6fYkYG9dgOsDT4iY94AF/79Ux66VwiPmXzF+gkOyaPYe+BiVHs
	VqVBOAOofBP3fGLg==
X-Received: by 2002:a05:6512:3183:b0:5a4:5b5:c84c with SMTP id 2adb3069b0e04-5a405b5c98cmr552568e87.17.1776160739227;
        Tue, 14 Apr 2026 02:58:59 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:58 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 6/9] staging: rtl8723bs: fix Yoda conditions and == false comparisons
Date: Tue, 14 Apr 2026 12:58:30 +0300
Message-ID: <20260414095833.76480-7-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace reversed comparisons with natural-order equivalents:
  - '0xFF == hw_channel_plan' -> 'hw_channel_plan == 0xFF'
  - 'false == pHalData->bDisableSWChannelPlan' -> '!pHalData->...'
  - 'is_supported_24g(...) == false' -> '!is_supported_24g(...)'

The multi-line if condition around bDisableSWChannelPlan is also
reformatted to standard kernel one-line style.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index fcfcdfd079da..dc5e6a58fd9d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -105,7 +105,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		AutoLoadFail = true;
 
 	if (!AutoLoadFail) {
@@ -120,10 +120,8 @@ u8 hal_com_config_channel_plan(
 		}
 	}
 
-	if (
-		(false == pHalData->bDisableSWChannelPlan) &&
-		rtw_is_channel_plan_valid(sw_channel_plan)
-	)
+	if ((!pHalData->bDisableSWChannelPlan) &&
+	    rtw_is_channel_plan_valid(sw_channel_plan))
 		chnlPlan = sw_channel_plan;
 
 	return chnlPlan;
@@ -134,7 +132,7 @@ bool HAL_IsLegalChannel(struct adapter *adapter, u32 Channel)
 	bool bLegalChannel = true;
 
 	if ((Channel <= 14) && (Channel >= 1)) {
-		if (is_supported_24g(adapter->registrypriv.wireless_mode) == false)
+		if (!is_supported_24g(adapter->registrypriv.wireless_mode))
 			bLegalChannel = false;
 	} else {
 		bLegalChannel = false;
-- 
2.53.0

