Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207022CA1
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:11:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o3so6723044wrh.10
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZgZw9wf8OGtp2Nl0K0C4zc2uLMgL4ndeZt9CPVyiWU=;
        b=pa3dIGdaZfWPxIEeb379ecQ0Vmos1Eo9DsFATDbGnN4AbMCGxE8HEHh/7TaHHe+NSp
         EjLELbMWCyGbRT1yWVfmeCHouEIzhdNMOXQZEP0vzPzcdquxqxEZtiN/DFaJ3bKxGwzV
         OktsjJKFeJxrQT1h6Z/pyloFO8ipam52YDpgl6IlcO2Nr1+lM6zPH49KEkEjsNWhYVkI
         T9dfRxG/IP342b3VyaSqDzL7wNH/54uxvABiDHlL4oC/t80imtFLLfZikDtMvh3PYKUW
         KYe/FF2Vv+SOD5h+Cz7ik6ZqH3owEkgh8KpS6wbydHkATC5tvuLeiVfwXlVVtH765SSh
         GMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZgZw9wf8OGtp2Nl0K0C4zc2uLMgL4ndeZt9CPVyiWU=;
        b=7E5PQkV+TZk2RX4y0b6n7FpZsGVj+PI6iaiqhk/dhX6WvN+oKJtG42P4nJNnsuWTlp
         1zDIZ08XUBmOdGV1ajg1iXJWQDCgX5+9qnJVeDUhURq63+qvvsmcuZAUuggd8t73GIsA
         CWvX6agdeqUdSXxSEVW875AZ5CBNrn0P9ywxpbL45j4Ktd0OhkrCHiRWtrvaYUAJ/saU
         WVQ1BTMRkoTykEvblUWjY6K9xCZcS1fHKhdO/UgyTzlHw58GEZjrXEpCpq5WyA4UaTxT
         Kffi1+duhLfs8ELAl8bVlL//3eNk9Df+n1M26OJ+c99GAhBndSSC0pBigHznqY7cllFr
         hB4A==
X-Gm-Message-State: AOAM530Pz1qC2lUbz/M3WB8bb33Y12ETotGrjuDiXRe3d+zuiLHq3MVm
	QsvxxuI3l6NjEiv6u8Et+Wc=
X-Google-Smtp-Source: ABdhPJzAqgsEsLfXaAbvpa/F/JEGaNjegI+7/8b29VEC/agbUon4ouMME5AZZdwEwkM7HcJeWnJwVA==
X-Received: by 2002:adf:fb86:: with SMTP id a6mr34467549wrr.35.1641129116622;
        Sun, 02 Jan 2022 05:11:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:56 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/11] staging: r8188eu: struct rx_hpc is not used
Date: Sun,  2 Jan 2022 14:11:34 +0100
Message-Id: <20220102131141.12310-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure rx_hpc is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 793068778833..46fdc87a5e2f 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -75,20 +75,6 @@ struct false_alarm_stats {
 	u32	Cnt_BW_LSC;	/* Gary */
 };
 
-struct rx_hpc {
-	u8		RXHP_flag;
-	u8		PSD_func_trigger;
-	u8		PSD_bitmap_RXHP[80];
-	u8		Pre_IGI;
-	u8		Cur_IGI;
-	u8		Pre_pw_th;
-	u8		Cur_pw_th;
-	bool		First_time_enter;
-	bool		RXHP_enable;
-	u8		TP_Mode;
-	struct timer_list PSDTimer;
-};
-
 #define ODM_ASSOCIATE_ENTRY_NUM	32 /*  Max size of AsocEntry[]. */
 
 struct sw_ant_switch {
-- 
2.34.1

