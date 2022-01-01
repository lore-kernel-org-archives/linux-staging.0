Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84C2C9C
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:49:55 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w20so50706896wra.9
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8r+cRr679ExYoNRZPV7FmhdQZm1WdYwZAxdxXDZnMJQ=;
        b=GLht4rLA6h25YdxDNBMSrXKlaclXLj6ZPHy2SE2xoG06FSzNulJFqPfD34NR3NQa7Z
         pC58ydUPVE6Gp5zQ4DcXAHWmI+EpYnSBmKeNjE6g8IOB4kVa0cQ1aH2E5n52PILWvVL0
         r5TBPpUIOxQY5lCGUfMyRDmsFXD27LLMPZ5vMbJcJN7uqu/ov81M62pFgWnoGci7wOtW
         SSfKjLvhs2EgvksgGkjkQG2QPvLmt1sL2pPANWN411nk2mppbvQc9qCVV6wW0d0H/rok
         Zf6okrSLm+Vfp7DFHmKudTZPVCZzmIAyHaa1tebY9zWznjL2qYOupmP3eIATa74d2fqi
         HDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8r+cRr679ExYoNRZPV7FmhdQZm1WdYwZAxdxXDZnMJQ=;
        b=DgUdD8ig09czBrYlTabA1/PxQn0M3z4i6oIpP64r/wuiXyolyC72YVoAvaeMmK69BO
         LD2uOvQe37CRpmdwTN6Ra0w/bWFR1978pDphSqphRR43w6+0kw7pN3or4eQT719HTWNE
         sKcPkoc67cOQwVN3YVbWAeL7hMk/XlX1ICNXA2Sf9MrAJ5qto62ijULPB38jq8C/by0f
         BS7QAgLAN+vsPtZ54UKqn8KNS3DqF6Owg3hCwAmFCp29iqQvgLFtow2wQwL9R9SUhh9r
         kpDJ9QJhVaT63OXJQjKn7MroXp2UzViQ/kyyiKzPQ73nGavKS8s/MeSfiAgtF5TBLqEZ
         zVZQ==
X-Gm-Message-State: AOAM5316/zziZeumxfA1HMo7bGceLyNJSRjDI1Ra7msXt/aa26PaqGO1
	s9KyaJwKPXGewXAEPzlsXc4=
X-Google-Smtp-Source: ABdhPJynMXEHJPJe6VUcIi1V0sBoXvz6fresJ71AOZRmZg6VFV3q4fZWNMnSHgWyXgQxjbz2zuJevA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id o2mr31923464wry.210.1641026993909;
        Sat, 01 Jan 2022 00:49:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id o9sm14806578wri.97.2022.01.01.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:49:53 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 7/7] staging: r8188eu: FwRsvdPageStartOffset is set but never used
Date: Sat,  1 Jan 2022 09:49:37 +0100
Message-Id: <20220101084937.3411-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101084937.3411-1-straube.linux@gmail.com>
References: <20220101084937.3411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field FwRsvdPageStartOffset of struct hal_data_8188e is set but
never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3: no changes
v2: no changes

 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 3 ---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index ca24e17c369d..a491c37777df 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -440,7 +440,6 @@ void CheckFwRsvdPageContent(struct adapter *Adapter)
 /*  2009.10.15 by tynli. */
 static void SetFwRsvdPagePkt(struct adapter *adapt, bool bDLFinished)
 {
-	struct hal_data_8188e *haldata;
 	struct xmit_frame	*pmgntframe;
 	struct pkt_attrib	*pattrib;
 	struct xmit_priv *pxmitpriv;
@@ -461,7 +460,6 @@ static void SetFwRsvdPagePkt(struct adapter *adapt, bool bDLFinished)
 		return;
 	}
 
-	haldata = &adapt->haldata;
 	pxmitpriv = &adapt->xmitpriv;
 	pmlmeext = &adapt->mlmeextpriv;
 	pmlmeinfo = &pmlmeext->mlmext_info;
@@ -480,7 +478,6 @@ static void SetFwRsvdPagePkt(struct adapter *adapt, bool bDLFinished)
 	if (PageNeed == 1)
 		PageNeed += 1;
 	PageNum += PageNeed;
-	haldata->FwRsvdPageStartOffset = PageNum;
 
 	BufIndex += PageNeed * 128;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 239d0db55639..25f3c04e81b7 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -230,8 +230,6 @@ struct hal_data_8188e {
 
 	u8	bDumpRxPkt;/* for debug */
 	u8	bDumpTxPkt;/* for debug */
-	u8	FwRsvdPageStartOffset; /* Reserve page start offset except
-					*  beacon in TxQ. */
 
 	u8	OutEpQueueSel;
 	u8	OutEpNumber;
-- 
2.34.1

