Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D81DDD1
	for <linux-staging@lists.linux.dev>; Thu, 15 May 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329392; cv=none; b=tGHpTcodBhbFYYEnPb2SiMimRHdLDXXuBY+IKul5WEybNKjtw4U8eYBj9fjjishLduBLBZzjCAmOvbA29Umbz5HrdV58esS2bXPKcAfVwMEeuHOAadaOmD1XyGcbaCvn8Cl0q7F1andTGz+g4E1ROQwPBO6DZIXjtSey67oWMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329392; c=relaxed/simple;
	bh=HAgq5TsL2J5W1qSWohscDi0sEpw741h+gH1OrIGfCW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UiVSyFOadBCBIvfF68HPnUV34AKe7EVoTxewVZMCDtJdBFgHE7ffZsoTyg17eLp8KQNQOqfotR3XhETHb2i1FquhfTJaz1zmDiXKh0iI6Oo5buHxkBIOw+0DoFPNapAXRlGi55goxDBvar6o30aGRKmsMJ7LM1SGfA29tCvkTeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlTpTcwg; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlTpTcwg"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c56a3def84so110932585a.0
        for <linux-staging@lists.linux.dev>; Thu, 15 May 2025 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747329390; x=1747934190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WodONXQd65P/c0ED7hKX8l21r+p4b/r4p9198gArTno=;
        b=mlTpTcwgW6Ll6xoNJMHAhpwptDjE+Wm6ChGEdlqkUvcA5wd1u7WiQU99c/wUfJHHqd
         2PPfpaBrAr04oVbRmStLmDDe0tk1oQ+DgHIWEFMSupmbvyDXVnQFscCD0BtsDdWaO4xZ
         TC/gLJfwJaHwvqfY1XuyzNyBgGmrG9k1JqHuuvH1YvXz/zOEO0VH1grTk9P2E95WMkmj
         OlnKxsGAMCwbmZN+6LzeJdwRGXBxN3OR0vuDhhSiKdwkcAJDZlxNG+x/wLLs9KJxrZ0e
         fykhFjIWhzpFS7FHipBkYUsbjG1/5ozxl2P1TcyXsylBmW2FbxQOqIytO4TWKZ+6NiwR
         yPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329390; x=1747934190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WodONXQd65P/c0ED7hKX8l21r+p4b/r4p9198gArTno=;
        b=vW9AlG3BLGCtSwjRPRVpu/6TD+QnskD6Y7W4+2k2QC0u2KAzcijc9UkpEnJNXyxYM2
         3oFdH/p/xHmjMSawn0N8zU0WJbW4ISWgrJndWwa10LBrKdEyuaIGRAX4WCV9jck09q9L
         Dpn11HcNHd5RGZXWvxrP+f7AWmWp0tL9/m1I4xDKQKwy5pZeos/cxRCpI4kVYskPXMzI
         57VLTVn+329DYHObXXu99rbbTVuB91ugt40TCtcSTh/qAcjLeVhie4M0xvVLuZxWAqaB
         LPDzK99AXCv2Dq0TUgS54AhKv0wpoH6/UlSkh0Y974LNA+dUrcIigNyHPIqtkGdpwcfS
         Gz7g==
X-Forwarded-Encrypted: i=1; AJvYcCWqMGkaieH3hYz9paUKOrAWcvAYzw7o0OyN2Uz9DRIW6R0twSV5A2z3BjOxkrmAR0ScHnku4I6OHckp61Jc@lists.linux.dev
X-Gm-Message-State: AOJu0YwqNo4Iip160JVyGYsHjp84kj7bKnTQgR+INPG0W1jPtWTmWNkX
	3eO+PRKVqUcIDT9oDTHlXP1jxWfMn6O2tfgy8OpTlDkVfKMcOyagWkb8
X-Gm-Gg: ASbGncvT4Np+9KG2PC9CYCQiKtsejaxOy/Y8T2Ygi8kOkIq212WQoMpCH+JNe/baxoV
	dSRUUB5YCOfhcaUSSX3iAEOCh6a1aVO0GZS/WCA4GrgIqN2LotZoVaNxd4pMar3C5gojPj5fyY4
	4YWErA5QJVC8w6JLmHIfXHRDkXT2AWhI+IHRIj8OoPBZYz4WKfTBuu9Wq6swWybZxfK0trxaAO7
	6jVM8qF8qlR15NFuZMP9aKqM65D2z5If+g/31xRPl96UnpIsWrLrT8oKVrDSkKaWOtU3XdaTyem
	HMzbtI/JZMxUxSE4L19n7R3Tg0CtaOvDJ1HUdpqJYA4GHHdSd3hIMpRrjyYSkz6H9ECDNPXN+1Y
	GodYLpCtuPXhbUUnMMcWQydP3uKOr
X-Google-Smtp-Source: AGHT+IGBIt5ADRN2ko2Y/bSo2YzdOgjYQbooGlhBSnGM0XLl4mv1yIyOiDT13nx1ErQ3x4cJwuQPOg==
X-Received: by 2002:a05:622a:5081:b0:494:a31b:c3ac with SMTP id d75a77b69052e-494ae33623bmr2581021cf.1.1747329388435;
        Thu, 15 May 2025 10:16:28 -0700 (PDT)
Received: from gmail.com (pool-173-48-161-18.bstnma.fios.verizon.net. [173.48.161.18])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f89a9sm409611cf.20.2025.05.15.10.16.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 10:16:28 -0700 (PDT)
From: Tanav Chinthapatla <tanavc01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tanavc01@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
Date: Thu, 15 May 2025 13:11:48 -0400
Message-ID: <20250515171148.22735-1-tanavc01@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tanav Chinthapatla <tanavc01@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d..98d89e836 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1619,7 +1619,7 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 		buf[1] = 0;
 	else if (cmd_idx == BTINFO_BT_AUTO_RPT)
 		buf[1] = 2;
-	hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+	hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }
 
 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
-- 
2.34.1

