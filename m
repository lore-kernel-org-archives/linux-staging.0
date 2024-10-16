Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FD205E3C
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085931; cv=none; b=YlEmoBF2MwPQhkCJ0JIIWxUJGjGxb8xZSG7YQh52AX5ZlSjgT6sLC6pa7hgyhEpd1T6a1HtgdkKJOmjTLNcJCNlqtrL7XWLDnl3XRDQfStGwYIUbo6pHxEJ35l52L8T+rBCIeFgkMpPijePha0X+XUZnNgZM88bOmdZ+2+ZoKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085931; c=relaxed/simple;
	bh=IySJiiHKQ9uzg8Y6/9egbralZWhforGpWViQ50tt5NQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qFy10CjCCzdsPuCrxJQlveQsJNo9T5a2zarufCu/6fkN6BFVnaATDdpjcj6IsxQA+TTlowASSE1Vr8AxS0JsRAywoAK1ebaQlYf5AKWzwU13hD2te9qvy+bBEPdgL5KNXmEmeiSnY4ejrwtoSyROUK/T60kbOsB19sWgENIwCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYnP0yRH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYnP0yRH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4305724c12eso50897115e9.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085928; x=1729690728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa6exbdx6NUoRdCrQdTchcVOej7ISzyDCTBB7HgeisE=;
        b=hYnP0yRHcZbkJpVYOXsYc+KbMWG+nyznMQvYUeBDf1+GKnHXy1sCyb1RZEe+Ffj9SU
         qI+y55a7VMJlRkI33vsJFj0r1avk30NvA303TIO35dTwAZm1E7xKvDQmlIdDEkOcNE8L
         PQUIEbZB9ZnP1oWiuR7DmUQZqvkfBS2/2qPnTrvVLPPZa4WGjLS8FDmWLx0V7iqePfKp
         Fto7cAYmLCYiqw5VjSd/b4uwJalMglzpELqCA9gD9La38piBiEPh8RcFWG6RBaO3YBV4
         8c3Nvz/3mwoPjDkBrirMQtGTC2Q2RW85i5Z6IdZJ5xIJC0b/1BQDBMacg3gH1yD/wwn1
         ob5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085928; x=1729690728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa6exbdx6NUoRdCrQdTchcVOej7ISzyDCTBB7HgeisE=;
        b=s1VCo6uciUnif2rZtun51kGg1WWXHO/kAZH3DjgS62Ic49pqxtN5AAG5iuwQUVr2lY
         1VNpBXgF6IpZV1sghj0+axvSqejrwclRfzQbkwD1bpu4Tldy3lKOWc8MIiFm+KfJodeF
         PN45iXvr5ATsOdo5iI+1N8cB6NVxK52hUSHRnDt5/+Csev9pem2y0KohxaeqpT7J8STl
         zziSlih/1mQAvkK7kgXNGC7IHa1zueHSFzxID4Bp5FT1zmwxuTvA5AsjDPqPeXFEE0TM
         omLcvT8j4KO62LrC+kR/nqfiMCMHac56SWEKTyrI0u3UHuEOOmw6jvamb3ltBn4UHB7e
         2Xdw==
X-Gm-Message-State: AOJu0YzvfYqosxVQRBMXg0mrHFvMTT1prCr6bRP/4mLOJ1x0muuLb7O8
	ZgS87FAFcFSszjJl06aAIFyHFob3GqCtBngSUBg2RVVZdBOGGfn+
X-Google-Smtp-Source: AGHT+IGnyAjXZ2SqY/EYanBwc0FwNiQp0vIkX5O4qBPdC2FXz95uKq4Rg6uBxI1a299/BzzJCGh5EQ==
X-Received: by 2002:a05:600c:4f43:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-431255e9df5mr132722185e9.21.1729085928173;
        Wed, 16 Oct 2024 06:38:48 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm49415035e9.44.2024.10.16.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:38:47 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH v2 4/4] drivers: staging: rtl8723bs: Fix comment alignment coding style issue.
Date: Wed, 16 Oct 2024 15:38:30 +0200
Message-Id: <20241016133830.2485315-5-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
References: <20241016133830.2485315-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Align * on block comment.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index cc4d08ce1d2e..5566c01193fe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1016,11 +1016,11 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 }
 
 /*
-* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
-* @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
-* Return _SUCCESS or _FAIL
-*/
+ * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
+ * @adapter: pointer to struct adapter structure
+ * @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+ * Return _SUCCESS or _FAIL
+ */
 
 int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
 {
-- 
2.34.1

