Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC72CA1
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:12:29 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id n10so20913717edv.2
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1AVN0e7+wSCiMDsgVXe5hxd5jK8h7WXEx+niad3RkKM=;
        b=WIX5Uw146iMBjci2EHosCeX+KCz9g06Fel/rdo63DdjpuFbWYHM1SSYBgRT+7/4RNN
         1x2lQmXMS+9KwyjU5b1+PUZaNZd+Ri/6PUDxm86TsVGKijnhwQllx+ja0XBzJKcqUJp7
         dZP/rT+tollXnqjSujFZgaC2wCHO0m0YZNVEOtLnKb5Ne9qj9JSD/L4oNMQnEyps9Dzi
         LrTQPn0EhIm5pbjLHljeDjTgGVXYV2jjupfb2lpbVD+xCLoeo2GgR/8nw4y6NuIJdsMc
         2F2DE3qOjfL1WH3WJjlQu1WIUZTM2oaHAntTa0i/3W2xsIVsrGENMJuoBWA0dxR8qajh
         HxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1AVN0e7+wSCiMDsgVXe5hxd5jK8h7WXEx+niad3RkKM=;
        b=DHX132eNvOl8C/fJ7eANr5omw27oFWvRjvBG0PbxZ7Tq1FTW0zqiTBTvBRNqqZlYWr
         pyA2wFCTm6GWLyjd5jNjCGgjFswnV6E2MTIreMc3m16bWY3dDW4Ip4Av0WJSiS/tl6Fq
         Q4bcC22stKbOwj4QzOgNBNfiU92y36Rsb73sl17Xzt6HCjryD1OYn2A/gAIFyQsi4C61
         nFshpWOnocwjRbqR9sUAV46+dN3w1/eBgjUF6Xw+yKICMrYuZbcaS3j4smYzp2DYtfH6
         egXqBGXBMKgsklbPbqwZgxnh12FB2idUvIq2g0tJqW3i12yy0OJCJ4vouoLB40O1lP9+
         ewsQ==
X-Gm-Message-State: AOAM532eW593A2U7zV2jJmzlZ4cJdvW2B3nXERjqhrFmAW2Ay11iv954
	pLTOUz9SeReZBHlsR3UjnE0=
X-Google-Smtp-Source: ABdhPJxLt2+gku5XsKep2reM7iU2/MjVVZqNEs/B6nGbEk9D0CC14SZ5FQ+XP+5xm9xdbAeiCjijbQ==
X-Received: by 2002:aa7:dbcc:: with SMTP id v12mr16266757edt.263.1643541147394;
        Sun, 30 Jan 2022 03:12:27 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id nd9sm12129510ejc.169.2022.01.30.03.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 03:12:27 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: remove unused parameter from hw_var_set_*
Date: Sun, 30 Jan 2022 12:12:18 +0100
Message-Id: <20220130111219.6390-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130111219.6390-1-straube.linux@gmail.com>
References: <20220130111219.6390-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused parameter 'variable' from hw_var_set_* functions.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 3aa5289a61f0..c5282603a42c 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -970,7 +970,7 @@ static void StopTxBeacon(struct adapter *adapt)
 	 /* todo: CheckFwRsvdPageContent(Adapter);  2010.06.23. Added by tynli. */
 }
 
-static void hw_var_set_opmode(struct adapter *Adapter, u8 variable, u8 *val)
+static void hw_var_set_opmode(struct adapter *Adapter, u8 *val)
 {
 	u8 val8;
 	u8 mode = *((u8 *)val);
@@ -1027,7 +1027,7 @@ static void hw_var_set_opmode(struct adapter *Adapter, u8 variable, u8 *val)
 	}
 }
 
-static void hw_var_set_macaddr(struct adapter *Adapter, u8 variable, u8 *val)
+static void hw_var_set_macaddr(struct adapter *Adapter, u8 *val)
 {
 	u8 idx = 0;
 	u32 reg_macid;
@@ -1038,7 +1038,7 @@ static void hw_var_set_macaddr(struct adapter *Adapter, u8 variable, u8 *val)
 		rtw_write8(Adapter, (reg_macid + idx), val[idx]);
 }
 
-static void hw_var_set_bssid(struct adapter *Adapter, u8 variable, u8 *val)
+static void hw_var_set_bssid(struct adapter *Adapter, u8 *val)
 {
 	u8 idx = 0;
 	u32 reg_bssid;
@@ -1049,7 +1049,7 @@ static void hw_var_set_bssid(struct adapter *Adapter, u8 variable, u8 *val)
 		rtw_write8(Adapter, (reg_bssid + idx), val[idx]);
 }
 
-static void hw_var_set_bcn_func(struct adapter *Adapter, u8 variable, u8 *val)
+static void hw_var_set_bcn_func(struct adapter *Adapter, u8 *val)
 {
 	u32 bcn_ctrl_reg;
 
@@ -1078,13 +1078,13 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 		}
 		break;
 	case HW_VAR_SET_OPMODE:
-		hw_var_set_opmode(Adapter, variable, val);
+		hw_var_set_opmode(Adapter, val);
 		break;
 	case HW_VAR_MAC_ADDR:
-		hw_var_set_macaddr(Adapter, variable, val);
+		hw_var_set_macaddr(Adapter, val);
 		break;
 	case HW_VAR_BSSID:
-		hw_var_set_bssid(Adapter, variable, val);
+		hw_var_set_bssid(Adapter, val);
 		break;
 	case HW_VAR_BASIC_RATE:
 		{
@@ -1122,7 +1122,7 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 		}
 		break;
 	case HW_VAR_BCN_FUNC:
-		hw_var_set_bcn_func(Adapter, variable, val);
+		hw_var_set_bcn_func(Adapter, val);
 		break;
 	case HW_VAR_CORRECT_TSF:
 		{
-- 
2.34.1

