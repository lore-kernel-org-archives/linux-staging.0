Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B52564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:29 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id i27so12928718ejd.9
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86bWkUU1DWtqExQIpuhgVcDC/r0eepfnI3UV3du+ILA=;
        b=ZF2eIv9ThBCqKphf5UMqpw+cNVjGX1YXmq3VIN2ZG93OmjFxooJ63vFD/WayYDMhSz
         4kR1GsaWyTnu7Ah8tJuLyNGvAY/FKomCHoki9gT/ELaTi0J1CZfnOWUwEQ33gHjP9wU0
         shH417CVQUtfVxRtAOe1MxfAg05a6HN304tCV1HjhQG1HWSmPTQAZTJz1SLe/opBo/oT
         mKLDAu3fqxTqCWdT8sQjsOhHLLNkkocVPi9bmZQ1WBo/TzrtTbwNs/Tm+cIhGV+mV8xU
         giAuMOTgDOskKbuTMBrNU540HXV9jdmgSSBPYy01eJOWt6UAXaz5bhN0HoOeng6b3J/B
         rP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86bWkUU1DWtqExQIpuhgVcDC/r0eepfnI3UV3du+ILA=;
        b=kH1J/AND/FK8U3fhM1CjcVuFjzjRtYCRcf/1pguKQwnlE4vzPyf2pyn4K4wmT+zaie
         SuPG74JywAOEO0Ebz44xpgbVr5ZiDVjXgzlw/UaxdF/LBQBoXyCuLGNhunL3q7d49EdS
         TKeOJ7nJeBamqD1STn1M/0hH/TUGnG3duJvrEtJ37quhnUoqOM91zW82k8++TqPvXh8W
         /HuZPDZO031w3Ub0lZfImXi0X91aEhZhmZ1Ok45jE0EWnxF+7QmPftdd8cyCv+GE/eXv
         ddh4ZL7qRPN3GOxWTruM29BHpfSUJTOlolW+YD7So6gVBm9FwzjsK2qgOBhi/N+Ue39h
         iQIw==
X-Gm-Message-State: AOAM532Y2qDbhT+76hzDvNHcUTgTmLBJ2WfrGxnaI9Cfqxz6aBYC1+5x
	BCLSKvhFpeZspyuqZEQNgGE=
X-Google-Smtp-Source: ABdhPJzaDeHLK//UqDlGr1gZKqD0RXONg04r9gqQGNsD312Pou1R2vAcj3+LLuu11D1pIy3u8bUNEA==
X-Received: by 2002:a17:907:3fa8:b0:6d3:477a:efe with SMTP id hr40-20020a1709073fa800b006d3477a0efemr15353946ejc.401.1649359707559;
        Thu, 07 Apr 2022 12:28:27 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/8] staging: r8188eu: remove unused prototype usbvendorrequest()
Date: Thu,  7 Apr 2022 21:28:17 +0200
Message-Id: <20220407192819.10661-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407192819.10661-1-straube.linux@gmail.com>
References: <20220407192819.10661-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused prototype usbvendorrequest().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/usb_osintf.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_osintf.h b/drivers/staging/r8188eu/include/usb_osintf.h
index 3e777ca52745..32ca8ef95b23 100644
--- a/drivers/staging/r8188eu/include/usb_osintf.h
+++ b/drivers/staging/r8188eu/include/usb_osintf.h
@@ -13,9 +13,6 @@ extern int rtw_mc2u_disable;
 
 #define USBD_HALTED(Status) ((u32)(Status) >> 30 == 3)
 
-u8 usbvendorrequest(struct dvobj_priv *pdvobjpriv, enum bt_usb_request brequest,
-		    enum rt_usb_wvalue wvalue, u8 windex, void *data,
-		    u8 datalen, u8 isdirectionin);
 void netdev_br_init(struct net_device *netdev);
 void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb);
 void *scdb_findEntry(struct adapter *priv, unsigned char *ipAddr);
-- 
2.35.1

