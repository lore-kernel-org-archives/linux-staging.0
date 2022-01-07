Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FC02CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 14:36:33 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id m21so23057176edc.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXsSPwqaQHZc3rdefwBjL67TswiXEAP9IH6NwIoWb94=;
        b=kaRLR+EmGxAVtMfQOYYKZFZjoB9Ov6y/mgQcY3Es8F2bbV+WewoRGWP3P8Xl92sGXR
         zl5lXizb3o+MLsVJdhr+o9wUvKcpN6WgBEw3wkDYWEzZSfY2/colRoEa3T5HN3BzWoMn
         NfSRpWiIY7tjBXRxvwCEUp4tE41gx3nKoY24VuS+MhJZlENLw2wdiUhtKD9JTGVoSQnU
         S5DEcigbn6GzLqxR/ZVOI1N/dS8nRcqPFUUZ8u3FeqmV3q6prdSCdp82Ljvtg2hVEtJm
         LRL1kRzcPnN4USDr415TUAju40BYhA7CfUfwjS+U6FPD5hUfhUCUSe22q+k5iceZ8joZ
         mosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXsSPwqaQHZc3rdefwBjL67TswiXEAP9IH6NwIoWb94=;
        b=NCNk+f5Swu38C47c/EUVliBjjnO4s6bMPMN6ISc0sZz0nrLyQCvJIEVkVpfG/Bwk/k
         CZafl/Sgle4BGecZ8WaYrvQscIQS8zG+Xp786c/hGagJrHg5319PcrZfsIKIUhpy0acD
         h0Nr3vpQKAKOXbEi+SXXrQQwNFgL+VBgKzdnmg8Cogkrri3AlLMMHA1Vw8BC+gn7dyWS
         GAGD7PgRWahAVVsSq30F/zE4CPGLTR0Ce4qeO4N3KlQpfDg6eBqMBiA6qXL4/3+UmWAR
         klZCJCnrPU79oL537q93MNdmjkQykoj5YVDhAdFFhaK1DvdBA6NrlrVvXYr9agi2rE7V
         0y5Q==
X-Gm-Message-State: AOAM530swdnmdO4bgxzu9zSTkqdrPLTQtthCp9ryz4UCSQ9lhGCu4EMC
	0yZNdgbdaoZEHQ6+c6pObsw=
X-Google-Smtp-Source: ABdhPJxcCPlpqPMUJCnpggRFbH2Q6dQZl8PkNIhMlLE88ycK4l70lZh1LGSgqzaOzfP0GeWIF0mPog==
X-Received: by 2002:a05:6402:26cd:: with SMTP id x13mr64090087edd.167.1641566191686;
        Fri, 07 Jan 2022 06:36:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id b4sm1445181ejl.206.2022.01.07.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 06:36:31 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: rename _pFwHdr in IS_FW_HEADER_EXIST
Date: Fri,  7 Jan 2022 15:36:15 +0100
Message-Id: <20220107143617.2214-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107143617.2214-1-straube.linux@gmail.com>
References: <20220107143617.2214-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename _pFwHdr in the macro IS_FW_HEADER_EXIST to avoid camel case.

_pFwHdr -> _fwhdr

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index c614faf188bb..d8892acad224 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -39,11 +39,11 @@
 
 #define MAX_PAGE_SIZE			4096	/*  @ page : 4k bytes */
 
-#define IS_FW_HEADER_EXIST(_pFwHdr)				\
-	((le16_to_cpu(_pFwHdr->Signature)&0xFFF0) == 0x92C0 ||	\
-	(le16_to_cpu(_pFwHdr->Signature)&0xFFF0) == 0x88C0 ||	\
-	(le16_to_cpu(_pFwHdr->Signature)&0xFFF0) == 0x2300 ||	\
-	(le16_to_cpu(_pFwHdr->Signature)&0xFFF0) == 0x88E0)
+#define IS_FW_HEADER_EXIST(_fwhdr)				\
+	((le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x92C0 ||	\
+	(le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x88C0 ||	\
+	(le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x2300 ||	\
+	(le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x88E0)
 
 /*  This structure must be careful with byte-ordering */
 
-- 
2.34.1

