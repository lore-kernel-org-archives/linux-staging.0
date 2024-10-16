Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2D20ADE6
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085928; cv=none; b=YjSxuAYeoZ+borh57VaH2tH6l36BwpT8WUIomnvGcDAuRTpBwJkYJjZhzKR+AMhS+feLjdFW1/03Cho1+I5pg9vPvEZ2RBRYOBYmaqNRb83gyS+u0Z6/niyeMpJOLKlU1rnq8a3rK3PjJcs67twVmRktOdwCN+Udc2S/KZtAsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085928; c=relaxed/simple;
	bh=1OACE3daHJ+YdaE0nxeFHkeGq0qYmXC3IRnKMrKDGew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=amyxUOY64osVAAwJnqp6RwPvShH1kM5lkyGxwCC9uWiU7QmiuMbxK5rxvSzIv+Z102Vd0OS/w6x0biIgeVcYa56sOhIAK+UJvbGHe3ktUKrYF+jGNA/wSc3GP/8o4UdWQsRCKaBEO+f0EMtfP71Dd05R3QQTcEhVuJn5hkUK7bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddmygyA1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddmygyA1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43118c9a955so56269355e9.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085925; x=1729690725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMVVltUWdMtnuXNP9nQSpMjW1IgqeHbCC5jnlf5pw3k=;
        b=ddmygyA1rPMHSQZzeJUrLZUua0SZBCsCtdVWsW1pod9vt86t8Bs2gUwyxHJ5utqmPE
         lGNs07RpuXx6Hv/2i1/euNdZCOwdAwdoR8Ast+J/DetGoG4m490m5PAUj22JA9605Sxi
         ea3CK6OlmAamasg5X3N+qW5iMCkFhWpxZFt0uoA5Bt196Bl2d/Z3NG5c6ukNG8oNQAqN
         dne61rDupnCj6L+n1E5ygQ9MPViHLGqXQnl5L2UBoCu20E1ggQqvi6cRyE4eqVGC/pwb
         rFw256BelmzRtk+a4fg5Uj9DSuW75A1i/QNTX4+yXq1xixY/CigAwV5JvUUhCLQaKlDs
         pVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085925; x=1729690725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMVVltUWdMtnuXNP9nQSpMjW1IgqeHbCC5jnlf5pw3k=;
        b=POWkntMDrxzmKiRrPsZBlMhJFICbFIuLFYEYqHrNaRfwHr9FMVuq3IjMF1oZaLeOHr
         YG5swQpPncRj52R3tI5lkc9KsPiYDF/bi9uobdX9eySeP3u0zF/KQEkjiuXdXEUa6sIx
         ByH96WuqkrRzE4/BIbiXB1aZYjOhrQiU+F3Lg2onNuFmjtHO9awyjX0LpOX62k/VgEj6
         2IbNd6u+x70CPGgsgROqFZwR1fbEMa+UPTc3mm8RDowq6VGDjLjT1nyNKqpoxrVSvrR3
         tiak3m/F5RGx1ic0IkHKYzm7d8GoJhw1QLj9+L0hrHn+dfH6SAIEfOHz60ynkJwsjG89
         eyvQ==
X-Gm-Message-State: AOJu0Yx6wdNjMpxDOdswlhupX/eYE27xwFLF7dQ/MyNvcb6laNa9Co4a
	/GjKfWS/6vQdK+c2Xh51vJDOR2ugzQlR1I44GWhmn5BfqU4UugGm
X-Google-Smtp-Source: AGHT+IHCkYpGdQxei+xYoZnJ29rBXR6vONOPkK25Mjls2usc7Ta8sOhMHRbJmVBFh+yzh0AhDfANkQ==
X-Received: by 2002:a05:600c:5248:b0:42c:bae0:f05b with SMTP id 5b1f17b1804b1-4311deae1a9mr168976605e9.1.1729085925332;
        Wed, 16 Oct 2024 06:38:45 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5524sm49415035e9.44.2024.10.16.06.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:38:44 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH v2 2/4] drivers: staging: rtl8723bs: Fix space coding style issue.
Date: Wed, 16 Oct 2024 15:38:28 +0200
Message-Id: <20241016133830.2485315-3-a.khalfa.1012@gmail.com>
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

- Remove unnecessary space before tab.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1ced6f7ac552..56a85174965c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -436,8 +436,8 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 }
 
 /*  */
-/* 	Description: */
-/* 		Enter the leisure power save mode. */
+/*	Description: */
+/*		Enter the leisure power save mode. */
 /*  */
 void LPS_Enter(struct adapter *padapter, const char *msg)
 {
@@ -476,8 +476,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 }
 
 /*  */
-/* 	Description: */
-/* 		Leave the leisure power save mode. */
+/*	Description: */
+/*		Leave the leisure power save mode. */
 /*  */
 void LPS_Leave(struct adapter *padapter, const char *msg)
 {
-- 
2.34.1

