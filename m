Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B692E173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:46:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id o6so139798483edc.4
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUcYul9v18yAoVmolWArOf2DBnyclj+ggzFU2OVJJAg=;
        b=hiax1oMlj9H/vUQPvrRHXPP6hhJy05e6mvmCS3qaRR6Ev0ZyyFV2py98WgbYGNlu7Z
         0vK/kDkT52A91JVj7EY9Hl4jZDErbVqIeKDD9a1RR0ok2t9MseONteDRs2yhcKyRvf7s
         GZPhLuG2kRtFsO55T4dP1n26jcoyVjkiLKB9e73cYWlGcJg1VXHkmTU0zlYc7gD/EXn7
         mzJf5xw5KyK/CMDXwfQhUpJAxTfpZJv4JjO78Lwn4EILR3XLWh7mMI+h/jw0Ol4JKtIj
         /I46D4/mfv+1zAQtlWICcNmaohS2elK9Ca05k7UIiX67QjExlhrrSniiHWxJSSutbxSL
         LPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xUcYul9v18yAoVmolWArOf2DBnyclj+ggzFU2OVJJAg=;
        b=T/dDtH+tki4x/XsOpNyLp7jxOoX4dbSkRLJ8ntfAPfg6/DtXBMIgmAEyC3PHRH8/WR
         Mlq84ez77PEWlatPFNWpUxJmzUypjE4miHCUd6Oz5TrrNKMLNyEzLQvRtCZlH4BotqBX
         yl+KPXshyPWqIiG3l7Ftuv5USRGjoEMM471DNj6k5mcRmToLw5NMDeIPCj4TIFBdV/Wz
         LK2T0L30Soe0Yl74AjVpBZ6tu7m77/ksSE3oqyesAr7UKmmLW6hc6CO2wWlNagcnsjGp
         sshxOEHWNny+S5KIga350OLmcKHa/K0HQJvNDW16VOL7qWVNzutW0dPhNYrpzc//WqCs
         Xw+g==
X-Gm-Message-State: AOAM533b5ROYQ07m02l9pFa4NAz3tz+RDkPM77IeoLs0vrJvcBvTlClj
	HmX44j6QSkAiPbSo77AbsPs=
X-Google-Smtp-Source: ABdhPJxW3M0Gf06UJFW9efJsc7PGZPR4M/g4hgGb0p/STrrkd/L+AYIpQietAOnyH7YrTSE2JIwp9Q==
X-Received: by 2002:a17:906:9756:: with SMTP id o22mr36763074ejy.324.1641239206131;
        Mon, 03 Jan 2022 11:46:46 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:46:45 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 44/56] staging: r8188eu: rename camelcase SetEOSP to set_eosp
Date: Mon,  3 Jan 2022 20:02:19 +0100
Message-Id: <20220103190326.363960-45-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename camel case macro SetEOSP into set_eosp

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c     | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 29075d7516ec..13f6831fb53b 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5530,7 +5530,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
 
 	set_priority(qc, tid);
 
-	SetEOSP(qc, pattrib->eosp);
+	set_eosp(qc, pattrib->eosp);
 
 	SetAckpolicy(qc, pattrib->ack_policy);
 
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index a13ef82b41f1..1d22f6dc2cdc 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -770,7 +770,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pattrib->priority)
 				set_priority(qc, pattrib->priority);
 
-			SetEOSP(qc, pattrib->eosp);
+			set_eosp(qc, pattrib->eosp);
 
 			SetAckpolicy(qc, pattrib->ack_policy);
 		}
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index e4f5b877c559..60b80ce144df 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -373,7 +373,7 @@ static void ConstructNullFunctionData(struct adapter *adapt, u8 *pframe,
 
 		pwlanqoshdr = (struct rtw_ieee80211_hdr_3addr_qos *)pframe;
 		set_priority(&pwlanqoshdr->qc, AC);
-		SetEOSP(&pwlanqoshdr->qc, bEosp);
+		set_eosp(&pwlanqoshdr->qc, bEosp);
 
 		pktlen = sizeof(struct rtw_ieee80211_hdr_3addr_qos);
 	} else {
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 6c5ca5b409d2..45774d7a6429 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -238,7 +238,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_priority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
 
-#define SetEOSP(pbuf, eosp)	\
+#define set_eosp(pbuf, eosp)	\
 		*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4)
 
 #define SetAckpolicy(pbuf, ack)	\
-- 
2.25.1

