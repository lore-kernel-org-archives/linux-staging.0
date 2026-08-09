Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC124A067
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786286666; cv=none; b=RlnMSsuAJ2hHmD1FRH2ybNfeRagTlZDXY0xwsE+R91QsyPkUJE1JxciLtHTIQfPUG5p+9D0pVXs3Ha/ZIkHwsfr5Elb0xf5f6p27CImkMucJ6vlnqSE2e8Hqh3eLlGpQOeWogYJ9KyenIMqcllrEEdqAA11RlIOEMjWGz92ZB2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786286666; c=relaxed/simple;
	bh=YLAccbw1eNuYL+141fQ+9wLw2CyCOvmrvVqiNoJgNVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dPPWl28yysHQtgu08fw47mufM3tjmxYhldCwVZTGqri2IgYqQIiHkwN4zTqqLLYQAtFK8d6mJ+/4Ji6kA2if/1JlJePuuBgY+eb8VKTv9Nz8S35E8xEUpiIRdEyjht8KBSu4UMH43nNTmViOnwgwb5IGhfJ4A8sJUJyqTRAWSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5yA5x9u; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5yA5x9u"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4798bea72f9so586374f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786286662; x=1786891462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRZmBN9wNEDqaO7SruE/ZQGmQHUIz5x0QScGuiM+0HY=;
        b=S5yA5x9u0zVjjl4KBnWY+8R1LW+A+0Q/nj43Nj3n5WxHEDP7OmKh9Q/K92cD1tz83Z
         k74nLiyjC6J8Sn3c5JRMEaBBGsRA9H4RjMKfDeKEPTuY6zXRcYFSc5iz7ypLxTOkSnBC
         Y8Dc9aMy8PRZ0klqmTC4v4RIXVIQNkVYG2IYQEYOrdW301xzF2Cf5+dOg5ztNThlpxNT
         ewaeKabtnsQ4bqbpdv5dKSrVQxovYWeIjpaZr3Lde/8oJUDxv/XmLXAG9koeGZ9PqkcS
         1sjUCwMVCxraCnc5ChlWiU2wKKd3htESMwO/PxrbgLyJ0BkaZ/i7ppjgl1z1c/j97pEj
         CUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786286662; x=1786891462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRZmBN9wNEDqaO7SruE/ZQGmQHUIz5x0QScGuiM+0HY=;
        b=b5UsOdUJX2JIvwmTk1xyI7mnM/UYYqLlJeAqZoyT2jkSrgiPCwxrgkel1c6O7/ESB3
         aPULjvMjkmSdQ71S3Xe1/SN8oB2dhfQuGz/ls6S3gWaUVV5/Myaai2I5nrnWdBh7jqAG
         s+LueVCATLkLr/48ZSx0SkW0hb6oQn+nMg8UrAraVCS1WibBbEjK6Lol0UBp6REwfEjJ
         xAz5Q2O2+cakziAX+5r2FdXt6UU9l3/QNtu7m6KNPLB04XW5c1QskY1QN4GDXM7EqsDe
         nJwlPYwxb5Eit+RgD0qFRqbILmyhb8Go6XjQB4+GauespZBp42UpiONZppWAgDOAHPde
         0jMw==
X-Gm-Message-State: AOJu0YwToSPmdhYXytPAqCV1Nno2psILSuqrrjMQhpxdEQeBpBB8y5NG
	PSlSB1v+5SJ42lDE7Jy22sFD+C5yr+T6/slPikDc6qI8BE9o+4TQUB5f
X-Gm-Gg: AR+sD12TkyJft1mhYe193SdftvCxnB82X1GbH1RnGQmwDgU+UaLWW0CbRJ83zrEsAHz
	pkPkJFu/dMT5fIVYDAtCggN7/jlGsVCcDRCUvSkBGc0/kKKmBEPILP/KP0LcqRToAwHmDPN+Nsk
	8HM20hlug/eAOh6lfCiEtQCRM9XFt997rZb9yOXTC1wicrjgCQUQ9K9I8U8Is96EVJSGMPBatYY
	MuiDENBw/lzULg+9TdafhqsMaFDxL5jXlyD9v9tM4wc+bcLn8f/pMzXGN5Ws5FDyDhkrLjptnG9
	ZEGotVTCuJAivDWzhgWAqsQTf6MA2K0G3CiRGVTG/f0py8Q/PLe6x09VDDDVqwXgBcLAiHgtoVE
	ftuenmR9jMzvV/oPDfAhZ1DrdHxQsykY2iz8HJq1GIsyb09RmhuRhY5Xcbei4F42mnS6PpQ8h06
	h+q8XK4jVmU7bG7Se2JNyU5XcBVy6YMm+hKuvxUPX3YBwIsGuRQLGhj/OA8ETdZPHZXT2qM3fwi
	gsXKYyE1pe0iYcWHDsAd0eoQ+5zqPbVXVDEnJ3AfG73eA==
X-Received: by 2002:a05:6000:29c2:b0:47f:77dc:b066 with SMTP id ffacd0b85a97d-47fec4e896dmr41711171f8f.5.1786286661707;
        Sun, 09 Aug 2026 07:44:21 -0700 (PDT)
Received: from fedora.tail740d57.ts.net ([185.70.52.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145589sm26171932f8f.1.2026.08.09.07.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:44:21 -0700 (PDT)
From: Andria Shengelia <shengeliaandria9@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andria Shengelia <shengeliaandria9@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rtw_ap: fix line wrapping and logical continuation checks
Date: Sun,  9 Aug 2026 18:43:55 +0400
Message-ID: <20260809144355.161212-1-shengeliaandria9@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line conditional expression wrapping in rtw_ap.c to fix
checkpatch.pl checks regarding logical continuations being placed at the
beginning of lines and lines ending with opening parentheses.

Signed-off-by: Andria Shengelia <shengeliaandria9@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index a6dc88dd4..9c14ba1dc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+			    (NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2)
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.55.0

