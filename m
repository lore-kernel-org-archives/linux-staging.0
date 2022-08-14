Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E262573
	for <linux-staging@lists.linux.dev>; Sun, 14 Aug 2022 17:50:33 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id u9so6584881oiv.12
        for <linux-staging@lists.linux.dev>; Sun, 14 Aug 2022 10:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc;
        bh=knj+8z4UTU4OZaEAZ8wqsUOuV/Nu60xNyiNJljXS19Q=;
        b=QHsxPE57quzg5BAU+EIYqrOCV22xtAzg9GALEKqEOwhtkF3jZKMel3HyWqwkv5vNfd
         trrHS0dcVJKUs9A+Ng0uQd1JQwp1s4c9Ghy2s4hpkl5+R11bK/qWbihJ08yA0Rca8q0u
         wn+pXwVEK49cNtR4/0x2lqAaBRjOqyoKS2YET+/0tuevpwYpa9euaMmJfENeVUTRA0qv
         vQpAGRBfHFHk8MCk6zuCABSAsFlK0qJdYcFIQkY0SF8y8srcf7N7QL9iXqNAfh9Xj1eO
         fOpGhdsZcOZv+VFTWAmHiyb/KsOmQ6cBefBk5h2YLPzoHFAq0Far4ayxUQAtCFAcLP5F
         7Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc;
        bh=knj+8z4UTU4OZaEAZ8wqsUOuV/Nu60xNyiNJljXS19Q=;
        b=buI80BRUg59wPwykqnn2245qWKapi5tz/5cNrOlvXM2F8quVLkMgm9UkItOTSoE98v
         xh2jMEvGqbFvpZd4K40XWoTTPN9AXcbG0q4Vy7S3CDb0lresB2XF+/Tup7bka0xfWzgB
         021PoKSxNc01da6OKIv0zwyvatF+TbDyZFzsXMyfY99GCgduiQdx6orK0AxmHRrWgYal
         KpW4N4gohLQkZHec7MAY6EXIFiuqjO/7/sP+vYjAnrHwpyqxjg0Vmy37pD4xDmprrfR+
         vwyX/wS3eyqBqh/EnBiuos5lT8sQAJpRaF8j23psf5S9EnhcZFPGdjXgULS92YBaY3Ak
         CupQ==
X-Gm-Message-State: ACgBeo0wKl5ECOpHteLM/fskeesMBGzqyTale5UcTFNGO1b5drfeyqzo
	IBaV4MjQaf9/83qgxVClZIk=
X-Google-Smtp-Source: AA6agR5RnSps4UtO1s0bbx9x06cJYKqMO6GiHSZzgzKSgb9LxS6C2z32RZ2oZvy0oGO49dtDAYI7Eg==
X-Received: by 2002:a54:4496:0:b0:343:2d07:fe01 with SMTP id v22-20020a544496000000b003432d07fe01mr8765781oiv.226.1660499432764;
        Sun, 14 Aug 2022 10:50:32 -0700 (PDT)
Received: from localhost.localdomain ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id t14-20020a056870638e00b0010e5a5dfcb4sm995874oap.0.2022.08.14.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 10:50:32 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 1/2] staging: r8188eu: Add Rosewill USB-N150 Nano to device tables
Date: Sun, 14 Aug 2022 12:50:27 -0500
Message-Id: <20220814175027.2689-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device is reported as using the RTL8188EUS chip.

It has the improbable USB ID of 0bda:ffef, which normally would belong
to Realtek, but this ID works for the reporter.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index cc2b44f60c46..9147d176da4f 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -28,6 +28,7 @@ static struct usb_device_id rtw_usb_id_tbl[] = {
 	/*=== Realtek demoboard ===*/
 	{USB_DEVICE(USB_VENDER_ID_REALTEK, 0x8179)}, /* 8188EUS */
 	{USB_DEVICE(USB_VENDER_ID_REALTEK, 0x0179)}, /* 8188ETV */
+	{USB_DEVICE(USB_VENDER_ID_REALTEK, 0xffef)}, /* Rosewill USB-N150 Nano */
 	/*=== Customer ID ===*/
 	/****** 8188EUS ********/
 	{USB_DEVICE(0x07B8, 0x8179)}, /* Abocom - Abocom */
-- 
2.37.1

