Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433856136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:55 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id m13-20020a17090aab0d00b001bbe267d4d1so4724271pjq.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5AE2uRsYYk+x02Y3HTY/LR7/duyX8373bf9eEbOiMhw=;
        b=VrC5/9ZfjKL0MIvIXSU975r5t328rIc0clW+nUjdfd8j3bKzwZxcRy1yQA3SLxLDOy
         sSp6lAe4/Fs2beIQiA3Inx/yAPLsKwikO0zqTE/ly1/Fn/c7D1I6PD1GJ7IRvJnN5ioJ
         93uMtqhrw0keVsXEjqLVU/0u5IwvtC2Kj6humVxy46R8v/V7sYJ5SkmTWQqE9CCqwea2
         HEIHI6qDZRLLEqDM1apSgyYRCVhZWRRBlwtBpLKwI8ZOb6qnW+uALOYxGEXVhja1sAP5
         VsrIKFlvobbwERFwZEWNoCcWeT5JLux7+Nhmb7EJx+AAJ5nUbsKYOCK7GezP6Q3vZnkM
         bBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5AE2uRsYYk+x02Y3HTY/LR7/duyX8373bf9eEbOiMhw=;
        b=OV0Ozj2aFmhL6cX1ntqSlVaI9fCjIfxDltMSg8szjOVbtP0xujRpXevVqkt90I1CJo
         D9vmDsGwv8l94aN6YxwA6385D4EvYG6p/TbCy1F2aioj5rTAQIn3/gisri+e+hjvKnOG
         W+QM1HmacknghQEErzpTegOl5Y7deaCrC+yFvSmwQ7s+tBsVIpxB0PmJySRjZcLjPibA
         PatTf1JhWbQnlnPiEVxXcFVrYBIOePRYM8MHQX1AYclRf5m6E1dbJho0sgFaxuRZ2mLq
         ohWgPPqrhLCyyAvXbqPqlGi7Li6Kr9tahyPjD7te9M8RZoc44p7gOKADQw5awaSyOcsC
         2lYg==
X-Gm-Message-State: AOAM532QLLhXP7XEgXOLPM3D4TOXq0bz4iPrZgH7Lw6+865UIUMLyiOx
	NL9WBgkXzFrDFthETNpNlRU=
X-Google-Smtp-Source: ABdhPJw0Vdrj8JQ8Hht/3yFHRDC5KV/68Nh0Lx0vUn1K4P96RrSMwULBxpz4qw7+dDDafwNxXmEuIA==
X-Received: by 2002:a17:903:2489:b0:14f:fe0b:554b with SMTP id p9-20020a170903248900b0014ffe0b554bmr32742239plw.113.1646254134788;
        Wed, 02 Mar 2022 12:48:54 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:54 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 16/16] staging: r8188eu: mark rtw_endofpktfile as bool
Date: Thu,  3 Mar 2022 02:17:37 +0530
Message-Id: <20220302204737.49056-17-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark rtw_endofpktfile as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 3e778dff0..00658681f 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -40,7 +40,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter,
 uint rtw_remainder_len(struct pkt_file *pfile);
 void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
-int rtw_endofpktfile(struct pkt_file *pfile);
+bool rtw_endofpktfile(struct pkt_file *pfile);
 
 void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
 void rtw_os_xmit_complete(struct adapter *padapter,
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 717b980a8..a6012cffd 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -54,7 +54,7 @@ uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 	return len;
 }
 
-int rtw_endofpktfile(struct pkt_file *pfile)
+bool rtw_endofpktfile(struct pkt_file *pfile)
 {
 
 	if (pfile->pkt_len == 0) {
-- 
2.30.2

