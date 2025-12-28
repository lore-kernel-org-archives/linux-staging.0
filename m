Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4AB2AD0C
	for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 05:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766900975; cv=none; b=pw0KjBbxn+FtlFY/ls74RK2WhtWNKddooO8SG8ZZP28XThH3+BRI+5wXypl2Nk333yN4X3rpx5NT+DwqhzPpfL7ZT1ZXD22NUNLgYDjbYkSbBEUPrO4d8UvR2DRhW1kNPERbpIWhu5/ubmm0wPHOx7d+Wa7h3c/KyMWcDT5KHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766900975; c=relaxed/simple;
	bh=XMgbu8I6j92R/5BJOZwxpCJxSEONI9ROo3og38A73h4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYu5BgC3Mj2efnOiPV9EjH9OfX10GCbilEZruQeZXPT3Xgu20i+2mlQVwHopAguMXwx+aExtNU0A0MLoeP5JHOYbT7TnG86VEqUJfSD3ok5WI6Nfa4ll5z5wAhscWr90dMLxwqjBfK4eJZXdrMD26JSQYQebvyGhbyMBNFEoWm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMet/rFy; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMet/rFy"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6432842cafdso7200649d50.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766900973; x=1767505773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLRlB+9DB40DMYma1+D4O4IOOLwQtSeZhDOF66a3lXk=;
        b=AMet/rFyR9E/hXTYUsquAgVx2klEToIZ0482qexYAIg0V9roZHGd/f0BcPhFGzp/VF
         B7uGHeMGhMhqt3EUlo8C4I3ZvGYjfTHvi9M5Un4GvIZ5JVwtqIsabXtP3WMDH9XkUo75
         BocKp0AiwPh/wp8bbP4yd+eUp6Nfmh/JPZ14wn7SZXnzlElX3oaSPOofVRtXoB7nx4dD
         +fztsYk/hvKQ9dlf+w/jpVk2TlS0KsfAdtkqPyt9lgFFoAHvaQxN9GNlviZdVEY3gVNm
         zvg5uSkN4kJqdU4JwPr8AQMftcAFQ4z1Q5dyYL68xTVBkFw81I/sjZG75WZf1tPbpGZn
         AaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766900973; x=1767505773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLRlB+9DB40DMYma1+D4O4IOOLwQtSeZhDOF66a3lXk=;
        b=TPhCIWzYx+m6sgBfjjLRTqkqZMivwJ/QwdGt7HRhroE3NC3HuhEbYB52iGElzB/0ZP
         RnM2edCHBixF5bv3aAC78VjbjLB+vRNar53rBPUy9cLAoEvrdj/kyiRem480gABW0VWy
         396IiDHia5MCH4Sd7ptnTCzyHns0KMAeDU50/eVulpe+w/HwRlrX8btoAloJI+NSZUMV
         Wo2Y494WWyKXMvewKtDdYFUcFG227fY6alNn++XAR3iFdiHhrwbkWawN/PLQGW1WXn+C
         pIk4zFTdb0ydp7Cgq20YVrajP9bgK8wbqz6qfs60lLwhYMOGVd/m7CR+xt+atMqHkeix
         ZoSA==
X-Gm-Message-State: AOJu0YwJq3C6VJ774vJGscYiTHuVgO6QWPpvVa5kL16Bz8DcYC3z6VTT
	6Rq0JjjLdCN0xMfJvWObnEAOss01/0AgAegDEw/GnapNx6oH84xPmO1n
X-Gm-Gg: AY/fxX50DhEQGD1mLTPUqXiLSaMwjhxbWWkCIfEf69O0hX+diSInsxfX19uYzR4ceLF
	pKKWNPkHyg8+uhFRXi+5kOq9+UGAge7a3xoM+Ng8YjVUV6JEhUDl5JNTvxoJbDeHTxRze1zHWIZ
	FpYl8Lq/8JXyc6+itiamE8BwhSnClkOP7GTs0+tL5ENgLCP/fn6nK8Zbu1ILOAPk9nB85Nt58Rc
	28CH6tMJsKCGcNqHhwcDND06hF2C4mrPuarPU9iER/SqdQw2VCTNZZUCUGAIlVVdG1nmxD1ZbJ8
	+QExtCFJUHtEEofAGdCpGvt9j5j2zkBdoui6nVTIQVjDRYkT3Q24F+tb3kwxV3OlnyJ27JV2YZW
	ezpogZ/IJEds85OftB5LElKaSfj7FReflEekdkp5CydlXEqVvEvSu3MXCUb4YD1Z1eVx8pC3vIP
	CTM5SVvsTHkNnll8ct/cMhPYKNKeVbfQpptq/Sy9ZvysN+eqIVwfkhBzrY0kEqXPorjBOnp4Vil
	2/NdhG5PA==
X-Google-Smtp-Source: AGHT+IF6p50/Sff+qjFcoZSSqgD6VwygtZHX89upMLmejiSZQ694evbPc/vHg1C5h3FwPrb0pYLmZw==
X-Received: by 2002:a53:ad89:0:b0:645:61fc:43c2 with SMTP id 956f58d0204a3-6466a845493mr14278575d50.8.1766900973023;
        Sat, 27 Dec 2025 21:49:33 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a81d4e4sm13226007d50.0.2025.12.27.21.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 21:49:32 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ignacio Pena <ignacio.pena87@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: avoid short msleep duration
Date: Sun, 28 Dec 2025 13:49:02 +0800
Message-ID: <20251228054902.9065-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() is documented to sleep for at least the specified
number of milliseconds, but small values may result in a
longer delay due to scheduler granularity.

Replace msleep(10) with msleep(20) to match the effective
sleep duration and silence checkpatch warning.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..0edf9ecc4bed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		msleep(20);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.43.0

