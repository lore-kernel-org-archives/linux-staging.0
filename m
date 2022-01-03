Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6902C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:16:43 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id j6so139369383edw.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7KymNEPxa+Z+FSFBz/5rYyS1VzBPF/+Pclc+ZH7hbiQ=;
        b=HB3+lf29knL0mnR/jINZfGcminLku65Da/NiPhXIkSS+AuH2KKAk1K+c6nIsTQUSwM
         YdHUESfWb8rj+99sk2R9AxRXhdwMx8bfN4UOdw3AvHWUurSZPGsOFXWGvqGCsH29gA2u
         EtwNmvQ5ok1LuybRlzVly0fbbpus2beCQET6LpI3duVsc6K3CbhT2k9m6tNb2dX2P+AG
         fZMe5TcVLDxaU+ZJw0NLYu960uhSbA6MVjt7/1+yDb8B+20yhJcsOelyTZTjV/F0c5hl
         J2KHfC4K69IC11o954daY6TTfHG9ILbfB6Vr0mIF9tfhtuADAf1qO4uooYlpRm+B6UxH
         G0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KymNEPxa+Z+FSFBz/5rYyS1VzBPF/+Pclc+ZH7hbiQ=;
        b=d62S4w1rtBHOOPXmXFFj9e8zK2T1cRy2xyreNqKZZauy4boDLewGZogWhRP7plB1Re
         hpsgpqKoyrEwnxW5rbCTC9exVsITostxmAV9++ka09K7+AjOpgmwsGExb3ut2q0bEXcY
         7nncRGP/K8hvG6dJlBr9ydz5LoPZhpPNS/Vkv5RMqVeaaw4UATrzKcd4mNl2SOyZz7CE
         gfemefWyTzNuYE6+QbZP/mzEhfAHlitpCNlhTrdWTY8hc9SyvEOKOUBxMvekr8DWJVez
         Ru/aK9ewrfmric6o9/rdZ6dBm4daSA25UlhnwR8QiV0leCjbpIJpalYQXZM3rWqkatUz
         Xk0w==
X-Gm-Message-State: AOAM531l9gJAu/QCfWfYUofbN+5kJqlKAqYEODkF/eWsrUPJdvSecMzC
	JUqkQcLunNRX3nsAuxJ7cxY=
X-Google-Smtp-Source: ABdhPJwPhDTlkvvg/DQhO23DWmZU/XOzRGvAtqLTX4vfUZIugoXL3eeQ1fUJu7vktQq74gV+dLvrTQ==
X-Received: by 2002:a50:d691:: with SMTP id r17mr13265102edi.317.1641237402171;
        Mon, 03 Jan 2022 11:16:42 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:16:41 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/56] staging: r8188eu: rename camelcase ClearMFrag to clear_m_frag
Date: Mon,  3 Jan 2022 20:01:47 +0100
Message-Id: <20220103190326.363960-13-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro ClearMFrag into get_m_frag.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index aa00e1711514..0deba46d3a23 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -991,7 +991,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
 						((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
 
-			ClearMFrag(mem_start);
+			clear_m_frag(mem_start);
 
 			break;
 		}
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index a07729f79867..e2ec9e630fbf 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -180,7 +180,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_m_frag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
 
-#define ClearMFrag(pbuf)	\
+#define clear_m_frag(pbuf)	\
 	*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_))
 
 #define SetRetry(pbuf)	\
-- 
2.25.1

