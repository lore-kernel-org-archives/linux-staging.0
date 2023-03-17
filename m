Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C529665D
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 06:50:50 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id w9so16664516edc.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679035849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsabCMN0jVXQwz5SLXDNmhQC+MOhJm5LHTpIIA+t6Qo=;
        b=UdS4eGISzJzHT/LF8yroXOCbDwHnve5JXf1pWBusOrBy2ytJVdMeHJujkpReG2+1zD
         J/9kOwHT5dZ01kGEQHbBcJvAUfmRMxR6rty88hiPLkQFHnCbRS9pfeDCaA9gStfeGue2
         JQEJo81n160sPj0nwt4KFBMX0jxPUn//V2Kvbx2q7tKQ22AtxfkHBCy+ge5iiyUN/gFf
         AQKlm+LrDr9Z0Thp895siT3bKQl8nEdnOpdqW0khh0j7QOwE870NLIIbnmUNOC6vHpWh
         efkCKOgx0Td0IzxEPsD53+GGti271joQKlnxD6i7TLzhTHymvUqcSIFinM6saO3O+l9Q
         J4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679035849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsabCMN0jVXQwz5SLXDNmhQC+MOhJm5LHTpIIA+t6Qo=;
        b=l7U5szmFvavh9YqAxZkoNHHPLPNV8lv56/uTObDpzfyN2TCd2+rrCfMS3WzsYVi+MY
         gab2oSBSVELkT/e6MQbJDaGjzsR6oXYxGa8jE4yGs2BK6DYAAPbidwcVAX0xxK1MYamc
         m7l3M4Pky10FVjT+64W6y1GaFaMzDHs1owWoO5cOoQtgroMFk7JzW/zMN6vuThTpRhkI
         EhWTx7CXopWIOyJdPJVJvarJx80MxmfWQVR9efoYOTmdX6EsMDroVmxLBJ2Y1KUKsI1w
         pJXAf1kxTpNMKq3kAK+NH+rDS7gs4yaaB5sYWLeu3T2rQ29RQh09fTcsHhU+3u8DQEcZ
         JWDg==
X-Gm-Message-State: AO0yUKXZvPhtuPZvZ7mSB0hXILSp+mLGuo5ATGlMBl6T3C1xXvq9d3Oq
	cYRhXZ5IW5ulMGh5XleiQvc=
X-Google-Smtp-Source: AK7set/nd1glzlt6Z9M5cWM/ndx6NmSuRKnBc0iy5Kk/tLAeqM8NjAzT9uvTQthctAzKYm3+FJqUUA==
X-Received: by 2002:a17:906:20c3:b0:927:6e70:e245 with SMTP id c3-20020a17090620c300b009276e70e245mr11785010ejc.63.1679035849007;
        Thu, 16 Mar 2023 23:50:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbef.dynamic.kabel-deutschland.de. [95.90.187.239])
        by smtp.gmail.com with ESMTPSA id z24-20020a17090674d800b009289de993e2sm577438ejl.216.2023.03.16.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 23:50:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: vt6655: remove unused bb_power_save_mode_off() function
Date: Fri, 17 Mar 2023 07:50:41 +0100
Message-Id: <20230317065041.16635-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230317065041.16635-1-straube.linux@gmail.com>
References: <20230317065041.16635-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function bb_power_save_mode_off() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 22 ----------------------
 drivers/staging/vt6655/baseband.h |  1 -
 2 files changed, 23 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index d7c3e4bec560..0e135af8316b 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2171,28 +2171,6 @@ bb_software_reset(struct vnt_private *priv)
 	bb_write_embedded(priv, 0x9C, 0);
 }
 
-/*
- * Description: Baseband Power Save Mode OFF
- *
- * Parameters:
- *  In:
- *      iobase      - I/O base address
- *  Out:
- *      none
- *
- * Return Value: none
- *
- */
-void
-bb_power_save_mode_off(struct vnt_private *priv)
-{
-	unsigned char by_org_data;
-
-	bb_read_embedded(priv, 0x0D, &by_org_data);
-	by_org_data &= ~(BIT(0));
-	bb_write_embedded(priv, 0x0D, by_org_data);
-}
-
 /*
  * Description: Set Tx Antenna mode
  *
diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
index d1128d050ac5..e4a02c240a1c 100644
--- a/drivers/staging/vt6655/baseband.h
+++ b/drivers/staging/vt6655/baseband.h
@@ -63,7 +63,6 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data);
 /* VT3253 Baseband */
 bool bb_vt3253_init(struct vnt_private *priv);
 void bb_software_reset(struct vnt_private *priv);
-void bb_power_save_mode_off(struct vnt_private *priv);
 void bb_set_tx_antenna_mode(struct vnt_private *priv,
 			    unsigned char by_antenna_mode);
 void bb_set_rx_antenna_mode(struct vnt_private *priv,
-- 
2.40.0

