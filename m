Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B212C85
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:09:55 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id s13so31439517wrb.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 09:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmYuAwim11Nia8KJQLIM3VlP7cUwEH2KKK7OvongJCM=;
        b=Nz4LOKjvzRH21Q5U9yrMJuMebrNlsaLpNFl7wBNxyKdpx5IveoJLTcHo+SFfZx8zyI
         /IMOn8ZrwtdEHNa4TimH4h8R8MrEV9lY3ksYSy3eTQrh+C0vRADrfNKgSQxK8oXNj7Jj
         OAsLnkVs/Gc74k3Yza7ZNwHkiYyvTee4i4ixglwukfcKGUpXV4Vp/XlheuwZhn6qnOC+
         t0BR4E3pxl9bgR7RKOXchi1oPdjw+5iRqYuGB7ItApZxEyDLBySCvmGT4h8MdFCuUnqk
         OLiK6X68rgVAFjmm6zLOImI93oSEzpd3ViHxKFf9a4pQTdrVqP0af2FgqwLjMQpAeymp
         sCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmYuAwim11Nia8KJQLIM3VlP7cUwEH2KKK7OvongJCM=;
        b=euq/z5817+B97DvCLvYQbSBg+yE0SpIvjdu4YjGH1aJvAPRk+iR5EZM+rBrQldF+Y2
         z4JuoXbu/LwjwJsRT+U64lEdKfbhG8KAqkzfE+CZkoic9XeXFA9CQar9abikhBhE6rXs
         ptAp/mc6Wm/X8IXSrwfHCy2GOEnkt7VfHJzE/3ImM5726PeFAerMxLHEvy6y+BxLMP33
         2ua1i3mus2C4xR371rcl77EvjEHTBLjnnjJhmzrwo/jH2Ru5t7JRcvkb9ZJ90pxQ6s4u
         akVUQxtGhvqYIVOyyLjdgwla4od4+2k1nWRNui+BWw/uYXjE9RV7MA0sl6U57Bq73GlY
         9xOA==
X-Gm-Message-State: AOAM531BoYyI0+R8NLLRXy2A7ok2ZpeGdoz8wSj17bulH3HxhISck5xV
	2OQwBC7yhp8W9zCfmHwSeTQ=
X-Google-Smtp-Source: ABdhPJywlOSAu4VWAh3iMKBs+zObErzL4UCihv1zRwNjRHEtX28SQYemISOrH1//FjEDfDQvQp+GNA==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr27834325wro.609.1638119393759;
        Sun, 28 Nov 2021 09:09:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id n15sm18243845wmq.38.2021.11.28.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:09:53 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 08/10] staging: r8188eu: remove unused HW_VAR_RF_TYPE
Date: Sun, 28 Nov 2021 18:09:22 +0100
Message-Id: <20211128170924.5874-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128170924.5874-1-straube.linux@gmail.com>
References: <20211128170924.5874-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous cleanups HW_VAR_RF_TYPE is unused now.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 04518e9838ea..9d6ce74d7c31 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1685,9 +1685,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_DM_FLAG:
 		val[0] = podmpriv->SupportAbility;
 		break;
-	case HW_VAR_RF_TYPE:
-		val[0] = haldata->rf_type;
-		break;
 	case HW_VAR_FWLPS_RF_ON:
 		{
 			/* When we halt NIC, we should check if FW LPS is leave. */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 693eb32fe1a9..7385ebaaba5c 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -29,7 +29,6 @@ enum hw_variables {
 	HW_VAR_ACK_PREAMBLE,
 	HW_VAR_SEC_CFG,
 	HW_VAR_BCN_VALID,
-	HW_VAR_RF_TYPE,
 	HW_VAR_DM_FLAG,
 	HW_VAR_DM_FUNC_OP,
 	HW_VAR_DM_FUNC_SET,
-- 
2.34.0

