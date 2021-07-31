Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795570
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h14so13338949wrx.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8H37xNBSGIOnEvnHiZeZ4kxx2fU5DnigwTZak5GvhE=;
        b=NIg5UHvTH6FALDSE3+pA6Qrj0S2z5qaDPCcc0Foli8P6IGIStfxYvLpRGT53osP3Rj
         pHDrPpxHyIEJZdgXXLPwfL1HQgnMGbT9Zj1B2iEkzBr35aqL7Fpvk82Ik/UkOz5Zi7KM
         7Ss8s0nL5+DpaZLLPd/08iGWRN8RZ4o5OXjCF96Kbh39ygRw3B5ycawUosSa6xsK1muN
         EUs2zA/mwrSjbdjDFd6dHoS50TapXqyFcA900uwBtd788nj/fbC1Bym2XL20+5vGxZoV
         Q++Zde0M+bqnSRFobYRN/ETi1oYPafdNALiLdHZ9cKZeUpRwmtF751YeJ6+SG90CcHIv
         ALsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8H37xNBSGIOnEvnHiZeZ4kxx2fU5DnigwTZak5GvhE=;
        b=ndPpxLwGtb0ys0HXGMQ1we7tJle9lQWPlivqc3KixoWAY9kWa0ZIwD3D/0/es86zc3
         h23D66CWyODD272yQk0spt6YvTDGuc0suTpAIla/v1bpBrgyhbEjW4UNyBYRvPbR8X18
         lg+tWVRRK44OSNVT7Yif/5Ju4KNieWb8q68k3z8gDrzsuia5g0jPnHyzi+761+RDaxmU
         gPu3Tt/hcFcmNHQBNhYZt12u83xVdv3f/kvbQIxXKa2jiItS6TqzzlyPaFxoGia1YaKM
         1CBNorz0UoKNJc6GmSf6gcQBDn5EJ/g6W2enpZqu9tsX424EzD7Jym9777RX0AQOgpqF
         21/g==
X-Gm-Message-State: AOAM5300TyD/xZIt6tgYPRKN6UaH+mzW47wk5pFy9V++RuQemxelTMIJ
	BP0R8fTE3mppvcO+qAAtmZK2Qw==
X-Google-Smtp-Source: ABdhPJwvBFx2hNfJ6C7GWCkka+1RfZ91xCNoSTZAkI6qG5AhnlQp9V8pzt7hmMf8W35dcR/9m4NYKA==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr5717643wrp.3.1627691982351;
        Fri, 30 Jul 2021 17:39:42 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:41 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/14 resent] staging: r8188eu: remove ODM_RT_TRACE_F macro definition
Date: Sat, 31 Jul 2021 01:39:27 +0100
Message-Id: <20210731003937.68615-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731003937.68615-1-phil@philpotter.co.uk>
References: <20210731003937.68615-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_TRACE_F macro definition from include/odm_debug.h, as
it is called from nowhere and is therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index c11d8925952c..ef0d6b84b2d5 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -90,12 +90,6 @@
 		RT_PRINTK fmt;						\
 	}
 
-#define ODM_RT_TRACE_F(pDM_Odm, comp, level, fmt)			\
-	if (((comp) & pDM_Odm->DebugComponents) &&			\
-	    (level <= pDM_Odm->DebugLevel)) {				\
-		RT_PRINTK fmt;						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

