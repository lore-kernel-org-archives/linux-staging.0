Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FA2370D70
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893485; cv=none; b=tNDLaO0+vby4yJlojY4mtkBBq0dRq+SnTdssODpIiAoWG8TmL4uTmCFqgPoLXUM5CZDY94EZ5keWw0nLXTdn2ieUal385CRX7tCKY882tLu76lzBc9Lj2l2/Z8EEVdwJvXbcTAhoqjcsm0hdIyJv5hmGx2p4H1oW9o+ZjGLPRU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893485; c=relaxed/simple;
	bh=/96kioy+nooUXzXoTGMXBgwBdB8hROa4Ie+CX9pIA9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEVb194Nr8MzmtOvwAutJixgOp1ci2T+LWdJmxxmBjXcfJplrJTPSyJ7jBgl3Pc6xCyVHz8e/ZV8dpM1H23lm1M6F72oSTw09gnOJBH+bERWKJp0+KirBMSKL4U1uLBtQ7w1SuUDssvApLuzb2T5cft4+KCbfTjM3sCCBTBlNk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5h8I83x; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5h8I83x"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2322654f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783893483; x=1784498283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y72amxkjmtbpOWkPfdLGFcwXl0bAUwvlpsCYltcE4iI=;
        b=R5h8I83xq+lBrSq6COiauLC9d42r4I7Lv/+Ckf17V1Up0GhDcxD1j9u4Lw0q/1tTTS
         VEzAno1iB5fae3KsfIIuImBIEXFJEjQtati8TL+M94XtdzoWekOTCV3C4VXjGfUGlX4D
         LMy1lXFcrQYrXJKTWMRh+FhitK9gXWMyygssojYJPujEn+Y2c+SMI5NHojpsy6oRTqUV
         Sp3Q+Bkxfo9+YWl0mAxPYp6ReIDL7m2zf0C7D7IimHQ4BQ3v/g2PIqBrYhrXGDEruGsy
         5MkKwKJkWQ5nYO+m1qlRSuwLEbnRaRLH3W4ND7PFyUw6dkrI4PIaBWlaHz647SgoGj5g
         CbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893483; x=1784498283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y72amxkjmtbpOWkPfdLGFcwXl0bAUwvlpsCYltcE4iI=;
        b=qnCQQHoW0M4KWuNJiZ/j0abLJqTdhQYAH/fJJQvU/YRffbAvdOJrD+dJku3Ob3FQFw
         zAlX/MWktTnAtCPgps53hu/6Ut2A+YJZcCTUPEiEZO5Wfm96/hYXqfXGMKvnyEnwojeu
         zS+6WgYsmqKCBlqEqThrtrteh6jf+a8XCWHEInf93DbxiZbLxz5Psq87d/FHCPhAaOMH
         c6g5zL8JCw7o26a1FJLcTUASkhPgRkCX0l2a6uizIU1WkBqOdNrpixY/KBKWXEkxQdHk
         XMv6TpTaQ40qysiBnFzIVVRw4TwnCZmDcaxz2a7NcxpQq+teUY7E4Y1p463XlEM9ETWX
         +z0g==
X-Gm-Message-State: AOJu0Yz4Dg+A+0nHHI71xNEzabGtzryCoT5ilfIWCpRHNOusJjoWV6Jr
	TNh59co/8Cly+IPHAezlNzJatcDzNV8Jxqzisc6LmE1CP1PlYaqOHKSaOucKUnpv
X-Gm-Gg: AfdE7cmqcm45/KrXJ3wT2ZswUSJOR67Z3C0ed9GA8dUZt9wW9xfiINiuQWwIkKz0KeX
	O8HyNOBhuFyJWcCAhNSTF/bMrSHAbA42sSUUC/1b68fwSd3o2TyNxUtXdvT1OyZFi5exfe3yZ9d
	yOGuN1yixBdl1gU4cxn69ZZ07CKQvq7uktyOEQsGzlSGvPvHDe8BmLnvvGiDBXGWKWxFlEb8g2x
	tiIvVbWuO8poyO+wmnIicyygwfdp8QbNka+4WJ9c4nvGMHCb9ZGrKNTiVwIc8aGOjHkfjMpWSyd
	qW1qZUQcaL8ivw07iKbdNd19eyJt/vwURutbcdhc9dCNG4hotuLGk0JI9FklDtEVEsDlK0r0JJT
	A/z9RSPvRptabma1B/pRi99QgufeUT5CpN073cKyRM5kIB9PyKwoaM/Zl2aE0ZQ9Py7aEVTJk6p
	XOadFI4DrVfGzupTuZGWwdrh9LsOC0H5KDHYx62q+fD7A8wkXP4gH9lhF2GHnrecrYJ5VecxSdM
	+cbfQ==
X-Received: by 2002:a05:6000:4381:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f2dcb50f2mr7715980f8f.14.1783893482780;
        Sun, 12 Jul 2026 14:58:02 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm84888158f8f.4.2026.07.12.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:58:02 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove unused parameter pnetdev
Date: Sun, 12 Jul 2026 21:56:17 +0000
Message-ID: <20260712215617.35003-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused parameter pnetdev from the function loadparam.
This function is called once and the argument is adjusted as well.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index fb6fc603f279..ec5e4d6a841a 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -175,7 +175,7 @@ MODULE_PARM_DESC(rtw_tx_pwr_by_rate, "0:Disable, 1:Enable, 2: Depend on efuse");
 
 static int netdev_close(struct net_device *pnetdev);
 
-static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
+static void loadparam(struct adapter *padapter)
 {
 	struct registry_priv  *registry_par = &padapter->registrypriv;
 
@@ -439,7 +439,7 @@ struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 	pnetdev->watchdog_timeo = HZ * 3; /* 3 second timeout */
 
 	/* step 2. */
-	loadparam(padapter, pnetdev);
+	loadparam(padapter);
 
 	return pnetdev;
 }
-- 
2.54.0

