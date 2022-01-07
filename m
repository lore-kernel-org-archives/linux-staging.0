Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8CB2CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id o6so20494278edc.4
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KedYO+3j4KJggZz3vqPPlAr+2ovOvnMpeqHl7HEWORI=;
        b=e9j8GDZK8kMQnGn1CQn9AR67/Yy0cMuDu3UeIrSfvDV867PrMzwZm8fDVtGXzGL29i
         wNveJiRtar3hTxM29Qofpvt/JMQJnm2PtybX8KgovLT/NiRdEfmLGeuoAZUa7aSTq8kc
         5hOj1kS8iGFHIda8uqb+LzQXT5FvtTM4uJevot6DqQKcqLDTG65zZ7rwkv9j+T7ZauoE
         fOMPa94E8HP74nxKL4MK4ysQOSwkP4TXNFIHrndvPmcZ83idtXs9q9lPQ0wLnIZOa9HL
         OPV4e8uAcX9g/4P+1EXxrV0B7AP3fCxdMsFSMLTlf/1anBmLz7c2IIsoo5FBpSOwbYF0
         ornw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KedYO+3j4KJggZz3vqPPlAr+2ovOvnMpeqHl7HEWORI=;
        b=vITsEBg/br/6MxTegBqLjzNwGhUsluXuwPFVjyl/GKp8YNdjoA8bMlx5r3W1mOErbX
         KgDoufgO385mJu7vKh6qp9eXOgiRYad8w3V9iNPLnqryZzR7uCD6TuTxk+5I8H3S7VCH
         pSwa3XcumoIVlDLUMKquFCEqoAMkAGsXcHNgdp4CsmSKWfns122ZoKFyezMAzY67mT/4
         JFb9M4c0AyRWezvuIrVlbM4q6IwmgITjWgKHtwuMd2yy31K3i/+RPX57eDHlxWeJUf0Z
         HZAwg/DO+ZYMAmRoRqnhIHq/hGub0jsJP0d4vQuqLKV0VmgZMwjBQ4DSbm2ae/5APQVp
         GxiQ==
X-Gm-Message-State: AOAM531BaNzE2M88fPrq0GyxlKICtF+03uuyz9Ij9wWuLlaapyzR6xV0
	51b+va1/QUFwz4gIsq+WF3c=
X-Google-Smtp-Source: ABdhPJwd411hrRjscwXWt0OpLWsJczSErc7XfKMxP6e+O5p1muBjZgEZwVRtL4oH7V0qP/fOime91g==
X-Received: by 2002:aa7:d0c4:: with SMTP id u4mr424196edo.70.1641551797379;
        Fri, 07 Jan 2022 02:36:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:37 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/19] staging: r8188eu: rename Exit label in rtl8188e_firmware_download()
Date: Fri,  7 Jan 2022 11:36:14 +0100
Message-Id: <20220107103620.15648-14-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the Exit label in rtl8188e_firmware_download() to avoid camel
case.

Exit -> exit

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index f86b5cb2b6f9..f158bbf44094 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -556,7 +556,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 		rtStatus = load_firmware(&dvobj->firmware, device);
 	if (rtStatus == _FAIL) {
 		dvobj->firmware.data = NULL;
-		goto Exit;
+		goto exit;
 	}
 	pFirmwareBuf = dvobj->firmware.data;
 	FirmwareLen = dvobj->firmware.size;
@@ -604,16 +604,16 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fw_download_enable(padapter, false);
 	if (_SUCCESS != rtStatus) {
 		DBG_88E("DL Firmware failed!\n");
-		goto Exit;
+		goto exit;
 	}
 
 	rtStatus = fw_free_to_go(padapter);
 	if (_SUCCESS != rtStatus) {
 		DBG_88E("DL Firmware failed!\n");
-		goto Exit;
+		goto exit;
 	}
 
-Exit:
+exit:
 	return rtStatus;
 }
 
-- 
2.34.1

