Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95FD18A6A7
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296582; cv=none; b=k7MRlhfCqX5d6l90EKB6UVCAuqMG/rW8xmWHcfSCV8Zs3lyNE4SYz1G6om+jqeJ2fucKB/1SJHj9LqRs10rEMGj4SnVvyYGaO7jFDO2FYWL3ZU6kJuXv9EyrvmCEoFP4/+aTOC5bxun4WcmXbIRhyQAAM9CGqfe2JebDYSex/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296582; c=relaxed/simple;
	bh=mYBH0sH57nOuXOhcOdBlQeETDJJNz3TLu96rnp6zraQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4JkDIFByq+ISFOR1IZRCDgunf8H0S/1U746jCrzD7WoTqtgNl8e2/jm5GjFBRcpUVONnhe0O1ZACQCuKvGaB8noEjAManQGcSKV1en0YD0UaYqqi06Pk+85W+LtJHOoSSefVaP3pmPRfTbV9Xt1myxUIP8xnTV9raXKnDHBWHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsABV9lF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsABV9lF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f47610542so1741758b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296581; x=1769901381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hcgvoe6D06V8qN1d3U5vkyeQdiyglzHRGb+iOpihG9g=;
        b=GsABV9lF4Ho3OHt61I7xtUE9n7EWF8k5M3QQrcu0YHhkwc9eBRZ/lY3VUs4UO4zaFk
         QZNHvwvzhGrMS+ClU9k2ychFRnpFdICgaLqG9U6i68hk3Vq3lQQU5w5tGJ5UWVpyP+Bo
         m1Wo/hGMEMPwFi+8XDJDVYlTWhIUp3TYZ3MBwPX/HWvwjhFQPm+Dbi4NJ0jSd2GMMTfK
         2dV0i1qejCZCmUcIKAYD5IcKt2NOjlC6U7L3jnMU+hXaXmn275Lj4ZQhJfA0wSD6j2xF
         yN7bl6Z4/Xp/0xWFjSWVw83XAs3MSGOEGyttNu4lWV64shOKLKNccb4YF5QAyaIHjikM
         jLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296581; x=1769901381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hcgvoe6D06V8qN1d3U5vkyeQdiyglzHRGb+iOpihG9g=;
        b=Q4gA3uPyKSzh3mMh7ZPgN1HP9m1w6V6qE69kiO3fAR+GEkdho8sH005n6ozTXSZj44
         bYUZi4jGvwDpmiKltbZ2RU8w+FJwQdKMdNyUX5Vb0uKp33UohYgasmB5pscc4aE9B6nF
         fg7auxAYzjrEO7lcqljg4ow4ngXDIXyGdJaFn7guYCGqyP+H/Jn+g/duhzOv/RC93+sC
         7I5F3K5YAlErgZ6IQ7+OP1IpOZhNGziMKaI3yRpSQ9Fxy7603V3rqVLGkf2dl/Cf6Awl
         dBLEQw4oONAwQ2Uomd5Ce2eC0Kwt0AbKA+7VeSJS3PQ+stPj7Q0LALdym6SwInIbIv0e
         VM4w==
X-Forwarded-Encrypted: i=1; AJvYcCUOXmbiWgWokLRByo+k5coOJiSue0u9dLdUMWyM/701itFACx4MzYpZT6m0XDsYY6+mafjgnH4JR2KqaUuZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1tZ5+TReZt61GW5vu+B9k6xK/BXCrnCiEx/G18zle4j7AkGcT
	mAGhgYayCe+AX8MkdicILIBPSmQ47ZCnRKQSUUT20LHP6ngkVjRcvMyp
X-Gm-Gg: AZuq6aI1kWO/z1skZ+QWNPEKcXKdD44ciyEINQim1hbZa91I57Jz70AIJPMdFuz7dEc
	65a2mDC1JxDR2Q3GqSNgLVHnghk3GhTOPtZrqygHgltO5JUFTyPo+zoUkvqESCI9FeW98KoZKCv
	/FuPo9W5OXAoWApVrX/aqwE4xI4y/gwUt/f+Cp+GoRzb6zV7SxIUF59lKLBrRJqWINrHH6dVr2E
	04ryQqhZnCpTkYJLLLeIDjvgmOQjRWVnxrdQju2+c3f20QBbmgMyiwxJeEMkPlr4K+AWp3H2FUt
	8Uhfpfe9rTK0jo2HiBTNuLUC+uyZrVGR/pYKy6W7Dv8qwtEid1NlhQ3OEWpYm/mjTfXnGMw0A2k
	nrUUXdFV1KlG7+5oOKsfr6IxaEm4C2ZvZ7oP/+g1GUHSA8WcfMKfl6mQbcve8mUlEoEZNjiLq44
	nDfYBr7cMmVXGc/NbNhmF9FJ/y1fEf57My
X-Received: by 2002:a05:6a00:bd91:b0:81e:a228:f0c9 with SMTP id d2e1a72fcca58-8234122c4a9mr143038b3a.19.1769296581027;
        Sat, 24 Jan 2026 15:16:21 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:19 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 2/7] staging: rtl8723bs: refactor comments to fix the line length warning for exceeding 100 columns
Date: Sat, 24 Jan 2026 15:15:52 -0800
Message-ID: <20260124231557.18189-3-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust the positioning and formatting of comments to align with the
flattened code structure. This ensures comments remain relevant and
clear following the logic refactoring.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d80c1a2620e2..4039504ad666 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4987,7 +4987,8 @@ void linked_status_chk(struct adapter *padapter)
 		link_count_limit = 7; /*  16 sec */
 
 		/*  Marked by Kurt 20130715 */
-		/*  For WiDi 3.5 and latered on, they don't ask WiDi sink to do roaming, so we could not check rx limit that strictly. */
+		/*  For WiDi 3.5 and latered on, they don't ask WiDi sink to do roaming, */
+		/* so we could not check rx limit that strictly. */
 		/*  todo: To check why we under miracast session, rx_chk would be false */
 		psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address);
 		if (psta) {
@@ -5968,9 +5969,10 @@ u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
 /*  TDLS_ESTABLISHED	: write RCR DATA BIT */
 /*  TDLS_CS_OFF		: go back to the channel linked with AP, terminating channel switch procedure */
 /*  TDLS_INIT_CH_SEN	: init channel sensing, receive all data and mgnt frame */
-/*  TDLS_DONE_CH_SEN: channel sensing and report candidate channel */
+/*  TDLS_DONE_CH_SEN	: channel sensing and report candidate channel */
 /*  TDLS_OFF_CH		: first time set channel to off channel */
-/*  TDLS_BASE_CH		: go back tp the channel linked with AP when set base channel as target channel */
+/*  TDLS_BASE_CH	: go back tp the channel linked with AP when set */
+/*			  base channel as target channel */
 /*  TDLS_P_OFF_CH	: periodically go to off channel */
 /*  TDLS_P_BASE_CH	: periodically go back to base channel */
 /*  TDLS_RS_RCR		: restore RCR */
-- 
2.43.0

