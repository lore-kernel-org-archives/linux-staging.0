Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F343E5595
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311552; cv=none; b=TqZti9JYiQd7U0scWx2/8F91NnvkRhjBqBtA+/oUH0zSx0Ub1OrltPu3Mo6GIIrWAhymnBFEpZnhs0zEyQxvO5SggQ6rC6zJA3LkOfKpykNfWzJ+Af9c2Oy7w6Y2d7lp74fVA4PW04SYJtlLXR1BLnEGnqL8mNs+AiBaVYjn7qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311552; c=relaxed/simple;
	bh=fGIxIBCnELBsOKp4BCmXhsHLDnPa8mmcKxzYoDvvxWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+TA7E+oWmI4xoDt5cLcPSHS7UGs1MYZYzyu+yPthF+LlGxNRInyIdUrXFXj2gHvVfl6rIUeH43gTtjQ5qI4gWvWzlGM5hkViT/9QcEMOMXSShm8zXUwpdh8oNMTPj+bHWW4SpYhxGHKGQv/OkGxWM9dj2Y0Pm3ER8Bh0fI8yrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjCvfcTv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjCvfcTv"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e7d983f91so106308701fa.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311547; x=1777916347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5bKZDeMKPqyO1FYNJhVlWaeLq7hh0P0U0r4uDcOybE=;
        b=MjCvfcTvu89JsydqThfn6e3/dtA48wJeMb7gicBjvMICQQxEloNBHTrw5o3RTrM3i2
         fjdQkvWqWCTCOvAfxIipH1RoXZfwrEfm9+63N35WQ4ZVCL6/B58wJJdazWqjK4gQ4yGX
         ieT4R0ryMDyIXGE/Jgd2GEmgeUqvjxqT4SjwO6ByE3F5oYv1CHKgCF67WI5U+x+6qUcK
         CJrxq66UPPDZkV0gFRm433mNMCOuG7qIJYwJl78f4wW9yy4ybWERexbV6d3YRfEMdH+O
         +Gmiz/NiwTi5V0bv+DrGdCfWptWUasJ0KYEYpkEUPaP6E3HXWmu7TMx4MmOYomwqPs+M
         AWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311547; x=1777916347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5bKZDeMKPqyO1FYNJhVlWaeLq7hh0P0U0r4uDcOybE=;
        b=mYx/+rHvXocp41oszkPIjxkxR79FRavZQCIrsnOnaieKezDl/HfPvv5UQylAT6xYXz
         VWkVKsng7LmspZX5sta7cf7U1Yi9YEf2CvzEd/JnN8iN0OQURWcxAUmqcHlA+5au06sc
         j83TKKJMJuZn1ymsrvt2p2vo8U7jw7yUAX7yCjVPQXCh5px8iR2zWUFnnPCBY+vzAI/6
         tB+h4+qV4Vi4W1phagIfbabrxnQM/DTsVeUlzkje0474Y6DQ2eZkaK/joFbu14JyiSb0
         Yyx0fVAa0sunrPX5Ezwvsw1XjcadSWXAXu2znGdDpQm1YIAtUPSIREj2WDZhbSe/jYyo
         c4UQ==
X-Gm-Message-State: AOJu0YwjKQceEacVXPqzqPt3NM1V+GsWOoIDznSyWGgyO5aE2WOmXaQw
	ABi9VvgoFKY8mkuXmZ/CR1XBkHgzbniDTK7iBdXovNiQ/ZmOWN/udtAX
X-Gm-Gg: AeBDieuRjSceechjHrhsMfLuXLY75FxlRr1UWCX61vXrfAFBLGcNc3//o/NI+CaHetS
	ZcVjQzwJLxoHvi4i+EP3+aBCZLLHtuqwPg+fi1VCjM+0vwYg0S347RJ+xxt3pDYiPB1Z7k+YMb4
	BW+hZdMSdd02sMkG6pIVOLTUfKltPyMyY8pU7S38jUWjCZ7HZBOqwz0cVVfZTmPw5VuAkNPpV6z
	FxBggjg+Ohzp++H28xLc4CtKjsHe3MGiYRD0v8KHaR+L+njGrCdbXQ7jlicRPUHT/A6KDbTvH2/
	C7EcOHxnP+IfMgPKgQen3SYpcL1D8jvbwmPSfhireRAVKnhGXv2zqTQExgTLvD1REnYhQlydm68
	eOOnLjkh5FUzK+lmFWvtgPkdo5zcDNsTUy0uIbDqgRhXvqsjDSVhb8wcxThUVWfSWt/EU+G4kLX
	lRA4FETqeg6e/D0Pl4PoR7/awIrXgy9JbON3iHAE1jkFEhEqgWkOItsl1NcFvVYZspeBDt6ySW9
	Sgl40BMhyc=
X-Received: by 2002:a05:6512:31c8:b0:5a1:3f3f:a29b with SMTP id 2adb3069b0e04-5a745e32ecamr69042e87.6.1777311546888;
        Mon, 27 Apr 2026 10:39:06 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm8363602e87.23.2026.04.27.10.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:06 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 4/8] staging: rtl8723bs: rename rtw_btcoex_media_status_notify definition arg
Date: Mon, 27 Apr 2026 19:38:53 +0200
Message-ID: <20260427173857.585742-5-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames rtw_btcoex_media_status_notify_definition argument mediaStatus
to media_status in order to conform to kernel code style.

This was found using checkpatch.pl

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 524f0fba294d..6eced86d6623 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -14,7 +14,7 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
 
-void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 mediaStatus);
+void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 media_status);
 void rtw_btcoex_HaltNotify(struct adapter *padapter);
 
 /*  ================================================== */
-- 
2.54.0

